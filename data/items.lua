return {
	-- ['testburger'] = {
	-- 	label = 'Test Burger',
	-- 	weight = 220,
	-- 	degrade = 60,
	-- 	client = {
	-- 		image = 'burger_chicken.png',
	-- 		status = { hunger = 200000 },
	-- 		anim = 'eating',
	-- 		prop = 'burger',
	-- 		usetime = 2500,
	-- 		export = 'ox_inventory_examples.testburger'
	-- 	},
	-- 	server = {
	-- 		export = 'ox_inventory_examples.testburger',
	-- 		test = 'what an amazingly delicious burger, amirite?'
	-- 	},
	-- 	buttons = {
	-- 		{
	-- 			label = 'Lick it',
	-- 			action = function(slot)
	-- 				print('You licked the burger')
	-- 			end
	-- 		},
	-- 		{
	-- 			label = 'Squeeze it',
	-- 			action = function(slot)
	-- 				print('You squeezed the burger :(')
	-- 			end
	-- 		},
	-- 		{
	-- 			label = 'What do you call a vegan burger?',
	-- 			group = 'Hamburger Puns',
	-- 			action = function(slot)
	-- 				print('A misteak.')
	-- 			end
	-- 		},
	-- 		{
	-- 			label = 'What do frogs like to eat with their hamburgers?',
	-- 			group = 'Hamburger Puns',
	-- 			action = function(slot)
	-- 				print('French flies.')
	-- 			end
	-- 		},
	-- 		{
	-- 			label = 'Why were the burger and fries running?',
	-- 			group = 'Hamburger Puns',
	-- 			action = function(slot)
	-- 				print('Because they\'re fast food.')
	-- 			end
	-- 		}
	-- 	},
	-- 	consume = 0.3
	-- },

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	["idcard"] = {
		label = "Personalausweis",
		weight = 10,
		stack = false,
		close = true,
		buttons = {
			{
				label = "Ansehen",
				action = function(slot)
					TriggerServerEvent("nvx_idcard:seeIdCard", slot)
					exports.ox_inventory:closeInventory()
				end
			},
			{
				label = "Zeigen",
				action = function(slot)
					local nearbyPlayers = lib.getNearbyPlayers(GetEntityCoords(PlayerPedId()), 2.0, true)
					local playerIds = {}

					for _, player in pairs(nearbyPlayers) do
						table.insert(playerIds, GetPlayerServerId(player.id))
					end

					TriggerServerEvent("nvx_idcard:showIdCard", slot, playerIds)
					exports.ox_inventory:closeInventory()
				end
			}
		}
	},

	["drivers_license"] = {
		label = "Führerschein",
		weight = 10,
		stack = false,
		close = true,
		buttons = {
			{
				label = "Ansehen",
				action = function(slot)
					TriggerServerEvent("nvx_idcard:seeDriversLicense", slot)
					exports.ox_inventory:closeInventory()
				end
			},
			{
				label = "Zeigen",
				action = function(slot)
					local nearbyPlayers = lib.getNearbyPlayers(GetEntityCoords(PlayerPedId()), 2.0, true)
					local playerIds = {}

					for _, player in pairs(nearbyPlayers) do
						table.insert(playerIds, GetPlayerServerId(player.id))
					end

					TriggerServerEvent("nvx_idcard:showDriversLicense", slot, playerIds)
					exports.ox_inventory:closeInventory()
				end
			}
		}
	},

	["vehicle_key"] = {
		label = "Fahrzeugschlüssel",
		weight = 10,
		stack = false,
		buttons = {
			{
				label = "Beschriften",
				action = function(slot)
					local input = lib.inputDialog("Beschriften", {
						{ type = "input", label = "Name", description = "Gib dem Schlüssel einen Namen", required = true }
					})

					if not input then
						return
					end

					TriggerServerEvent("nvx_core:items:rename", slot, input[1])
				end
			}
		}
	}
}
