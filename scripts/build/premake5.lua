--------------------------------------------
-- libapplescript workspace (premake 5)
--------------------------------------------

include "options.lua"

workspace "applescript"
	configurations { "Release", "Debug" }
	location (_OPTIONS["location"])
	targetdir (_OPTIONS["targetpath"])

	warnings "Extra"
	
	filter 'configurations:Debug'
		runtime 'Debug'
		inlining "Disabled"
		symbols 'On'
		optimize 'Off'
			
	filter 'configurations:Release'
		runtime 'Release'
		inlining 'Auto'
		symbols 'Off'
		optimize 'Speed'
			
	filter {}
			
	include "libapplescript.lua"
	include "apps.lua"
