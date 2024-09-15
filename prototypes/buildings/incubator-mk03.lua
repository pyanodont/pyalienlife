local pipe = {
    south = {
        filename = "__pyalienlifegraphics__/graphics/entity/incubator/bottom.png",
        priority = "extra-high",
        width = 224,
        height = 257
    }
}

RECIPE {
    type = "recipe",
    name = "incubator-mk03",
    energy_required = 1,
    enabled = false,
    ingredients = {
        {"molybdenum-plate", 50},
        {"incubator-mk02", 1},
        {"processing-unit", 30},
        {"low-density-structure", 20},
        {"electric-engine-unit", 5},
        {"nbti-alloy", 10},
        {"ticocr-alloy", 20},
        {"sc-unit", 15},
    },
    results = {
        {"incubator-mk03", 1}
    }
}:add_unlock("biotech-machines-mk03"):add_ingredient({type = "item", name = "small-parts-03", amount = 30})

ITEM {
    type = "item",
    name = "incubator-mk03",
    icon = "__pyalienlifegraphics__/graphics/icons/incubator-mk03.png",
	icon_size = 64,
    flags = {},
    subgroup = "py-alienlife-buildings-mk03",
    order = "a",
    place_result = "incubator-mk03",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "incubator-mk03",
    icon = "__pyalienlifegraphics__/graphics/icons/incubator-mk03.png",
	icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "incubator-mk03"},
    fast_replaceable_group = "incubator",
    max_health = 400,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.2, -3.2}, {3.2, 3.2}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 3
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"incubator"},
    crafting_speed = 3,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 1,
    },
    energy_usage = "1500kW",
    animation = {
        layers ={
            {
                filename = "__pyalienlifegraphics__/graphics/entity/incubator/off.png",
                width = 224,
                height = 257,
                frame_count = 1,
                shift = {-0.00, -0.15}
            },
            {
                filename = "__pyalienlifegraphics__/graphics/entity/incubator/off-mask.png",
                width = 224,
                height = 257,
                frame_count = 1,
                shift = {-0.00, -0.15},
                tint = {r = 0.223, g = 0.490, b = 0.858, a = 1.0}
            },
        },
},
    working_visualisations = {
        {
            north_position = {-0.25, -1.624},
            west_position = {-0.25, -1.624},
            south_position = {-0.25, -1.624},
            east_position = {-0.25, -1.624},
            animation = {
                filename = "__pyalienlifegraphics__/graphics/entity/incubator/main.png",
                frame_count = 100,
                width = 140,
                height = 163,
                line_length = 14,
                animation_speed = 0.3,
                priority = "medium",
                run_mode = "forward-then-backward"
            }
        },
        {
            north_position = {-0.0, -3.156},
            west_position = {-0.0, -3.156},
            south_position = {-0.0, -3.156},
            east_position = {-0.0, -3.156},
            animation = {
                filename = "__pyalienlifegraphics__/graphics/entity/incubator/cooler.png",
                frame_count = 80,
                width = 224,
                height = 64,
                line_length = 9,
                animation_speed = 0.5,
                priority = "high"
            }
        },
        {
            north_position = {2.0, -0.556},
            west_position = {2.0, -0.556},
            south_position = {2.0, -0.556},
            east_position = {2.0, -0.556},
            animation = {
                filename = "__pyalienlifegraphics__/graphics/entity/incubator/smoke.png",
                frame_count = 50,
                width = 96,
                height = 96,
                line_length = 20,
                animation_speed = 0.5,
                priority = "high"
            }
        }
    },
    fluid_boxes = {
        {
            production_type = "output",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-2.0, -4.25}, nil, nil, pipe),
            pipe_covers = py.pipe_covers(true, true, true, true),
            volume = 100,
            pipe_connections = {{flow_direction = "output", position = {-2.0, -3.2}, direction = defines.direction.north}},
            priority = "extra-high"
        },
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-2.00, -4.25}, nil, nil, pipe),
            pipe_covers = py.pipe_covers(true, true, true, true),
            volume = 1000,
            base_level = -1,
            pipe_connections = {{flow_direction = "input", position = {2.0, 3.2}, direction = defines.direction.south}},
            priority = "extra-high"
        },
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-2.00, -4.25}, nil, nil, pipe),
            pipe_covers = py.pipe_covers(true, true, true, true),
            volume = 1000,
            base_level = -1,
            pipe_connections = {{flow_direction = "input", position = {3.2, -2.0}, direction = defines.direction.east}},
            priority = "extra-high"
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pyalienlifegraphics__/sounds/incubator.ogg", volume = 0.7},
        idle_sound = {filename = "__pyalienlifegraphics__/sounds/incubator.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
