-- Copyright (c) 2020 Kirazy
-- Part of Bob's Logistics Belt Reskin
--     
-- See LICENSE.md in the project directory for license information.

-- Set mod directory
local modDir = "__boblogistics-belt-reskin__"

-- Initialize function storage
if not beltReskin then beltReskin = {} end

-- Store tint values for use with particle creation, format is ["entityPrefix"] = {{transport-belt},{underground-belt},{splitter}}
beltReskin.particleTint = {
    ["basic"] = {{a = 1, b = 187, g = 187, r = 187},{a = 1, b = 197, g = 197, r = 197},{a = 1, b = 192, g = 192, r = 192}},
    ["turbo"] = {{a = 1, b = 160, g = 0, r = 186},{a = 1,b = 214, g = 31, r = 231},{a = 1, b = 207, g = 29, r = 221}},
    ["ultimate"] = {{a = 1, b = 0, g = 214, r = 59},{a = 1, b = 57, g = 232, r = 106},{a = 1, b = 55, g = 226, r = 100}}
}

-- This function creates corpses for splitter entities
function beltReskin.createRemnants(entityName, entityType)
    local remnant = table.deepcopy(data.raw["corpse"][entityType.."-remnants"])
    remnant.name = entityName.."-remnants"
    remnant.icon = modDir.."/graphics/icons/"..entityName..".png"

    if entityType == "transport-belt" then
        remnant.animation[1].filename = modDir.."/graphics/entity/"..entityName.."/remnants/"..entityName.."-remnants.png"
        remnant.animation[1].hr_version.filename = modDir.."/graphics/entity/"..entityName.."/remnants/hr-"..entityName.."-remnants.png"
        remnant.animation[2].filename = modDir.."/graphics/entity/"..entityName.."/remnants/"..entityName.."-remnants.png"
        remnant.animation[2].hr_version.filename = modDir.."/graphics/entity/"..entityName.."/remnants/hr-"..entityName.."-remnants.png"
    else
        remnant.animation.filename = modDir.."/graphics/entity/"..entityName.."/remnants/"..entityName.."-remnants.png"
        remnant.animation.hr_version.filename = modDir.."/graphics/entity/"..entityName.."/remnants/hr-"..entityName.."-remnants.png"
    end
    data:extend({remnant})
end

-- This function patches sprites for transport belts
function beltReskin.patchTransport(entityName)
    local entity = data.raw["transport-belt"][entityName.."-transport-belt"]
	entity.belt_animation_set = _G[entityName.."_transport_belt_animation_set"]
	entity.icon = modDir.."/graphics/icons/"..entityName.."-transport-belt.png"
	entity.icon_size = 64
    entity.corpse = entityName.."-transport-belt-remnants"
    entity.dying_explosion = entityName.."-transport-belt-explosion"
end

-- This function patches sprites for underground belts
function beltReskin.patchUnderground(entityName)
    local entity = data.raw["underground-belt"][entityName.."-underground-belt"]
    
	entity.belt_animation_set = _G[entityName.."_transport_belt_animation_set"]
	entity.icon = modDir.."/graphics/icons/"..entityName.."-underground-belt.png"
	entity.icon_size = 64
    entity.corpse = entityName.."-underground-belt-remnants"
    entity.dying_explosion = entityName.."-underground-belt-explosion"
	entity.structure.direction_in.sheet.filename = modDir.."/graphics/entity/"..entityName.."-underground-belt/"..entityName.."-underground-belt-structure.png"
	entity.structure.direction_in.sheet.hr_version.filename = modDir.."/graphics/entity/"..entityName.."-underground-belt/hr-"..entityName.."-underground-belt-structure.png"
	entity.structure.direction_out.sheet.filename = modDir.."/graphics/entity/"..entityName.."-underground-belt/"..entityName.."-underground-belt-structure.png"
    entity.structure.direction_out.sheet.hr_version.filename = modDir.."/graphics/entity/"..entityName.."-underground-belt/hr-"..entityName.."-underground-belt-structure.png"
end

