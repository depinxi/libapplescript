--------------------------------------------
-- libapplescript
--------------------------------------------

project "applescript"
	kind "StaticLib"
	targetdir (_OPTIONS["targetpath"] .. "/lib") 
	language "C"
	files {
		"../../include/applescript/applescript.h"
	}
	
	filter {"system:" .. premake.MACOSX}
		files {
			"../../src/applescript/applescript.m"
		}
	filter {"system:not " .. premake.MACOSX}
		files {
			"../../src/applescript/applescript_placeholder.c"
		}
	filter {}
	
	includedirs { "../../include" }
	links {}
