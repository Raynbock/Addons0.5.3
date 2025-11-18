-- State
ModelBrowser_CurrentCategory = 1;
ModelBrowser_CurrentList = nil;   -- list of model paths for current category + search
ModelBrowser_CurrentIndex = 1;
ModelBrowser_FilterText = "";
ModelBrowser_Zoom = 0;
ModelBrowser_ZoomStep = 0.2;
ModelBrowser_MinZoom = -2.0;
ModelBrowser_MaxZoom = 2.0;
ModelBrowser_CurrentTextureList = nil;
ModelBrowser_CurrentTextureIndex = 1;


-- Utility ---------------------------------------------------

local function ModelBrowser_GetCategoryKey(index)
    if ( not index ) then
        return nil;
    end
    local info = ModelBrowser_Categories[index];
    if ( not info ) then
        return nil;
    end
    return info.key;
end

local function ModelBrowser_GetCurrentPath()
    if ( not ModelBrowser_CurrentList ) then
        return nil;
    end
    local idx = ModelBrowser_CurrentIndex;
    if ( not idx or idx < 1 or idx > table.getn(ModelBrowser_CurrentList) ) then
        return nil;
    end
    return ModelBrowser_CurrentList[idx];
end

-- Building the list -----------------------------------------

function ModelBrowser_BuildList()
    local key = ModelBrowser_GetCategoryKey(ModelBrowser_CurrentCategory);
    if ( not key ) then
        return;
    end
    local source = ModelBrowser_Data[key];
    if ( not source ) then
        return;
    end

    local filter = ModelBrowser_FilterText;
    local list = {};
    local count = 0;

    if ( filter and filter ~= "" ) then
        local f = string.lower(filter);
        for i = 1, table.getn(source) do
            local path = source[i];
            local lowerPath = string.lower(path);
            if ( string.find(lowerPath, f, 1, 1) ) then
                count = count + 1;
                list[count] = path;
            end
        end
    else
        for i = 1, table.getn(source) do
            list[i] = source[i];
        end
        count = table.getn(source);
    end

    ModelBrowser_CurrentList = list;
    if ( count == 0 ) then
        ModelBrowser_CurrentIndex = 0;
    else
        if ( ModelBrowser_CurrentIndex < 1 ) then
            ModelBrowser_CurrentIndex = 1;
        elseif ( ModelBrowser_CurrentIndex > count ) then
            ModelBrowser_CurrentIndex = count;
        end
    end

    if ( ModelBrowserStatusText ) then
        if ( count == 0 ) then
            ModelBrowserStatusText:SetText("0 / 0");
        else
            ModelBrowserStatusText:SetText(ModelBrowser_CurrentIndex.." / "..count);
        end
    end
end

-- Showing the model -----------------------------------------

function ModelBrowser_ShowCurrentModel()
    if ( not ModelBrowserModel ) then
        return;
    end
    ModelBrowserModel:ClearModel();

    local path = ModelBrowser_GetCurrentPath();
    if ( not path or path == "" ) then
        if ( ModelBrowserInfoText ) then
            ModelBrowserInfoText:SetText("No model");
        end
        ModelBrowser_CurrentTextureList = nil;
        ModelBrowser_CurrentTextureIndex = 1;
        if ( ModelBrowserTextureDropDown_Rebuild ) then
            ModelBrowserTextureDropDown_Rebuild();
        end
        return;
    end

    -- 0.5.3 does not have pcall, so we just call SetModel directly.
    ModelBrowserModel:SetModel(path);

    if ( ModelBrowserInfoText ) then
        ModelBrowserInfoText:SetText(path);
    end

    -- Reset zoom and rotation each time
    ModelBrowser_Zoom = 0;
    ModelBrowserModel:SetPosition(0, 0, ModelBrowser_Zoom);
    ModelBrowserModel:SetRotation(0);

    -- Update texture list for this model
    if ( ModelBrowser_TextureData ) then
        ModelBrowser_CurrentTextureList = ModelBrowser_TextureData[path];
    else
        ModelBrowser_CurrentTextureList = nil;
    end
    ModelBrowser_CurrentTextureIndex = 1;

    if ( ModelBrowserTextureDropDown_Rebuild ) then
        ModelBrowserTextureDropDown_Rebuild();
    end
