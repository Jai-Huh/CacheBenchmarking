return function(part)
    local force = Instance.new('VectorForce')
    force.Force = Vector3.new(0, 10, 0)
    force.Parent = part
end