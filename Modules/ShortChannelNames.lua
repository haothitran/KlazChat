local addon, ns = ...
local L = ns.L

--------------------------------------------------------------------------------
-- # MODULES > SHORT CHANNEL NAMES
--------------------------------------------------------------------------------

_G.CHAT_INSTANCE_CHAT_GET = '|Hchannel:INSTANCE_CHAT|h['..L.SHORT_INSTANCE..']|h %s:\32'
_G.CHAT_INSTANCE_CHAT_LEADER_GET = '|Hchannel:INSTANCE_CHAT|h['..L.SHORT_INSTANCE_LEADER..']|h %s:\32'
_G.CHAT_BN_WHISPER_GET = L.SHORT_WHISPER_FROM..' %s:\32'
_G.CHAT_GUILD_GET = '|Hchannel:GUILD|h['..L.SHORT_GUILD..']|h %s:\32'
_G.CHAT_OFFICER_GET = '|Hchannel:OFFICER|h['..L.SHORT_OFFICER..']|h %s:\32'
_G.CHAT_PARTY_GET = '|Hchannel:PARTY|h['..L.SHORT_PARTY..']|h %s:\32'
_G.CHAT_PARTY_LEADER_GET = '|Hchannel:PARTY|h['..L.SHORT_PARTY_LEADER..']|h %s:\32'
_G.CHAT_RAID_GET = '|Hchannel:RAID|h['..L.SHORT_RAID..']|h %s:\32'
_G.CHAT_RAID_LEADER_GET = '|Hchannel:RAID|h['..L.SHORT_RAID_LEADER..']|h %s:\32'
_G.CHAT_RAID_WARNING_GET = '['..L.SHORT_RAID_WARNING..'] %s:\32'
_G.CHAT_SAY_GET = '%s:\32'
_G.CHAT_WHISPER_GET = L.SHORT_WHISPER_FROM..' %s:\32'
_G.CHAT_YELL_GET = '%s:\32'
_G.CHAT_FLAG_AFK = '|cffE7E716'..L.SHORT_FLAG_AFK..'|r '
_G.CHAT_FLAG_DND = '|cffFF0000'..L.SHORT_FLAG_DND..'|r '
_G.CHAT_FLAG_GM = '|cff4154F5'..L.SHORT_FLAG_GM..'|r '
_G.ERR_FRIEND_ONLINE_SS = '|Hplayer:%s|h%s|h '..L.SHORT_STATUS_ONLINE
_G.ERR_FRIEND_OFFLINE_S = '%s '..L.SHORT_STATUS_OFFLINE

local f = CreateFrame('Frame')
f:RegisterEvent('PLAYER_ENTERING_WORLD')
f:SetScript('OnEvent', function(self, event)

  local origs = {}

  local function Strip(info, name)
    return string.format("|Hplayer:%s|h[%s]|h", info, name:gsub("%-[^|]+", ""))
  end

  local AddMessage = function(self, text, ...)
    if type(text) == "string" then
      text = text:gsub("|h%[(%d+)%. .-%]|h", "|h[%1]|h")
      text = text:gsub("|Hplayer:(.-)|h%[(.-)%]|h", Strip)
    end
    return origs[self](self, text, ...)
  end

  for i = 1, NUM_CHAT_WINDOWS do
    if i ~= 2 then
      origs[_G['ChatFrame' .. i]] = _G['ChatFrame' .. i].AddMessage
      _G['ChatFrame' .. i].AddMessage = AddMessage
    end
  end
end)
