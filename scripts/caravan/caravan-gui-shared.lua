local prototypes = require 'caravan-prototypes'

function Caravan.status_img(caravan_data)
    local entity = caravan_data.entity
    if caravan_data.is_aerial then
        return {'entity-status.working'}, 'utility/status_working'
    elseif caravan_data.fuel_bar == 0 and caravan_data.fuel_inventory.is_empty() then
        return {'entity-status.starved'}, 'utility/status_not_working'
    elseif entity.health ~= entity.prototype.max_health then
        return {'entity-status.wounded'}, 'utility/status_yellow'
    elseif not Caravan.is_automated(caravan_data) then
        return {'entity-status.idle'}, 'utility/status_yellow'
    else
        return {'entity-status.healthy'}, 'utility/status_working'
    end
end

local function convert_to_tooltip_row(name, count)
    return {'', '\n[item=' .. name .. '] ', prototypes.item[name].localised_name, ' ×', count}
end

function Caravan.get_inventory_tooltip(caravan_data)
    local inventory = caravan_data.inventory
    ---@type (table | string)[]
    local inventory_contents = {'', '\n[img=utility/trash_white] ', {'caravan-gui.the-inventory-is-empty'}}
    if inventory and inventory.valid then
        local sorted_contents = {}
        for name, count in pairs(inventory.get_contents()) do
            sorted_contents[#sorted_contents + 1] = {name = name, count = count}
        end
        table.sort(sorted_contents, function(a, b) return a.count > b.count end)
        
        local i = 0
        for _, item in pairs(sorted_contents) do
            if i == 0 then inventory_contents = {''} end
            local name, count = item.name, item.count
            inventory_contents[#inventory_contents + 1] = convert_to_tooltip_row(name, count)
            i = i + 1
            if i == 10 then
                if #sorted_contents > 10 then
                    inventory_contents[#inventory_contents + 1] = {'', '\n[color=255,210,73]', {'caravan-gui.more-items', #sorted_contents - 10}, '[/color]'}
                end
                break
            end
        end
    end
    return {'', '[font=default-semibold]', inventory_contents, '[/font]'}
end

function Caravan.get_summary_tooltip(caravan_data)
    local entity = caravan_data.entity

    local schedule = caravan_data.schedule[caravan_data.schedule_id]
    ---@type (table | string)[]
    local current_action = {'caravan-gui.current-action', {'entity-status.idle'}}
    if schedule then
        local action_id = caravan_data.action_id
        local action = schedule.actions[action_id]
        current_action = {'', {'caravan-gui.current-action', action and action.localised_name or {'caravan-actions.traveling'}}}

        local destination
        local localised_destination_name
        local destination_entity = schedule.entity
        if destination_entity and destination_entity.valid then
            destination = destination_entity.position
            localised_destination_name = {
                'caravan-gui.entity-position',
                destination_entity.prototype.localised_name,
                math.floor(destination.x),
                math.floor(destination.y)
            }
        elseif schedule.position then
            destination = schedule.position
            localised_destination_name = {'caravan-gui.map-position', math.floor(destination.x), math.floor(destination.y)}
        end
        
        if localised_destination_name then
            local distance = math.sqrt((entity.position.x - destination.x) ^ 2 + (entity.position.y - destination.y) ^ 2)
            distance = math.floor(distance * 10) / 10
            current_action[#current_action + 1] = {'', '\n', {'caravan-gui.current-destination', distance, localised_destination_name}}
        end
    end

    local fuel_inventory = caravan_data.fuel_inventory
    ---@type (table | string)[]
    local fuel_inventory_contents = {''}
    if fuel_inventory and fuel_inventory.valid then
        local i = 0
        for name, count in pairs(fuel_inventory.get_contents()) do
            fuel_inventory_contents[#fuel_inventory_contents + 1] = convert_to_tooltip_row(name, count)
            i = i + 1
            if i == 10 then break end
        end
    end

    return {'', '[font=default-semibold]', current_action, fuel_inventory_contents, '\n', Caravan.get_inventory_tooltip(caravan_data), '[/font]'}
end

function Caravan.add_gui_row(caravan_data, key, table)
    local entity = caravan_data.entity
    local prototype = prototypes[entity.name]

    table = table.add{type = 'frame', direction = 'vertical', tags = {unit_number = key}}

    local button_flow = table.add{type = 'flow', direction = 'horizontal'}
    button_flow.style.vertical_align = 'top'
    button_flow.style.height = 30

    local caption_flow = button_flow.add{type = 'flow', direction = 'horizontal'}

    local title = caption_flow.add{
        name = 'title',
        type = 'label',
        caption = Caravan.get_name(caravan_data),
        style = 'frame_title',
        ignored_by_interaction = true
    }
    title.style.maximal_width = 150

    local rename_button = caption_flow.add{
        type = 'sprite-button',
        name = 'py_rename_caravan_button',
        style = 'frame_action_button',
        sprite = 'utility/rename_icon_small_white',
        hovered_sprite = 'utility/rename_icon_small_black',
        clicked_sprite = 'utility/rename_icon_small_black',
        tags = {unit_number = key, maximal_width = 150}
    }

    button_flow.add{type = 'empty-widget'}.style.horizontally_stretchable = true

    local tooltip = Caravan.get_summary_tooltip(caravan_data)
    local view_inventory_button = button_flow.add{
        type = 'sprite-button',
        name = 'py_view_inventory_button',
        style = 'frame_action_button',
        sprite = 'utility/expand_dots_white',
        hovered_sprite = 'utility/expand_dots',
        clicked_sprite = 'utility/expand_dots',
        tooltip = tooltip,
        tags = {unit_number = caravan_data.unit_number}
    }

    local open_caravan_button = button_flow.add{
        type = 'sprite-button',
        name = 'py_click_caravan',
        style = 'frame_action_button',
        sprite = 'utility/logistic_network_panel_white',
        hovered_sprite = 'utility/logistic_network_panel_black',
        clicked_sprite = 'utility/logistic_network_panel_black',
        tooltip = {'caravan-gui.open', entity.prototype.localised_name},
        tags = {unit_number = caravan_data.unit_number}
    }

    local open_map_button = button_flow.add{
        type = 'sprite-button',
        name = 'py_open_map_button',
        style = 'frame_action_button',
        sprite = 'utility/search',
        hovered_sprite = 'utility/search_icon',
        clicked_sprite = 'utility/search_icon',
        tooltip = {'caravan-gui.view-on-map'},
        tags = {unit_number = caravan_data.unit_number}
    }

    for _, button in pairs{rename_button, open_caravan_button, view_inventory_button, open_map_button} do
        button.style.size = {26, 26}
        button.style.top_margin = -2
        button.style.bottom_margin = -4
    end

    local camera_frame = table.add{type = 'frame', name = 'camera_frame', style = 'inside_shallow_frame'}
	local camera = camera_frame.add{type = 'camera', name = 'camera', style = 'py_caravan_camera', position = entity.position, surface_index = entity.surface.index}
	camera.entity = entity
	camera.visible = true
	camera.style.height = 155
	camera.zoom = (prototype.camera_zoom or 1) / 2

    local status_flow = table.add{type = 'flow', direction = 'horizontal'}
    status_flow.style.height = 0
    status_flow.style.top_margin = -26
    status_flow.style.bottom_margin = 6
    status_flow.style.left_margin = 5
    local status_sprite = status_flow.add{type = 'sprite'}
    status_sprite.resize_to_sprite = false
    status_sprite.style.size = {16, 16}
    local status_text = status_flow.add{type = 'label'}
    local state, img = Caravan.status_img(caravan_data)
    status_text.caption = {'', '[font=default-bold]', state, '[/font]'}
    status_sprite.sprite = img
    status_text.style.right_margin = 4
end

gui_events[defines.events.on_gui_click]['py_click_caravan'] = function(event)
    local player = game.get_player(event.player_index)
    local element = event.element
    local tags = element.tags
    local caravan_data = storage.caravans[tags.unit_number]
    if Caravan.validity_check(caravan_data) then
        Caravan.build_gui(player, caravan_data.entity)
    end
end

gui_events[defines.events.on_gui_click]['py_view_inventory_button'] = function(event)
    local element = event.element
    local tags = element.tags
    local caravan_data = storage.caravans[tags.unit_number]
    local tooltip = Caravan.get_summary_tooltip(caravan_data)
    element.tooltip = tooltip
end

gui_events[defines.events.on_gui_click]['py_open_map_button'] = function(event)
    local player = game.get_player(event.player_index)
    local element = event.element
    local tags = element.tags
    local caravan_data = storage.caravans[tags.unit_number]
    local entity = caravan_data.entity

    player.opened = nil
    player.zoom_to_world(entity.position, 0.5, entity)
end

local function title_edit_mode(caption_flow, caravan_data)
    local title = caption_flow.title
    local index = title.get_index_in_parent()
    title.destroy()

    local textfield = caption_flow.add{
        type = 'textfield',
        name = 'py_rename_caravan_textfield',
        text = Caravan.get_name(caravan_data),
        tags = {index = caravan_data.entity.unit_number},
        index = index
    }
    textfield.focus()
    textfield.select_all()
    textfield.style.top_margin = -5
    textfield.style.maximal_width = 150
    local button = caption_flow.py_rename_caravan_button
    ---@class SpriteButton.style
    ---@diagnostic disable-next-line: assign-type-mismatch
    button.style = 'item_and_count_select_confirm'
    button.sprite = 'utility/check_mark'
    button.hovered_sprite = 'utility/check_mark'
    button.clicked_sprite = 'utility/check_mark'
    button.style.size = {26, 26}
    button.style.top_margin = -2
    button.style.bottom_margin = -4
end

local function title_display_mode(caption_flow, caravan_data)
    local textfield = caption_flow.py_rename_caravan_textfield
    local index = textfield.get_index_in_parent()
    textfield.destroy()

    local title = caption_flow.add{
        type = 'label',
        name = 'title',
        caption = Caravan.get_name(caravan_data),
        style = 'frame_title',
        ignored_by_interaction = true,
        index = index
    }
    local button = caption_flow.py_rename_caravan_button
    button.style = 'frame_action_button'
    button.sprite = 'utility/rename_icon_small_white'
    button.hovered_sprite = 'utility/rename_icon_small_black'
    button.clicked_sprite = 'utility/rename_icon_small_black'

    title.style.maximal_width = button.tags.maximal_width or error('No maximal width')
end

gui_events[defines.events.on_gui_click]['py_rename_caravan_button'] = function(event)
    local element = event.element
    local caravan_data = storage.caravans[element.tags.unit_number]
    local caption_flow = element.parent
    if caption_flow.title then
        title_edit_mode(caption_flow, caravan_data)
    else
        title_display_mode(caption_flow, caravan_data)
    end
end

gui_events[defines.events.on_gui_text_changed]['py_rename_caravan_textfield'] = function(event)
    local element = event.element
    local caravan_data = storage.caravans[element.tags.index]
    caravan_data.name = element.text
end

gui_events[defines.events.on_gui_confirmed]['py_rename_caravan_textfield'] = function(event)
    local element = event.element
    local caravan_data = storage.caravans[element.tags.index]
    title_display_mode(element.parent, caravan_data)
end