--Coding Tool
---@diagnostic disable: undefined-global

local math_config = {
    --Range (to m)
    ["km"] = 1000,
    ["nmi"] = 1852,
    ["ft"] = 0.3048,

    --Speed (to m/s)
    ["kt"] = 0.5144,
    ["kmh"] = 0.2778,
    ["mach"] = 340.3,

    --Mass (to kg)
    ["lb"] = 0.4536,

    --Engineering Unit
    ["M"] = 1000000,
}

local mission_config = {
    ["Global"] = {
        script_version = "0.6.3",
        update_interval = 5,
        carrier_update_interval = 30,
        capture_bar_factor = 5,
        wind = 218,
    },
    ["Blue"] = {
        awacs = "B-E2D",
        cvn_group = "USN-CVN",
        aircraft_config = {
            ["UH-60A"] = { --For test
                type_name = "UH-60A",
                name = "B_UH60A ",
                skin_id = "standard",
                aa = {
                    pylons = {
                    },
                    fuel = 2425,
                    flare = 30,
                    chaff = 30,
                },
            },
            ["FA-18C SEAD"] = {
                type_name = "FA-18C_hornet",
                service = "USN",
                airport = "CVN-75",
                parking = "1",
                parking_id = "1",
                name = "B_FA18C_SEAD ",
                group_mission = "SEAD",
                skin_id = "VFA-37",
                level = "DLC",
                frequency = 301.00 * math_config["M"],
                aa = {
                    pylons = {
                        [1] = { CLSID = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}" }, --AIM-9X
                        [2] = { CLSID = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}" }, --AGM-88C
                        [3] = { CLSID = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}" }, --AGM-88C
                        [4] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" }, --AIM-120C
                        [5] = { CLSID = "{FPU_8A_FUEL_TANK}" },                     --Fuel Tank
                        [6] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" }, --AIM-120C
                        [7] = { CLSID = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}" }, --AGM-88C
                        [8] = { CLSID = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}" }, --AGM-88C
                        [9] = { CLSID = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}" }, --AIM-9X
                    },
                    fuel = 4900,
                    flare = 60,
                    chaff = 60,
                    gun = 100,
                },
                wypt = {
                    [2] = {
                        type = "Turning Point",
                        action = "Turning Point",
                        speed = 0.8 * math_config["mach"],
                        task_builder = function(d_x, d_z, d_alt)
                            return {
                                id = "ComboTask",
                                params = {
                                    tasks = {
                                        [1] = {
                                            auto = false,
                                            enabled = true,
                                            id = "Orbit",
                                            number = 1,
                                            params = {
                                                altitude = 38000 * math_config["ft"],
                                                pattern = "Circle",
                                                speed = 0.8 * math_config["mach"],
                                            },
                                        },
                                    },
                                },
                            }
                        end,
                    },
                },
            },
            ["FA-18C CAP"] = {
                type_name = "FA-18C_hornet",
                service = "USN",
                airport = "CVN-75",
                parking = "1",
                parking_id = "1",
                name = "B_FA18C_CAP ",
                group_mission = "CAP",
                skin_id = "VFA-113",
                level = "DLC",
                frequency = 301.00 * math_config["M"],
                aa = {
                    pylons = {
                        [1] = { CLSID = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}" }, --AIM-9X
                        [2] = { CLSID = "<CLEAN>" },
                        [3] = { CLSID = "LAU-115_2*LAU-127_AIM-120C" },             --AIM-120C * 2
                        [4] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" }, --AIM-120C
                        [5] = { CLSID = "{FPU_8A_FUEL_TANK}" },                     --Fuel Tank
                        [6] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" }, --AIM-120C
                        [7] = { CLSID = "LAU-115_2*LAU-127_AIM-120C" },             --AIM-120C * 2
                        [8] = { CLSID = "<CLEAN>" },
                        [9] = { CLSID = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}" }, --AIM-9X
                    },
                    fuel = 4900,
                    flare = 60,
                    chaff = 60,
                    gun = 100,
                },
                wypt = {
                    [2] = {
                        type = "Turning Point",
                        action = "Turning Point",
                        speed = 0.8 * math_config["mach"],
                        task_builder = function(d_x, d_z, d_alt)
                            return {
                                id = "ComboTask",
                                params = {
                                    tasks = {
                                        [1] = {
                                            auto = false,
                                            enabled = true,
                                            id = "Orbit",
                                            number = 1,
                                            params = {
                                                altitude = 38000 * math_config["ft"],
                                                pattern = "Circle",
                                                speed = 0.8 * math_config["mach"],
                                            },
                                        },
                                    },
                                },
                            }
                        end,
                    },
                }
            },
            ["F-14B CAP"] = {
                type_name = "F-14B",
                service = "USN",
                airport = "CVN-75",
                parking = "1",
                parking_id = "1",
                name = "B_F14B_CAP ",
                group_mission = "CAP",
                skin_id = "VF-32 Fighting Swordsmen 100 (2000)",
                level = "DLC",
                frequency = 301.00 * math_config["M"],
                aa = {
                    pylons = {
                        [1] = { CLSID = "{LAU-138 wtip - AIM-9M}" },
                        [2] = { CLSID = "{SHOULDER AIM_54C_Mk47 L}" },
                        [3] = { CLSID = "{F14-300gal}" },
                        [4] = { CLSID = "{AIM_54C_Mk47}" },
                        [5] = { CLSID = "{AIM_54C_Mk47}" },
                        [6] = { CLSID = "{AIM_54C_Mk47}" },
                        [7] = { CLSID = "{AIM_54C_Mk47}" },
                        [8] = { CLSID = "{F14-300gal}" },
                        [9] = { CLSID = "{SHOULDER AIM_54C_Mk47 R}" },
                        [10] = { CLSID = "{LAU-138 wtip - AIM-9M}" },
                    },
                    fuel = 7348,
                    flare = 60,
                    chaff = 140,
                    gun = 100,
                },
                wypt = {
                    [2] = {
                        type = "Turning Point",
                        action = "Turning Point",
                        speed = 0.8 * math_config["mach"],
                        task_builder = function(d_x, d_z, d_alt)
                            return {
                                id = "ComboTask",
                                params = {
                                    tasks = {
                                        [1] = {
                                            auto = false,
                                            enabled = true,
                                            id = "Orbit",
                                            number = 1,
                                            params = {
                                                altitude = 38000 * math_config["ft"],
                                                pattern = "Circle",
                                                speed = 0.8 * math_config["mach"],
                                            },
                                        },
                                    },
                                },
                            }
                        end,
                    },
                }
            },
            ["FA-18C CAS"] = {
                type_name = "FA-18C_hornet",
                service = "USMC",
                airport = "CVN-75",
                parking = "1",
                parking_id = "1",
                name = "B_FA18C_CAS ",
                group_mission = "CAS",
                skin_id = "VMFA-232",
                level = "DLC",
                frequency = 301.00 * math_config["M"],
                aa = {
                    pylons = {
                        [1] = { CLSID = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}" }, --AIM-9X
                        [2] = { CLSID = "LAU_117_AGM_65F" },                        --AGM-65F
                        [3] = { CLSID = "{BRU55_2*AGM-154C}" },                     --AGM-154C * 2
                        [4] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" }, --AIM-120C
                        [5] = { CLSID = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}" }, --AN/AAQ-28
                        [6] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" }, --AIM-120C
                        [7] = { CLSID = "{BRU55_2*AGM-154C}" },                     --AGM-154C * 2
                        [8] = { CLSID = "LAU_117_AGM_65F" },                        --AGM-65F
                        [9] = { CLSID = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}" }, --AIM-9X
                    },
                    fuel = 4900,
                    flare = 60,
                    chaff = 60,
                    gun = 100,
                },
                wypt = {
                    [2] = {
                        type = "Turning Point",
                        action = "Turning Point",
                        speed = 0.8 * math_config["mach"],
                        task_builder = function(d_x, d_z, d_alt)
                            return {
                                id = "ComboTask",
                                params = {
                                    tasks = {
                                        [1] = {
                                            auto = false,
                                            enabled = true,
                                            number = 2,
                                            id = "Orbit",
                                            params = {
                                                pattern = "Circle",
                                                altitude = 17000 * math_config["ft"],
                                                speed = 0.6 * math_config["mach"],
                                            },
                                        },
                                        [2] = {
                                            auto = false,
                                            enabled = true,
                                            number = 1,
                                            id = "EngageTargetsInZone",
                                            params = {
                                                x = d_x,
                                                y = d_z,
                                                zoneRadius = 10000,
                                                targetTypes = { "Ground vehicles" },
                                                value = "Ground vehicles;",
                                                priority = 0,
                                            },
                                        },
                                    },
                                },
                            }
                        end,
                    },
                },
            },
            ["F-16C_50 CAP"] = {
                type_name = "F-16C_50",
                service = "USAF",
                airport = "Senaki-Kolkhi",
                parking = "0",
                parking_id = "0",
                name = "B_F16C-50_CAP ",
                group_mission = "CAP",
                skin_id = "23rd_Fighter_Squadron",
                level = "DLC",
                frequency = 305.00 * math_config["M"],
                aa = {
                    pylons = {
                        [1] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" },
                        [2] = { CLSID = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}" },
                        [3] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" },
                        [4] = { CLSID = "<CLEAN>" },
                        [5] = { CLSID = "{8A0BE8AE-58D4-4572-9263-3144C0D06364}" },
                        [6] = { CLSID = "<CLEAN>" },
                        [7] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" },
                        [8] = { CLSID = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}" },
                        [9] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" },
                    },
                    fuel = 3249,
                    flare = 60,
                    chaff = 60,
                    gun = 100,
                },
                wypt = {
                    [2] = {
                        type = "Turning Point",
                        action = "Turning Point",
                        speed = 0.8 * math_config["mach"],
                        task_builder = function(d_x, d_z, d_alt)
                            return {
                                id = "ComboTask",
                                params = {
                                    tasks = {
                                        [1] = {
                                            auto = false,
                                            enabled = true,
                                            id = "Orbit",
                                            number = 1,
                                            params = {
                                                altitude = 38000 * math_config["ft"],
                                                pattern = "Circle",
                                                speed = 0.8 * math_config["mach"],
                                            },
                                        },
                                    },
                                },
                            }
                        end,
                    },
                }
            },
            ["F-15C CAP"] = {
                type_name = "F-15C",
                service = "USAF",
                airport = "Senaki-Kolkhi",
                parking = "0",
                parking_id = "0",
                name = "B_F15C_CAP ",
                group_mission = "CAP",
                skin_id = "58th Fighter SQN (EG)",
                level = "FC",
                frequency = 305.00 * math_config["M"],
                aa = {
                    pylons = {
                        [1] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" },
                        [2] = { CLSID = "<CLEAN>" },
                        [3] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" },
                        [4] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" },
                        [5] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" },
                        [6] = { CLSID = "<CLEAN>" },
                        [7] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" },
                        [8] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" },
                        [9] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" },
                        [10] = { CLSID = "<CLEAN>" },
                        [11] = { CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}" },
                    },
                    fuel = 6103,
                    flare = 60,
                    chaff = 120,
                    gun = 100,
                },
                wypt = {
                    [2] = {
                        type = "Turning Point",
                        action = "Turning Point",
                        speed = 0.8 * math_config["mach"],
                        task_builder = function(d_x, d_z, d_alt)
                            return {
                                id = "ComboTask",
                                params = {
                                    tasks = {
                                        [1] = {
                                            auto = false,
                                            enabled = true,
                                            id = "Orbit",
                                            number = 1,
                                            params = {
                                                altitude = 38000 * math_config["ft"],
                                                pattern = "Circle",
                                                speed = 0.8 * math_config["mach"],
                                            },
                                        },
                                    },
                                },
                            }
                        end,
                    },
                }
            },
        },
        aircraft_pool = {
            ["USN"] = {
                ["CAP"] = {
                    "FA-18C CAP", "F-14B CAP",
                },
                ["CAS"] = {
                    --WIP
                },
                ["SEAD"] = {
                    "FA-18C SEAD",
                },
            },
            ["USAF"] = {
                ["CAP"] = {
                    "F-15C CAP", "F-16C_50 CAP",
                },
                ["CAS"] = {
                    --WIP
                },
                ["SEAD"] = {
                    --WIP
                },
            },
            ["USMC"] = {
                ["CAP"] = {
                    --WIP
                },
                ["CAS"] = {
                    "FA-18C CAS",
                },
                ["SEAD"] = {
                    --WIP
                },
            },
        },
        support_aircraft = {
            ["KC-135"] = {
                callsign = "Arco 1-1",
                radio = "305.00 AM",
                tacan = "35X",
                tacan_name = "35B",
            },
            ["KC-135MPRS"] = {
                callsign = "Texaco 1-1",
                radio = "301.00 AM",
                tacan = "10X",
                tacan_name = "35M",
            },
            ["E-2D"] = {
                --Working in progress...
            },
        },
        ground_force_config = {
            ["M1A2 SEPv3 Group"] = {
                country = "USA",
                name = "B_M1A2_SEPv3 ",
                group_task = "Ground Attack",
                units = {
                    { type = "M1A2C_SEP_V3", dx = 0,   dz = 0 },
                    { type = "M1A2C_SEP_V3", dx = -5,  dz = 5 },
                    { type = "M1A2C_SEP_V3", dx = -10, dz = -10 },
                },
                route = {
                    { dx = 0,    dz = 0,    speed = 0 },
                    { dx = 3000, dz = 1500, speed = 8 },
                },
            },
            ["NASAMS"] = {
                country = "USA",
                name = "B_AVENGER ",
                group_task = "Air Defence",
                units = {
                    { type = "M1097 Avenger", dx = 0, dz = 0 },
                    { type = "M1097 Avenger", dx = 4, dz = 2 },
                },
                route = { { dx = 0, dz = 0 } },
            },
            ["Cargo"] = {
                country = "USA",
                name = "B_Cargo ",
                --group_task = "Air Defence",
                units = {
                    { type = "CHAP_M1083", dx = 0, dz = 0 },
                    { type = "CHAP_M1083", dx = 4, dz = 2 },
                },
                route = { { dx = 0, dz = 0 } },
            },
        },
        aoi = {
            {
                name = "Kutaisi",
                x = -284876,
                z = 683899,
                spawned = {},
                spawn_limit = 1,
                capture_range = 15 * math_config["nmi"],
                capture_progress_bar = 0,
                capturer = "Blue"
            },
            {
                name = "Senaki-Kolkhi",
                x = -281784,
                z = 647295,
                spawned = {},
                spawn_limit = 1,
                capture_range = 15 * math_config["nmi"],
                capture_progress_bar = 0,
                capturer = "Blue"
            },
            {
                name = "Kobuleti",
                x = -317931,
                z = 635723,
                spawned = {},
                spawn_limit = 1,
                capture_range = 15 * math_config["nmi"],
                capture_progress_bar = 0,
                capturer = "Blue"
            },
            {
                name = "Vaziani",
                x = -319114,
                z = 903197,
                spawned = {},
                spawn_limit = 1,
                capture_range = 15 * math_config["nmi"],
                capture_progress_bar = 0,
                capturer = "Blue"
            },
        },
        airports = {
            ["Kutaisi"] = {
                ID = 25,
            },
            ["Senaki-Kolkhi"] = {
                ID = 23,
            },
            ["Kobuleti"] = {
                ID = 24,
            },
            ["Vaziani"] = {
                ID = 31,
            },
            ["CVN-75"] = {
                ID = 114,
            },
        },
    },
    ["Red"] = {
        awacs = "R-A50",
        warning_range = 100 * math_config["km"],
        aircraft_config = {
            ["MiG-29 Fulcrum"] = {
                type_name = "MiG-29 Fulcrum",
                name = "R_MiG29_9-12 ",
                skin_id = "RF Standard grey",
                group_mission = "CAP",
                aa = {
                    pylons = {
                        [1] = { CLSID = "{MISSILE_R-73_APU-73}" },
                        [2] = { CLSID = "{MISSILE_R-73_APU-73}" },
                        [3] = { CLSID = "{MISSILE_R-27ER_APU-470}" },
                        [4] = { CLSID = "{PTB_1500_MIG29A}" },
                        [5] = { CLSID = "{MISSILE_R-27ER_APU-470}" },
                        [6] = { CLSID = "{MISSILE_R-73_APU-73}" },
                        [7] = { CLSID = "{MISSILE_R-73_APU-73}" },
                    },
                    fuel = 3376,
                    flare = 30,
                    chaff = 30,
                    gun = 100,
                },
            },
            ["MiG-29S"] = {
                type_name = "MiG-29S",
                name = "R_MiG29S  ",
                skin_id = "Air Force Standard",
                group_mission = "CAP",
                aa = {
                    pylons = {
                        [1] = { CLSID = "{FBC29BFE-3D24-4C64-B81D-941239D12249}" },
                        [2] = { CLSID = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}" },
                        [3] = { CLSID = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}" },
                        [4] = { CLSID = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}" },
                        [5] = { CLSID = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}" },
                        [6] = { CLSID = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}" },
                        [7] = { CLSID = "{FBC29BFE-3D24-4C64-B81D-941239D12249}" },
                    },
                    fuel = 3493,
                    flare = 30,
                    chaff = 30,
                    gun = 100,
                },
            },
            ["Su-27"] = {
                type_name = "Su-27",
                name = "R_Su27 ",
                skin_id = "Air Force Standard",
                group_mission = "CAP",
                aa = {
                    pylons = {
                        [1]  = { CLSID = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}" },
                        [2]  = { CLSID = "{FBC29BFE-3D24-4C64-B81D-941239D12249}" },
                        [3]  = { CLSID = "{E8069896-8435-4B90-95C0-01A03AE6E400}" },
                        [4]  = { CLSID = "{E8069896-8435-4B90-95C0-01A03AE6E400}" },
                        [5]  = { CLSID = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}" },
                        [6]  = { CLSID = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}" },
                        [7]  = { CLSID = "{E8069896-8435-4B90-95C0-01A03AE6E400}" },
                        [8]  = { CLSID = "{E8069896-8435-4B90-95C0-01A03AE6E400}" },
                        [9]  = { CLSID = "{FBC29BFE-3D24-4C64-B81D-941239D12249}" },
                        [10] = { CLSID = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}" },
                    },
                    fuel = 9400,
                    flare = 96,
                    chaff = 96,
                    gun = 100,
                },
            },
        },
        aircraft_pool = {
            "MiG-29 Fulcrum", "Su-27", "MiG-29S",
        },
        aircraft_type_whitelist = {
            ["MiG-29 Fulcrum"] = true,
            ["An-30M"] = true,
            ["An-26B"] = true,
            ["IL-76MD"] = true,
            ["IL-78M"] = true,
            ["Su-27"] = true,
            ["Ka-52"] = true,
            ["MiG-29A"] = true,
            ["MiG-29S"] = true,
            ["Su-34"] = true,
            ["A-50"] = true,
        },
        aoi = {
            {
                name = "Tskhinvali",
                x = -264118,
                z = 806263,
                spawned = {},
                spawn_limit = 1,
                capture_range = 15 * math_config["nmi"],
                capture_progress_bar = 0,
                capturer = "Red",
                landing_zone_x = -263763,
                landing_zone_z = 807014
            },
            {
                name = "Mozdok Airport",
                x = -83447,
                z = 834510,
                spawned = {},
                spawn_limit = 2,
                capture_range = 15 * math_config["nmi"],
                capture_progress_bar = 0,
                capturer = "Red",
                landing_zone_x = -205132,
                landing_zone_z = 552359
            },
            {
                name = "Sukhumi Urban",
                x = -204932,
                z = 552528,
                spawned = {},
                spawn_limit = 1,
                capture_range = 15 * math_config["nmi"],
                capture_progress_bar = 0,
                capturer = "Red"
            },
            {
                name = "Krasnodar Center",
                x = 11099,
                z = 368390,
                spawned = {},
                spawn_limit = 2,
                capture_range = 15 * math_config["nmi"],
                capture_progress_bar = 0,
                capturer = "Red"
            },
            {
                name = "Sochi-Adler",
                x = -163912,
                z = 463251,
                spawned = {},
                spawn_limit = 2,
                capture_range = 15 * math_config["nmi"],
                capture_progress_bar = 0,
                capturer = "Red"
            },
            {
                name = "Maykop-Khanskaya",
                x = -26540,
                z = 457967,
                spawned = {},
                spawn_limit = 2,
                capture_range = 15 * math_config["nmi"],
                capture_progress_bar = 0,
                capturer = "Red"
            },
        },
        airports = {
            { name = "Mozdok Airport",   ID = 28 },
            { name = "Krasnodar Center", ID = 13 },
            { name = "Sochi-Adler",      ID = 18 },
        },
    },
}

