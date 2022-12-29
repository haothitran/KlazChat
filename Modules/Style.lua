--------------------------------------------------------------------------------
-- # MODULES > STYLE
--------------------------------------------------------------------------------

local f = CreateFrame('Frame')
f:RegisterEvent('PLAYER_ENTERING_WORLD')
f:SetScript('OnEvent', function(self, event)

  -- hide social button
  QuickJoinToastButton:HookScript('OnShow', QuickJoinToastButton.Hide)
  QuickJoinToastButton:Hide()

  -- hide the chat shortcut button for emotes/languages/etc
  ChatFrameMenuButton:HookScript('OnShow', ChatFrameMenuButton.Hide)
  ChatFrameMenuButton:Hide()

  -- hide the voice deafen button
  ChatFrameToggleVoiceDeafenButton:HookScript('OnShow', ChatFrameToggleVoiceDeafenButton.Hide)
  ChatFrameToggleVoiceDeafenButton:Hide()

  -- hide the voice mute button
  ChatFrameToggleVoiceMuteButton:HookScript('OnShow', ChatFrameToggleVoiceMuteButton.Hide)
  ChatFrameToggleVoiceMuteButton:Hide()

  -- hide the voice mute button
  ChatFrameChannelButton:HookScript('OnShow', ChatFrameChannelButton.Hide)
  ChatFrameChannelButton:Hide()

  -- table to keep track of frames we have already seen
  local frames = {}

  local function SkinChatFrames(frame)
    if frames[frame] then return end
    local name = frame:GetName()

    -- hide buttom frame
    _G[name..'ButtonFrame']:Hide()

    -- hide edit box textures
    _G[name .. 'EditBoxLeft']:Hide()
    _G[name .. 'EditBoxMid']:Hide()
    _G[name .. 'EditBoxRight']:Hide()

    -- adjust edit box position because we hid edit box textures
    local editbox = _G[name..'EditBox']
    editbox:ClearAllPoints()
    editbox:SetPoint('TOPLEFT', ChatFrame1, 'BOTTOMLEFT', -8, -2)
    editbox:SetPoint('TOPRIGHT', ChatFrame1, 'BOTTOMRIGHT', 28, -2)
    editbox:SetAltArrowKeyMode(false)

    -- hide chat tabs textures
    local tab = _G[name..'Tab']
    for i = 1, select('#', tab:GetRegions()) do
      local texture = select(i, tab:GetRegions())
      if texture and texture:GetObjectType() == 'Texture' then
          texture:SetTexture(nil)
      end
    end

    frames[frame] = true
  end

  -- get all of the permanent chat windows and customize them
  for i = 1, NUM_CHAT_WINDOWS do
    SkinChatFrames(_G['ChatFrame' .. i])
  end

  -- set up a dirty hook to catch temporary windows and customize them when they are created
  local old_OpenTemporaryWindow = FCF_OpenTemporaryWindow
  FCF_OpenTemporaryWindow = function(...)
    local frame = old_OpenTemporaryWindow(...)
    SkinChatFrames(frame)
    return frame
  end
end)
