#include <applescript/applescript.h>
#include <stdio.h>

void handle_event(int index, size_t count, int type, const char *value, void *cookie)
{
	(void)count;
	(void)type;
	(void)cookie;
	
	if (index < 0)
	{
		if (value)
		{
			fprintf(stderr, "%s\n", value);
		}
		
		return;
	}
	
	if (value)
	{
		fprintf(stdout, "%s\n", value);
	}
}

int main(int argc, const char **argv)
{
	int result = 0;
	int r = 0;
	int i = 1;
	
	for (i = 2; i < argc; ++i)
	{
		r = applescript_tell_application_cstring(argv[1], argv[i], handle_event, NULL);
		result += (r ? 1 : 0);
	}
	
	return result;
}
