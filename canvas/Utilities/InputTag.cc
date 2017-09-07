#include "canvas/Utilities/InputTag.h"
// vim: set sw=2 expandtab :

#include "boost/algorithm/string/classification.hpp"
#include "boost/algorithm/string/split.hpp"
#include "boost/any.hpp"
#include "canvas/Utilities/Exception.h"
#include "fhiclcpp/coding.h"

#include <ostream>
#include <sstream>
#include <string>
#include <utility>
#include <vector>

using namespace std;

namespace art {

InputTag::
~InputTag()
{
}

InputTag::
InputTag()
  : label_{}
  , instance_{}
  , process_{}
{
}

InputTag::
InputTag(string const& label, string const& instance, string const& processName)
  : label_{label}
  , instance_{instance}
  , process_{processName}
{
}

InputTag::
InputTag(char const* label, char const* instance, char const* processName)
  : label_{label}
  , instance_{instance}
  , process_{processName}
{
}

InputTag::
InputTag(string const& s)
{
  vector<string> tokens;
  boost::split(tokens, s, boost::is_any_of(":"), boost::token_compress_off);
  int nwords = tokens.size();
  if (nwords > 3) {
    throw Exception(errors::Configuration, "InputTag")
        << "Input tag " << s << " has " << nwords << " tokens";
  }
  if (nwords > 0) {
    label_ = tokens[0];
  }
  if (nwords > 1) {
    instance_ = tokens[1];
  }
  if (nwords > 2) {
    process_ = tokens[2];
  }
}

InputTag::
InputTag(char const* s)
  : InputTag{string{s}}
{
}

InputTag::
InputTag(InputTag const& rhs)
  : label_{rhs.label_}
  , instance_{rhs.instance_}
  , process_{rhs.process_}
{
}

InputTag::
InputTag(InputTag&& rhs)
  : label_{move(rhs.label_)}
  , instance_{move(rhs.instance_)}
  , process_{move(rhs.process_)}
{
}

InputTag&
InputTag::
operator=(InputTag const& rhs)
{
  if (this != &rhs) {
    label_ = rhs.label_;
    instance_ = rhs.instance_;
    process_ = rhs.process_;
  }
  return *this;
}

InputTag&
InputTag::
operator=(InputTag&& rhs)
{
  label_ = move(rhs.label_);
  instance_ = move(rhs.instance_);
  process_ = move(rhs.process_);
  return *this;
}

bool
InputTag::
operator==(InputTag const& tag) const
{
  return (label_ == tag.label_) && (instance_ == tag.instance_) && (process_ == tag.process_);
}

string const&
InputTag::
label() const
{
  return label_;
}

string const&
InputTag::
instance() const
{
  return instance_;
}

string const&
InputTag::
process() const
{
  return process_;
}

string
InputTag::
encode() const
{
  static string const separator{":"};
  string result = label_;
  if (!instance_.empty() || !process_.empty()) {
    result += separator + instance_;
  }
  if (!process_.empty()) {
    result += separator + process_;
  }
  return result;
}

bool
operator!=(InputTag const& left, InputTag const& right)
{
  return !(left == right);
}

void
decode(boost::any const& a, InputTag& tag)
{
  if (fhicl::detail::is_sequence(a)) {
    vector<string> tmp;
    fhicl::detail::decode(a, tmp);
    if (tmp.size() == 2)
      tag = { tmp.at(0), tmp.at(1) };
    else if (tmp.size() == 3)
      tag = { tmp.at(0), tmp.at(1), tmp.at(2) };
    else {
      ostringstream errmsg;
      errmsg << "When converting to InputTag by a sequence, FHiCL entries must follow the convention:\n\n"
             << "  [ label, instance ], or\n"
             << "  [ label, instance, process_name ].\n\n";
      errmsg << "FHiCL entries provided: [ ";
      for (auto ca = tmp.begin(); ca != tmp.cend(); ++ca) {
        errmsg << *ca;
        if (ca != tmp.cend() - 1) {
          errmsg << ", ";
        }
      }
      errmsg << " ]";
      throw length_error(errmsg.str());
    }
  }
  else {
    string tmp;
    fhicl::detail::decode(a, tmp);
    tag = tmp;
  }
}

ostream&
operator<<(ostream& os, InputTag const& tag)
{
  static string const process(", process = ");
  os << "InputTag:  label = " << tag.label()
     << ", instance = " << tag.instance()
     << (tag.process().empty() ? string() : (process + tag.process()));
  return os;
}

} // namespace art

