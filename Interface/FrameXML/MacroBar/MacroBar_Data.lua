-- MacroBar_Data.lua

-- Copy the following Template for new Macros, just remove the "--" infront of it. If you want to find an icon, i recommend using the Icons Addon as well.
--        {
--            ABNumber = 'NUMBEROFBARSLOT',
--            name = 'NAMEOFYOURCHOICE',
--            icon = 'THEICONONTHEBAR',
--            body = 'COMMANDorSCRIPT',
--        },


--Example for a say and cast macro (if you want to do several commands in one macro, do "\n" right before you use the second one)
-- body = '/say I choose you Pikachu!\n/cast Summon Imp\n/say I mean.... Imp!',

MacroData = {
    -- Default/fallback macros (used if no character-specific set)
        -- ... up to ABNumber '24'
    ['MacroBar'] = {
        {
            ABNumber = '1',
            name = '',
            icon = '',
            body = '',
        },
        {
            ABNumber = '2',
            name = '',
            icon = '',
            body = '',
        },
        {
            ABNumber = '22',
            name = 'Reload',
            icon = 'Interface\\Icons\\Spell_Frost_Stun',
            body = '/script ReloadUI()',
        },
        {
            ABNumber = '23',
            name = 'Icons',
            icon = 'Interface\\Icons\\Ability_TownWatch',
            body = '/icons',
        },
        {
            ABNumber = '24',
            name = 'Atlas',
            icon = 'Interface\\Icons\\Ability_Spy',
            body = '/atlas',
        },
    },

    -- Character-specific macros, just change the top name [NAMEONE], [NAMETWO]... with your characters name.
    ['NAMEONE'] = {
        {
            ABNumber = '1',
            name = '',
            icon = '',
            body = '',
        },
        {
            ABNumber = '2',
            name = '',
            icon = '',
            body = '',
        },
        {
            ABNumber = '22',
            name = 'Reload',
            icon = 'Interface\\Icons\\Spell_Frost_Stun',
            body = '/script ReloadUI()',
        },
        {
            ABNumber = '23',
            name = 'Icons',
            icon = 'Interface\\Icons\\Ability_TownWatch',
            body = '/icons',
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
            name = '',
            icon = '',
            body = '',
        },
        {
            ABNumber = '2',
            name = '',
            icon = '',
            body = '',
        },
        {
            ABNumber = '22',
            name = 'Reload',
            icon = 'Interface\\Icons\\Spell_Frost_Stun',
            body = '/script ReloadUI()',
        },
        {
            ABNumber = '23',
            name = 'Icons',
            icon = 'Interface\\Icons\\Ability_TownWatch',
            body = '/icons',
        },
        {
            ABNumber = '24',
            name = 'Atlas',
            icon = 'Interface\\Icons\\Ability_Spy',
            body = '/atlas',
        },
    },
}
