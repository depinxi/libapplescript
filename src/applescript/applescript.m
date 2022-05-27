/**************************************************************************************$
 * libapplescript - A tiny C library to execute AppleScript
 ***************************************************************************************
 * Copyright © 2014 - 2019 by Renaud Guillard (dev@nore.fr)
 * Distributed under the terms of the MIT License, see LICENSE
 ***************************************************************************************
 */

/**
 * @file
 * @brief libapplescript implementation
 */


#include "applescript/applescript.h"
#include <AppleScriptObjC/AppleScriptObjC.h>

void applescript_process_descriptor(NSAppleEventDescriptor *descriptor, int event_index, size_t event_count, applescript_event_handler event_handler, void *cookie);
void applescript_process_descriptor(NSAppleEventDescriptor *descriptor, int event_index, size_t event_count, applescript_event_handler event_handler, void *cookie)
{
	DescType type = [descriptor descriptorType];
	
	if (type == typeAEList)
	{
		NSInteger a = 1;
		NSInteger c = [descriptor numberOfItems];
		
		for (a = 1; a <= c; ++a)
		{
			NSAppleEventDescriptor *d = [descriptor descriptorAtIndex: a];
			applescript_process_descriptor(d, event_index + ((int)a - 1), (event_count + (size_t)c - 1), event_handler, cookie);
		}
		
		return;
	}
	
	if (event_handler)
	{
		NSString *s = [descriptor stringValue];
		(*event_handler)(event_index, event_count, (int)type, [s UTF8String], cookie);
	}
}

int applescript_execute_nsstring(NSString *nsAppleScriptCode, applescript_event_handler event_handler, void *cookie);
int applescript_execute_nsstring(NSString *nsAppleScriptCode, applescript_event_handler event_handler, void *cookie)
{
	int resultCode = -1;
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	{
		NSAppleScript *as = [[NSAppleScript alloc]
		                     initWithSource: nsAppleScriptCode];
		NSDictionary *errInfo;
		
		NSAppleEventDescriptor *descriptor = [as executeAndReturnError:&errInfo];
		
		if (descriptor)
		{
			resultCode = 0;
			applescript_process_descriptor(descriptor, 0, 1, event_handler, cookie);
		}
		else
		{
			/*
			 * Dictionnary keys
			 * - NSAppleScriptErrorMessage
			 * - NSAppleScriptErrorBriefMessage
			 * - NSAppleScriptErrorNumber
			 * - NSAppleScriptErrorRange
			 */
			
			NSObject *errorCode = [errInfo objectForKey: NSAppleScriptErrorNumber];
			
			resultCode = -1;
			
			if (errorCode && [errorCode isKindOfClass:[NSNumber class]])
			{
				NSNumber *value = (NSNumber *)(errorCode);
				resultCode = [value intValue];
			}
			
			if (event_handler)
			{
				NSObject *message = [errInfo objectForKey: NSAppleScriptErrorMessage];
				
				if (message && [message isKindOfClass: [NSString class]])
				{
					NSString *value = (NSString *)(message);
					(*event_handler)(-1, 0, resultCode, [value UTF8String], cookie);
				}
				else
				{
					(*event_handler)(-1, 0, resultCode, "", cookie);
				}
			}
		}
		
		[as release];
	}
	
	[pool drain];
	
	return resultCode;
}

int applescript_execute_cstring(const char *applescriptCode, applescript_event_handler event_handler, void *cookie)
{
	int resultCode = 0;
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	{
		NSString *nsAppleScriptCode = [
		                                  [NSString alloc]
		                                  initWithCString: applescriptCode
		                                  encoding: (NSUInteger)NSASCIIStringEncoding
		                              ];
		                              
		resultCode = applescript_execute_nsstring(nsAppleScriptCode, event_handler, cookie);
	}
	[pool drain];
	
	return resultCode;
}

int applescript_tell_application_cstring(const char *applicationName,
        const char *applescriptCode,
        applescript_event_handler event_handler, void *cookie)
{
	int resultCode = 0;
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	{
		NSString *app = [NSString stringWithUTF8String: applicationName];
		NSString *code = [NSString stringWithUTF8String: applescriptCode];
		NSString *nsAppleScriptCode = [NSString stringWithFormat:
		                                        @"tell application \"%@\"\n %@\nend tell",
		                                        app,
		                                        code];
		
		resultCode = applescript_execute_nsstring(nsAppleScriptCode, event_handler, cookie);
	}
	[pool drain];
	
	return resultCode;
}




