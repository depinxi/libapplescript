project "applescript"
	kind "StaticLib"
	location (_OPTIONS["buildpath"])
	targetdir (_OPTIONS["targetpath"] .. "/lib")
	language "C"
	files { 
		"../../src/applescript/*.*",
		"../../include/applescript/*.h"
	}
	includedirs { "../../include" }
	links {}