local runtime_required_vars = {
    ["Target detection"] = {
        tgt_dtctn_switch = false,
        tgt_dtctn_running = nil,
    },
    ["Spawn counter"] = {
        blue = 1,
        red = 1,
        red_spawn_limit = 1,
    },
    ["Carrier controller"] = {
        stby = false,
        initial_pos = nil,
        to_pos_x = nil,
        to_pos_z = nil,
        turning_point = nil,
        destination_num = 2,
        turn_into_wind = nil,
        return_command = nil,
    },
    ["Global state"] = {
        seed = nil,
        blue_available_score = 5,
        blue_score = 0,
        red_available_score = 5,
        red_score = 0,
    },
    ["Tac map"] = {
        player_mark = {},
    },
    ["Player call"] = {
        calling = false,
        call_type = nil, -- CAP CAS SEAD
        call_to = nil,   -- USN USAF USMC
    },
}

trigger.action.outText("Version: " .. mission_config["Global"].script_version, 5)
--[[
    X.Y.Z:
    X: Major (release) version
    Y: Minor (feature) version
    Z: Patch (bug-fix) version
]]

--BLUE Side
local cvn = Group.getByName(mission_config["Blue"].cvn_group)
local Carrier_loop
local Carrier_movement
local Carrier_movement_cancel

