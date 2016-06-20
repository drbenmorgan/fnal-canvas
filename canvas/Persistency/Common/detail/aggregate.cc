#include "canvas/Persistency/Common/detail/aggregate.h"

namespace art {
  namespace detail {

    void
    CanBeAggregated<CLHEP::HepVector>::aggregate(CLHEP::HepVector& p,
                                                 CLHEP::HepVector const& other)
    {
      p += other;
    }

    void CanBeAggregated<CLHEP::Hep2Vector>::aggregate(CLHEP::Hep2Vector& p,
                                                       CLHEP::Hep2Vector const& other)
    {
      p += other;
    }

    void CanBeAggregated<CLHEP::Hep3Vector>::aggregate(CLHEP::Hep3Vector& p,
                                                       CLHEP::Hep3Vector const& other)
    {
      p += other;
    }

    void
    CanBeAggregated<CLHEP::HepLorentzVector>::aggregate(CLHEP::HepLorentzVector& p,
                                                        CLHEP::HepLorentzVector const& other)
    {
      p += other;
    }

    void
    CanBeAggregated<CLHEP::HepMatrix>::aggregate(CLHEP::HepMatrix& p,
                                                 CLHEP::HepMatrix const& other)
    {
      p += other;
    }

    void
    CanBeAggregated<CLHEP::HepSymMatrix>::aggregate(CLHEP::HepSymMatrix& p,
                                                    CLHEP::HepSymMatrix const& other)
    {
      p += other;
    }

  }
}