#ifndef canvas_Persistency_Provenance_RangeSet_h
#define canvas_Persistency_Provenance_RangeSet_h
// vim: set sw=2 expandtab :

#include "canvas/Persistency/Provenance/EventRange.h"
#include "canvas/Persistency/Provenance/IDNumber.h"
#include "canvas/Persistency/Provenance/RunID.h"
#include "canvas/Persistency/Provenance/SubRunID.h"
#include "canvas/Utilities/Exception.h"
#include "cetlib/container_algorithms.h"

#include <cstddef>
#include <limits>
#include <ostream>
#include <string>
#include <utility>
#include <vector>

namespace art {

class RangeSet {

public: // TYPES

  using const_iterator = std::vector<EventRange>::const_iterator;

public: // MEMBER FUNCTIONS -- Static API

  static
  constexpr
  unsigned
  invalidChecksum()
  {
    return std::numeric_limits<unsigned>::max();
  }

  static
  RangeSet
  invalid();

  static
  RangeSet
  forRun(RunID);

  static
  RangeSet
  forSubRun(SubRunID);

public: // MEMBER FUNCTIONS -- Special Member Functions

  ~RangeSet();

  explicit
  RangeSet();

  explicit
  RangeSet(RunNumber_t);

  explicit
  RangeSet(RunNumber_t, std::vector<EventRange> const& eventRanges);

  RangeSet(RangeSet const&);

  RangeSet(RangeSet&&);

  RangeSet&
  operator=(RangeSet const&);

  RangeSet&
  operator=(RangeSet&&);

private: // MEMBER FUNCTIONS -- Special Member Functions

  explicit
  RangeSet(RunNumber_t const r, bool fullRun);

public: // MEMBER FUNCTIONS -- API provided to user

  RunNumber_t
  run() const;

  std::vector<EventRange> const&
  ranges() const;

  bool
  contains(RunNumber_t, SubRunNumber_t, EventNumber_t) const;

  bool
  is_valid() const;

  bool
  is_full_run() const;

  bool
  is_full_subRun() const;

  bool
  is_sorted() const;

  bool
  is_collapsed() const;

  std::string
  to_compact_string() const;

  bool
  has_disjoint_ranges() const;

  bool
  empty() const;

  const_iterator
  begin() const;

  const_iterator
  end() const;

  std::size_t
  begin_idx() const;

  std::size_t
  end_idx() const;

  unsigned
  checksum() const;

  std::size_t
  next_subrun_or_end(std::size_t const b) const;

  EventRange&
  front();

  EventRange&
  back();

  EventRange&
  at(std::size_t);

  std::vector<EventRange>
  extract_ranges(std::size_t const b, std::size_t const e);

  void
  assign_ranges(RangeSet const& rs, std::size_t const b, std::size_t const e);

  template <typename ... ARGS>
  void
  emplace_range(ARGS&& ...);

  RangeSet&
  collapse();

  RangeSet&
  merge(RangeSet const& other);

  // For a range [1,6) split into [1,3) and [3,6) the specified
  // event number is the new 'end' of the left range (3).
  std::pair<std::size_t, bool>
  split_range(SubRunNumber_t, EventNumber_t);

  void
  set_run(RunNumber_t const r);

  void
  sort();

  void
  clear();

private: // MEMBER FUNCTIONS -- Implementation details

  void
  require_not_full_run();

private: // MEMBER DATA

  RunNumber_t
  run_{IDNumber<Level::Run>::invalid()};

  std::vector<EventRange>
  ranges_{};

  bool
  fullRun_{false};

  bool
  isCollapsed_{false};

  mutable
  unsigned
  checksum_{invalidChecksum()};

};

template <typename ... ARGS>
void
RangeSet::
emplace_range(ARGS&& ... args)
{
  require_not_full_run();
  ranges_.emplace_back(std::forward<ARGS>(args)...);
  isCollapsed_ = false;
}

bool
operator==(RangeSet const& l, RangeSet const& r);

bool
same_ranges(RangeSet const& l, RangeSet const& r);

bool
disjoint_ranges(RangeSet const& l, RangeSet const& r);

// If one range-set is a superset of the other, the return value is
// 'true'.
bool
overlapping_ranges(RangeSet const& l, RangeSet const& r);

std::ostream&
operator<<(std::ostream& os, RangeSet const& rs);

} // namespace art

#endif /* canvas_Persistency_Provenance_RangeSet_h */

// Local variables:
// mode: c++
// End:
