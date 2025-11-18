-- MacroBar_Data.lua

MacroData = {
    -- Default/fallback macros (used if no character-specific set)
    ['MacroBar'] = {
        {
            ABNumber = '1',
            name = 'Hello',
            icon = 'Interface\\Icons\\INV_Misc_QuestionMark',
            body = '/reload',
        },
        {
            ABNumber = '2',
            name = 'Follow',
            icon = 'Interface\\Icons\\Ability_Rogue_Sprint',
            body = '/follow',
        },
        {
            ABNumber = '22',
            name = 'Icons',
            icon = 'Interface\\Icons\\Ability_TownWatch',
            body = '/icons',
        },
        {
            ABNumber = '23',
            name = 'Reload',
            icon = 'Interface\\Icons\\Spell_Frost_Stun',
            body = '/reload',
        },
        {
            ABNumber = '24',
            name = 'Atlas',
            icon = 'Interface\\Icons\\Ability_Spy',
            body = '/atlas',
        },
        -- ... up to ABNumber '24'
    },

    -- Character-specific macros, just change the top name [NAMEONE], [NAMETWO]... with your characters name.
    ['Davir'] = {
        {
            ABNumber = '1',
            name = 'Sheep Focus',
            icon = 'Interface\\Icons\\Spell_Nature_Polymorph',
            body = '/say Sheeping focus\n/cast Polymorph',
        },
        {
            ABNumber = '2',
            name = 'Drink',
            icon = 'Interface\\Icons\\INV_Drink_18',
            body = '/use Conjured Water',
        },
        {
            ABNumber = '23',
            name = 'Icons',
            icon = 'Interface\\Icons\\Ability_TownWatch',
            body = '/icons',
        },
        {
            ABNumber = '22',
            name = 'Reload',
            icon = 'Interface\\Icons\\Spell_Frost_Stun',
            body = '/reload',
        },
        {
            ABNumber = '24',
            name = 'Atlas',
            icon = 'Interface\\Icons\\Ability_Spy',
            body = '/atlas',
        },
    },

    -- Character 2
    ['NAMETWO'] = {
        {
            ABNumber = '1',
            name = 'Pet Attack',
            icon = 'Interface\\Icons\\Ability_ImpFireball',
            body = '/petattack',
        },
        -- ...
    },
}
