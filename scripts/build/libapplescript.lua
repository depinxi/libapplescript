--------------------------------------------
-- libapplescript
--------------------------------------------

project "applescript"
	kind "StaticLib"
	if type (_OPTIONS["targetpath"] == "string") then targetdir (_OPTIONS["targetpath"] .. "/lib") end
	language "C"
	files { 
		"../../src/applescript/*.*",
		"../../include/applescript/*.h"
	}
	includedirs { "../../include" }
	links {}
