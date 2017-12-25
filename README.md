libapplescript
===========
A tiny C library to execute AppleScript

Copyright © 2014-2018 by Renaud Guillard (dev@nore.fr)
Distributed under the terms of the MIT License, see LICENSE

## Introduction
`libapplescript` is an OS X C library that wraps 
the [Objective-C AppleScript API](https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/nsapplescript_Class/Reference/Reference.html) 
of the Cocoa framework  

## Building
```bash
make -C build
```

The Makefile was generated by [premake4](https://bitbucket.org/premake/premake-stable)
using the script located in `scripts/build/premake4.lua`
```bash
premake4 --file=script/build/premake4 [--buildpath=] [--targetpath=] gmake
```
With

* `buildpath`: The place where to put the build files (Makefile etc.)
* `targetpath`: The base path of the targets output. Equivalent of the `--prefix` on most `configure` scripts 

## Linking
A program using `libapplescript` have to be linked against the Cocoa framework too

## Usage
```c
int res = applescript_execute_cstring("tell application \"iTunes\" to quit");
if (res == kAppleScriptResultInvalidScript)
{
	fprintf(stderr, "Invalid AppleScript code\n");
}
else if (res != 0)
{
	fprintf(stderr, "An error occured while executing the script (exit code: %d)\n", res);
}
```

Or simply
```c
applescript_tell_application_cstring("iTunes", "quit");
```
