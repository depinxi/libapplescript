#include <applescript/applescript.h>
#include <stdio.h>

int main(int argc, const char **argv)
{
    int result = 0;
    int r = 0;
    int i = 1;

    for (i = 2; i < argc; ++i)
    {
        if (i == 2)
        {
            printf("Tell application \"%s\" to ...\n", argv[1]);
        }

        r = applescript_tell_application_cstring(argv[1], argv[i]);
        printf("\t%s: %d\n", argv[i], r);

        result += r;
    }

    return result;
}