--Debug Function
local function Completed()
    trigger.action.outText("Operation successful.", 3)
end
local function Failed()
    trigger.action.outText("Operation unsuccessful.", 3)
end

--Functions Part(Global)
local function getDistance2D(fromPos, toPos)
    local dx = toPos.x - fromPos.x
    local dz = toPos.z - fromPos.z
    return math.sqrt(dx * dx + dz * dz)
end

local function getBearing2D(fromPos, toPos)
    local dx = toPos.x - fromPos.x
    local dz = toPos.z - fromPos.z
    if dx == 0 and dz == 0 then
        return 0
    end
    local rad
    if dx == 0 then
        rad = (dz > 0) and (math.pi / 2) or (-math.pi / 2)
    else
        local atan_val = math.atan(dz / dx)
        if dx > 0 then
            rad = atan_val
        else
            rad = atan_val + (dz >= 0 and math.pi or -math.pi)
        end
    end
    local brg = math.deg(rad)
    if brg < 0 then brg = brg + 360 end
    return brg
end

local function Get_offset(heading, distance)
    local rad = math.rad(heading)
    local dx = distance * math.cos(rad)
    local dz = distance * math.sin(rad)
    return dx, dz
end

--F10 Menu
local awacs_menu = missionCommands.addSubMenu("AWACS")
local dctct_menu = missionCommands.addSubMenu("Target Detection", awacs_menu)
local sppr_menu = missionCommands.addSubMenu("Support Aircraft Info", awacs_menu)
local cvn_menu = missionCommands.addSubMenu("Aircraft Carrier(CVN-75)")
local frndly_menu = missionCommands.addSubMenu("Call Friendly Aircrafts")
local frndly_cap_menu = missionCommands.addSubMenu("CAP", frndly_menu)
local frndly_cas_menu = missionCommands.addSubMenu("CAS", frndly_menu)
local frndly_sead_menu = missionCommands.addSubMenu("SEAD", frndly_menu)

