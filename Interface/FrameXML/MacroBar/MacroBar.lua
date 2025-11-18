--------------------------------------------------------------------------------
--  MacroBar - static macro bar for WoW 0.5.3 (2 rows + keybinds)
--------------------------------------------------------------------------------

-- Keybinding names (so they show up in the keybinding UI)
BINDING_HEADER_MACROBAR          = "Macro Bar";
BINDING_NAME_MACROBAR_BUTTON1    = "Macro Bar Button 1";
BINDING_NAME_MACROBAR_BUTTON2    = "Macro Bar Button 2";
BINDING_NAME_MACROBAR_BUTTON3    = "Macro Bar Button 3";
BINDING_NAME_MACROBAR_BUTTON4    = "Macro Bar Button 4";
BINDING_NAME_MACROBAR_BUTTON5    = "Macro Bar Button 5";
BINDING_NAME_MACROBAR_BUTTON6    = "Macro Bar Button 6";
BINDING_NAME_MACROBAR_BUTTON7    = "Macro Bar Button 7";
BINDING_NAME_MACROBAR_BUTTON8    = "Macro Bar Button 8";
BINDING_NAME_MACROBAR_BUTTON9    = "Macro Bar Button 9";
BINDING_NAME_MACROBAR_BUTTON10   = "Macro Bar Button 10";
BINDING_NAME_MACROBAR_BUTTON11   = "Macro Bar Button 11";
BINDING_NAME_MACROBAR_BUTTON12   = "Macro Bar Button 12";

--------------------------------------------------------------------------------
--  Macro database
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--  Macro database
--------------------------------------------------------------------------------

-- MacroData is defined in MacroBar_Data.lua.
-- It can be either:
--   1) A flat list of 24 macros (old style):
--        MacroData = { { ABNumber="1", ... }, { ABNumber="2", ... }, ... }
--   2) Multiple per-character sets (new style):
--        MacroData = {
--            ["MacroBar"]   = { ...default 24 macros... },
--            ["Character1"] = { ...24 macros... },
--            ["Character2"] = { ...24 macros... },
--        }
-- On login, MacroBar will use MacroData[UnitName("player")] if it exists,
-- otherwise it falls back to MacroData["MacroBar"].
--
--------------------------------------------------------------------------------
--  Internal indexing of macros by slot
--------------------------------------------------------------------------------

-- Two rows of 12 buttons
MACROBAR_NUM_BUTTONS = 24;

MacroBarBySlot = {};

local MacroBarActiveData = nil;

local function MacroBar_SelectData()
    MacroBarActiveData = nil;

    if ( not MacroData ) then
        return;
    end

    -- Backwards compatibility: flat list (old style)
    if ( MacroData[1] ) then
        MacroBarActiveData = MacroData;
        return;
    end

    -- New style: MacroData["CategoryName"] = { ... }
    local playerName = nil;
    if ( UnitName ) then
        playerName = UnitName("player");
    end

    if ( playerName and MacroData[playerName] ) then
        MacroBarActiveData = MacroData[playerName];
        return;
    end

    if ( MacroData["MacroBar"] ) then
        MacroBarActiveData = MacroData["MacroBar"];
        return;
    end

    -- Fallback: just take the first table we find
    for key, value in MacroData do
        MacroBarActiveData = value;
        break;
    end
end

local function MacroBar_BuildIndex()
    MacroBarBySlot = {};
    if ( not MacroData ) then
        return;
    end

    if ( not MacroBarActiveData ) then
        MacroBar_SelectData();
    end

    local data = MacroBarActiveData;
    if ( not data ) then
        return;
    end

    -- No type()/tonumber()/getn(): just walk until nil
    local i = 1;
    while ( true ) do
        local macro = data[i];
        if ( not macro ) then
            break;
        end

        if ( macro.ABNumber ) then
            local key = "" .. macro.ABNumber; -- always string
            MacroBarBySlot[key] = macro;
        end

        i = i + 1;
    end
end


local function MacroBar_GetMacro(slot)
    -- slot is numeric button ID; map "1".."24"
    return MacroBarBySlot["" .. slot];
