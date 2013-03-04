#define BOOST_TEST_ALTERNATIVE_INIT_API
#include "art/Utilities/quiet_unit_test.hpp"
using namespace boost::unit_test;

#include "tech-testbed/SerialTaskQueue.hh"
#include "tech-testbed/make_reader.hh"

#include "tbb/task_scheduler_init.h"

#include <cstdlib>
#include <cstring>
#include <fstream>
#include <iostream>
#include <random>

class TaskTestbed {
public:
  TaskTestbed();
  void operator() (size_t nSchedules,
                   size_t nEvents);

private:
  tbb::task_scheduler_init tbbManager_;
};

// Actual working function
void exec_taskTestbed() {
  TaskTestbed work;
  auto const perSchedule = 4000;
//  auto const runs { 10, 15, 20, 25, 30, 31, 32 };
  auto const runs { 30 };
  for (auto const ns : runs) {
    work(ns, ns * perSchedule);
  }
}

bool
init_unit_test_suite()
{
  framework::master_test_suite().add(BOOST_TEST_CASE(&exec_taskTestbed));
  return true;
}

int main(int argc, char *argv[]) {
  char const *cmp = "-c";
  char to[] = "--config";
  for (int i = 0;
       i < argc;
       ++i) {
    if (strncmp(cmp, argv[i], 2) == 0) {
      argv[i] = to;
      break; // Done.
    }
  }
  return unit_test_main(&init_unit_test_suite, argc, argv);
}

TaskTestbed::TaskTestbed()
:
  tbbManager_()
{
}

void
TaskTestbed::
operator() (size_t nSchedules,
            size_t nEvents)
{

  demo::SerialTaskQueue sQ;

  // Dummy task (never spawned) to handle all the others as children.
  std::shared_ptr<tbb::task> topTask
  { new (tbb::task::allocate_root()) tbb::empty_task {},
      [](tbb::task* iTask){tbb::task::destroy(*iTask);}
  };

  topTask->set_ref_count(nSchedules + 1);

  size_t evCounter = nEvents;

  std::random_device rd;

  std::vector<demo::Schedule> schedules;
  schedules.reserve(nSchedules);
  tbb::tick_count t0 = tbb::tick_count::now();
  for (size_t i { 0 }; i < nSchedules; ++i) {
    schedules.emplace_back(i, rd(), 50000);
    sQ.push(demo::make_reader(cet::exempt_ptr<demo::Schedule>(&schedules.back()),
                              topTask.get(),
                              sQ,
                              evCounter));
  }

  // Wait for all tasks to complete.
  topTask->wait_for_all();
  tbb::tick_count t1 = tbb::tick_count::now();

  size_t totalEvents = 0;
  tbb::tick_count::interval_t totalTime(0.0);
  std::ofstream file("taskTestbed.dat");
  demo::Schedule::printHeader(file);
  for (auto const & sched : schedules) {
    auto evts = sched.eventsProcessed();
    auto time = sched.timeTaken();
    std::cout << "Schedule " << sched.id()
              << " processed "
              << sched.itemsGenerated() << " items from "
              << evts << " events ("
              << sched.itemsGenerated() / static_cast<double>(evts)
              << "/event) in "
              << time.seconds() * 1000 << " ms."
              << std::endl;
    totalEvents += evts;
    totalTime += time;
    file << sched;
  }

  auto elapsed_time = (t1 -t0).seconds();
  std::cout << "Processed a total of "
            << totalEvents << " events using "
            << nSchedules << " schedules in "
            << totalTime.seconds() << " s CPU, "
            << elapsed_time << " s elapsed (speedup x"
            << totalTime.seconds() / elapsed_time << ")."
            << std::endl;

  BOOST_REQUIRE_EQUAL(nEvents, totalEvents);

  return;
}

// Local Variables:
// mode: c++
// End:
