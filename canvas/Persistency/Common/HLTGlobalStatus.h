#ifndef canvas_Persistency_Common_HLTGlobalStatus_h
#define canvas_Persistency_Common_HLTGlobalStatus_h
// vim: set sw=2 expandtab :

#include "canvas/Persistency/Common/HLTenums.h"
#include "canvas/Persistency/Common/HLTPathStatus.h"

#include <cstddef>
#include <vector>
#include <ostream>

namespace art {

class HLTGlobalStatus {

public:

  ~HLTGlobalStatus();

  explicit
  HLTGlobalStatus(std::size_t const n = 0);

public:

  std::size_t
  size() const;

  void
  reset();

  bool
  wasrun() const;

  bool
  accept() const;

  bool
  error() const;

  HLTPathStatus const&
  at(unsigned const i) const;

  HLTPathStatus&
  at(unsigned const i);

  HLTPathStatus const&
  operator[](unsigned const i) const;

  HLTPathStatus&
  operator[](unsigned const i);

  bool
  wasrun(unsigned const i) const;

  bool
  accept(unsigned const i) const;

  bool
  error(unsigned const i) const;

  hlt::HLTState
  state(unsigned const i) const;

  unsigned
  index(unsigned const i) const;

  void
  reset(unsigned const i);

  //void
  //swap(HLTGlobalStatus& other);

private:

  std::vector<HLTPathStatus>
  paths_;

};

//void
//swap(HLTGlobalStatus& lhs, HLTGlobalStatus& rhs);

std::ostream&
operator<<(std::ostream& ost, const HLTGlobalStatus& hlt);

} // namespace art

//namespace std {
//
//template <>
//inline
//void
//swap(art::HLTGlobalStatus& lhs, art::HLTGlobalStatus& rhs)
//{
//  lhs.swap(rhs);
//}
//
//} // namespace std

#endif /* canvas_Persistency_Common_HLTGlobalStatus_h */

// Local Variables:
// mode: c++
// End:
