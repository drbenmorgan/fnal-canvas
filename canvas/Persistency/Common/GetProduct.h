#ifndef canvas_Persistency_Common_GetProduct_h
#define canvas_Persistency_Common_GetProduct_h

namespace art::detail {
  template <typename COLLECTION>
  struct GetProduct {
    typedef typename COLLECTION::value_type element_type;
    typedef typename COLLECTION::const_iterator iter;
    static element_type const*
    address(iter const& i)
    {
      return &*i;
    }
    static COLLECTION const*
    product(COLLECTION const& coll)
    {
      return &coll;
    }
  };
}

#endif /* canvas_Persistency_Common_GetProduct_h */

// Local Variables:
// mode: c++
// End:
