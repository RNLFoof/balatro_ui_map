local _module_0 = { }
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
				return res
			end
		end
	end
	return nil
end
_module_0["get_UIE_by_attribute"] = get_UIE_by_attribute
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
local screens = {
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
	}
}
_module_0["screens"] = screens
return _module_0
