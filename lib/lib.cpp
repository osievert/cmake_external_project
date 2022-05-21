#include <string>

extern const char *hello();

std::string hi()
{
    // return "hi";
    return hello();
}