end
function ModelBrowser_Next()
    if ( not ModelBrowser_CurrentList ) then
        return;
    end
    local count = table.getn(ModelBrowser_CurrentList);
    if ( count == 0 ) then
        return;
    end
    ModelBrowser_CurrentIndex = ModelBrowser_CurrentIndex + 1;
    if ( ModelBrowser_CurrentIndex > count ) then
        ModelBrowser_CurrentIndex = count;
    end
    ModelBrowser_BuildList();
    ModelBrowser_ShowCurrentModel();
end

function ModelBrowser_Prev()
    if ( not ModelBrowser_CurrentList ) then
        return;
    end
    local count = table.getn(ModelBrowser_CurrentList);
    if ( count == 0 ) then
        return;
    end
    ModelBrowser_CurrentIndex = ModelBrowser_CurrentIndex - 1;
    if ( ModelBrowser_CurrentIndex < 1 ) then
        ModelBrowser_CurrentIndex = 1;
    end
    ModelBrowser_BuildList();
    ModelBrowser_ShowCurrentModel();
end

-- Rotation & Zoom ------------------------------------------

function ModelBrowser_RotateLeft()
    if ( not ModelBrowserModel ) then
        return;
    end
    local current = ModelBrowserModel.rotation or 0;
    current = current - 0.1;
    ModelBrowserModel.rotation = current;
    ModelBrowserModel:SetRotation(current);
end

function ModelBrowser_RotateRight()
    if ( not ModelBrowserModel ) then
        return;
    end
    local current = ModelBrowserModel.rotation or 0;
    current = current + 0.1;
    ModelBrowserModel.rotation = current;
    ModelBrowserModel:SetRotation(current);
end

function ModelBrowser_ZoomIn()
    if ( not ModelBrowserModel ) then
        return;
    end
    ModelBrowser_Zoom = ModelBrowser_Zoom + ModelBrowser_ZoomStep;
    if ( ModelBrowser_Zoom > ModelBrowser_MaxZoom ) then
        ModelBrowser_Zoom = ModelBrowser_MaxZoom;
    end
    ModelBrowserModel:SetPosition(0, 0, ModelBrowser_Zoom);
end

function ModelBrowser_ZoomOut()
    if ( not ModelBrowserModel ) then
        return;
    end
    ModelBrowser_Zoom = ModelBrowser_Zoom - ModelBrowser_ZoomStep;
    if ( ModelBrowser_Zoom < ModelBrowser_MinZoom ) then
        ModelBrowser_Zoom = ModelBrowser_MinZoom;
    end
    ModelBrowserModel:SetPosition(0, 0, ModelBrowser_Zoom);
end

-- Dropdown --------------------------------------------------

function ModelBrowserCategoryDropDown_OnLoad()
    UIDropDownMenu_Initialize();
    for i = 1, table.getn(ModelBrowser_Categories) do
        UIDropDownMenu_AddButton(ModelBrowser_Categories[i].name, ModelBrowserCategoryDropDown_OnClick, nil);
    end
    UIDropDownMenu_SetSelectedID(ModelBrowserCategoryDropDown, 1);
end

function ModelBrowserCategoryDropDown_OnClick()
    local frame = ModelBrowserCategoryDropDown;
    local id = this:GetID();
    UIDropDownMenu_SetSelectedID(frame, id);
    ModelBrowser_CurrentCategory = id;
    ModelBrowser_BuildList();
    ModelBrowser_ShowCurrentModel();
end

-- Texture dropdown (per-model textures from ModelBrowser_TextureData)

function ModelBrowserTextureDropDown_OnLoad()
    -- Nothing special on load; we rebuild whenever the model changes.
end

