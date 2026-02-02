---@diagnostic disable: undefined-global, undefined-global, lowercase-global, param-type-mismatch, redundant-parameter

--=================================================== Created By GodFather =======================================================

-- ========================Variables===========================

local accSys = exports["Accounts-System"] -- db Connect
local mickSys = export["mick"] -- find & .....
local notf = exports["notf"] -- notf in Server
local find = mickSys.findPlayer("player")
local Player_admin = tonumber(getElementData(accSys.getPlayerAcc(thePlayer), "pAdmin"))
local find_admin = tonumber(getElementData(accSys.getPlayerAcc(find), "pAdmin"))
local find_name = getPlayername(find)
local thePlayer_name = getPlayerName(thePlayer)
local Player_Rank_Faction = tonumber(getElementData(accSys.getPlayerAcc(thePlayer), "pFactionRank"))
local find_Rank_Faction = tonumber(getElementData(accSys.getPlayerAcc(find), "pFactionRank"))
local Player_Faction = tonumber(getElementData(accSys.getPlayerAcc(thePlayer), "pFaction"))
local find_Faction = tonumber(getElementData(accSys.getPlayerAcc(find), "pFaction"))
local Player_Warn = tonumber(getElementData(accSys.getPlayerAcc(thePlayer), "pFactionWarn"))
local find_Warn = tonumber(getElementData(accSys.getPlayerAcc(find), "pFactionWarn"))
local find_Ban_Faction = tonumber(getElementData(accSys.getPlayerAcc(find), "pFactionBan"))
local find_Faction_Punish = tonumber(getElementData(accsys.getPlayerAcc(find), "pFactionPunish"))
local find_Bank = tonumber(getElementData(accSys.getPlayerAcc(find), "pBankCash"))

-- ===================factions Table======================

local factions = {
    [0] = {name = "Civilian", skin = 2},
    [1] = {name = "Federal", skin = 117},
    [2] = {name = "Mechanic", skin = 217},
    [3] = {name = "National Gard", skin = 200},
    [4] = {name = "School", skin = 1}
}

-- Factions Rank
local frank = {
    [0] = {rank = "trial"},
    [1] = {rank = "bronze"},
    [2] = {rank = "sub"},
    [3] = {rank = "silver"},
    [4] = {rank = "gold"},
    [5] = {rank = "Leader"}
}

--=================================================== Created By GodFather =======================================================