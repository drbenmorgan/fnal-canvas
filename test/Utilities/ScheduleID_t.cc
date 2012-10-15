#define BOOST_TEST_MODULE (ScheduleID_t)
#include "boost/test/auto_unit_test.hpp"

#include "art/Utilities/ScheduleID.h"

#include <stdexcept>

BOOST_AUTO_TEST_SUITE(ScheduleID_t)

BOOST_AUTO_TEST_CASE(construct)
{
  BOOST_CHECK_NO_THROW(art::ScheduleID(0));
  BOOST_CHECK_NO_THROW(art::ScheduleID(1));
  BOOST_CHECK_THROW(art::ScheduleID(65536), std::out_of_range);
  BOOST_CHECK_THROW(art::ScheduleID(65537), std::out_of_range);
}

BOOST_AUTO_TEST_CASE(compare)
{
  BOOST_CHECK(art::ScheduleID(57) == art::ScheduleID(57));
  BOOST_CHECK(art::ScheduleID(57) != art::ScheduleID(58));
}

BOOST_AUTO_TEST_CASE(id)
{
  art::ScheduleID sID {61};
  BOOST_CHECK(sID.id() == 61);
}

BOOST_AUTO_TEST_SUITE_END()