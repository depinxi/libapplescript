solution "applescript"
	configurations {"Release", "Debug"}
	location (_WORKING_DIR)
		
	project "applescript"
		kind "StaticLib"
		targetdir (_WORKING_DIR .. "/lib")
		language "C"
		files { 
			"src/applescript/*.*",
			"include/applescript/*.h"
		}
		includedirs { "include" }
		links {}
		
	for _, app in ipairs{"as-exec", "as-tell"}
	do
		project (app)
			kind "ConsoleApp"
			targetdir (_WORKING_DIR .. "/bin")
			language "C"
			includedirs { "include" }
			files { "src/apps/" .. app .. ".c" }
			links { "applescript", "Cocoa.framework" }	
	end