--Register AWACS
local awacs_ctrl = Unit.getByName(mission_config["Blue"].awacs):getController()
local r_awacs_ctrl = Unit.getByName(mission_config["Red"].awacs):getController()
local player

--Functions Part(BLUE Side)
--AWACS: Detection Report Function
local function Detected_targets(awacs)
    local players_blue = coalition.getPlayers(coalition.side.BLUE)
    if #players_blue == 0 then
        Failed()
    elseif #players_blue == 1 then
        player = players_blue[1]
    end
    if awacs then
        local d_targets = awacs:getDetectedTargets(4)
        local count = 0
        if d_targets then
            count = #d_targets
        end
        trigger.action.outText("Targets counter:" .. count, (mission_config["Global"].update_interval - 1))
        if #players_blue == 1 then
            local pos = player:getPoint()
            for i, t in ipairs(d_targets) do
                if t.object then
                    local t_pos = t.object:getPoint()
                    local distance = getDistance2D(pos, t_pos) / math_config["nmi"]
                    local brg = getBearing2D(pos, t_pos)
                    trigger.action.outText(
                        "TGT " ..
                        i ..
                        ": Distance(nmi):" .. string.format("%.2f", distance) .. " Angle:" .. string.format("%.0f", brg),
                        (mission_config["Global"].update_interval - 1))
                end
            end
            if runtime_required_vars["Target detection"].tgt_dtctn_switch then
                runtime_required_vars["Target detection"].tgt_dtctn_running = timer.scheduleFunction(Detected_targets,
                    awacs,
                    timer.getTime() + mission_config["Global"].update_interval)
            end
        elseif #players_blue == 0 then
            runtime_required_vars["Target detection"].tgt_dtctn_switch = false
        end
    else
        Failed()
    end
