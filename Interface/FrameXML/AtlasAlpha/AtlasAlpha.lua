-- AtlasAlpha.lua
-- Atlas-style map browser with instance + boss dropdowns and loot icon buttons
-- Designed for WoW 0.5.3 (no CreateFrame, no reliance on 'type()').

AtlasAlpha_CurrentInstance = 1;
AtlasAlpha_CurrentBoss = 1;
AtlasAlpha_NUM_LOOT_BUTTONS = 8;
AtlasAlpha_LootButtons = nil;

function AtlasAlpha_OnLoad()
    -- Set initial title
    if ( AtlasAlphaTitleText ) then
        AtlasAlphaTitleText:SetText("AtlasAlpha");
    end

    -- Slash commands: /atlas or /atlasalpha
    SlashCmdList = SlashCmdList or {};
    SlashCmdList.ATLASALPHA = AtlasAlpha_SlashCommand;
    SLASH_ATLASALPHA1 = "/atlas";
    SLASH_ATLASALPHA2 = "/atlasalpha";

    -- Cache loot button references
    AtlasAlpha_LootButtons = {};
    local i = 1;
    while ( i <= AtlasAlpha_NUM_LOOT_BUTTONS ) do
        AtlasAlpha_LootButtons[i] = getglobal("AtlasAlphaLootButton"..i);
        i = i + 1;
    end
end

function AtlasAlpha_OnShow()
    AtlasAlpha_BuildInstanceDropdown(AtlasAlphaInstanceDropDown);
    AtlasAlpha_BuildBossDropdown(AtlasAlphaBossDropDown);
    AtlasAlpha_UpdateDisplay();
end

function AtlasAlpha_SlashCommand(msg)
    if ( AtlasAlphaFrame:IsVisible() ) then
        HideUIPanel(AtlasAlphaFrame);
    else
        ShowUIPanel(AtlasAlphaFrame);
    end
end

--------------------------------------------------
-- Instance dropdown
--------------------------------------------------

function AtlasAlpha_InstanceDropDown_OnLoad()
    AtlasAlpha_BuildInstanceDropdown(this);
end

function AtlasAlpha_BuildInstanceDropdown(frame)
    if ( not frame or not AtlasAlpha_Instances ) then
        return;
    end

    if ( not AtlasAlpha_CurrentInstance ) then
        AtlasAlpha_CurrentInstance = 1;
    end

    local oldThis = this;
    this = frame;

    UIDropDownMenu_Initialize(1);

    local index = 1;
    while ( AtlasAlpha_Instances[index] ) do
        local inst = AtlasAlpha_Instances[index];
        UIDropDownMenu_AddButton(inst.name, AtlasAlpha_InstanceDropDown_OnClick, 1, frame);
        index = index + 1;
    end

    UIDropDownMenu_SetSelectedID(frame, AtlasAlpha_CurrentInstance);
    UIDropDownMenu_Refresh(frame, 1);
    UIDropDownMenu_SetWidth(150, frame);
    UIDropDownMenu_JustifyText(frame, "LEFT");

    this = oldThis;
end

function AtlasAlpha_InstanceDropDown_OnClick()
    local id = this:GetID();
    if ( not id ) then
        return;
    end

    AtlasAlpha_CurrentInstance = id;
    AtlasAlpha_CurrentBoss = 1;

    AtlasAlpha_BuildInstanceDropdown(AtlasAlphaInstanceDropDown);
    AtlasAlpha_BuildBossDropdown(AtlasAlphaBossDropDown);
    AtlasAlpha_UpdateDisplay();
end

--------------------------------------------------
-- Boss dropdown
--------------------------------------------------

function AtlasAlpha_BossDropDown_OnLoad()
    AtlasAlpha_BuildBossDropdown(this);
end

function AtlasAlpha_BuildBossDropdown(frame)
    if ( not frame or not AtlasAlpha_Instances ) then
        return;
    end

    if ( not AtlasAlpha_CurrentInstance ) then
        AtlasAlpha_CurrentInstance = 1;
    end
    if ( not AtlasAlpha_CurrentBoss ) then
        AtlasAlpha_CurrentBoss = 1;
    end

    local instance = AtlasAlpha_Instances[AtlasAlpha_CurrentInstance];
    if ( not instance or not instance.bosses ) then
        return;
    end

    local oldThis = this;
    this = frame;

    UIDropDownMenu_Initialize(1);

    local index = 1;
    while ( instance.bosses[index] ) do
        local boss = instance.bosses[index];
        UIDropDownMenu_AddButton(boss.name, AtlasAlpha_BossDropDown_OnClick, 1, frame);
        index = index + 1;
    end

    if ( not instance.bosses[AtlasAlpha_CurrentBoss] ) then
        AtlasAlpha_CurrentBoss = 1;
    end

    UIDropDownMenu_SetSelectedID(frame, AtlasAlpha_CurrentBoss);
    UIDropDownMenu_Refresh(frame, 1);
    UIDropDownMenu_SetWidth(150, frame);
    UIDropDownMenu_JustifyText(frame, "LEFT");

    this = oldThis;
end

function AtlasAlpha_BossDropDown_OnClick()
    local id = this:GetID();
    if ( not id ) then
        return;
    end

    AtlasAlpha_CurrentBoss = id;

    AtlasAlpha_BuildBossDropdown(AtlasAlphaBossDropDown);
    AtlasAlpha_UpdateDisplay();
end

