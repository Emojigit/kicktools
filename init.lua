local k_all = function(name, param)
	local kick_r = "Operator request to kick all player."
	if not(param == "") then
		kick_r = param
	end
	for _,player in ipairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		minetest.kick_player(name,kick_r)
	end
end

minetest.register_chatcommand("kickall", {
	params = "[Optional reason]",
	privs = {server = true},
	description = "Kick all player",
	func = k_all,
})

minetest.register_chatcommand("error", {
	params = "[Optional reason]",
	privs = {server = true},
	description = "Cause an error manualy",
	func = function(name, param)
		if not(param == "") then
			for _,player in ipairs(minetest.get_connected_players()) do
				local name = player:get_player_name()
				minetest.kick_player(name,param)
			end
		end
		minetest.after(1,error,name.." Request an error.",0)
	end,
})
