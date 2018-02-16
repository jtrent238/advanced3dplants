-- Advanced 3D Plands mod made by jtrent238

advanced3dplants = {}

advanced3dplants.modname = minetest.get_current_modname()

-- Set a noticeable inventory formspec for players
minetest.register_on_joinplayer(function(player)
	local cb = function(player)
		minetest.chat_send_player(player:get_player_name(), "Hammermod made by: jtrent238")
	end
	minetest.after(2.0, cb, player)
end)

-- Flower registration

local function add_advanced_plant(name, desc, box, f_groups)
	-- Common flowers' groups
	f_groups.snappy = 3
	f_groups.flower = 1
	f_groups.flora = 1
	f_groups.attached_node = 1

	minetest.register_node("advanced3dplants:" .. name, {
		description = desc,
		drawtype = "plantlike",
		waving = 1,
		tiles = {"advanced3dplants_" .. name .. ".png"},
		inventory_image = "advanced3dplants_" .. name .. ".png",
		wield_image = "advanced3dplants_" .. name .. ".png",
		mesh = "advanced3dplants_" .. name .. ".obj",
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		groups = f_groups,
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = box
		}
	})
end

advanced3dplants.datas = {
	{
		"plant",
		"Plant",
		{-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16},
		{color_red = 1, flammable = 1}
	},
}

for _,item in pairs(advanced3dplants.datas) do
	add_advanced_plant(unpack(item))
end