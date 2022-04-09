local range = NumberRange.new(1000, 1000)

local keypoints = {
    NumberSequenceKeypoint.new(0, 1000),
    NumberSequenceKeypoint.new(1, 1000)
}

local sequence = NumberSequence.new(keypoints)

return function(part)
    local particle = Instance.new("ParticleEmitter")
    particle.Speed = range
    particle.Rate = 1000
    particle.Size = sequence

    particle.Parent = part
end