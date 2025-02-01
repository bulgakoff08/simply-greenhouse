local GRAPHICS_PATH = "__simply-greenhouse__/graphics/"

local function type(itemId)
    if (itemId == "water") then
        return "fluid"
    elseif (itemId == "crude-oil") then
        return "fluid"
    else
        return "item"
    end
end

local function ingredient(itemId, count)
    return {
        type = type(itemId),
        name = itemId,
        amount = count
    }
end

local function items(item1, amount1, item2, amount2, item3, amount3, item4, amount4)
    local result = {}
    if (item1 ~= nil) then table.insert(result, ingredient(item1, amount1)) end
    if (item2 ~= nil) then table.insert(result, ingredient(item2, amount2)) end
    if (item3 ~= nil) then table.insert(result, ingredient(item3, amount3)) end
    if (item4 ~= nil) then table.insert(result, ingredient(item4, amount4)) end
    return result
end

local function recipe(category, duration, recipeId, inputs, outputs)
    return {
        type = "recipe",
        name = recipeId,
        category = category,
        energy_required = duration,
        ingredients = inputs,
        results = outputs,
        main_product = outputs[1]["name"]
    }
end

local function recipeWithIcon(category, duration, icon, recipeId, inputs, outputs)
    local result = recipe(category, duration, recipeId, inputs, outputs)
    result["icon"] = GRAPHICS_PATH .. "icons/recipes/" .. icon .. ".png"
    result["icon_size"] = 64
    return result
end

data:extend({
    recipe("crafting", 1, "sg-greenhouse", items("lab", 1, "small-lamp", 5, "landfill", 10), items("sg-greenhouse", 1)),
    recipe("crafting-with-fluid", 1, "sg-sapling", items("wood", 1, "water", 100), items("sg-sapling", 4)),
    recipeWithIcon("sg-greenhouse", 30, "grow-wood", "sg-grow-wood", items("sg-sapling", 40), items("wood", 40)),
    recipe("crafting", 0.5, "sg-capsule-housing", items("iron-plate", 5, "coal", 10), items("sg-capsule-housing", 10))
})

for treeNumber = 1, 9 do
    data:extend({
        recipe("crafting", 0.5, "sg-sapling-capsule-" .. treeNumber, items("sg-capsule-housing", 1, "sg-sapling", 2), items("sg-sapling-capsule-" .. treeNumber, 1)),
    })
end

if settings.startup["sg-enable-charcoal-recipe"].value == "Yes" then
    data:extend({
        recipe("smelting", 1, "sg-charcoal", items("wood", 1), items("sg-charcoal", 3))
    })
end
if settings.startup["sg-enable-water-recipe"].value == "Yes" then
    data:extend({
        recipeWithIcon("crafting-with-fluid", 1, "water-well", "sg-water-well", {}, items("water", 1000))
    })
end