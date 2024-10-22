local GRAPHICS_PATH = "__simply-greenhouse__/graphics/"

data:extend({
    {
        type = "assembling-machine",
        name = "sg-greenhouse",
        icon = GRAPHICS_PATH .. "icons/sg-greenhouse.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {hardness = 0.2, mining_time = 0.5, result = "sg-greenhouse"},
        max_health = 250,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        resistances = {
            {type = "fire", percent = 70}
        },
        collision_box = {
            {-1.7, -1.7},
            {1.7, 1.7}
        },
        selection_box = {
            {-2, -2},
            {2, 2}
        },
        graphics_set = {
            idle_animation = {
                filename = GRAPHICS_PATH .. "entities/greenhouse-idle.png",
                priority = "low",
                width = 320,
                height = 320,
                frame_count = 1,
                shift = {0.3, 0},
                scale = 0.45
            },
            animation = {
                filename = GRAPHICS_PATH .. "entities/greenhouse-working.png",
                priority = "low",
                width = 320,
                height = 320,
                frame_count = 1,
                shift = {0.3, 0},
                scale = 0.45
            }
        },
        crafting_categories = {"sg-greenhouse"},
        crafting_speed = 1,
        energy_source = {
            type = "electric",
            usage_priority = "primary-input",
            emissions_per_minute = {pollution = -10}
        },
        energy_usage = "500kW",
        open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85},
        close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75},
        vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
        module_specification = {module_slots = 2, module_info_icon_shift = {0, 0.8}},
        allowed_effects = {"consumption", "speed", "productivity"}
    }
})