end

local function Switch_detection(awacs)
    if runtime_required_vars["Target detection"].tgt_dtctn_switch then
        runtime_required_vars["Target detection"].tgt_dtctn_switch = false
        timer.removeFunction(runtime_required_vars["Target detection"].tgt_dtctn_running)
    else
        runtime_required_vars["Target detection"].tgt_dtctn_switch = true
        Detected_targets(awacs)
    end
end

local awacs_detection = missionCommands.addCommand("Toggle Air Situation Report", dctct_menu, Switch_detection,
    awacs_ctrl)

local function Refresh_carrier_pos()
    runtime_required_vars["Carrier controller"].initial_pos = cvn:getUnit(1):getPoint()
    runtime_required_vars["Carrier controller"].to_pos_x, runtime_required_vars["Carrier controller"].to_pos_z =
        Get_offset((mission_config["Global"].wind + 90) % 360, 30 * 2 * math_config["nmi"])
    runtime_required_vars["Carrier controller"].turning_point = {
        [1] = {
            x = runtime_required_vars["Carrier controller"].initial_pos.x,
            z = runtime_required_vars["Carrier controller"].initial_pos.z,
        },
        [2] = {
            x = runtime_required_vars["Carrier controller"].initial_pos.x +
                runtime_required_vars["Carrier controller"].to_pos_x,
            z = runtime_required_vars["Carrier controller"].initial_pos.z +
                runtime_required_vars["Carrier controller"].to_pos_z,
        },
        [3] = {
            x = nil,
            z = nil,
        },
    }
end

local function Send_turning_point(carrier)
    local navy_task = {
        id = "Mission",
        params = {
            route = {
                points = {
                    [1] = {
                        type = "Turning Point",
                        action = "Turning Point",
                        x = runtime_required_vars["Carrier controller"].turning_point
                            [runtime_required_vars["Carrier controller"].destination_num].x,
                        y = runtime_required_vars["Carrier controller"].turning_point
                            [runtime_required_vars["Carrier controller"].destination_num].z,
                        speed = 15.43,
                    }
                }
            }
        }
    }
    carrier:getController():setTask(navy_task)
end

local function Change_carrier_destination(carrier)
    if runtime_required_vars["Carrier controller"].destination_num == 1 then
        runtime_required_vars["Carrier controller"].destination_num = 2
    else
        runtime_required_vars["Carrier controller"].destination_num = 1
    end
    Send_turning_point(carrier)
end

Carrier_loop = function(carrier)
    local carrier_pos = carrier:getUnit(1):getPoint()
    if runtime_required_vars["Carrier controller"].stby then
        if getDistance2D(carrier_pos, runtime_required_vars["Carrier controller"].turning_point[3]) < math_config["nmi"] then
            Carrier_movement_cancel(carrier)
        end
    elseif getDistance2D(carrier_pos, runtime_required_vars["Carrier controller"].turning_point[runtime_required_vars["Carrier controller"].destination_num]) < math_config["nmi"] then
        Change_carrier_destination(carrier)
    end
    timer.scheduleFunction(Carrier_loop, carrier, timer.getTime() + mission_config["Global"].carrier_update_interval)
end

Carrier_movement = function(carrier)
    local carrier_pos = carrier:getUnit(1):getPoint()
    local d_x, d_z = Get_offset((mission_config["Global"].wind + 180) % 360, 10 * math_config["nmi"])
    runtime_required_vars["Carrier controller"].turning_point[3] = {
        x = carrier_pos.x + d_x,
        z = carrier_pos.z + d_z,
    }
    local navy_task = {
        id = "Mission",
        params = {
            route = {
                points = {
                    [1] = {
                        type = "Turning Point",
                        action = "Turning Point",
                        x = runtime_required_vars["Carrier controller"].turning_point[3].x,
                        y = runtime_required_vars["Carrier controller"].turning_point[3].z,
                        speed = 15.43,
                    }
                }
            }
        }
    }
    carrier:getController():setTask(navy_task)
    runtime_required_vars["Carrier controller"].stby = true
    runtime_required_vars["Carrier controller"].return_command = missionCommands.addCommand(
        "Cancel Carrier Flight Operations Request", cvn_menu,
        Carrier_movement_cancel, cvn)
    missionCommands.removeItem(runtime_required_vars["Carrier controller"].turn_into_wind)
