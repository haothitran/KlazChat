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