-- This function patches sprites for splitters
function beltReskin.patchSplitter(entityName)	
	local entity = data.raw["splitter"][entityName.."-splitter"]
	entity.belt_animation_set = _G[entityName.."_transport_belt_animation_set"]
	entity.icon = modDir.."/graphics/icons/"..entityName.."-splitter.png"
	entity.icon_size = 64
	entity.corpse = entityName.."-splitter-remnants"
    entity.dying_explosion = entityName.."-splitter-explosion"
	entity.structure.north.filename = modDir.."/graphics/entity/"..entityName.."-splitter/"..entityName.."-splitter-north.png"
	entity.structure.north.hr_version.filename = modDir.."/graphics/entity/"..entityName.."-splitter/hr-"..entityName.."-splitter-north.png"
	entity.structure.east =
	{
		filename = modDir.."/graphics/entity/"..entityName.."-splitter/"..entityName.."-splitter-east.png",
		frame_count = 32,
		line_length = 8,
		priority = "extra-high",
		width = 46,
		height = 44,
		shift = util.by_pixel(4, 12),
		hr_version =
		{
		filename = modDir.."/graphics/entity/"..entityName.."-splitter/hr-"..entityName.."-splitter-east.png",
		frame_count = 32,
		line_length = 8,
		priority = "extra-high",
		width = 90,
		height = 84,
		shift = util.by_pixel(4, 13),
		scale = 0.5
		}
	}
	entity.structure.south.filename = modDir.."/graphics/entity/"..entityName.."-splitter/"..entityName.."-splitter-south.png"
	entity.structure.south.hr_version.filename = modDir.."/graphics/entity/"..entityName.."-splitter/hr-"..entityName.."-splitter-south.png"	
	entity.structure.west =
	{
		filename = modDir.."/graphics/entity/"..entityName.."-splitter/"..entityName.."-splitter-west.png",
		frame_count = 32,
		line_length = 8,
		priority = "extra-high",
		width = 46,
		height = 44,
		shift = util.by_pixel(4, 12),
		hr_version =
		{
		filename = modDir.."/graphics/entity/"..entityName.."-splitter/hr-"..entityName.."-splitter-west.png",
		frame_count = 32,
		line_length = 8,
		priority = "extra-high",
		width = 94,
		height = 84,
		shift = util.by_pixel(4, 13),
		scale = 0.5
		}
	}
	entity.structure_patch = 
	{
		north = util.empty_sprite(),
		east =
		{
			filename = modDir.."/graphics/entity/"..entityName.."-splitter/"..entityName.."-splitter-east-top_patch.png",
			frame_count = 32,
			line_length = 8,
			priority = "extra-high",
			width = 46,
			height = 52,
			shift = util.by_pixel(4, -20),
			hr_version =
			{
				filename = modDir.."/graphics/entity/"..entityName.."-splitter/hr-"..entityName.."-splitter-east-top_patch.png",
				frame_count = 32,
				line_length = 8,
				priority = "extra-high",
				width = 90,
				height = 104,
				shift = util.by_pixel(4, -20),
				scale = 0.5
			}
		},	
		south = util.empty_sprite(),
		west =
		{
			filename = modDir.."/graphics/entity/"..entityName.."-splitter/"..entityName.."-splitter-west-top_patch.png",
			frame_count = 32,
			line_length = 8,
			priority = "extra-high",
			width = 46,
			height = 48,
			shift = util.by_pixel(4, -20),
			hr_version =
			{
				filename = modDir.."/graphics/entity/"..entityName.."-splitter/hr-"..entityName.."-splitter-west-top_patch.png",
				frame_count = 32,
				line_length = 8,
				priority = "extra-high",
				width = 94,
				height = 96,
				shift = util.by_pixel(4, -20),
				scale = 0.5
			}
		}
	}
end