--------------------------------------------------
-- Helper to normalize item links
--------------------------------------------------

function AtlasAlpha_GetEntryLink(entry)
    if ( not entry ) then
        return nil;
    end

    -- If we have a full hyperlink like "|cff...|Hitem:ID:...|h[Name]|h|r",
    -- extract just the part between |H and |h (e.g. "item:ID:...").
    if ( entry.link ) then
        local full = entry.link;
        local s, e = string.find(full, "|H");
        if ( s ) then
            local startPos = e + 1;
            local hStart, hEnd = string.find(full, "|h", startPos);
            if ( hStart ) then
                return string.sub(full, startPos, hStart - 1);
            end
        end
        -- Fallback: use link as-is
        return full;
    end

    if ( entry.id ) then
        return "item:"..entry.id;
    end

    return nil;
end

--------------------------------------------------
-- Loot button handlers
--------------------------------------------------

function AtlasAlpha_LootButton_OnEnter()
    if ( not this or not this.itemData ) then
        return;
    end

    local link = AtlasAlpha_GetEntryLink(this.itemData);
    if ( not link ) then
        return;
    end

    if ( GameTooltip ) then
        GameTooltip:SetOwner(this, "ANCHOR_RIGHT");
        GameTooltip:SetHyperlink(link);
    end
end

function AtlasAlpha_LootButton_OnLeave()
    if ( GameTooltip ) then
        GameTooltip:Hide();
    end
end

function AtlasAlpha_LootButton_OnClick()
    if ( not this or not this.itemData ) then
        return;
    end

    local link = AtlasAlpha_GetEntryLink(this.itemData);
    if ( not link ) then
        return;
    end

    if ( IsShiftKeyDown and IsShiftKeyDown() and ChatFrameEditBox and ChatFrameEditBox:IsVisible() ) then
        ChatFrameEditBox:Insert(link);
    elseif ( SetItemRef ) then
        SetItemRef(link);
    end
end

--------------------------------------------------
-- Main display update
--------------------------------------------------

function AtlasAlpha_UpdateDisplay()
    if ( not AtlasAlpha_Instances ) then
        return;
    end

    local instIndex = AtlasAlpha_CurrentInstance or 1;
    local instance = AtlasAlpha_Instances[instIndex];
    if ( not instance ) then
        return;
    end

    -- Update title bar
    if ( AtlasAlphaTitleText ) then
        if ( instance.name ) then
            AtlasAlphaTitleText:SetText(instance.name);
        else
            AtlasAlphaTitleText:SetText("AtlasAlpha");
        end
    end

    -- Update map texture
    if ( AtlasAlphaMap ) then
        if ( instance.texture ) then
            AtlasAlphaMap:SetTexture(instance.texture);
        else
            AtlasAlphaMap:SetTexture(nil);
        end
    end

    -- Info text (location, level, faction, boss + plain loot list)
    if ( AtlasAlphaInfoText ) then
        local text = "";

        if ( instance.location ) then
            text = text.."Location: "..instance.location;
        end

        if ( instance.levelRange ) then
            if ( text ~= "" ) then
                text = text.."\n";
            end
            text = text.."Level: "..instance.levelRange;
        end

        if ( instance.faction ) then
            if ( text ~= "" ) then
                text = text.."\n";
            end
            text = text.."Faction: "..instance.faction;
        end

        local boss = nil;
        if ( instance.bosses ) then
            boss = instance.bosses[AtlasAlpha_CurrentBoss or 1];
            if ( boss ) then
                if ( text ~= "" ) then
                    text = text.."\n\n";
                end
                if ( boss.name ) then
                    text = text.."Boss: "..boss.name.."\n";
                end

                if ( boss.loot ) then
                    text = text.."Loot:\n";
                    local i = 1;
                    while ( boss.loot[i] ) do
                        local entry = boss.loot[i];
                        local lineText = "";

                        if ( entry ) then
                            if ( entry.link ) then
                                lineText = entry.link;
                            elseif ( entry.text ) then
                                lineText = entry.text;
                            elseif ( entry.name ) then
                                lineText = entry.name;
                            elseif ( entry.id ) then
                                lineText = "item:"..entry.id;
                            end
                        end

                        if ( lineText ~= "" ) then
                            text = text.." - "..lineText.."\n";
                        end

                        i = i + 1;
                    end
                end
            end
        end

        AtlasAlphaInfoText:SetText(text);
    end

    -- Loot icon buttons
    if ( AtlasAlpha_LootButtons ) then
        local instance = AtlasAlpha_Instances[AtlasAlpha_CurrentInstance or 1];
        local boss = nil;
        if ( instance and instance.bosses ) then
            boss = instance.bosses[AtlasAlpha_CurrentBoss or 1];
        end
        local lootList = nil;
        if ( boss ) then
            lootList = boss.loot;
        end

        local i = 1;
        while ( i <= AtlasAlpha_NUM_LOOT_BUTTONS ) do
            local button = AtlasAlpha_LootButtons[i];
            if ( button ) then
                local entry = nil;
                if ( lootList ) then
                    entry = lootList[i];
                end
                button.itemData = entry;
                if ( entry ) then
                    button:Show();
                    local icon = entry.icon;
                    if ( SetItemButtonTexture ) then
                        SetItemButtonTexture(button, icon);
                    end
                else
                    button.itemData = nil;
                    button:Hide();
                end
            end
            i = i + 1;
        end
    end
end