end

Carrier_movement_cancel = function(carrier)
    runtime_required_vars["Carrier controller"].stby = false
    Send_turning_point(carrier)
    runtime_required_vars["Carrier controller"].turn_into_wind = missionCommands.addCommand(
        "Prepare for Flight Operations", cvn_menu, Carrier_movement, cvn)
    missionCommands.removeItem(runtime_required_vars["Carrier controller"].return_command)
end

runtime_required_vars["Carrier controller"].turn_into_wind = missionCommands.addCommand("Prepare for Flight Operations",
    cvn_menu, Carrier_movement, cvn)

local function Output_aircraft_info(aircraft_type)
    local aircraft = aircraft_type.type
    local txt = "Callsign:" .. mission_config["Blue"].support_aircraft[aircraft].callsign ..
        "\nType:" .. aircraft ..
        "\nRadio:" .. mission_config["Blue"].support_aircraft[aircraft].radio ..
        "\nTACAN:" .. mission_config["Blue"].support_aircraft[aircraft].tacan ..
        "\nTACAN callsign:" .. mission_config["Blue"].support_aircraft[aircraft].tacan_name
    trigger.action.outText(txt, 5)
end

local b_tanker_menu = missionCommands.addSubMenu("Hose/Boom Tanker Information", sppr_menu)
local b_boom_tanker = missionCommands.addCommand("KC-135", b_tanker_menu, Output_aircraft_info, { type = "KC-135" })
local b_hose_tanker = missionCommands.addCommand("KC-135MPRS", b_tanker_menu, Output_aircraft_info,
    { type = "KC-135MPRS" })

local function Take_off_wypt(type, airport)
    if mission_config["Blue"].aircraft_config[type].service == "USAF" then
        return {
            type = "TakeOffParking",
            action = "From Parking Area",
            airdromeId = mission_config["Blue"].airports[airport].ID,
        }
    else
        if not runtime_required_vars["Carrier controller"].stby then
            Carrier_movement(cvn)
        end
        return {
            alt = 0,
            type = "TakeOffParkingHot",
            action = "From Parking Area Hot",
            alt_type = "BARO",
            speed = 500 * math_config["kmh"],
            linkUnit = 114,
            helipadId = 114,
            x = cvn:getUnit(1):getPoint().x,
            y = cvn:getUnit(1):getPoint().z,
        }
    end
end

local function Spawn_b_group(type, d_x, d_z, d_alt)
    local groupData = {
        name = mission_config["Blue"].aircraft_config[type].name .. runtime_required_vars["Spawn counter"].blue,
        task = mission_config["Blue"].aircraft_config[type].group_mission,
        units = {
            [1] = {
                name = mission_config["Blue"].aircraft_config[type].name ..
                    runtime_required_vars["Spawn counter"].blue .. "-1",
                type = mission_config["Blue"].aircraft_config[type].type_name,
                skill = "Excellent",
                callsign = { 0, runtime_required_vars["Spawn counter"].blue, 1 },
                alt = 0,
                alt_type = "BARO",
                onboard_num = runtime_required_vars["Spawn counter"].blue .. "1",
                livery_id = mission_config["Blue"].aircraft_config[type].skin_id,
                payload = mission_config["Blue"].aircraft_config[type].aa,
                parking = mission_config["Blue"].aircraft_config[type].parking,
                parking_id = mission_config["Blue"].aircraft_config[type].parking_id,
            },
            [2] = {
                name = mission_config["Blue"].aircraft_config[type].name ..
                    runtime_required_vars["Spawn counter"].blue .. "-2",
                type = mission_config["Blue"].aircraft_config[type].type_name,
                skill = "Excellent",
                callsign = { 0, runtime_required_vars["Spawn counter"].blue, 2 },
                alt = 0,
                alt_type = "BARO",
                onboard_num = runtime_required_vars["Spawn counter"].blue .. "2",
                livery_id = mission_config["Blue"].aircraft_config[type].skin_id,
                payload = mission_config["Blue"].aircraft_config[type].aa,
                parking = mission_config["Blue"].aircraft_config[type].parking,
                parking_id = mission_config["Blue"].aircraft_config[type].parking_id,
            },
        },
        route = {
            points = {
                [1] = Take_off_wypt(type, mission_config["Blue"].aircraft_config[type].airport),
                [2] = {
                    type = mission_config["Blue"].aircraft_config[type].wypt[2].type,
                    action = mission_config["Blue"].aircraft_config[type].wypt[2].action,
                    x = d_x,
                    y = d_z,
                    alt = d_alt,
                    alt_type = "BARO",
                    speed = mission_config["Blue"].aircraft_config[type].wypt[2].speed,
                    speed_locked = true,
                    ETA_locked = false,
                    formation_template = "",
                    task = mission_config["Blue"].aircraft_config[type].wypt[2].task_builder(d_x, d_z, d_alt),
                },
            },
        },
    }

    coalition.addGroup(country.id.USA, Group.Category.AIRPLANE, groupData)
    local newGroup = Group.getByName(groupData.name)
    if newGroup then
        local controller = newGroup:getController()
        controller:setOption(
            AI.Option.Air.id.ROE,
            AI.Option.Air.val.ROE.WEAPON_FREE
        )
        controller:setOption(
            AI.Option.Air.id.MISSILE_ATTACK,
            AI.Option.Air.val.MISSILE_ATTACK.TARGET_THREAT_EST
        )
        if mission_config["Blue"].aircraft_config[type].group_mission == "CAP" then
            controller:setOption(AI.Option.Air.id.PROHIBIT_AG, true)
        end
        if mission_config["Blue"].aircraft_config[type].level == "DLC" then
            controller:pushTask({
                id = "WrappedAction",
                params = {
                    action = {
                        id = "SetFrequency",
                        params = {
                            frequency = mission_config["Blue"].aircraft_config[type].frequency,
                            modulation = 0,
                        },
                    },
                },
            })
        end
    end
    runtime_required_vars["Spawn counter"].blue = runtime_required_vars["Spawn counter"].blue + 1
