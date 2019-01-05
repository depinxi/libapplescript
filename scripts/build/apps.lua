--------------------------------------------
-- libapplescript command line tools
--------------------------------------------

for _, app in ipairs{"as-exec", "as-tell", "as-info"}
do
	project (app)
		kind "ConsoleApp"
		language "C"
		targetdir (_OPTIONS["targetpath"] .. "/bin")
		includedirs { "../../include" }
		files { "../../src/apps/" .. app .. ".c" }
		
		links { "applescript" }
		filter {"system:" .. premake.MACOSX}
			links { "Cocoa.framework" }
		filter {}	
end