end

--------------------------------------------------------------------------------
--  Default keybindings (Ctrl+1..Ctrl+=) for buttons 1–12
--  Only set if the key is currently unused.
--------------------------------------------------------------------------------

local MacroBar_DefaultKeys = {
    "CTRL-1", "CTRL-2", "CTRL-3", "CTRL-4",
    "CTRL-5", "CTRL-6", "CTRL-7", "CTRL-8",
    "CTRL-9", "CTRL-0", "CTRL--", "CTRL-=",
};

local function MacroBar_SetupDefaultBindings()
    if ( not SetBinding or not GetBindingAction ) then
        return;
    end

    local i = 1;
    while ( i <= 12 ) do
        local key = MacroBar_DefaultKeys[i];
        if ( key ) then
            local action = GetBindingAction(key);
            if ( not action or action == "" ) then
                SetBinding(key, "MACROBAR_BUTTON"..i);
            end
        end
        i = i + 1;
    end
    -- No SaveBindings() here – we let the game save if the user clicks "Okay".
end

--------------------------------------------------------------------------------
--  Frame / button helpers
--------------------------------------------------------------------------------

local function MacroBar_UseButton(id)
    local macro = MacroBar_GetMacro(id);
    if ( macro ) then
        MacroBar_ExecuteMacro(macro);
    end
end

function MacroBar_OnLoad()
    MacroBar_BuildIndex();
    MacroBar_UpdateButtons();
    MacroBar_SetupDefaultBindings();
end

function MacroBar_UpdateButtons()
    local i = 1;
    while ( i <= MACROBAR_NUM_BUTTONS ) do
        MacroBar_UpdateButton(i);
        i = i + 1;
    end
end

function MacroBar_UpdateButton(id)
    local button = getglobal("MacroButton"..id);
    if ( not button ) then
        return;
    end

    local macro = MacroBar_GetMacro(id);
    local icon = getglobal(button:GetName().."Icon");

    if ( macro ) then
        if ( icon and macro.icon ) then
            icon:SetTexture(macro.icon);
            icon:Show();
        elseif ( icon ) then
            icon:SetTexture("");
            icon:Hide();
        end
        button:Show();
    else
        if ( icon ) then
            icon:SetTexture("");
            icon:Hide();
        end
        button:Hide();
    end
end

function MacroBarButton_OnLoad()
    this:RegisterForClicks("LeftButtonUp", "RightButtonUp");
end

function MacroBarButton_OnClick()
    if ( not this ) then
        return;
    end
    local id = this:GetID();
    MacroBar_UseButton(id);
end

function MacroBarButton_OnEnter()
    if ( not this ) then
        return;
    end
    local id = this:GetID();
    local macro = MacroBar_GetMacro(id);
    if ( macro and macro.name and GameTooltip ) then
        GameTooltip:SetOwner(this, "ANCHOR_RIGHT");
        GameTooltip:SetText(macro.name, 1.0, 1.0, 1.0);
    end
end

function MacroBarButton_OnLeave()
    if ( GameTooltip ) then
        GameTooltip:Hide();
    end
end

--------------------------------------------------------------------------------
--  Macro execution
--------------------------------------------------------------------------------

function MacroBar_ExecuteMacro(macro)
    if ( not macro or not macro.body ) then
        return;
    end

    local body = macro.body;
    local len = strlen(body);
    local pos = 1;

    while ( pos <= len ) do
        local next = strfind(body, "\n", pos, 1);
        local line;
        if ( next ) then
            line = strsub(body, pos, next - 1);
            pos = next + 1;
        else
            line = strsub(body, pos);
            pos = len + 1;
        end

        line = gsub(line, "^%s+", "");
        line = gsub(line, "%s+$", "");

        if ( strlen(line) > 0 ) then
            MacroBar_RunLine(line);
        end
    end
end

