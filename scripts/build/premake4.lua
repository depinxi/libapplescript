--[[
libapplescript
A tiny C library to execute AppleScript

Copyright © 2014 by Renaud Guillard (dev@nore.fr)
Distributed under the terms of the MIT License, see LICENSE
--]]

dofile ("options.lua")

solution "applescript"
	configurations {"Release", "Debug"}
	location (_OPTIONS["buildpath"])
	targetdir (_OPTIONS["targetpath"])
		
	dofile("libapplescript.lua")
	dofile("apps.lua")
