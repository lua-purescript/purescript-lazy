-- module Data.Lazy

local exports = {}

local Defer = {}

exports.defer = function(thunk)
	local function force(self)
		local value = self.thunk()
		self.thunk = function()
			return value
		end
		return value
	end
	local ret = {}
	ret.thunk = thunk
	ret.force = force
	return ret
end

exports.force = function(l)
	return l:force()
end

return exports