function MacroBar_RunLine(line)
    -- Lines without leading "/" are treated as Lua (Lua code)
    if ( strsub(line, 1, 1) ~= "/" ) then
        RunScript(line);
        return;
    end

    local _, _, cmd, rest = strfind(line, "^/(%S+)%s*(.*)$");
    if ( not cmd ) then
        return;
    end

    cmd = strlower(cmd or "");
    rest = rest or "";

    -- Chat
    if ( cmd == "say" or cmd == "s" ) then
        if ( strlen(rest) > 0 ) then
            SendChatMessage(rest, "SAY");
        end
        return;
    elseif ( cmd == "yell" or cmd == "y" ) then
        if ( strlen(rest) > 0 ) then
            SendChatMessage(rest, "YELL");
        end
        return;
    elseif ( cmd == "party" or cmd == "p" ) then
        if ( strlen(rest) > 0 ) then
            SendChatMessage(rest, "PARTY");
        end
        return;
    elseif ( cmd == "raid" ) then
        if ( strlen(rest) > 0 ) then
            SendChatMessage(rest, "RAID");
        end
        return;
    end

    -- Follow
    if ( cmd == "follow" ) then
        local target = gsub(rest, "(%s*)([`%w]+)(.*)", "%2", 1);
        if ( strlen(target) > 0 ) then
            if ( FollowByName ) then
                FollowByName(target);
            end
        else
            if ( FollowUnit ) then
                FollowUnit("target");
            end
        end
        return;
    end

    -- Cast by spell name
    if ( cmd == "cast" ) then
        if ( strlen(rest) > 0 ) then
            MacroBar_CastByName(rest);
        end
        return;
    end

    -- Pure Lua
    if ( cmd == "script" or cmd == "run" ) then
        if ( strlen(rest) > 0 ) then
            RunScript(rest);
        end
        return;
    end

    -- Dummy /focus for compatibility
    if ( cmd == "focus" ) then
        if ( DEFAULT_CHAT_FRAME ) then
            DEFAULT_CHAT_FRAME:AddMessage("MacroBar: /focus is not supported in 0.5.3");
        end
        return;
    end

    -- Special-case /reload style commands
    if ( cmd == "reload" or cmd == "reloadui" or cmd == "rl" ) then
        if ( ReloadUI ) then
            ReloadUI();
        end
        return;
    end

    -- Generic slash: replicate ChatEdit_ParseText's SlashCmdList + emote handling
    if ( SlashCmdList ) then
        -- Reconstruct the full text like in the chat edit box
        local text;
        if ( rest and rest ~= "" ) then
            text = "/"..cmd.." "..rest;
        else
            text = "/"..cmd;
        end

        -- Copied / adapted from ChatEdit_ParseText
        local command = gsub(text, "/([`%w]+)%s(.*)", "/%1", 1);
        local msg = "";

        if ( command ~= text ) then
            msg = strsub(text, strlen(command) + 2);
        end

        command = gsub(command, "%s+", "");
        command = strupper(command);

        -- Try all registered slash aliases for every SlashCmdList entry
        for index, value in SlashCmdList do
            local i = 1;
            local key = "SLASH_"..index..i;
            local cmdString = getglobal(key);

            while ( cmdString ) do
                cmdString = strupper(TEXT(cmdString));
                if ( cmdString == command ) then
                    -- Found a match; run the handler with msg
                    value(msg);
                    return;
                end
                i = i + 1;
                key = "SLASH_"..index..i;
                cmdString = getglobal(key);
            end
        end

        -- Emote commands (e.g. /dance) - copied from ChatEdit_ParseText
        local i = 1;
        local j = 1;
        local cmdString = TEXT(getglobal("EMOTE"..i.."_CMD"..j));
        while ( cmdString ) do
            if ( strupper(cmdString) == command ) then
                local token = getglobal("EMOTE"..i.."_TOKEN");
                if ( token and DoEmote ) then
                    DoEmote(token, msg);
                end
                return;
            end
            j = j + 1;
            cmdString = TEXT(getglobal("EMOTE"..i.."_CMD"..j));
            if ( not cmdString ) then
                i = i + 1;
                j = 1;
                cmdString = TEXT(getglobal("EMOTE"..i.."_CMD"..j));
            end
        end
    end

    -- If we get here, we completely failed to run the slash command
    if ( DEFAULT_CHAT_FRAME ) then
        DEFAULT_CHAT_FRAME:AddMessage("MacroBar: unknown or unsupported slash /"..cmd);
    end
