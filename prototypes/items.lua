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

data:extend({
    fuel("sg-charcoal", 100, "intermediate-product", "2MJ"),
    fuel("sg-sapling", 100, "intermediate-product", "1MJ"),
    machine("sg-greenhouse", 10, "production-machine")
})