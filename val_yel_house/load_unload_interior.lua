Citizen.CreateThread(function()

    local ipls = {{
        hash = GetHashKey("val_07_resf_shell_int_milo"),
        coords = vector3(-409.57108, 655.8354, 117.07685),
        distance = 145
    }}


    while true do

        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        for k, v in pairs(ipls) do

            local distance = #(coords - v.coords)
            
            if distance < v.distance - 2 and not IsImapActive(v.hash) then
                RequestImap(v.hash)
            end

            if distance > v.distance and IsImapActive(v.hash) then
                RemoveImap(v.hash)
            end

        end

        Citizen.Wait(250)

    end
end)