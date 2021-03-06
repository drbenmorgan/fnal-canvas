#include "canvas/Persistency/Provenance/ParameterSetBlob.h"

#include <ostream>

namespace art {

  std::ostream&
  operator<<(std::ostream& os, ParameterSetBlob const& blob)
  {
    os << blob.pset_;
    return os;
  }

} // art
