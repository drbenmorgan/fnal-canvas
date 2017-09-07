#ifndef canvas_Persistency_Common_detail_setPtrVectorBaseStreamer_h
#define canvas_Persistency_Common_detail_setPtrVectorBaseStreamer_h
// vim: set sw=2 expandtab :

namespace art {
  namespace detail {
    class PtrVectorBaseStreamer;
    void setPtrVectorBaseStreamer();
  }
} // namespace art

#include "TClassStreamer.h"

class TBuffer;

class art::detail::PtrVectorBaseStreamer : public TClassStreamer {

public:

  virtual
  TClassStreamer*
  Generate() const override;

  void
  operator()(TBuffer &R_b, void *objp) override;

};

#endif /* canvas_Persistency_Common_detail_setPtrVectorBaseStreamer_h */

// Local Variables:
// mode: c++
// End:
