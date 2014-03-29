newoption({
		trigger = "buildpath",
		description = "build path",
		value = "path"
	})
	
newoption({
	trigger = "targetpath",
	description = "target path",
	value = "path"
})

if not (type (_OPTIONS["buildpath"]) == "string")
then
	_OPTIONS["buildpath"] = path.getabsolute(_WORKING_DIR)
end

if not (type (_OPTIONS["targetpath"]) == "string")
then
	_OPTIONS["targetpath"] = path.getabsolute(_WORKING_DIR)
end

solution "applescript"
	configurations {"Release", "Debug"}
	location (_OPTIONS["buildpath"])
		
	dofile("libapplescript.lua")
	dofile("apps.lua")