-- This function creates particle entities
function beltReskin.createParticles(entityName)
    
    -- transport-belt-metal-particle-medium
    local mediumBeltParticle = table.deepcopy(data.raw["optimized-particle"]["transport-belt-metal-particle-medium"])
    mediumBeltParticle.name = entityName.."-transport-belt-metal-particle-medium"
    mediumBeltParticle.pictures.sheet.tint = beltReskin.particleTint[entityName][1]
    mediumBeltParticle.pictures.sheet.hr_version.tint = beltReskin.particleTint[entityName][1]
    data:extend({mediumBeltParticle})
        
    -- transport-belt-metal-particle-small
    local smallBeltParticle = table.deepcopy(data.raw["optimized-particle"]["transport-belt-metal-particle-small"])
    smallBeltParticle.name = entityName.."-transport-belt-metal-particle-small"
    smallBeltParticle.pictures.sheet.tint = beltReskin.particleTint[entityName][1]
    smallBeltParticle.pictures.sheet.hr_version.tint = beltReskin.particleTint[entityName][1]
    data:extend({smallBeltParticle})

    -- underground-belt-metal-particle-small
    local smallUndergroundParticle = table.deepcopy(data.raw["optimized-particle"]["underground-belt-metal-particle-small"])
    smallUndergroundParticle.name = entityName.."-underground-belt-metal-particle-small"
    smallUndergroundParticle.pictures.sheet.tint = beltReskin.particleTint[entityName][2]
    smallUndergroundParticle.pictures.sheet.hr_version.tint = beltReskin.particleTint[entityName][2]
    data:extend({smallUndergroundParticle})

    -- underground-belt-metal-particle-tinted
    local tintedUndergroundParticle = table.deepcopy(data.raw["optimized-particle"]["underground-belt-metal-particle-medium-yellow"])
    tintedUndergroundParticle.name = entityName.."-underground-belt-metal-particle-medium-tinted"
    tintedUndergroundParticle.pictures.sheet.tint = beltReskin.particleTint[entityName][2]
    tintedUndergroundParticle.pictures.sheet.hr_version.tint = beltReskin.particleTint[entityName][2]
    data:extend({tintedUndergroundParticle})

    -- splitter-metal-particle-medium
    local mediumSplitterParticle = table.deepcopy(data.raw["optimized-particle"]["splitter-metal-particle-medium"])
    mediumSplitterParticle.name = entityName.."-splitter-metal-particle-medium"
    mediumSplitterParticle.pictures.sheet.tint = beltReskin.particleTint[entityName][1]
    mediumSplitterParticle.pictures.sheet.hr_version.tint = beltReskin.particleTint[entityName][3]
    data:extend({mediumSplitterParticle})

    -- splitter-metal-particle-big
    local bigSplitterParticle = table.deepcopy(data.raw["optimized-particle"]["splitter-metal-particle-big"])
    bigSplitterParticle.name = entityName.."-splitter-metal-particle-big"
    bigSplitterParticle.pictures.sheet.tint = beltReskin.particleTint[entityName][1]
    bigSplitterParticle.pictures.sheet.hr_version.tint = beltReskin.particleTint[entityName][3]
    data:extend({bigSplitterParticle})
end

-- This function creates explosion entities
function beltReskin.createExplosions(entityName,entityType)
    local explosion = table.deepcopy(data.raw["explosion"][entityType.."-explosion"])
    explosion.name = entityName.."-"..entityType.."-explosion"
    explosion.icon = modDir.."/graphics/icons/"..entityName.."-"..entityType..".png"

    -- Transport belt explosions
    if entityType == "transport-belt" then
        explosion.created_effect.action_delivery.target_effects[1].particle_name = entityName.."-transport-belt-metal-particle-medium"
        explosion.created_effect.action_delivery.target_effects[2].particle_name = entityName.."-transport-belt-metal-particle-small"
    end

    -- Underground belt explosions
    if entityType == "underground-belt" then
        explosion.created_effect.action_delivery.target_effects[2].particle_name = entityName.."-underground-belt-metal-particle-small"
        explosion.created_effect.action_delivery.target_effects[3].particle_name = entityName.."-underground-belt-metal-particle-medium-tinted"
    end

    -- Splitter explosions
    if entityType == "splitter" then
        explosion.created_effect.action_delivery.target_effects[1].particle_name = entityName.."-splitter-metal-particle-medium"
        explosion.created_effect.action_delivery.target_effects[4].particle_name = entityName.."-splitter-metal-particle-big"
    end

    data:extend({explosion})
end

-- This function replaces the icons
function beltReskin.patchIcon(entityName)
    data.raw["item"][entityName].icon = modDir.."/graphics/icons/"..entityName..".png"
	data.raw["item"][entityName].icon_size = 64
end