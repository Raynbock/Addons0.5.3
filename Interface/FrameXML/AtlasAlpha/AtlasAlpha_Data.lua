-- AtlasAlpha_Data.lua
-- Instance + boss + loot data for AtlasAlpha2 (0.5.3)
-- All loot entries are tables so the code doesn't need type().
-- You can add 'icon' = "Interface\\Icons\\..." for proper icons.

AtlasAlpha_Instances = {
    {
        key        = "BFD",
        name       = "Blackfathom Deeps",
        texture    = "Interface\\AtlasAlpha\\Maps\\BlackfathomDeeps",
        location   = "Darkshore",
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
        texture    = "Interface\\AtlasAlpha\\Maps\\RazorfenKraul",
        location   = "The Barrens",
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
        texture    = "Interface\\AtlasAlpha\\Maps\\ShadowfangKeep",
        location   = "Silverpine Forest",
        bosses     = {
            {
                name = "Razorclaw the Butcher",
                loot = {
                    {
                        id   = 1292,
                        link = "|cff006bff|Hitem:1292::::::::60:::::|h[Butcher's Cleaver]|h|r",
                        icon = "Interface\\Icons\\INV_Axe_23",
                    },
                    {
                        id   = 6226,
                        link = "|cff1eff00|Hitem:6226::::::::60:::::|h[Bloody Apron]|h|r",
                        icon = "Interface\\Icons\\INV_Robe_01",
                    },
                },
            },
            {
                name = "Baron Silverlaine",
                loot = {
                    {
                        id   = 6321,
                        link = "|cff006bff|Hitem:6321::::::::60:::::|h[Silverlaine's Family Seal]|h|r",
                        icon = "Interface\\Icons\\INV_Jewelry_Ring_04",
                    },
                    {
                        id   = 6323,
                        link = "|cff1eff00|Hitem:3078::::::::60:::::|h[Baron's Sceptre]|h|r",
                        icon = "Interface\\Icons\\INV_Mace_01",
                    },
                },
            },
            {
                name = "Commander Springvale",
                loot = {
                    {
                        id   = 6320,
                        link = "|cff006bff|Hitem:6320::::::::60:::::|h[Commander's Crest]|h|r",
                        icon = "Interface\\Icons\\INV_Shield_05",
                    },
                    {
                        id   = 3191,
                        link = "|cff1eff00|Hitem:3191::::::::60:::::|h[Arced War Axe]|h|r",
                        icon = "Interface\\Icons\\INV_Axe_06",
                    },
                },
            },
            {
                name = "Odo the Blindwatcher",
                loot = {
                    {
                        id   = 6318,
                        link = "|cff006bff|Hitem:6318::::::::60:::::|h[Odo's Ley Staff]|h|r",
                        icon = "Interface\\Icons\\INV_Staff_09",
                    },
                    {
                        id   = 6319,
                        link = "|cff1eff00|Hitem:6319::::::::60:::::|h[Girdle of the Blindwatcher]|h|r",
                        icon = "Interface\\Icons\\INV_Belt_03",
                    },
                },
            },
            {
                name = "Fenrus the Devourer",
                loot = {
                    {
                        id   = 3230,
                        link = "|cff1eff00|Hitem:3230::::::::60:::::|h[Black Wolf Bracers]|h|r",
                        icon = "Interface\\Icons\\INV_Bracer_08",
                    },
                    {
                        id   = 6340,
                        link = "|cffffff00|Hitem:6340::::::::60:::::|h[Fenrus' Hide]|h|r",
                        icon = "Interface\\Icons\\INV_Misc_Pelt_Wolf_02",
                    },
                },
            },
            {
                name = "Wolf Master Nandos",
                loot = {
                    {
                        id   = 3748,
                        link = "|cff006bff|Hitem:3748::::::::60:::::|h[Feline Mantle]|h|r",
                        icon = "Interface\\Icons\\INV_Shoulder_05",
                    },
                    {
                        id   = 6314,
                        link = "|cff1eff00|Hitem:6314::::::::60:::::|h[Wolfmaster Cape]|h|r",
                        icon = "Interface\\Icons\\INV_Misc_Cape_10",
                    },
                },
            },
            {
                name = "Archmage Arugal",
                loot = {
                    {
                        id   = 6324,
                        link = "|cff006bff|Hitem:6324::::::::60:::::|h[Robes of Arugal]|h|r",
                        icon = "Interface\\Icons\\INV_Robe_01",
                    },
                    {
                        id   = 6392,
                        link = "|cff006bff|Hitem:6392::::::::60:::::|h[Belt of Arugal]|h|r",
                        icon = "Interface\\Icons\\INV_Belt_10",
                    },
                    {
                        id   = 6220,
                        link = "|cff006bff|Hitem:6220::::::::60:::::|h[Meteor Shard]|h|r",
                        icon = "Interface\\Icons\\INV_Weapon_ShortBlade_04",
                    },
                },
            },
        },
    },

    {
        key        = "Stockades",
        name       = "Stockades",
        texture    = "Interface\\AtlasAlpha\\Maps\\TheStockade",
        location   = "Stormwind",
        bosses     = {
            {
                name = "Bruegal Ironknuckle",
                loot = {
                    {
                        id   = 2942,
                        link = "|cff006bff|Hitem:2942::::::::60:::::|h[Iron Knuckles]|h|r",
                        icon = "Interface\\Icons\\INV_Gauntlets_04",
                    },
                    {
                        id   = 3228,
                        link = "|cff006bff|Hitem:3228::::::::60:::::|h[Jimmied Handcuffs]|h|r",
                        icon = "Interface\\Icons\\INV_Bracer_02",
                    },
                    {
                        id   = 2941,
                        link = "|cff006bff|Hitem:2941::::::::60:::::|h[Prison Shank]|h|r",
                        icon = "Interface\\Icons\\INV_Weapon_ShortBlade_05",
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
        bosses     = {
            {
                name = "Lady Anacondra",
                loot = {
                    {
                        id   = 5404,
                        link = "|cffffff00|Hitem:5404::::::::60:::::|h[Rigid Shoulderpads]|h|r",
                        icon = "Interface\\Icons\\INV_Shoulder_08",
                    },
                },
            },
            {
                name = "Lord Serpentis",
                loot = {
                    {
                        id   = 5970,
                        link = "|cff1eff00|Hitem:5970::::::::60:::::|h[Serpent Gloves]|h|r",
                        icon = "Interface\\Icons\\INV_Gauntlets_06",
                    },
                },
            },
        },
    },
}
