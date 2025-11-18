-- AtlasAlpha_Data.lua
-- Instance + boss + loot data for AtlasAlpha2 (0.5.3)
-- All loot entries are tables so the code doesn't need type().
-- You can add 'icon' = "Interface\\Icons\\..." for proper icons.

AtlasAlpha_Instances = {
    {
        key        = "BFD",
        name       = "Blackfathom Deeps",
        texture    = "Interface\\AtlasAlpha\\Maps\\Deadmines",
        location   = "Westfall",
        levelRange = "18-23",
        faction    = "Alliance",
        bosses     = {
            {
                name = "Lady Sarevess",
                loot = {
                    {
                        id   = 888,
                        link = "|cff006bff|Hitem:888::::::::60:::::|h[Naga Battle Gloves]|h|r",
                        icon = "Interface\\Icons\\INV_Gauntlets_05",
                    },
                    {
                        id   = 3078,
                        link = "|cff1eff00|Hitem:3078::::::::60:::::|h[Naga Heartpiercer]|h|r",
                        icon = "Interface\\Icons\\INV_Weapon_Bow_05",
                    },
                },
            },
            {
                name = "Twilight Lord Kelris",
                loot = {
                    {
                        id   = 1155,
                        link = "|cff006bff|Hitem:1155::::::::60:::::|h[Rod of the Sleepwalker]|h|r",
                        icon = "Interface\\Icons\\INV_Staff_09",
                    },
                },
            },
        },
    },

    {
        key        = "DEADMINES",
        name       = "Deadmines",
        texture    = "Interface\\AtlasAlpha\\Maps\\Deadmines",
        location   = "Westfall",
        levelRange = "18-23",
        faction    = "Alliance",
        bosses     = {
            {
                name = "Rhahk'Zor",
                loot = {
                    {
                        id   = 5187,
                        link = "|cffffff00|Hitem:5187::::::::60:::::|h[Rhahk'Zor's Hammer]|h|r",
                        icon = "Interface\\Icons\\INV_Hammer_09",
                    },
                    {
                        id   = 872,
                        link = "|cff1eff00|Hitem:872::::::::60:::::|h[Rockslicer]|h|r",
                        icon = "Interface\\Icons\\INV_ThrowingAxe_02",
                    },
                },
            },
            {
                name = "Miner Johnson",
                loot = {
                    {
                        id   = 5443,
                        link = "|cff006bff|Hitem:5443::::::::60:::::|h[Gold-plated Buckler]|h|r",
                        icon = "Interface\\Icons\\INV_Shield_02",
                    },
                    {
                        id   = 5444,
                        link = "|cff1eff00|Hitem:5444::::::::60:::::|h[Miner's Cape]|h|r",
                        icon = "Interface\\Icons\\INV_Misc_Cape_02",
                    },
                },
            },
            {
                name = "Sneed",
                loot = {
                    {
                        id   = 5194,
                        link = "|cff006bff|Hitem:5194::::::::60:::::|h[Taskmaster Axe]|h|r",
                        icon = "Interface\\Icons\\INV_ThrowingAxe_06",
                    },
                    {
                        id   = 5195,
                        link = "|cff1eff00|Hitem:5195::::::::60:::::|h[Gold-flecked Gloves]|h|r",
                        icon = "Interface\\Icons\\INV_Gauntlets_05",
                    },
                    {
                        id   = 1937,
                        link = "|cff1eff00|Hitem:1937::::::::60:::::|h[Buzz Saw]|h|r",
                        icon = "Interface\\Icons\\INV_Sword_24",
                    },
                    {
                        id   = 2169,
                        link = "|cffffff00|Hitem:2169::::::::60:::::|h[Buzzer Blade]|h|r",
                        icon = "Interface\\Icons\\INV_Weapon_ShortBlade_05",
                    },
                },
            },
            {
                name = "Gilnid",
                loot = {
                    {
                        id   = 1156,
                        link = "|cff006bff|Hitem:1156::::::::60:::::|h[Lavishly Jeweled Ring]|h|r",
                        icon = "Interface\\Icons\\INV_Jewelry_Ring_09",
                    },
                    {
                        id   = 5199,
                        link = "|cff1eff00|Hitem:5199::::::::60:::::|h[Smelting Pants]|h|r",
                        icon = "Interface\\Icons\\INV_Pants_02",
                    },
                },
            },
            {
                name = "Mr. Smite",
                loot = {
                    {
                        id   = 5192,
                        link = "|cff006bff|Hitem:5192::::::::60:::::|h[Thief's Blade]|h|r",
                        icon = "Interface\\Icons\\INV_Sword_24",
                    },
                    {
                        id   = 5196,
                        link = "|cff1eff00|Hitem:5196::::::::60:::::|h[Spiked Axe]|h|r",
                        icon = "Interface\\Icons\\INV_Axe_14",
                    },
                },
            },
            {
                name = "Cookie",
                loot = {
                    {
                        id   = 5198,
                        link = "|cff006bff|Hitem:5198::::::::60:::::|h[Cookie's Stirring Rod]|h|r",
                        icon = "Interface\\Icons\\INV_Staff_02",
                    },
                    {
                        id   = 5197,
                        link = "|cff1eff00|Hitem:5197::::::::60:::::|h[Cookie's Tenderizer]|h|r",
                        icon = "Interface\\Icons\\INV_Misc_Flute_01",
                    },
                },
            },
            {
                name = "Captain Greenskin",
                loot = {
                    {
                        id   = 5201,
                        link = "|cff006bff|Hitem:5201::::::::60:::::|h[Emberstone Staff]|h|r",
                        icon = "Interface\\Icons\\INV_Staff_07",
                    },
                    {
                        id   = 5200,
                        link = "|cff1eff00|Hitem:5200::::::::60:::::|h[Impaling Harpoon]|h|r",
                        icon = "Interface\\Icons\\INV_Spear_07",
                    },
                },
            },
            {
                name = "Edwin VanCleef",
                loot = {
                    {
                        id   = 5193,
                        link = "|cff006bff|Hitem:5193::::::::60:::::|h[Cape of the Brotherhood]|h|r",
                        icon = "Interface\\Icons\\INV_Misc_Cape_07",
                    },
                    {
                        id   = 5202,
                        link = "|cff006bff|Hitem:5202::::::::60:::::|h[Corsair's Overshirt]|h|r",
                        icon = "Interface\\Icons\\inv_shirt_08",
                    },
                    {
                        id   = 5191,
                        link = "|cff006bff|Hitem:5191::::::::60:::::|h[Cruel Barb]|h|r",
                        icon = "Interface\\Icons\\INV_Sword_24",
                    },
                },
            },
        },
    },

    {
        key        = "RazorfenKraul",
        name       = "Razorfen Kraul",
        texture    = "Interface\\AtlasAlpha\\Maps\\Deadmines",
        location   = "Westfall",
        levelRange = "18-23",
        faction    = "Alliance",
        bosses     = {
            {
                name = "Death Speaker Jargba",
                loot = {
                    {
                        id   = 2816,
                        link = "|cff006bff|Hitem:2816::::::::60:::::|h[Death Speaker Sceptre]|h|r",
                        icon = "Interface\\Icons\\INV_Mace_01",
                    },
                },
            },
        },
    },

    {
        key        = "ShadowfangKeep",
        name       = "Shadowfang Keep",
        texture    = "Interface\\AtlasAlpha\\Maps\\Deadmines",
        location   = "Westfall",
        levelRange = "18-23",
        faction    = "Alliance",
        bosses     = {
            {
                name = "Razorclaw the Butcher",
                loot = {
                    { text = "Impaling Harpoon", icon = "Interface\\Icons\\INV_Spear_08" },
                    { text = "Foreman's Gloves", icon = "Interface\\Icons\\INV_Gauntlets_05" },
                },
            },
            {
                name = "Baron Silverlaine",
                loot = {
                    { text = "Impaling Harpoon", icon = "Interface\\Icons\\INV_Spear_08" },
                    { text = "Foreman's Gloves", icon = "Interface\\Icons\\INV_Gauntlets_05" },
                },
            },
            {
                name = "Commander Springvale",
                loot = {
                    { text = "Impaling Harpoon", icon = "Interface\\Icons\\INV_Spear_08" },
                    { text = "Foreman's Gloves", icon = "Interface\\Icons\\INV_Gauntlets_05" },
                },
            },
            {
                name = "Odo the Blindwatcher",
                loot = {
                    { text = "Impaling Harpoon", icon = "Interface\\Icons\\INV_Spear_08" },
                    { text = "Foreman's Gloves", icon = "Interface\\Icons\\INV_Gauntlets_05" },
                },
            },
            {
                name = "Deathsworn Captain",
                loot = {
                    { text = "Impaling Harpoon", icon = "Interface\\Icons\\INV_Spear_08" },
                    { text = "Foreman's Gloves", icon = "Interface\\Icons\\INV_Gauntlets_05" },
                },
            },
            {
                name = "Fenrus the Devourer",
                loot = {
                    { text = "Impaling Harpoon", icon = "Interface\\Icons\\INV_Spear_08" },
                    { text = "Foreman's Gloves", icon = "Interface\\Icons\\INV_Gauntlets_05" },
                },
            },
            {
                name = "Wolf Master Nandos",
                loot = {
                    { text = "Impaling Harpoon", icon = "Interface\\Icons\\INV_Spear_08" },
                    { text = "Foreman's Gloves", icon = "Interface\\Icons\\INV_Gauntlets_05" },
                },
            },
            {
                name = "Archmage Arugal",
                loot = {
                    {
                        id   = 10399,
                        link = "|cff1eff00|Hitem:10399::::::::60:::::|h[Blackened Defias Armor]|h|r",
                        icon = "Interface\\Icons\\INV_Chest_Leather_07",
                    },
                    {
                        id   = 5200,
                        link = "|cff1eff00|Hitem:5200::::::::60:::::|h[Impaling Harpoon]|h|r",
                        icon = "Interface\\Icons\\INV_Spear_08",
                    },
                },
            },
        },
    },

    {
        key        = "ScarletMonestary",
        name       = "Scarlet Monestary",
        texture    = "Interface\\AtlasAlpha\\Maps\\Deadmines",
        location   = "Westfall",
        levelRange = "18-23",
        faction    = "Alliance",
        bosses     = {
            {
                name = "Rhahk'Zor",
                loot = {
                    { text = "Impaling Harpoon", icon = "Interface\\Icons\\INV_Spear_08" },
                    { text = "Foreman's Gloves", icon = "Interface\\Icons\\INV_Gauntlets_05" },
                },
            },
            {
                name = "Edwin VanCleef",
                loot = {
                    {
                        id   = 10399,
                        link = "|cff1eff00|Hitem:10399::::::::60:::::|h[Blackened Defias Armor]|h|r",
                        icon = "Interface\\Icons\\INV_Chest_Leather_07",
                    },
                    {
                        id   = 5200,
                        link = "|cff1eff00|Hitem:5200::::::::60:::::|h[Impaling Harpoon]|h|r",
                        icon = "Interface\\Icons\\INV_Spear_08",
                    },
                },
            },
        },
    },

    {
        key        = "Stockades",
        name       = "Stockades",
        texture    = "Interface\\AtlasAlpha\\Maps\\Deadmines",
        location   = "Westfall",
        levelRange = "18-23",
        faction    = "Alliance",
        bosses     = {
            {
                name = "Rhahk'Zor",
                loot = {
                    { text = "Impaling Harpoon", icon = "Interface\\Icons\\INV_Spear_08" },
                    { text = "Foreman's Gloves", icon = "Interface\\Icons\\INV_Gauntlets_05" },
                },
            },
            {
                name = "Edwin VanCleef",
                loot = {
                    {
                        id   = 10399,
                        link = "|cff1eff00|Hitem:10399::::::::60:::::|h[Blackened Defias Armor]|h|r",
                        icon = "Interface\\Icons\\INV_Chest_Leather_07",
                    },
                    {
                        id   = 5200,
                        link = "|cff1eff00|Hitem:5200::::::::60:::::|h[Impaling Harpoon]|h|r",
                        icon = "Interface\\Icons\\INV_Spear_08",
                    },
                },
            },
        },
    },

    {
        key        = "WAILING_CAVERNS",
        name       = "Wailing Caverns",
        texture    = "Interface\\AtlasAlpha\\Maps\\WailingCaverns",
        location   = "The Barrens",
        levelRange = "17-24",
        faction    = "Horde",
        bosses     = {
            {
                name = "Lady Anacondra",
                loot = {
                    { text = "Example Staff", icon = "Interface\\Icons\\INV_Staff_20" },
                    { text = "Example Shoulders", icon = "Interface\\Icons\\INV_Shoulder_08" },
                },
            },
            {
                name = "Mutanus the Devourer",
                loot = {
                    {
                        id   = 6461,
                        link = "|cff1eff00|Hitem:6461::::::::60:::::|h[Slime-encrusted Pads]|h|r",
                        icon = "Interface\\Icons\\INV_Shoulder_17",
                    },
                    {
                        id   = 6463,
                        link = "|cff1eff00|Hitem:6463::::::::60:::::|h[Deep Fathom Ring]|h|r",
                        icon = "Interface\\Icons\\INV_Jewelry_Ring_03",
                    },
                },
            },
        },
    },
}
