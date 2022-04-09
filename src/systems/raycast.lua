local start = Vector3.new(0, 0, 0)
local direction = (Vector3.new(10, 0, 0) - start).Unit * 10000

local params = RaycastParams.new()

return function()
    workspace:Raycast(start, direction, params)
end