end

local function Player_call(call_mssg)
    runtime_required_vars["Player call"].call_to = call_mssg.force
    runtime_required_vars["Player call"].call_type = call_mssg.mssn_type
    runtime_required_vars["Player call"].calling = true
    if not runtime_required_vars["Global state"].seed then
        runtime_required_vars["Global state"].seed = math.floor(timer.getTime() * 1000)
        math.randomseed(runtime_required_vars["Global state"].seed % 2147483647)
    end
end

missionCommands.addCommand("USN", frndly_cap_menu, Player_call, { force = "USN", mssn_type = "CAP" })
missionCommands.addCommand("USAF", frndly_cap_menu, Player_call, { force = "USAF", mssn_type = "CAP" })
--missionCommands.addCommand("USMC", frndly_cap_menu, Player_call, { force = "USMC", mssn_type = "CAP" })
--missionCommands.addCommand("USN", frndly_cas_menu, Player_call, { force = "USN", mssn_type = "CAS" })
--missionCommands.addCommand("USAF", frndly_cas_menu, Player_call, { force = "USAF", mssn_type = "CAS" })
missionCommands.addCommand("USMC", frndly_cas_menu, Player_call, { force = "USMC", mssn_type = "CAS" })
missionCommands.addCommand("USN", frndly_sead_menu, Player_call, { force = "USN", mssn_type = "SEAD" })
--missionCommands.addCommand("USAF", frndly_sead_menu, Player_call, { force = "USAF", mssn_type = "SEAD" })
--missionCommands.addCommand("USMC", frndly_sead_menu, Player_call, { force = "USMC", mssn_type = "SEAD" })

