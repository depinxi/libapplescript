/**************************************************************************************$
 * libapplescript - A tiny C library to execute AppleScript
 ***************************************************************************************
 * Copyright © 2014 by Renaud Guillard (dev@nore.fr)
 * Distributed under the terms of the MIT License, see LICENSE
 ***************************************************************************************
 */

#if !defined(__APPLESCRIPT_APPLESCRIPT_H__)
#define __APPLESCRIPT_APPLESCRIPT_H__

#if !defined (APPLESCRIPTAPI)
#	if defined(__cplusplus)
#		define APPLESCRIPTAPI extern "C"
#	else
#		define APPLESCRIPTAPI extern
#	endif
#endif

enum applescript_resultcode
{
	kAppleScriptResultInvalidScript = 256
};

/**
 * Execute arbitrary AppleScript code
 *
 * @param applescriptCode AppleScript code to execute
 *
 * @return On success, exit code return by the @param applescriptCode execution
 * 	or kAppleScriptResultInvalidScript if @param applescriptCode failed to execute
 */
APPLESCRIPTAPI int applescript_execute_cstring(const char *applescriptCode);

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
 * @return On success, exit code return by the @param applescriptCode execution
 * 	or kAppleScriptResultInvalidScript if @param applescriptCode failed to execute
 */
APPLESCRIPTAPI int applescript_tell_application_cstring(const char *applicationName, const char *applescriptCode);

#endif /* __APPLESCRIPT_APPLESCRIPT_H__ */
