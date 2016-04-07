#include "canvas/Persistency/Provenance/RangeSet.h"
#include "cetlib/crc32.h"

namespace {

  bool disjoint(std::vector<art::EventRange> const& ranges)
  {
    auto it = ranges.cbegin();
    auto const end = ranges.cend();
    for (auto next = std::next(it); next != end; ++it, ++next) {
      if (!it->is_disjoint(*next))
        return false;
    }
    return true;
  }

}

namespace art {

  RangeSet&
  RangeSet::collapse()
  {
    if (isCollapsed_)
      return *this;

    if (ranges_.size() < 2)
      return *this;

    if (!is_sorted())
      throw art::Exception(art::errors::LogicError,"RangeSet::collapse()")
        << "A range set must be sorted before it is collapsed.\n";

    auto processing = ranges_;
    decltype(ranges_) result;
    while (!processing.empty()) {
      result.push_back(processing.front());
      processing.erase(processing.cbegin());
      decltype(ranges_) remaining;
      for (auto const& r : processing) {
        if (result.back().is_adjacent(r)) {
          result.back().merge(r);
          // Check if newly-formed range has been cached as a
          // remaining range to check
          auto f = std::find(remaining.begin(), remaining.end(), result.back());
          if (f != remaining.end())
            remaining.erase(f);
        }
        else {
          // If the current range is not adjacent to the 'result'
          // range, then cache it for further processing later on.
          remaining.push_back(r);
        }
      }
      std::swap(processing, remaining);
    }
    std::swap(ranges_, result);
    isCollapsed_ = true;
    checksum_ = cet::crc32{to_compact_string()}.digest();
    return *this;
  }

  RangeSet&
  RangeSet::merge(RangeSet const& other)
  {
    std::vector<EventRange> merged;
    std::merge(ranges_.begin(), ranges_.end(),
               other.ranges_.begin(), other.ranges_.end(),
               std::back_inserter(merged));
    std::unique(merged.begin(), merged.end());
    std::swap(ranges_, merged);
    isCollapsed_ = false;
    collapse();
    return *this;
  }

  bool
  RangeSet::has_disjoint_ranges() const
  {
    if (isCollapsed_ || is_sorted() ) {
      return ranges_.size() < 2ull ? true : disjoint(ranges_);
    }

    RangeSet tmp {*this};
    tmp.sort();
    tmp.collapse();
    return tmp.has_disjoint_ranges();
  }

  bool
  RangeSet::is_valid() const
  {
    return run_ != IDNumber<Level::Run>::invalid();
  }

  bool
  RangeSet::is_sorted() const
  {
    return std::is_sorted(ranges_.cbegin(), ranges_.cend());
  }

  std::string
  RangeSet::to_compact_string() const
  {
    using namespace std;
    string s {to_string(run_)};
    s += ":";
    for(auto const& r: ranges_) {
      s += to_string(r.subrun());
      s += "[";
      s += to_string(r.begin());
      s += ",";
      s += to_string(r.end());
      s += ")";
    }
    return s;
  }

  bool are_disjoint(RangeSet const& l,
                    RangeSet const& r)
  {
    // If either RangeSet by itself is not disjoint, return false
    if (!l.has_disjoint_ranges() || !r.has_disjoint_ranges()) return false;

    if (l.run() != r.run()) return true; // Can't imagine that anyone
                                         // would be presented with
                                         // two RangeSets from
                                         // different runs.  But just
                                         // in case...

    RangeSet ltmp {l};
    RangeSet rtmp {r};
    auto const& lranges = ltmp.collapse().ranges();
    auto const& rranges = rtmp.collapse().ranges();

    std::vector<EventRange> merged;
    std::merge(lranges.begin(), lranges.end(),
               rranges.begin(), rranges.end(),
               std::back_inserter(merged));



    return disjoint(merged);
  }

}
