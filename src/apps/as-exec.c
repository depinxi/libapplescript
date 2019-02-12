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
	int i = 1;
	int r = 0;
	
	for (i = 1; i < argc; ++i)
	{
		r = applescript_execute_cstring(argv[i], handle_event, NULL);
		result += (r ? 1 : 0);
	}
	
	return result;
}
