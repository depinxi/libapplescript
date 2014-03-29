for _, app in ipairs{"as-exec", "as-tell"}
do
	project (app)
		kind "ConsoleApp"
		location (_OPTIONS["buildpath"])
		targetdir (_OPTIONS["targetpath"] .. "/bin")
		language "C"
		includedirs { "../../include" }
		files { "../../src/apps/" .. app .. ".c" }
		links { "applescript", "Cocoa.framework" }	
end