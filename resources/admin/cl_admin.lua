local PanelToggle = false
local isCursorActive = false

local function ShowCursor()
	isCursorActive = not isCursorActive	
	SetNuiFocus(isCursorActive, isCursorActive)
end

Citizen.CreateThread(function()
	PreviousEntity = nil
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, 0x911CB09E) then
			PanelToggle = not PanelToggle
			SendNUIMessage({toggle = PanelToggle})
		end
		if IsControlJustReleased(0, 0x4403F97F) then
			ShowCursor()
		end
		-- if PanelToggle then
		-- 	local PlayerPed = PlayerPedId()
		-- 	local PlayerPosition = GetEntityCoords(PlayerPed, false)
		-- 	local PlayerRotation = GetEntityRotation(PlayerPedId())
		-- 	local PlayerHeading = GetEntityHeading(PlayerPedId())
		-- 	SendNuiMessage({
		-- 		setPlayer = true,
		-- 		position = "vector4("..PlayerPosition.x..", "..PlayerPosition.y..", "..PlayerPosition.z..", "..PlayerHeading.."),",
		-- 		rotation = "vector3("..PlayerPosition.x..", "..PlayerPosition.y..", "..PlayerPosition.z.."),"
		-- 	})
		-- 	if IsPlayerFreeAiming(PlayerId()) then
		-- 		local result, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
		-- 		if DoesEntityExist(entity) then
		-- 			if isNetworkingActive then
		-- 				if not IsEntityAMissionEntity(entity) then
		-- 					if DoesEntityExist(previous_entity) then
		-- 						SetEntityAsMissionEntity(entity, false, false)
		-- 						SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), true)
		-- 						SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(entity), true)
		-- 					end
		-- 					SetEntityAsMissionEntity(entity, true, true)
		-- 					previous_entity = entity
		-- 				end
		-- 			end
		-- 			local EntityPosition = GetEntityCoords(entity, false)
		-- 			local EntityHeading = GetEntityHeading(entity)
		-- 			local EntityRotation = GetEntityRotation(entity)
		-- 			local EntityModel = GetEntityModel(entity)
		-- 			SendNUIMessage({
		-- 				setTarget = true,
		-- 				position = "vector4("..EntityPosition.x..", "..EntityPosition.y..", "..EntityPosition.z..", "..EntityHeading.."),",
		-- 				rotation = "vector3("..EntityRotation.x..", "..EntityRotation.y..", "..EntityRotation.z.."),",
		-- 				id = entity,
		-- 				model = EntityModel,
		-- 				network_id = NetworkGetNetworkIdFromEntity(entity),
		-- 			})
		-- 			if isDeleteActive and IsPedShooting(PlayerPedId()) then
		-- 				if not IsEntityAMissionEntity(entity) then
		-- 					SetEntityAsMissionEntity(entity, true, true)
		-- 				end
		-- 				if IsEntityAPed(entity) then
		-- 					DeletePed(entity)
		-- 					DeleteEntity(entity)
		-- 					SetModelAsNoLongerNeeded(entity_model)
		-- 				elseif IsEntityAVehicle(entity) then
		-- 					DeleteVehicle(entity)
		-- 					DeleteEntity(entity)
		-- 					SetModelAsNoLongerNeeded(entity_model)
		-- 				elseif IsEntityAnObject(entity) then
		-- 					DeleteEntity(entity)
		-- 					DeleteObject(entity)
		-- 				end
		-- 			end

		-- 			if isRotationActive then
		-- 				if IsControlPressed(0, 52) then
		-- 					SetEntityHeading(entity, GetEntityHeading(entity) + 1.5)
		-- 				elseif IsControlPressed(0, 51) then
		-- 					SetEntityHeading(entity, GetEntityHeading(entity) - 1.5)
		-- 				end

		-- 				if IsControlPressed(0, 174) then
		-- 					SetEntityCoordsNoOffset(entity, GetOffsetFromEntityInWorldCoords(entity, 0.0, 0.25, 0.0))
		-- 				elseif IsControlPressed(0, 175) then
		-- 					SetEntityCoordsNoOffset(entity, GetOffsetFromEntityInWorldCoords(entity, 0.0, -0.25, 0.0))
		-- 				end

		-- 				if IsControlPressed(0, 172) then
		-- 					SetEntityCoordsNoOffset(entity, GetOffsetFromEntityInWorldCoords(entity, 0.0, 0.0, 0.25))
		-- 				elseif IsDisabledControlPressed(0, 173) then
		-- 					SetEntityCoordsNoOffset(entity, GetOffsetFromEntityInWorldCoords(entity, 0.0, 0.0, -0.25))
		-- 				end
		-- 			end
		-- 		end
		-- 	end
		-- end
	end
end)