end

--------------------------------------------------------------------------------
--  Cast by spell / ability name
--------------------------------------------------------------------------------

function MacroBar_CastByName(name)
    if ( not name ) then
        return;
    end
    name = gsub(name, "^%s+", "");
    name = gsub(name, "%s+$", "");
    if ( name == "" ) then
        return;
    end

    local lowerName = strlower(name);
    local i, spellName, subName, full;

    -- Spell book
    i = 1;
    while ( i <= MAX_SPELLS ) do
        spellName, subName = GetSpellName(i, BOOKTYPE_SPELL);
        if ( not spellName ) then
            break;
        end

        full = spellName;
        if ( subName and subName ~= "" ) then
            full = spellName.."("..subName..")";
        end

        if ( strlower(spellName) == lowerName or strlower(full) == lowerName ) then
            CastSpell(i, BOOKTYPE_SPELL);
            return;
        end
        i = i + 1;
    end

    -- Ability book
    i = 1;
    while ( i <= MAX_SPELLS ) do
        spellName, subName = GetSpellName(i, BOOKTYPE_ABILITY);
        if ( not spellName ) then
            break;
        end

        full = spellName;
        if ( subName and subName ~= "" ) then
            full = spellName.."("..subName..")";
        end

        if ( strlower(spellName) == lowerName or strlower(full) == lowerName ) then
            CastSpell(i, BOOKTYPE_ABILITY);
            return;
        end
        i = i + 1;
    end

    if ( DEFAULT_CHAT_FRAME ) then
        DEFAULT_CHAT_FRAME:AddMessage("MacroBar: spell not found: "..name);
    end
end


--------------------------------------------------------------------------------
--  Pet bar: move bar above macro bar and hide UI-PetBar textures
--------------------------------------------------------------------------------

local function MacroBar_HideTextureIfUIPetBar(tex)
    if ( not tex or not tex.GetTexture ) then
        return;
    end

    local path = tex:GetTexture();
    -- Match the exact texture path the pet bar uses
    if ( path and path == "Interface\\PetActionBar\\UI-PetBar" ) then
        if ( tex.Hide ) then
            tex:Hide();
        end
        if ( tex.SetAlpha ) then
            tex:SetAlpha(0);
        end
        if ( tex.SetTexture ) then
            tex:SetTexture("");
        end
    end
end

local function MacroBar_StripUIPetBarTextures()
    -- Named sliding textures
    MacroBar_HideTextureIfUIPetBar(SlidingActionBarTexture0);
    MacroBar_HideTextureIfUIPetBar(SlidingActionBarTexture1);

    -- Any unnamed textures attached directly to the pet bar frame
    if ( PetActionBarFrame and PetActionBarFrame.GetRegions ) then
        local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = PetActionBarFrame:GetRegions();
        MacroBar_HideTextureIfUIPetBar(r1);
        MacroBar_HideTextureIfUIPetBar(r2);
        MacroBar_HideTextureIfUIPetBar(r3);
        MacroBar_HideTextureIfUIPetBar(r4);
        MacroBar_HideTextureIfUIPetBar(r5);
        MacroBar_HideTextureIfUIPetBar(r6);
        MacroBar_HideTextureIfUIPetBar(r7);
        MacroBar_HideTextureIfUIPetBar(r8);
        MacroBar_HideTextureIfUIPetBar(r9);
        MacroBar_HideTextureIfUIPetBar(r10);
    end
end

function MacroBar_OnUpdate()
    if ( not PetActionBarFrame or not MacroBarFrame ) then
        return;
    end

    -- Keep the pet bar above the macro bar
    PetActionBarFrame:ClearAllPoints();
    PetActionBarFrame:SetPoint("BOTTOM", "MacroBarFrame", "TOP", 30, 9);

    -- Strip any pieces that use Interface\PetActionBar\UI-PetBar
    MacroBar_StripUIPetBarTextures();
end
