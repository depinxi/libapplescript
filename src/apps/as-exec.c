#include <applescript/applescript.h>
#include <stdio.h>

int main(int argc, const char **argv)
{
    int result = 0;
    int i = 1;

    for (i = 1; i < argc; ++i)
    {
        result += applescript_execute_cstring(argv[i]);
    }

    return result;
}
