local MODULE_SLOTS = 5
local FULL_CRAFTING_SPEED = .4 -- crafting speed when full of mk01 modules


RECIPE {
    type = "recipe",
    name = "simik-den-mk01",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "concrete", amount = 20},
        {type = "item", name = "gate", amount = 1},
        {type = "item", name = "nbfe-alloy", amount = 20},
        {type = "item", name = "sncr-alloy", amount = 20},
        {type = "item", name = "big-electric-pole", amount = 8},
        {type = "item", name = "lens", amount = 10},
        {type = "item", name = "advanced-circuit", amount = 20},
        {type = "item", name = "pump", amount = 1},
        {type = "item", name = "steel-plate", amount = 50},
    },
    results = {
        {type = "item", name = "simik-den-mk01", amount = 1}
    }
}:add_unlock("simik-mk01")

ITEM {
    type = "item",
    name = "simik-den-mk01",
    icon = "__pyalienlifegraphics2__/graphics/icons/simik-den-mk01.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-alienlife-farm-buildings-mk01",
    order = "d",
    place_result = "simik-den-mk01",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "simik-den-mk01",
    icon = "__pyalienlifegraphics2__/graphics/icons/simik-den-mk01.png",
	icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "simik-den-mk01"},
    fast_replaceable_group = "simik-den",
    max_health = 400,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-7.6, -7.6}, {7.6, 7.6}},
    selection_box = {{-8.0, -8.0}, {8.0, 8.0}},
    match_animation_speed_to_activity = false,
    module_slots = MODULE_SLOTS,
    allowed_effects = {'speed', 'productivity', 'consumption', 'pollution'},
    crafting_categories = {"simik"},
    crafting_speed = py.farm_speed(MODULE_SLOTS, FULL_CRAFTING_SPEED),
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = {
            pollution = 2
        },
    },
    energy_usage = "400kW",
    graphics_set = {
        working_visualisations = {
            --MID
            {
                north_position = util.by_pixel(105, -56),
                west_position = util.by_pixel(105, -56),
                south_position = util.by_pixel(105, -56),
                east_position = util.by_pixel(105, -56),
                animation = {
                    filename = "__pyalienlifegraphics2__/graphics/entity/simik-den/mid.png",
                    frame_count = 45,
                    width = 128,
                    height = 288,
                    line_length = 9,
                    animation_speed = 0.4,
                    priority = "medium"
                }
            },
            --LAVA POP
            {
                north_position = util.by_pixel(96, 64),
                west_position = util.by_pixel(96, 64),
                south_position = util.by_pixel(96, 64),
                east_position = util.by_pixel(96, 64),
                animation = {
                    filename = "__pyalienlifegraphics2__/graphics/entity/simik-den/lava-pop.png",
                    frame_count = 50,
                    width = 96,
                    height = 128,
                    line_length = 10,
                    animation_speed = 0.4,
                    priority = "medium"
                }
            },
            --LAVA TOP
            {
                north_position = util.by_pixel(27, -120),
                west_position = util.by_pixel(27, -120),
                south_position = util.by_pixel(27, -120),
                east_position = util.by_pixel(27, -120),
                animation = {
                    filename = "__pyalienlifegraphics2__/graphics/entity/simik-den/lava-top.png",
                    frame_count = 26,
                    width = 96,
                    height = 128,
                    line_length = 13,
                    animation_speed = 0.4,
                    priority = "high"
                }
            },
            --ROAR
            {
                north_position = util.by_pixel(32, -76),
                west_position = util.by_pixel(32, -76),
                south_position = util.by_pixel(32, -76),
                east_position = util.by_pixel(32, -76),
                animation = {
                    filename = "__pyalienlifegraphics2__/graphics/entity/simik-den/roar.png",
                    frame_count = 96,
                    width = 128,
                    height = 128,
                    line_length = 12,
                    animation_speed = 0.4,
                    priority = "medium"
                }
            },
            --LEFT
            {
                north_position = util.by_pixel(-80, 76),
                west_position = util.by_pixel(-80, 76),
                south_position = util.by_pixel(-80, 76),
                east_position = util.by_pixel(-80, 76),
                animation = {
                    filename = "__pyalienlifegraphics2__/graphics/entity/simik-den/left.png",
                    frame_count = 46,
                    width = 256,
                    height = 128,
                    line_length = 5,
                    animation_speed = 0.4,
                    priority = "medium"
                }
            },
            --ENCLOSURE-OVER
            {
                north_position = util.by_pixel(-0, 0),
                west_position = util.by_pixel(-0, 0),
                south_position = util.by_pixel(-0, 0),
                east_position = util.by_pixel(-0, 0),
                animation = {
                    filename = "__pyalienlifegraphics2__/graphics/entity/simik-den/enclosure-over.png",
                    width = 576,
                    height = 576,
                    frame_count = 1,
                    shift = util.by_pixel(0, 0),
                    priority = "high"
                }
            },
            --POOF-1
            {
                north_position = util.by_pixel(-128, 32),
                west_position = util.by_pixel(-128, 32),
                south_position = util.by_pixel(-128, 32),
                east_position = util.by_pixel(-128, 32),
                animation = {
                    filename = "__pyalienlifegraphics2__/graphics/entity/simik-den/poof-1.png",
                    frame_count = 70,
                    width = 64,
                    height = 192,
                    line_length = 10,
                    animation_speed = 0.35,
                    priority = "medium"
                }
            },
            --POOF-2
            {
                north_position = util.by_pixel(160, -141),
                west_position = util.by_pixel(160, -141),
                south_position = util.by_pixel(160, -141),
                east_position = util.by_pixel(160, -141),
                animation = {
                    filename = "__pyalienlifegraphics2__/graphics/entity/simik-den/poof-2.png",
                    frame_count = 60,
                    width = 64,
                    height = 160,
                    line_length = 20,
                    animation_speed = 0.35,
                    priority = "medium"
                }
            },
        },
        animation = {
            layers = {
                --TERRAIN
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/simik-den/terrain.png",
                    width = 576,
                    height = 576,
                    frame_count = 1,
                    shift = util.by_pixel(0, 0),
                    priority = "low"
                },
                --ENCLOSURE
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/simik-den/enclosure.png",
                    width = 576,
                    height = 576,
                    frame_count = 1,
                    shift = util.by_pixel(0, 0),
                    priority = "low"
                },
                --MASK
                {
                    filename = "__pyalienlifegraphics2__/graphics/entity/simik-den/enclosure-mask.png",
                    width = 576,
                    height = 576,
                    frame_count = 1,
                    shift = util.by_pixel(0, 0),
                    priority = "low",
                    tint = {r = 1.0, g = 1.0, b = 0.0, a = 1.0},
                },
            }
        },
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact-1.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pyalienlifegraphics2__/sounds/simik-den.ogg", volume = 0.90},
        idle_sound = {filename = "__pyalienlifegraphics2__/sounds/simik-den.ogg", volume = 0.0},
        audible_distance_modifier = 0.35,
    },
    fluid_boxes = {
        --1
        {
            production_type = "input",
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.88}, nil, nil),
            volume = 1000,
            pipe_connections = {
                {flow_direction = "input", position = {0.5, -7.6}, direction = defines.direction.north},
                {flow_direction = "input", position = {-0.5, -7.6}, direction = defines.direction.north}
            },
            secondary_draw_orders = { north = -1 }
        },
        off_when_no_fluid_recipe = true
    },
}
