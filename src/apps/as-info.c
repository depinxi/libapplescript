#include <applescript/applescript.h>
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>

int main(int argc, const char **argv)
{
#define print_info(key, format, value) { \
	if (argc == 1) { \
		fprintf(stdout, "%s " format "\n", key, value); \
	} else if (a > 0) { \
		if ((a > 0) && (strcmp(argv[a], key) == 0)) { \
			if (argc == 2) { fprintf(stdout, format "\n", value); } \
			else { fprintf(stdout, "%s " format "\n", key, value); } \
		} \
	} \
}

	int a;
	
	for (a = 0; a < argc; ++a)
	{
		print_info("version.string", "%s", APPLESCRIPT_VERSIONSTRING);
		print_info("version.number", "%d", APPLESCRIPT_VERSION);
		print_info("version.major", "%d", APPLESCRIPT_VERSION_MAJOR);
		print_info("version.minor", "%d", APPLESCRIPT_VERSION_MINOR);
		print_info("version.patch", "%d", APPLESCRIPT_VERSION_PATCH);
	}
	
	return EXIT_SUCCESS;
}
