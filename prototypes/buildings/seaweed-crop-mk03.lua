local MODULE_SLOTS = 30

RECIPE {
    type = "recipe",
    name = "seaweed-crop-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "ticocr-alloy", amount = 35},
        {type = "item", name = "seaweed-crop-mk02", amount = 1},
        {type = "item", name = "neuromorphic-chip", amount = 20},
        {type = "item", name = "processing-unit", amount = 30},
        {type = "item", name = "stainless-steel", amount = 50},
        {type = "item", name = "electric-engine-unit", amount = 10},
    },
    results = {
        {type = "item", name = "seaweed-crop-mk03", amount = 1}
    }
}:add_unlock("botany-mk03"):add_ingredient({type = "item", name = "small-parts-03", amount = 50})

ITEM {
    type = "item",
    name = "seaweed-crop-mk03",
    icon = "__pyalienlifegraphics__/graphics/icons/seaweed-crop-mk03.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-alienlife-farm-buildings-mk03",
    order = "e",
    place_result = "seaweed-crop-mk03",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "seaweed-crop-mk03",
    icon = "__pyalienlifegraphics__/graphics/icons/seaweed-crop-mk03.png",
	icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "seaweed-crop-mk03"},
    fast_replaceable_group = "seaweed-crop",
    max_health = 100,
    corpse = "medium-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-6.2, -6.2}, {6.2, 6.2}},
    selection_box = {{-6.5, -6.5}, {6.5, 6.5}},
    match_animation_speed_to_activity = false,
    module_slots = MODULE_SLOTS,
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"seaweed"},
    crafting_speed = py.farm_speed_derived(MODULE_SLOTS, "seaweed-crop-mk01"),
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = {
            pollution = -35
        },
    },
    energy_usage = "1700kW",
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/seaweed-crop/base.png",
                    width = 416,
                    height = 50,
                    line_length = 4,
                    frame_count = 100,
                    animation_speed = 0.4,
                    shift = util.by_pixel(0, 183)
                },
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/seaweed-crop/base-mask.png",
                    width = 416,
                    height = 50,
                    line_length = 4,
                    frame_count = 100,
                    animation_speed = 0.4,
                    shift = util.by_pixel(0, 183),
                    tint = {r = 0.223, g = 0.490, b = 0.858, a = 1.0}
                },
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/seaweed-crop/a1.png",
                    width = 64,
                    height = 384,
                    line_length = 25,
                    frame_count = 100,
                    animation_speed = 0.4,
                    shift = util.by_pixel(-176, -34)
                },
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/seaweed-crop/a1-mask.png",
                    width = 64,
                    height = 384,
                    line_length = 25,
                    frame_count = 100,
                    animation_speed = 0.4,
                    shift = util.by_pixel(-176, -34),
                    tint = {r = 0.223, g = 0.490, b = 0.858, a = 1.0}
                },
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/seaweed-crop/a2.png",
                    width = 64,
                    height = 384,
                    line_length = 25,
                    frame_count = 100,
                    animation_speed = 0.4,
                    shift = util.by_pixel(-112, -34)
                },
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/seaweed-crop/a2-mask.png",
                    width = 64,
                    height = 384,
                    line_length = 25,
                    frame_count = 100,
                    animation_speed = 0.4,
                    shift = util.by_pixel(-112, -34),
                    tint = {r = 0.223, g = 0.490, b = 0.858, a = 1.0}
                },
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/seaweed-crop/a3.png",
                    width = 64,
                    height = 384,
                    line_length = 25,
                    frame_count = 100,
                    animation_speed = 0.4,
                    shift = util.by_pixel(-48, -34)
                },
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/seaweed-crop/a3-mask.png",
                    width = 64,
                    height = 384,
                    line_length = 25,
                    frame_count = 100,
                    animation_speed = 0.4,
                    shift = util.by_pixel(-48, -34),
                    tint = {r = 0.223, g = 0.490, b = 0.858, a = 1.0}
                },
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/seaweed-crop/a4.png",
                    width = 64,
                    height = 384,
                    line_length = 25,
                    frame_count = 100,
                    animation_speed = 0.4,
                    shift = util.by_pixel(16, -34)
                },
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/seaweed-crop/a4-mask.png",
                    width = 64,
                    height = 384,
                    line_length = 25,
                    frame_count = 100,
                    animation_speed = 0.4,
                    shift = util.by_pixel(16, -34),
                    tint = {r = 0.223, g = 0.490, b = 0.858, a = 1.0}
                },
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/seaweed-crop/a5.png",
                    width = 64,
                    height = 384,
                    line_length = 25,
                    frame_count = 100,
                    animation_speed = 0.4,
                    shift = util.by_pixel(80, -34)
                },
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/seaweed-crop/a5-mask.png",
                    width = 64,
                    height = 384,
                    line_length = 25,
                    frame_count = 100,
                    animation_speed = 0.4,
                    shift = util.by_pixel(80, -34),
                    tint = {r = 0.223, g = 0.490, b = 0.858, a = 1.0}
                },
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/seaweed-crop/a6.png",
                    width = 64,
                    height = 384,
                    line_length = 25,
                    frame_count = 100,
                    animation_speed = 0.4,
                    shift = util.by_pixel(144, -34)
                },
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/seaweed-crop/a6-mask.png",
                    width = 64,
                    height = 384,
                    line_length = 25,
                    frame_count = 100,
                    animation_speed = 0.4,
                    shift = util.by_pixel(144, -34),
                    tint = {r = 0.223, g = 0.490, b = 0.858, a = 1.0}
                },
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/seaweed-crop/a7.png",
                    width = 32,
                    height = 384,
                    line_length = 25,
                    frame_count = 100,
                    animation_speed = 0.4,
                    shift = util.by_pixel(192, -34)
                },
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/seaweed-crop/a7-mask.png",
                    width = 32,
                    height = 384,
                    line_length = 25,
                    frame_count = 100,
                    animation_speed = 0.4,
                    shift = util.by_pixel(192, -34),
                    tint = {r = 0.223, g = 0.490, b = 0.858, a = 1.0}
                },
            }
        },
    },

    fluid_boxes_off_when_no_fluid_recipe = true,
    fluid_boxes = {
        --1
        {
            production_type = "input",
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.88}, nil, nil),
            volume = 1000,
            base_level = -1,
            pipe_connections = {{flow_direction = "input", position = {4.0, -6.2}, direction = defines.direction.north}}
        },
        {
            production_type = "input",
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.88}, nil, nil),
            volume = 1000,
            base_level = -1,
            pipe_connections = {{flow_direction = "input", position = {2.0, -6.2}, direction = defines.direction.north}}
        },
        {
            production_type = "input",
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.88}, nil, nil),
            volume = 1000,
            base_level = -1,
            pipe_connections = {{flow_direction = "input", position = {-2.0, -6.2}, direction = defines.direction.north}}
        },
        {
            production_type = "input",
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.88}, nil, nil),
            volume = 1000,
            base_level = -1,
            pipe_connections = {{flow_direction = "input", position = {-4.0, -6.2}, direction = defines.direction.north}}
        },
        {
            production_type = "output",
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.88}, nil, nil),
            volume = 100,
            pipe_connections = {{flow_direction = "output", position = {2.0, 6.2}, direction = defines.direction.south}}
        },
        {
            production_type = "output",
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.88}, nil, nil),
            volume = 100,
            pipe_connections = {{flow_direction = "output", position = {-2.0, 6.2}, direction = defines.direction.south}}
        },
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact-1.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pyalienlifegraphics__/sounds/seaweed-crop.ogg", volume = 1.5},
        idle_sound = {filename = "__pyalienlifegraphics__/sounds/seaweed-crop.ogg", volume = 0.3},
        audible_distance_modifier = 0.22,
    }
}