function ModelBrowserTextureDropDown_Rebuild()
    if ( not ModelBrowserTextureDropDown ) then
        return;
    end

    local frame = ModelBrowserTextureDropDown;
    local textures = ModelBrowser_CurrentTextureList;

    -- 0.5.3 UIDropDownMenu uses 'this' for the owner frame.
    local oldThis = this;
    this = frame;
    UIDropDownMenu_Initialize();

    -- If there are no textures, ensure we still have one 'empty' entry
    if ( not textures or table.getn(textures) == 0 ) then
        UIDropDownMenu_AddButton("empty", ModelBrowserTextureDropDown_OnClick);
        UIDropDownMenu_SetSelectedID(frame, 1);
        this = oldThis;
        return;
    end

    -- 0.5.3 dropdowns only support a fixed number of buttons (UIDROPDOWNMENU_NUMBUTTONS)
    local maxButtons = UIDROPDOWNMENU_NUMBUTTONS or 32;
    local count = table.getn(textures);
    local limit = count;
    if ( limit > maxButtons ) then
        limit = maxButtons;
    end

    for i = 1, limit do
        UIDropDownMenu_AddButton(textures[i], ModelBrowserTextureDropDown_OnClick);
    end

    ModelBrowser_CurrentTextureIndex = 1;
    UIDropDownMenu_SetSelectedID(frame, 1);
    this = oldThis;
end

function ModelBrowserTextureDropDown_OnClick()
    local frame = ModelBrowserTextureDropDown;
    local id = this:GetID();
    if ( not ModelBrowser_CurrentTextureList ) then
        return;
    end
    if ( id < 1 or id > table.getn(ModelBrowser_CurrentTextureList) ) then
        return;
    end

    ModelBrowser_CurrentTextureIndex = id;
    UIDropDownMenu_SetSelectedID(frame, id);

    local texLabel = ModelBrowser_CurrentTextureList[id];
    local path = ModelBrowser_GetCurrentPath();
    if ( ModelBrowserInfoText and path and texLabel ) then
        ModelBrowserInfoText:SetText(path.." | "..texLabel);
    end
end


-- Search ---------------------------------------------------

function ModelBrowserFilterBox_OnTextChanged()
    if ( not ModelBrowserFilterBox ) then
        return;
    end
    ModelBrowser_FilterText = ModelBrowserFilterBox:GetText();
    ModelBrowser_BuildList();
    ModelBrowser_ShowCurrentModel();
end

function ModelBrowserFilterBox_OnEscapePressed()
    if ( ModelBrowserFilterBox ) then
        ModelBrowserFilterBox:SetText("");
        ModelBrowser_FilterText = "";
        ModelBrowserFilterBox:ClearFocus();
        ModelBrowser_BuildList();
        ModelBrowser_ShowCurrentModel();
    end
end

function ModelBrowserFilterBox_OnEnterPressed()
    if ( ModelBrowserFilterBox ) then
        ModelBrowserFilterBox:ClearFocus();
    end
end

-- Frame events ---------------------------------------------

function ModelBrowser_OnLoad()
    -- Hide default DialogBoxFrame button if present
    local btn = getglobal(this:GetName().."Button");
    if ( btn ) then
        btn:Hide();
    end

    ModelBrowser_CurrentCategory = 1;
    ModelBrowser_CurrentIndex = 1;
    ModelBrowser_FilterText = "";

    ModelBrowser_BuildList();
end

function ModelBrowser_OnShow()
    ModelBrowser_BuildList();
    ModelBrowser_ShowCurrentModel();
end

function ModelBrowser_OnHide()
    -- nothing special for now
end

-- Slash command --------------------------------------------

SLASH_MODEL_BROWSER1 = "/models";
SlashCmdList = SlashCmdList or {};
SlashCmdList["MODEL_BROWSER"] = function(msg)
    if ( ModelBrowserFrame:IsVisible() ) then
        ModelBrowserFrame:Hide();
    else
        ModelBrowserFrame:Show();
    end
end
