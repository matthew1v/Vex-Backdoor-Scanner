local Signal = {}
Signal.__index = Signal

function Signal.new()
	local self = setmetatable({}, Signal)
	self.connections = {}
	self.once = {}
	return self
end

function Signal:Connect(f)
	table.insert(self.connections, f)
end

function Signal:Once(f)
	table.insert(self.once, f)
end

function Signal:Fire(...)
	for i, v in next, self.once do
		v(...)
	end
	table.clear(self.once)
	for i, v in next, self.connections do
		v(...)
	end
end

return Signal
