--------------------------------------------
-- libapplescript workspace (premake 4)
--------------------------------------------

dofile "options.lua"

solution "applescript"
	configurations { "Release", "Debug" }
	location (_OPTIONS["location"])
	targetdir (_OPTIONS["targetpath"])
		
	dofile "libapplescript.lua"
	dofile "apps.lua"
