local Debugger = {}
Debugger.__index = Debugger

function getFullStringFromArgs(...)
	local str = ""

	for i, v in next, ({...}) do
		str = str .. v
	end
	
	return str
end

function Debugger.new()
	local self = setmetatable({}, Debugger)
	self.suffix = "[unknown]"
	return self
end

function Debugger:log(...)
	print(string.format("%s: %s", self.suffix, getFullStringFromArgs(...)))
	return self
end

function Debugger:warning(...)
	warn(string.format("%s: %s", self.suffix, getFullStringFromArgs(...)))
	return self
end

function Debugger:error(...)
	task.spawn(error, string.format("%s: %s", self.suffix, getFullStringFromArgs(...)))
	return self
end

return Debugger
