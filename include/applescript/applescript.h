/**************************************************************************************$
 * libapplescript - A tiny C library to execute AppleScript
 ***************************************************************************************
 * Copyright © 2014 by Renaud Guillard (dev@nore.fr)
 * Distributed under the terms of the MIT License, see LICENSE
 ***************************************************************************************
 */

/**
 * @file
 * @brief libapplescript library API
 *
 * @see https://developer.apple.com/documentation/foundation/nsapplescript?language=objc
 */

#if !defined(__APPLESCRIPT_APPLESCRIPT_H__)
#define __APPLESCRIPT_APPLESCRIPT_H__

#include <stdio.h>

#if !defined (APPLESCRIPTAPI)
#	if defined(__cplusplus)
#		define APPLESCRIPTAPI extern "C"
#	else
#		define APPLESCRIPTAPI extern
#	endif
#endif

#define APPLESCRIPT_VERSION_MAJOR 2
#define APPLESCRIPT_VERSION_MINOR 0
#define APPLESCRIPT_VERSION_PATCH 0
#define APPLESCRIPT_VERSION ( \
			(APPLESCRIPT_VERSION_MAJOR * 10000) \
			+ (APPLESCRIPT_VERSION_MINOR * 100) \
			+ (APPLESCRIPT_VERSION_PATCH))


#define APPLESCRIPT_QUOTEME_(x) #x
#define APPLESCRIPT_QUOTEME(x) APPLESCRIPT_QUOTEME_(x)

#define APPLESCRIPT_VERSIONSTRING \
		APPLESCRIPT_QUOTEME(APPLESCRIPT_VERSION_MAJOR) \
		"." \
		APPLESCRIPT_QUOTEME(APPLESCRIPT_VERSION_MINOR) \
		"." \
		APPLESCRIPT_QUOTEME(APPLESCRIPT_VERSION_PATCH)

typedef void (*applescript_event_handler)(int event_index, size_t event_count, int event_type, const char *evebt_value, void *cookie);

/**
 * Execute arbitrary AppleScript code
 *
 * @param applescriptCode AppleScript code to execute
 *
 * @return @c 0 on success. Obherwise the value of the @c NSAppleScriptErrorNumber key
 * of the @c NSDictionnary error information.
 */
APPLESCRIPTAPI int applescript_execute_cstring(const char *applescriptCode, applescript_event_handler event_handler, void *cookie);

/**
 * Tell an application to execute on or more commands
 *
 * This is a shorthand for
 * @code{.c}
 * int res = int applescript_execute_cstring("tell application \"applicationName\"\n applescriptCode\n endtell");
 * @endcode
 *
 * @param applicationName Application name
 * @param applescriptCode
 *
 * @return @c 0 on success. Obherwise the value of the @c NSAppleScriptErrorNumber key
 * of the @c NSDictionnary error information.
 */
APPLESCRIPTAPI int applescript_tell_application_cstring(const char *applicationName, const char *applescriptCode, applescript_event_handler event_handler, void *cookie);

#endif /* __APPLESCRIPT_APPLESCRIPT_H__ */
