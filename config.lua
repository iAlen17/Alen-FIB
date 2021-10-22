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
    ['AttackingPeds'] = {
        PedConfig = {
            {pos = vector3(119.42137, -761.3185, 242.15206), heading = 267.51391, ped = 's_m_m_chemsec_01'},
            {pos = vector3(137.60064, -768.9351, 242.15213), heading = 27.648406, ped = 's_m_m_chemsec_01'},
            {pos = vector3(128.74789, -761.6337, 242.15185), heading = 226.68038, ped = 's_m_m_chemsec_01'},
            {pos = vector3(124.17907, -764.8161, 242.15203), heading = 260.66476, ped = 's_m_m_chemsec_01'},
            {pos = vector3(121.53397, -757.9509, 242.15203), heading = 210.10429, ped = 's_m_m_chemsec_01'}, --Add More Peds Over Here!
            {pos = vector3(113.91598, -753.3021, 242.15228), heading = 214.78201, ped = 's_m_m_chemsec_01'},
            {pos = vector3(114.08854, -740.7044, 242.15219), heading = 198.01211, ped = 's_m_m_chemsec_01'},
            {pos = vector3(121.72486, -739.1644, 242.15219), heading = 155.41575, ped = 's_m_m_chemsec_01'},
            {pos = vector3(126.87366, -730.3227, 242.15197), heading = 69.755676, ped = 's_m_m_chemsec_01'},


            {pos = vector3(5450.1015, -5205.519, 78.856681), heading = 171.6372, ped = 'a_f_m_prolhost_01'},
            {pos = vector3(-938.6571, -2932.306, 13.945069), heading = 320.43283, ped = 'a_m_y_hasjew_01'},
            {pos = vector3(5361.1386, -5179.498, 82.770988), heading = 77.337684, ped = 'a_m_m_og_boss_01'},
        }
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