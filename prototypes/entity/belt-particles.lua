-- Create belt particles
if data.raw["transport-belt"]["basic-transport-belt"] then
    beltReskin.createParticles("basic")
end

if data.raw["transport-belt"]["turbo-transport-belt"] then
    beltReskin.createParticles("turbo")
end

if data.raw["transport-belt"]["ultimate-transport-belt"] then
    beltReskin.createParticles("ultimate")
end