local function Friendly_aircraft_state_machine()
    if runtime_required_vars["Global state"].blue_available_score > 0 and runtime_required_vars["Player call"].calling then
        local global_mark = world.getMarkPanels()
        if global_mark then
            for _, mark in ipairs(global_mark) do
                if mark.coalition == 2 then
                    if mark.text == runtime_required_vars["Player call"].call_type then
                        Spawn_b_group(
                            mission_config["Blue"].aircraft_pool[runtime_required_vars["Player call"].call_to]
                            [runtime_required_vars["Player call"].call_type]
                            [math.random(#mission_config["Blue"].aircraft_pool[runtime_required_vars["Player call"].call_to][runtime_required_vars["Player call"].call_type])],
                            mark.pos.x, mark.pos.z, 38000 * math_config["ft"])
                        trigger.action.removeMark(mark.idx)
                        trigger.action.outText("Friendly group is coming.", mission_config["Global"].update_interval)
                        runtime_required_vars["Global state"].blue_available_score = runtime_required_vars
                        ["Global state"].blue_available_score - 1
                        runtime_required_vars["Player call"].calling = false
                        break
                    end
                end
            end
        end
    end
    timer.scheduleFunction(Friendly_aircraft_state_machine, nil,
        timer.getTime() + mission_config["Global"].update_interval)
end

--Functions Part(RED Side)
local function Count_aoi_airspace(area)
    local count = 0
    for i = 1, #area.spawned do
        local aircrafts = Group.getByName(area.spawned[i])
        if aircrafts and aircrafts:isExist() then
            count = count + 1
        end
    end
    return count
end

local function Spawn_r_group(type, airports, d_area, d_x, d_z, d_alt)
    local groupData = {
        name = mission_config["Red"].aircraft_config[type].name .. runtime_required_vars["Spawn counter"].red,
        task = "CAP",
        units = {
            [1] = {
                name = mission_config["Red"].aircraft_config[type].name ..
                    runtime_required_vars["Spawn counter"].red .. "-1",
                type = mission_config["Red"].aircraft_config[type].type_name,
                skill = "Excellent",
                callsign = { 0, runtime_required_vars["Spawn counter"].red, 1 },
                alt_type = "BARO",
                onboard_num = runtime_required_vars["Spawn counter"].red .. "1",
                livery_id = mission_config["Red"].aircraft_config[type].skin_id,
                payload = mission_config["Red"].aircraft_config[type].aa,
            },
            [2] = {
                name = mission_config["Red"].aircraft_config[type].name ..
                    runtime_required_vars["Spawn counter"].red .. "-2",
                type = mission_config["Red"].aircraft_config[type].type_name,
                skill = "Excellent",
                callsign = { 0, runtime_required_vars["Spawn counter"].red, 2 },
                alt_type = "BARO",
                onboard_num = runtime_required_vars["Spawn counter"].red .. "2",
                livery_id = mission_config["Red"].aircraft_config[type].skin_id,
                payload = mission_config["Red"].aircraft_config[type].aa,
            },
        },
        route = {
            points = {
                [1] = {
                    type = "TakeOffParking",
                    action = "From Parking Area",
                    airdromeId = airports[math.random(#airports)].ID,
                },
                [2] = {
                    type = "Turning Point",
                    action = "Turning Point",
                    x = d_x,
                    y = d_z,
                    alt = d_alt,
                    alt_type = "BARO",
                    speed = 0.8 * math_config["mach"],
                    speed_locked = true,
                    ETA_locked = false,
                    formation_template = "",
                    task = {
                        id = "ComboTask",
                        params = {
                            tasks = {
                                [1] = {
                                    auto = false,
                                    enabled = true,
                                    id = "Orbit",
                                    number = 1,
                                    params = {
                                        altitude = d_alt,
                                        pattern = "Circle",
                                        speed = 0.8 * math_config["mach"],
                                    },
                                },
                            },
                        },
                    },
                },
            },
        },
    }

    coalition.addGroup(country.id.RUSSIA, Group.Category.AIRPLANE, groupData)
    local newGroup = Group.getByName(groupData.name)
    if newGroup then
        local controller = newGroup:getController()
        controller:setOption(
            AI.Option.Air.id.ROE,
            AI.Option.Air.val.ROE.WEAPON_FREE
        )
        controller:setOption(
            AI.Option.Air.id.MISSILE_ATTACK,
            AI.Option.Air.val.MISSILE_ATTACK.TARGET_THREAT_EST
        )
        if mission_config["Red"].aircraft_config[type].group_mission == "CAP" then
            controller:setOption(AI.Option.Air.id.PROHIBIT_AG, true)
        end
    end
    table.insert(d_area.spawned, groupData.name)
    runtime_required_vars["Spawn counter"].red = runtime_required_vars["Spawn counter"].red + 1
end

local function Red_occupy()
    local active_unit_count
    local active_flag
    local blue_groups = coalition.getGroups(coalition.side.BLUE, Group.Category.AIRPLANE)
    for _, aoi in ipairs(mission_config["Red"].aoi) do
        active_unit_count = 0
        if aoi and aoi.capturer == "Red" then
            for _, g in ipairs(blue_groups) do
                active_flag = false
                if g and g:isExist() then
                    for _, u in ipairs(g:getUnits()) do
                        if u and u:isExist() and u:getLife() > 0 then
                            if getDistance2D(u:getPoint(), aoi) <= aoi.capture_range then
                                active_flag = true
                                break
                            end
                        end
                    end
                    if active_flag then
                        active_unit_count = active_unit_count + 1
                    end
                end
            end
            if active_unit_count > 0 then
                aoi.capture_progress_bar = aoi.capture_progress_bar +
                    active_unit_count * mission_config["Global"].capture_bar_factor
                if aoi.capture_progress_bar >= 100 then
                    aoi.capturer = "Blue"
                    trigger.action.outText("Airspace " .. aoi.name .. " has been captured by BLUE", 10)
                    runtime_required_vars["Global state"].blue_available_score = runtime_required_vars["Global state"]
                        .blue_available_score + 3
                    runtime_required_vars["Global state"].blue_score = runtime_required_vars["Global state"].blue_score +
                        1
                    runtime_required_vars["Spawn counter"].red_spawn_limit = runtime_required_vars["Spawn counter"]
                        .red_spawn_limit + 1
                    for _, refresh_aoi in ipairs(mission_config["Red"].aoi) do
                        refresh_aoi.spawn_limit = refresh_aoi.spawn_limit +
                            runtime_required_vars["Spawn counter"].red_spawn_limit
                    end
                else
                    trigger.action.outText("Airspace " .. aoi.name .. ":" .. aoi.capture_progress_bar, 5)
                end
            else
                aoi.capture_progress_bar = 0
            end
        end
    end
    timer.scheduleFunction(Red_occupy, nil, timer.getTime() + mission_config["Global"].update_interval)
end

local function Red_detection()
    local r_targets = r_awacs_ctrl:getDetectedTargets(4)
    if #r_targets > 0 then
        for i, t in ipairs(r_targets) do
            if t.object and not mission_config["Red"].aircraft_type_whitelist[t.object:getTypeName()] then
                local target_position = t.object:getPoint()
                for _, aoi in ipairs(mission_config["Red"].aoi) do
                    if aoi.capturer == "Red" then
                        local t_distance = getDistance2D(target_position, aoi)
                        if t_distance <= mission_config["Red"].warning_range and Count_aoi_airspace(aoi) < aoi.spawn_limit then
                            Spawn_r_group(
                                mission_config["Red"].aircraft_pool[math.random(#mission_config["Red"].aircraft_pool)],
                                mission_config["Red"].airports,
                                aoi,
                                target_position.x, target_position.z,
                                38000 * math_config["ft"])
                            break
                        end
                    end
                end
            end
        end
    end
    timer.scheduleFunction(Red_detection, nil, timer.getTime() + mission_config["Global"].update_interval)
end

--Running Part
timer.scheduleFunction(Refresh_carrier_pos, nil, timer.getTime() + 1)
timer.scheduleFunction(Send_turning_point, cvn, timer.getTime() + 3)
timer.scheduleFunction(Carrier_loop, cvn, timer.getTime() + mission_config["Global"].carrier_update_interval)
timer.scheduleFunction(Red_detection, nil, timer.getTime() + mission_config["Global"].update_interval)
timer.scheduleFunction(Red_occupy, nil, timer.getTime() + mission_config["Global"].update_interval)
timer.scheduleFunction(Friendly_aircraft_state_machine, nil, timer.getTime() + mission_config["Global"].update_interval)

--Debug Menu

--[[
Debug Menu
local spawn_menu = missionCommands.addSubMenu("Debug: Spawn", menu)

local function Search_airports()
    local airports_list = world.getAirbases()
    trigger.action.outText("Airports List", 10)
    for i = 1, #airports_list do
        local ap = airports_list[i]
        trigger.action.outText("Name:" .. Airbase.getName(ap) .. "\nID" .. Airbase.getID(ap), 10)
    end
    trigger.action.outText("Total:" .. #airports_list, 10)
end

local search_airport_menu = missionCommands.addSubMenu("Debug: Search All Available Airports")
local search_airports_command = missionCommands.addCommand("Search all available airports", search_airport_menu,
    Search_airports)

local debug_menu = missionCommands.addSubMenu("Debug")

local function debug_random()
    if not runtime_required_vars["Global state"].seed then
        runtime_required_vars["Global state"].seed = math.floor(timer.getTime() * 1000)
        math.randomseed(runtime_required_vars["Global state"].seed % 2147483647)
        Completed()
        trigger.action.outText("Seed:" .. runtime_required_vars["Global state"].seed, 3)
    end
    trigger.action.outText(
        "Random type:" ..
        mission_config["Blue"].aircraft_pool[runtime_required_vars["Player call"].call_to]
        [runtime_required_vars["Player call"].call_type]
        [math.random(#mission_config["Blue"].aircraft_pool[runtime_required_vars["Player call"].call_to][runtime_required_vars["Player call"].call_type])],
        3)
end

missionCommands.addCommand("Random choose type", debug_menu, debug_random)
]]
