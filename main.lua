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
local screens = { }
screens.select_blind = { }
do
	screens.select_blind.small = { }
	screens.select_blind.small.ui_box = function()
		return G.blind_select_opts.small
	end
	screens.select_blind.small.buttons = { }
	screens.select_blind.small.buttons.select = function()
		return screens.select_blind.small.ui_box():get_UIE_by_ID('select_blind_button')
	end
	screens.select_blind.small.buttons.skip = function()
		return get_UIE_by_attribute(screens.select_blind.small.ui_box(), 'button', 'skip_blind')
	end
end
do
	screens.select_blind.big = { }
	screens.select_blind.big.ui_box = function()
		return G.blind_select_opts.big
	end
	screens.select_blind.big.buttons = { }
	screens.select_blind.big.buttons.select = function()
		return screens.select_blind.big.ui_box():get_UIE_by_ID('select_blind_button')
	end
	screens.select_blind.big.buttons.skip = function()
		return get_UIE_by_attribute(screens.select_blind.big.ui_box(), 'button', 'skip_blind')
	end
end
do
	screens.select_blind.boss = { }
	screens.select_blind.boss.ui_box = function()
		return G.blind_select_opts.boss
	end
	screens.select_blind.boss.buttons = { }
	screens.select_blind.boss.buttons.select = function()
		return screens.select_blind.boss.ui_box():get_UIE_by_ID('select_blind_button')
	end
	screens.select_blind.boss.buttons.skip = function()
		return get_UIE_by_attribute(screens.select_blind.boss.ui_box(), 'button', 'skip_blind')
	end
end
_module_0[#_module_0 + 1] = screens
return _module_0
