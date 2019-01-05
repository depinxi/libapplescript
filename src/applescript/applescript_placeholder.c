/**************************************************************************************$
 * libapplescript - A tiny C library to execute AppleScript
 ***************************************************************************************
 * Copyright © 2014 - 2019 by Renaud Guillard (dev@nore.fr)
 * Distributed under the terms of the MIT License, see LICENSE
 ***************************************************************************************
 */

/**
 * @file
 * @brief libapplescript placeholder implementation
 */


#include "applescript/applescript.h"

int applescript_execute_cstring(const char *applescriptCode, applescript_event_handler event_handler, void *cookie)
{
	(void)applescriptCode;
	
	if (event_handler)
	{
		(*event_handler)(-1, 0, -1, "Not implemented", cookie);
	}
	
	return -1;
}

int applescript_tell_application_cstring(const char *applicationName, const char *applescriptCode, applescript_event_handler event_handler, void *cookie)
{
	(void)applicationName;
	(void)applescriptCode;
	
	if (event_handler)
	{
		(*event_handler)(-1, 0, -1, "Not implemented", cookie);
	}
	
	return -1;
}




