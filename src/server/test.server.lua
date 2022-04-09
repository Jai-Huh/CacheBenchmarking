local ServerStorage = game:GetService("ServerStorage")
local systems = ServerStorage.Systems

local raycast = require(systems.raycast)
local createPart = require(systems.createPart)
local destroyPart = require(systems.destroyPart)
local applyForce = require(systems.applyForce)
local applyParticle = require(systems.applyParticle)
local createClosure = require(systems.createClosure)

task.wait(3)
local unoptimizedTotalTime = 0
for _ = 1, 100 do
    local partList = {}
    for i = 1, 500 do
        local one = os.clock()

        local part = createPart()
        table.insert(partList, part)
        unoptimizedTotalTime += os.clock() - one
        one = os.clock()

        applyForce(part)
        unoptimizedTotalTime += os.clock() - one
        one = os.clock()

        applyParticle(part)
        unoptimizedTotalTime += os.clock() - one
        one = os.clock()

        destroyPart(part)
        unoptimizedTotalTime += os.clock() - one
        one = os.clock()

        createClosure()
        unoptimizedTotalTime += os.clock() - one
        one = os.clock()

        raycast()
        unoptimizedTotalTime += os.clock() - one
        one = os.clock()
    end
end
local averagedUnoptimizedTime = unoptimizedTotalTime / (500 * 100)

local optimizedTime = 0
for _ = 1, 100 do
    local partList = {}
    for i = 1, 500 do
        local start = os.clock()
        local part = createPart()
        table.insert(partList, part)
        optimizedTime += os.clock() - start
    end
    for i = 1, 500 do
        local start = os.clock()
        applyForce(partList[i])
        optimizedTime += os.clock() - start
    end
    for i = 1, 500 do
        local start = os.clock()
        applyParticle(partList[i])
        optimizedTime += os.clock() - start
    end
    for i = 1, 500 do
        local start = os.clock()
        destroyPart(partList[i])
        optimizedTime += os.clock() - start
    end
    for i = 1, 500 do
        local start = os.clock()
        createClosure()
        optimizedTime += os.clock() - start
    end
    for i = 1, 500 do
        local start = os.clock()
        raycast()
        optimizedTime += os.clock() - start
    end
end
local averagedOptimizedTime = optimizedTime / (500 * 100)
warn("  Optimized:", optimizedTime)
warn("Unoptimized:", unoptimizedTotalTime)
