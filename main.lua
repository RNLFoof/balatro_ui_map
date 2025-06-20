local _module_0 = { }
local _deeper_type
_deeper_type = function(object)
	local type_name = type(output)
	if type_name == "table" then
		local metatable = getmetatable(self)
		if metatable then
			return metatable
		end
	end
	return type_name
end
local _anon_func_0 = function(attribute_key, node)
	local _obj_0 = node.config
	if _obj_0 ~= nil then
		return _obj_0[attribute_key]
	end
	return nil
end
local _anon_func_1 = function(child_value)
	local _obj_0 = child_value.config.object
	if _obj_0 ~= nil then
		return _obj_0.get_UIE_by_ID
	end
	return nil
end
local get_UIE_by_attribute
get_UIE_by_attribute = function(ui_box, attribute_key, attribute_value, node)
	if ui_box == "any" then
		return get_UIE_by_attribute(G.I.UIBOX, attribute_key, attribute_value, node)
	end
	if _deeper_type(ui_box) == "table" then
		local ui_boxes = ui_box
		for _index_0 = 1, #ui_boxes do
			local ui_box = ui_boxes[_index_0]
			local output = get_UIE_by_attribute(ui_box, attribute_key, attribute_value, node)
			if output then
				return output
			end
		end
		return nil
	end
	if node == nil then
		node = ui_box.UIRoot
	end
	if _anon_func_0(attribute_key, node) == attribute_value then
		return node
	end
	for child_key, child_value in pairs(node.children) do
		local result = get_UIE_by_attribute(ui_box, attribute_key, attribute_value, child_value)
		if result then
			return result
		elseif _anon_func_1(child_value) then
			result = get_UIE_by_attribute(v.config.object, attribute_key, attribute_value, nil)
			if result then
				return result
			end
		end
	end
	return nil
end
_module_0["get_UIE_by_attribute"] = get_UIE_by_attribute
local get_button
get_button = function(ui_box, button_function_name)
	return get_UIE_by_attribute(ui_box, "button", button_function_name)
end
_module_0["get_button"] = get_button
local get_UIBoxes_by_check
get_UIBoxes_by_check = function(check, kwargs)
	if kwargs == nil then
		kwargs = { }
	end
	if kwargs.instance_type == nil then
		kwargs.instance_type = nil
	end
	local target_table
	if kwargs.instance_type then
		target_table = G.I[kwargs.instance_type]
	else
		target_table = G.I.UIBOX
	end
	local output = { }
	for _index_0 = 1, #target_table do
		local ui_box = target_table[_index_0]
		if check(ui_box) then
			output[#output + 1] = ui_box
		end
	end
	return output
end
_module_0["get_UIBoxes_by_check"] = get_UIBoxes_by_check
local get_UIBox_by_check
get_UIBox_by_check = function(check, kwargs)
	if kwargs == nil then
		kwargs = { }
	end
	return get_UIBoxes_by_check(check, kwargs)[1]
end
_module_0["get_UIBox_by_check"] = get_UIBox_by_check
local _anon_func_2 = function(ui_box)
	local _obj_0 = ui_box.config
	if _obj_0 ~= nil then
		return _obj_0.id
	end
	return nil
end
local get_UIBox_by_id
get_UIBox_by_id = function(id, kwargs)
	if kwargs == nil then
		kwargs = { }
	end
	return get_UIBox_by_check((function(ui_box)
		return _anon_func_2(ui_box) == id
	end), kwargs)
end
_module_0["get_UIBox_by_id"] = get_UIBox_by_id
local card_areas = {
	get_hand = function()
		return G.hand
	end,
	get_jokers = function()
		return G.jokers
	end,
	get_consumables = function()
		return G.consumeables
	end,
	get_inventory = function()
		return G.consumeables
	end
}
_module_0["card_areas"] = card_areas
local screens
screens = {
	select_blind = {
		small = {
			get_ui_box = function()
				return G.blind_select_opts.small
			end,
			buttons = {
				get_select = function()
					return screens.select_blind.small.get_ui_box():get_UIE_by_ID('select_blind_button')
				end,
				get_skip = function()
					return get_UIE_by_attribute(screens.select_blind.small.get_ui_box(), 'button', 'skip_blind')
				end
			}
		},
		big = {
			get_ui_box = function()
				return G.blind_select_opts.big
			end,
			buttons = {
				get_select = function()
					return screens.select_blind.big.get_ui_box():get_UIE_by_ID('select_blind_button')
				end,
				get_skip = function()
					return get_UIE_by_attribute(screens.select_blind.big.get_ui_box(), 'button', 'skip_blind')
				end
			}
		},
		boss = {
			get_ui_box = function()
				return G.blind_select_opts.boss
			end,
			buttons = {
				get_select = function()
					return screens.select_blind.boss.get_ui_box():get_UIE_by_ID('select_blind_button')
				end,
				get_skip = function()
					return get_UIE_by_attribute(screens.select_blind.boss.get_ui_box(), 'button', 'skip_blind')
				end
			}
		},
		card_areas = {
			get_jokers = card_areas.get_jokers,
			get_consumables = card_areas.get_consumables,
			get_inventory = card_areas.get_inventory
		}
	},
	blind = {
		buttons = {
			get_play_hand = function()
				return get_UIE_by_attribute(G.buttons, "button", "play_cards_from_highlighted")
			end,
			get_rank = function()
				return get_UIE_by_attribute(G.buttons, "button", "sort_hand_value")
			end,
			get_suit = function()
				return get_UIE_by_attribute(G.buttons, "button", "sort_hand_suit")
			end,
			get_discard = function()
				return get_UIE_by_attribute(G.buttons, "button", "discard_cards_from_highlighted")
			end
		},
		card_areas = {
			get_hand = card_areas.get_hand,
			get_jokers = card_areas.get_jokers,
			get_consumables = card_areas.get_consumables,
			get_inventory = card_areas.get_inventory
		}
	},
	win_blind = {
		buttons = {
			get_cash_out = function()
				return get_button(screens.win_blind.get_ui_box(), "cash_out")
			end
		},
		card_areas = {
			get_jokers = card_areas.get_jokers,
			get_consumables = card_areas.get_consumables,
			get_inventory = card_areas.get_inventory
		},
		get_uibox = get_UIBox_by_check((function(uibox)
			do
				local _cond_0 = G.round_eval
				if not (uibox.config.major == _cond_0) then
					return false
				else
					return _cond_0 ~= nil
				end
			end
		end))
	}
}
_module_0["screens"] = screens
return _module_0
