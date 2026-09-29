--!strict

local Cooldown = {}
Cooldown.__index = Cooldown

function Cooldown.new(duration: number)
return setmetatable({ _duration = duration, _last = {} }, Cooldown)
end

function Cooldown:isReady(key: any): boolean
local last = self._last[key]
return last == nil or os.clock() - last >= self._duration
end

function Cooldown:try(key: any): boolean
if not self:isReady(key) then
return false
end
self._last[key] = os.clock()
return true
end

function Cooldown:clear(key: any)
self._last[key] = nil
end

return Cooldown
