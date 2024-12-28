// Code from https://rosettacode.org/wiki/Linux_CPU_utilization
// Modified by: j3h1 (https://github.com/j3h1)

#include <fstream>
#include <iostream>
#include <numeric>
#include <unistd.h>
#include <vector>

std::vector<size_t> get_cpu_times() {
    std::ifstream proc_stat("/proc/stat");
    proc_stat.ignore(5, ' '); // Skip the 'cpu' prefix.
    std::vector<size_t> times;
    for (size_t time; proc_stat >> time; times.push_back(time));
    return times;
}

bool get_cpu_times(size_t &idle_time, size_t &total_time) {
    const std::vector<size_t> cpu_times = get_cpu_times();
    if (cpu_times.size() < 4)
        return false;
    idle_time = cpu_times[3];
    total_time = std::accumulate(cpu_times.begin(), cpu_times.end(), 0);
    return true;
}

int main(int argc, char **argv) {
    size_t previous_idle_time, previous_total_time;
    size_t idle_time, total_time;

    const bool a = get_cpu_times(previous_idle_time, previous_total_time);
    
    sleep(1);

    const bool b = get_cpu_times(idle_time, total_time);

    if ( a && b ) {
        const float idle_time_delta = idle_time - previous_idle_time;
        const float total_time_delta = total_time - previous_total_time;

        const float utilization = 100.0 * (1.0 - idle_time_delta / total_time_delta);
        std::cout << utilization << std::endl;
    } else {
        return -1;
    }

    return 0;
}