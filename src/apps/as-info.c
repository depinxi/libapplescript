#include <applescript/applescript.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char **argv)
{
	(void) argc;
	(void) argv;
	
	fprintf(stdout, "version.string %s\n", APPLESCRIPT_VERSIONSTRING);
	fprintf(stdout, "version.number %d\n", APPLESCRIPT_VERSION);
	fprintf(stdout, "version.major %d\n", APPLESCRIPT_VERSION_MAJOR);
	fprintf(stdout, "version.minor %d\n", APPLESCRIPT_VERSION_MINOR);
	fprintf(stdout, "version.patch %d\n", APPLESCRIPT_VERSION_PATCH);
	
	return EXIT_SUCCESS;
}
