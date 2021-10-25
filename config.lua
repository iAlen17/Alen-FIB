Strings = {
    ['Grab'] = 'Grab cash',
    ['LockPick'] = 'Lockpick the door',
    ['Lock'] = 'Lock the door',
    ['Robbery'] = 'Someone is robbing the FIB!',
    ['Waypoint'] = '~INPUT_CONTEXT~ Set waypoint'
}

Config = {
    ['Door'] = {
        ['Obj'] = 'v_ilev_fib_door2', --Name of the door object
        ['Coords'] = vec3(128.13, -729.37, 241.17), -- Coordinates of the door
        ['Heading'] = 69.99938694844, -- Heading of the Door
        ['Offset'] = vec3(-0.6, 0.0, -0.75), -- Offset while lockpicking
        ['LockPick'] = vec3(-1.0, 0.7, -1.5), 
        ['LockPickHeading'] = 250.0, 
        ['Anim'] = {
            ['Dict'] = 'missheistfbisetup1', 
            ['Anim'] = 'hassle_intro_loop_f', --Animation while unlocking and locking the fib door
            ['Time'] = 5000, -- MilliSeconds before cancelling animation (unlocking door)
        },
    },

    
    ['PedWeapon'] = 'WEAPON_APPISTOL',--Put the name of the weapon that you desire to be given to the FIB Securities
    ['Police'] = 'police',--Job Name
    ['PoliceVeh'] = 'police',--Vehicle Name(Police) 
    ['HeistVeh'] = 'bodhi2',--Vehicle Name( Robbers[North Yankton])
    ['SanVeh'] = 'gburrito',--Vehicle Name(San Andreas) 
    ['Reward'] = 10000,--Reward Per Bundle Of Cash 
    ['PrintedCash'] = 1,--Amount of bundles per trolley 
    ['RequiredCops'] = 0, -- cops required to lockpick the door / grab cash

   ['Cash'] = {
        ['Min'] = 25, -- minimum cash (for each pile)
        ['Max'] = 50, -- max cash (for each pile)
    },

    ['Trolleys'] = {
        {
            ['heading'] = 310.0,
            ['coords'] = vec3(129.89, -726.31, 241.17),
        },
        {
            ['heading'] = 200.0,
            ['coords'] = vec3(130.59, -724.23, 241.17),
        },
        {
            ['heading'] = 158.0,
            ['coords'] = vec3(132.24, -724.56, 241.17),
        },
        {
            ['heading'] = 70.49,
            ['coords'] = vec3(134.46, -726.03, 241.17)
        }
    }
}

Config['3DText'] = {
    ['Enabled'] = true,

    ['Draw'] = function(coords, text)
        SetDrawOrigin(coords)

        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(0.0, 0.0)
        DrawRect(0.0, 0.0125, 0.015 + text:gsub("~.-~", ""):len() / 370, 0.03, 45, 45, 45, 150)

        ClearDrawOrigin()
    end
}
