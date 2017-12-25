--------------------------------------------
-- libapplescript command line tools
--------------------------------------------

for _, app in ipairs{"as-exec", "as-tell"}
do
	project (app)
		kind "ConsoleApp"
		language "C"
		if type (_OPTIONS["targetpath"] == "string") then targetdir (_OPTIONS["targetpath"] .. "/bin") end
		includedirs { "../../include" }
		files { "../../src/apps/" .. app .. ".c" }
		links { "applescript", "Cocoa.framework" }	
end