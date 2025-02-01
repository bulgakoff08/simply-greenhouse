local GRAPHICS_PATH = "__simply-greenhouse__/graphics/"

local function item (itemId, stackSize, subgroup)
    return {
        type = "item",
        name = itemId,
        icon = GRAPHICS_PATH .. "icons/" .. itemId .. ".png",
        icon_size = 64,
        subgroup = subgroup,
        stack_size = stackSize
    }
end

local function fuel (itemId, stackSize, subgroup, energyValue)
    local result = item(itemId, stackSize, subgroup)
    result["fuel_value"] = energyValue
    result["fuel_category"] = "chemical"
    result["fuel_emissions_multiplier"] = 0.5 -- wow, so eco-friendly!
    return result
end

local function machine (itemId, stackSize, subgroup)
    local result = item(itemId, stackSize, subgroup)
    result["place_result"] = itemId
    return result
end

local function createTreeProjectile (treeNumber)
    return {
        type = "projectile",
        name = "grenade-tree-" .. treeNumber,
        flags = {"not-on-map"},
        acceleration = 0.005,
        action = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {
                        type = "create-entity",
                        entity_name = "tree-0" .. treeNumber,
                        trigger_created_entity = true
                    }
                }
            }
        },
        light = {intensity = 0.5, size = 4},
        animation = {
            filename = GRAPHICS_PATH .. "entities/sg-capsule-housing.png",
            frame_count = 1,
            width = 24,
            height = 24,
            priority = "high"
        },
        shadow = {
            filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
            frame_count = 1,
            width = 24,
            height = 24,
            priority = "high"
        }
    }
end

local function createTreeCapsule (treeNumber)
    return {
        type = "capsule",
        name = "sg-sapling-capsule-" .. treeNumber,
        icon = GRAPHICS_PATH .. "icons/sg-sapling-capsule-" .. treeNumber .. ".png",
        icon_size = 64,
        capsule_action = {
            type = "throw",
            attack_parameters = {
                type = "projectile",
                ammo_category = "grenade",
                cooldown = 15,
                projectile_creation_distance = 0.6,
                range = 50,
                ammo_type = {
                    category = "grenade",
                    target_type = "position",
                    action = {
                        type = "direct",
                        action_delivery = {
                            type = "projectile",
                            projectile = "grenade-tree-" .. treeNumber,
                            starting_speed = 0.3
                        }
                    }
                }
            }
        },
        subgroup = "capsule",
        order = "a[grenade]-b[sg-sapling-capsule-" .. treeNumber .. "]",
        stack_size = 50
    }
end

data:extend({
    fuel("sg-charcoal", 100, "intermediate-product", "2MJ"),
    fuel("sg-sapling", 100, "intermediate-product", "1MJ"),
    machine("sg-greenhouse", 10, "production-machine"),
    item("sg-capsule-housing", 50, "intermediate-product")
})

for treeNumber = 1, 9 do
    data:extend({
        createTreeProjectile(treeNumber),
        createTreeCapsule(treeNumber)
    })
end