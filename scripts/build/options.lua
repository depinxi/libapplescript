
for t, d in pairs {
	buildpath = "Build path",
	targetpath = "Target path"
}
do
	newoption({
		trigger = t,
		description = d,
		value = "path"
	})
	
	if not (type (_OPTIONS[t]) == "string")
	then
		_OPTIONS[t] = path.getabsolute(_WORKING_DIR)
	end	
end
