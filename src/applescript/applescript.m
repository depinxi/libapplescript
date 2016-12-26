/**************************************************************************************$
 * libapplescript - A tiny C library to execute AppleScript
 ***************************************************************************************
 * Copyright © 2014 by Renaud Guillard (dev@nore.fr)
 * Distributed under the terms of the MIT License, see LICENSE
 ***************************************************************************************
 */

#include "applescript/applescript.h"
#include <AppleScriptObjC/AppleScriptObjC.h>

int applescript_execute_nsstring(NSString *nsAppleScriptCode);
int applescript_execute_nsstring(NSString *nsAppleScriptCode)
{
	int resultCode = 0;
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	{
		NSAppleScript *as = [[NSAppleScript alloc]
		                     initWithSource: nsAppleScriptCode];
		NSDictionary *errInfo;
		
		NSAppleEventDescriptor *res = [as executeAndReturnError:&errInfo];
		
		if (!res)
		{
			resultCode = kAppleScriptResultInvalidScript;
		}
		else
		{
			resultCode = [res int32Value];
		}
		
		[as release];
	}
	[pool drain];
	
	return 0;
}

int applescript_execute_cstring(const char *applescriptCode)
{
	int resultCode = 0;
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	{
		NSString *nsAppleScriptCode = [
		                                  [NSString alloc]
		                                  initWithCString: applescriptCode
		                                  encoding: NSASCIIStringEncoding
		                              ];
		                              
		resultCode = applescript_execute_nsstring(nsAppleScriptCode);
	}
	[pool drain];
	
	return 0;
}

int applescript_tell_application_cstring(const char *applicationName, const char *applescriptCode)
{
	int resultCode = 0;
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	{
		NSString *nsAppleScriptCode = [NSString stringWithFormat:@"tell application \"%s\"\n %s\nend tell", applicationName, applescriptCode];
		
		resultCode = applescript_execute_nsstring(nsAppleScriptCode);
	}
	[pool drain];
	
	return resultCode;
}
