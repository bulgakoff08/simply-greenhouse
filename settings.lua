data:extend({
    {
        type = "string-setting",
        name = "sg-enable-charcoal-recipe",
        setting_type = "startup",
        default_value = "Yes",
        allowed_values = {"Yes", "No"}
    },
    {
        type = "string-setting",
        name = "sg-enable-water-recipe",
        setting_type = "startup",
        default_value = "Yes",
        allowed_values = {"Yes", "No"}
    },
    {
        type = "int-setting",
        name = "sg-wood-input-amount",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 1,
        maximum_value = 3
    },
    {
        type = "int-setting",
        name = "sg-greenhouse-recipe-duration",
        setting_type = "startup",
        default_value = 30,
        minimum_value = 10,
        maximum_value = 600
    },
    {
        type = "int-setting",
        name = "sg-charcoal-output-amount",
        setting_type = "startup",
        default_value = 3,
        minimum_value = 1,
        maximum_value = 10
    }
})