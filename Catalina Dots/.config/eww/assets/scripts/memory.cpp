// Sources: https://stackoverflow.com/questions/2513505/how-to-get-available-memory-c-g
// Modified by j3h1 (https://github.com/j3h1)

#include <iostream>
#include <unistd.h>

void get_memory_info(size_t &total_memory, size_t &free_memory)
{
    const size_t pages = sysconf(_SC_PHYS_PAGES);
    const size_t page_size = sysconf(_SC_PAGE_SIZE);
    const size_t page_free = sysconf(_SC_AVPHYS_PAGES);

    total_memory = pages * page_size;
    free_memory  = page_free * page_size;
}

int main(int argc, char** argv)
{
    size_t total_mem, free_mem;
    get_memory_info(total_mem, free_mem);

    std::cout   << "{\"total\": " << total_mem 
                << ", \"free\": " << free_mem 
                << ", \"used_percentage\": " << (100.0 * (total_mem - free_mem) / static_cast<double>(total_mem)) << "}"
                << "\n" << std::endl ;
    return 0;
}