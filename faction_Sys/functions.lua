---@diagnostic disable: undefined-global, undefined-global, lowercase-global, param-type-mismatch, redundant-parameter

--=================================================== Created By GodFather =======================================================

function invite(thePlayer, command, player, faction, factionrank) -- /invite
    local facrank = frank[factionrank]
    local get_faction = factions[faction]
    if (Player_Rank_Faction) < 4 or (Player_admin) <= 20 then
        if (Player_Faction) == 0 then
            if (Player_Faction) ~= faction then
                return false
            end
        end
    end

    if thePlayer then
        if player then
            if faction then
                if factionrank then
                    if (find_Faction) == 0 then
                        if (find_Ban_Faction) == 0 then
                            setElementData(accSys.getPlayerAcc(find), "pFaction", get_faction.name)
                            setElementData(accSys.getPlayerAcc(find), "pFactionRank", facrank.rank)
                            setElementModel(find, get_faction.skin)
                            setElementData(accSys.getPlayerAcc(find), "cSkin", get_faction.skin)
                            outputChatBox("#7a7744[Faction-System]: #FFFFFFplayer #FF0000"..find_name.." #FFFFFFPromoted By #FF0000"..thePlayer_name.." #FFFFFFTo faction #9b00ff"..get_faction.name.." #FFFFFFRank: #0000FF"..facrank.rank, thePlayer, 255, 255, 255, true)
                            outputChatBox("#7a7744[Faction-System]: #FFFFFFplayer #FF0000"..find_name.." #FFFFFFPromoted By #FF0000"..thePlayer_name.." #FFFFFFTo faction #9b00ff"..get_faction.name.." #FFFFFFRank: #0000FF"..facrank.rank, find, 255, 255, 255, true)
                            outputDebugString("Player "..find_name.." faction set to "..find_Faction)
                            exports.Log.newLog("Player "..find_name.." faction set to "..find_Faction)
                        else
                            notf.addNotification(thePlayer, "Player is faction baned", 'error')
                        end
                    else
                        notf.addNotification(thePlayer, "Player In Faction! (/id "..find_name..")", 'error')
                    end
                else
                    notf.addNotification(thePlayer, "Enter Rank Number!!", 'error')
                end
            else
                notf.addNotification(thePlayer, "please Enter Faction")
            end
        else
            notf.addNotification(thePlayer, "Player Not found!", 'error')
        end
    else
        notf.addNotification(thePlayer, "Syntax: /invite <player_id> <faction id> <faction rank>", 'info')
    end
end

--============================================================================================================================
--============================================================================================================================

function list_faction(thePlayer) 
    if (Player_Rank_Faction) < 4 or (Player_admin) < 21 then
        return false
    else --========================---|list factions|---====================
        outputChatBox("#a6ff00ff ________________________________________", thePlayer, 255, 255, 255, true)
        outputChatBox("#FFFFFF 0. Civilian", 255, 255, 255, true)
        outputChatBox("#FFFFF1. #3939e8ff Federal", thePlayer, 255, 255, 255, true)
        outputChatBox("#FFFFFF 2. #bababa Mechanic", thePlayer, 255, 255, 255, true)
        outputChatBox("#FFFFFF 3. #0000ffff National Gard", thePlayer, 255, 255, 255, true)
        outputChatBox("#FFFFFF 4. #00eeffff School", thePlayer, 255, 255, 255, true)
        outputChatBox("#a6ff00ff ________________________________________", thePlayer, 255, 255, 255, true)
    end
end

--============================================================================================================================
--============================================================================================================================

-- /kickfp <Player> <reason>
function  demote(thePlayer, command, player, ...)
    if (Player_admin) <= 20 or (Player_Rank_Faction) < 4 then
        return false
    end
    local reason = string.sub(table.concat({...}, " "), 1, 90)
    if thePlayer then
        if command then
            if player then
                if (...) then
                    
                    setElementData(accSys.getPlayerAcc(find), "pFaction", 0)
                    setElementData(accSys.getPlayerAcc(find), "pFactionRank", 0)
                    setElementData(accSys.getPlayerAcc(find), "pFactionWarn", 0)
                    setElementData(accSys.getPlayerAcc(find), "pFactionPunish", 20)
                    outputChatBox("#7a7744[Faction-System]: #FFFFFFplayer #FF0000"..find_name.." #FFFFFF Kicked By #FF0000"..thePlayer_name.." #FFFFFF Reason:"..reason, thePlayer, 255, 255, 255, true)
                    outputChatBox("#7a7744[Faction-System]: #FFFFFFplayer #FF0000"..find_name.." #FFFFFF Kicked By #FF0000"..thePlayer_name.." #FFFFFF Reason:"..reason, find, 255, 255, 255, true)
                    if (find_Warn) > 0 and (find_Warn) < 3 then
                        for warn in ipairs(find_Warn) do
                            setElementData(accSys.getPlayerAcc(find), "pFactionPunish", find_Faction_Punish + 10)
                        end
                    end
                else
                    notf.addNotification(thePlayer, "Enter Reason", 'error')
                end
            else
                notf.addNotification(thePlayer, "Player Not Found!", 'error')
            end
        end
    else
        notf.addNotification(thePlayer, "Syntax: /kickfp <Player> <Reason>", 'info')
    end
end
if (find_Warn) > 0 and (find_Warn) < 3 then
    for warn in ipairs(find_Warn) do
        setElementData(accSys.getPlayerAcc(find), "pFactionPunish", find_Faction_Punish + 10)
    end 
end

--============================================================================================================================
--============================================================================================================================

-- /warn <player> <warn> <reason>
function warn(thePlayer, cmd, player, warn, ...)
    if (Player_admin) < 15 or (Player_Rank_Faction) < 3 then
        if (Player_Faction) ~= (find_Faction) then
            return false
        end
    end

    local warn = tonumber(warn)
    local reason = string.sub(table.concat({...}, " "), 1, 90)
    local calculate_warn = (find_Warn) + warn
    
    if (calculate_warn) >= 4 then
        notf.addNotification(thePlayer, "Player Warn: "..find_Warn.."/3", 'warning')
        return false
    end

    if thePlayer then
        if cmd then
            if player then
                if reason then
                    if (Player_Rank_Faction) > (find_Rank_Faction) then
                        if (find_Warn) < 3 then
                            if warn < 4 then
                                setElementData(accSys.getPlayerAcc(find), "pFactionWarn", find_Warn + 10)
                                notf.addNotification(thePlayer, "Player Warned Reason:"..reason, 'success')
                                outputChatBox("#7a7744[Faction-System]: your are get a warn Than #ffffff"..thePlayer_name.. "#7a7744 your warns: #ffffff"..find_Warn.."/3", find, 255, 255, 255, true)
                                if (find_Warn) >= 3 then
                                    setElementData(accSys.getPlayerAcc(find), "pFaction", 0)
                                    setElementData(accSys.getPlayerAcc(find), "pFactionWarn", 0)
                                    setElementData(accSys.getPlayerAcc(find), "pFactionRank", 0)
                                    setElementData(accSys.getPlayerAcc(find), "pFactionPunish", find_Faction_Punish + 80) 
                                    outputChatBox("#7a7744 [Faction-System]: Player #FFFFFF"..find_name.." #7a7744 Kicked with 3 warn", thePlayer, 255, 255, 255, true)
                                    outputChatBox("#7a7744 [Faction-System]: Player #FFFFFF"..find_name.." #7a7744 Kicked with 3 warn", find, 255, 255, 255, true)
                                end
                            end
                        end
                    else
                        notf.addNotification(thePlayer, "how to give warn to leader faction ?", 'error')
                    end
                else
                    notf.addNotification(thePlayer, "Error: Enter reason for warn message", 'error')
                end
            else
                notf.addNotification(thePlayer, "player Not found!!", 'error')
            end
        else
            notf.addNotification(thePlayer, "Syntax: /warn <player> <warn> <reason>", 'info')
        end
    else
        notf.addNotification(thePlayer, "Syntax: /warn <player> <warn> <reason>", 'info')
    end
end

--============================================================================================================================
--============================================================================================================================

-- /warns
function warns(thePlayer)
    if (Player_Rank_Faction) < 4 or (Player_admin) < 15 then
        return false
    end
    if thePlayer then
        outputChatBox("#FFAE00 ================================================", thePlayer, 255, 255, 255 , true)
        for i in ipairs(getElementsByType("player")) do
            if getElementData(i, "LogedIn") == true then
                if tonumber(getElementData(accSys.getPlayerAcc(i), "pFaction")) == (Player_Faction) then
                    if tonumber(getElementData(accSys.getPlayerAcc(i), "pFactionWarn")) > 1 then
                        outputChatBox("#F00BAB "..getPlayerName(i)..": #FFFFFF"..tonumber(getElementData(accSys.getPlayerAcc(i), "pFactionWarn")).."/3", thePlayer, 255, 255, 255, true)
                    end
                end
            end
        end
        outputChatBox("#FFAE00 ================================================", thePlayer, 255, 255, 255 , true)
    end
end

--============================================================================================================================
--============================================================================================================================

-- /salary <amount>
function salary(thePlayer, cmd, amount)
    if (Player_Rank_Faction) < 5 or (Player_admin) < 15 then
        return false
    end

    local amount = tonumber(amount)
    local Player_Cash = tonumber(getElementData(accSys.getPlayerAcc(thePlayer), "pBankCash"))
    local Player_money = tonumber(getElementData(accSys.getPlayerAcc(thePlayer), "pCash"))
    if thePlayer then
        if cmd then
            if amount and amount < 100000000 and amount > 0 then
                if (Player_Faction) ~= 0 then
                    for Players_Faction in ipairs(getElementsByTyps("player")) do
                        if tonumber(getElementdata(accSys.getPlayerAcc(Players_Faction), "pFaction")) == (Player_Faction) then
                            if (Player_Cash) >= amount or (Player_money) >= amount then
                                setElementData(accSys.getPlayerAcc(Players_Faction), "pBankCash", find_Bank + amount) 
                                outputChatBox("#FFAE00 your Salary in Server bank goto bank for get your salary!!", Players_Faction, 255, 255, 255, true)
                            else
                                notf.addNotification(thePlayer, "your cash is Low", 'error')
                            end
                        else
                            return false
                        end
                    end
                end
            else
                notf.addNotification(thePlayer, "wrong input amount!!", 'error')
            end 
        end
    else
        notf.addNotification(thePlayer, "Syntax: /salary <amount>")
    end
end

--============================================================================================================================
--============================================================================================================================

function clearwarn(thePlayer, cmd, player, cwnum)
    if (Player_admin) < 15 or (Player_Rank_Faction) < 5 then
        return false
    end

    local cwarn = tonumber(cwnum)
    if thePlayer then
        if cmd then
            if player then
                if cwarn then
                    if cwarn == 1 then
                        if (find_Warn) > 0 then
                            setElementData(accSys.getPlayerAcc(find), "pFactionWarn", find_Warn - cwarn) 
                            if (find_Warn) < 0 then
                                setElementData(accSys.getPlayerAcc(find), "pFactionWarn", find_Warn + cwarn) 
                                notf.addNotification(thePlayer, "wrong warn!! Player warns:"..find_Warn, 'error')
                            end
                            outputChatBox("#7a7744 [Faction-System]: #FFFFF 1 warn cleared By #FF0000"..thePlayer_name.." #FFFFFF for #FF0000"..find_name, thePlayer, 255, 255, 255, true)
                            outputChatBox("#7a7744 [Faction-System]: #FFFFF 1 warn cleared By #FF0000"..thePlayer_name.." #FFFFFF for #FF0000"..find_name, find, 255, 255, 255, true)
                        else
                            notf.addNotification(thePlayer, "find player warns: 0", 'error')
                        end
                    else
                        notf.addNotification(thePlayer, "warn for clean = 0", 'error')
                    end
                else
                    notf.addNotification(thePlayer, "Error: Enter clear warn digit", 'error')
                end   
            else                 
                notf.addNotification(thePlayer, "Player not found!!", 'error')
            end
        else
            notf.addNotification(thePlayer, "Syntax: /cwarn <player> <warn>")
        end
    else
        notf.addNotification(thePlayer, "Syntax: /cwarn <player> <warn>")
    end
end

--============================================================================================================================
--============================================================================================================================

function clearwarns(thePlayer)
    if (Player_admin) < 14 then
        return false
    end

    if thePlayer then
        for l, n in ipairs(getElementsByTyps("player")) do
            if tonumber(getElementData(accSys.getPlayerAcc(n), "pFaction")) >= 1 then
                if tonumber(getElementData(accSys.getPlayerAcc(n), "pFactionWarn")) >= 1 then
                    setElementData(accSys.getPlayerAcc(n), "pFactionWarn", 0)
                    outputChatBox("#7a7744 [Faction-System]: #FFFFF All Faction Warns seted #FF0000 0 #FFFFF for all factions by #FF0000"..thePlayer_name, n, 255, 255, 255, true)
                    triggerClientEvent(root, "PlayNotf", root)
                    outputDebugString("Admin "..thePlayer_name.." Cleared all faction warns!!")
                    exports.Log.newLog("Admin "..thePlayer_name.." Cleared all faction warns!!")
                end
            end
        end
    end
end

--=============================================================================================================================
--=============================================================================================================================

function banf(thePlayer, cmd, player, time, ...)
    if (Player_admin) < 14 then
        return false
    end

    local reason = string.sub(table.concat({...}, " "), 1, 90)
    local time = tonumber(time)
    if thePlayer then
        if cmd then
            if player then
                if time then
                    if reason then
                        setElementData(accSys.getPlayerAcc(find), "pFactionBan", time)
                        for i, m in ipairs(getElementsByType("player")) do
                            if getElementData(m, "LoggedIn") == true then
                                outputChatBox("#7a7744 [Faction-System]: #FFFFF Player #FF0000"..find_name.." Faction baned by admin "..thePlayer_name.." #FFFFFreason: #FFAE00"..reason, m, 255, 255, 255, true)
                            end
                        end
                    else
                        notf.addNotification(thePlayer, "Enter Reason!", 'error')
                    end
                else
                    notf.addNotification(thePlayer, "Enter ban time")
                end
            else
                notf.addNotification(thePlayer, "Player Not Found!", 'error')
            end
        else
            notf.addNotification(thePlayer, "Syntax: /fban <player> <time> <reason>", 'info')
        end
    else
        notf.addNotification(thePlayer, "Syntax: /fban <player> <time> <reason>", 'info')
    end
end

--=============================================================================================================================
--=============================================================================================================================

function promote(thePlayer, cmd, player, rank)
    if (Player_admin) < 14 or (Player_Rank_Faction) < 4 then
        return false
    end

    local rank = tonumber(rank)
    if thePlayer then
        if cmd then
            if player then
                if rank then
                    setElementData(accSys.getPlayerAcc(find), "pFactionRank", rank)
                    outputChatBox("#7a7744 [Faction-System]: #FFFFF Player #FF0000"..find_name.." #FFFFF Promoted by #FF0000"..thePlayer_name, thePlayer, 255, 255 ,255, true)
                    outputChatBox("#7a7744 [Faction-System]: #FFFFF Player #FF0000"..find_name.." #FFFFF Promoted by #FF0000"..thePlayer_name, find, 255, 255 ,255, true)
                else
                    notf.addNotification(thePlayer, "Enter Rank <1~4> !!!", 'error')
                end
            else
                notf.addNotification(thePlayer, "player not found!!", 'error')
            end
        else
            notf.addNotification(thePlayer, "Syntax: /rankup <player> <rank 1~4>", 'info')
        end
    else
        notf.addNotification(thePlayer, "Syntax: /rankup <player> <rank 1~4>", 'info')
    end
end

--=============================================================================================================================
--=============================================================================================================================

function setFactionPunish(thePlayer, cmd, player, hfp, ...)
    if (Player_admin) < 14 then
        return false
    end

    local Reason =  string.sub(table.concat({...}, " "), 1, 90)
    local hfp = tonumber(hfp)
    if thePlayer then
        if cmd then
            if player then
                if hfp then
                    if Reason then
                        setElementData(accSys.getPlayerAcc(find), "pFactionPunish", hfp)
                        notf.addNotification(thePlayer, "Done! findPlayer "..find_name.." fp:"..find_Faction_Punish, 'success')
                        notf.addNotification(find, "Done! findPlayer "..find_name.." fp:"..find_Faction_Punish, 'success')
                        outputDebugString("[Faction-System]: faction governor "..thePlayer_name.." changed Faction Punish player: "..find_name.." new Faction Punish: "..hfp)
                        exports.Log.newLog("[Faction-System]: faction governor "..thePlayer_name.." changed Faction Punish player: "..find_name.." new Faction Punish: "..hfp)
                    else
                        notf.addNotification(thePlayer, "where is Reason?", 'error')
                    end
                else
                    notf.addNotification(thePlayer, "Enter new Faction Punish to change fp", 'warning')
                end
            else
                notf.addNotification(thePlayer, "Player Not Found", 'error')
            end
        else
            notf.addNotification(thePlayer, "Syntax: /setfp <Player> <new fp> <reason>", 'info')
        end
    else
        notf.addNotification(thePlayer, "Syntax: /setfp <Player> <new fp> <reason>", 'info')
    end
end

--=============================================================================================================================
--=============================================================================================================================

-- set faction rank for faction leaders /setfrank
function setrank(thePlayer, cmd, player, rank)

    local rank = tonumber(rank)
    local findrank = frank[find] -- use faction ranks table for messages

    if (Player_admin) < 14 or (Player_Rank_Faction) < 4 or (Player_Faction) ~= (find_Faction) or rank == 5 then -- rank filters
        return false
    elseif thePlayer then
        if (Player_Faction) == (find_Faction) then
            if cmd then
                if player then
                    if rank then
                        if rank ~= (find_Rank_Faction) then

                            if rank == frank.rank then -- input rank filter and Logs for change ranks
                                setElementData(accSys.getPlayerAcc(find), "pFactionRank", rank)
                                outputDebugString("Leader or admin "..thePlayer_name.." changed rank player "..find_name.." to "..findrank.rank)
                                exports.Log.newLog("Leader or admin "..thePlayer_name.." changed rank player "..find_name.." to "..findrank.rank)

                                if rank < (find_Rank_Faction) then -- if player demoted: 
                                    if (Player_Faction) == (find_Faction) then

                                        -- loop for send demote message players in faction
                                        for index, PlayerFaction in ipairs(getElementsByType("player")) do
                                            if getElementData(PlayerFaction, "LoggedIn") == true then
                                                local PlayersinFaction = tonumber(getElementData(accSys.getPlayerAcc(PlayerFaction), "pFaction"))
                                                if (PlayersinFaction) >= 1 then
                                                    if (PlayersinFaction) == (Player_Faction) then
                                                        outputChatBox("#FF0000[Demote]: #FFFFFF Player #FFAE00"..find_name.." #FFFFFFDemoted By #FFAE00"..thePlayer_name.." #FFFFFF to Rank: "..findrank.rank, PlayerFaction, 255, 255, 255, true)
                                                    end
                                                end
                                            end
                                        end

                                        -- Log for report demote Player
                                        outputDebugString("admin or leader "..thePlayer_name.." player "..find_name.." demoted to rank: "..findrank.rank)
                                        exports.Log.newLog("admin or leader "..thePlayer_name.." player "..find_name.." demoted to rank: "..findrank.rank) 
                                    end
                                elseif (Player_Faction) == (find_Faction) then
                                    if rank > (find_Rank_Faction) then -- If player promoted:

                                        -- loop for send promote message to Players in faction
                                        for index, promote in ipairs(getElementsByType("player")) do
                                            local factionplayers = tonumber(getElementData(accsys.getPlayerAcc(promote), "pFaction"))
                                            if getElementData(promote, "LoggedIn") == true then
                                                if (factionplayers) == (Player_Faction) then
                                                    outputChatBox("#FFAE00[Promote]: #FFFFFF Player #FF0000"..find_name.." #FFFFFF Promoted by #FF0000"..thePlayer_name.." #FFFFFFto rank: #FFAE00"..findrank.rank, promote, 255, 255, 255, true)
                                                end
                                            end
                                        end
                                    end
                                end
                            else
                                notf.addNotification(thePlayer, "Wrong Rank!! Enter (1~4)", 'error')
                            end
                        else
                            notf.addNotification(thePlayer, "Wrong Rank", 'error')
                        end
                    else
                        notf.addNotification(thePlayer, "[Error]: Enter Rank", 'error')
                    end
                else
                    notf.addNotification(thePlayer, "Player Not Found", 'error')
                end
            else
                notf.addNotification(thePlayer, "Syntax: /setfrank <player> <new-rank>", 'info')
            end
        else
            notf.addNotification(thePlayer, "Syntax: /setfrank <player> <new-rank>", 'info')
        end
    else
        notf.addNotification(thePlayer, "Syntax: /setfrank <player> <new-rank>", 'info')
    end

    -- Loop for send demote or promote message to admins for report changes and manage events
    for index, chat_admin in ipairs(getElementsByType("player")) do
        local admin_Rank = tonumber(getElementData(accSys.getPlayerAcc(chat_admin), "pAdmin"))
        if getElementData(chat_admin, 'LoggedIn') == true then 
            if (admin_Rank) >= 1 then -- message filter

                if rank < (find_Rank_Faction) then -- if demoted:
                    outputChatBox("#FF0000[Admin-System]: #FFFFFF Player #FFAE00"..find_name.." #FFFFFFDemoted By #FFAE00"..thePlayer_name.." #FFFFFF to Rank: "..findrank.rank, chat_admin, 255, 255, 255, true)

                elseif rank > (find_Rank_Faction) then -- if promoted:
                    outputChatBox("#FF0000[Admin-System]: #FFFFFF Player #FF0000"..find_name.." #FFFFFF Promoted by #FF0000"..thePlayer_name.." #FFFFFFto rank: #FFAE00"..findrank.rank, chat_admin, 255, 255, 255, true)
                end
            end
        end
    end
end

--=============================================================================================================================
--=============================================================================================================================

-- Set Faction for faction governor
function setfaction(thePlayer, cmd, player, faction, ...)
    local faction = factions[faction]
    local factionID = tonumber(faction)
    if (Player_admin) < 14 then
        return false
    end

    if thePlayer then
        if cmd then
            if player then
                if factionID then
                    if (...) then
                        local reason = string.sub(table.concat({...}, " "), 1, 90)
                        setElementData(accSys.getPlayerAcc(find), "pFaction", factionID)
                        for index, m in ipairs(getElementsByType("player")) do
                            local INFac = tonumber(getElementData(accSys.getPlayerAcc(m), "pFaction"))
                            local facRANK = tonumber(getElementData(accsys.getPlayerAcc(find), "pFactionRank"))
                            if getElementData(m, "LoggedIn") == true then
                                if (INFac) == (Player_Faction) then
                                    if (facRANK) >= 1 then
                                        outputChatBox("#7a7744 [Faction-System]: #FFFFFF Faction governor: #FFAE00"..thePlayer_name.." #FFFFFF changed faction player: #FFAE00"..find_name.." #FFFFFF to #FF0000"..faction.name.." #FFFFFF reason: "..reason, m, 255, 255, 255, true)
                                    end
                                end
                            end
                        end
                    else
                        notf.addNotification(thePlayer, "Enter reason", 'error')
                    end
                else
                    notf.addNotification(thePlayer, "Enter Faction ID!!!", 'error')
                end
            else
                notf.addNotification(thePlayer, "player Not Found", 'error')
            end
        else
            notf.addNotification(thePlayer, "Syntax: /setf <player> <faction> <reason>", 'info')
        end
    else
        notf.addNotification(thePlayer, "Syntax: /setf <player> <faction> <reason>", 'info')
    end
    for index, chat_admin in ipairs(getElementsByType("player")) do
        local chatRank = tonumber(getElementData(accSys.getPlayerAcc(chat_admin), "pAdmin"))
        if getElementData(chat_admin, "LoggedIn") == true then
            if (chatRank) >= 1 then
                outputChatBox("#FF0000[Admin-System]: #FFAE00faction governor #FFFFFF"..thePlayer_name.." #FFAE00 Changed Faction #FFFFFF"..find_name.." #FFAE00 New Faction: #FFFFFF"..faction.name.." #FFAE00 Reason: #FFFFFF"..reason, m, 255, 255, 255, true)     
            end 
        end
    end
end

--=============================================================================================================================
--=============================================================================================================================

-- Make leader for faction governor
function makeleader(thePlayer, cmd, player, leaderfID)
    if (Player_admin) > 14 then
        return false
    else
        local fac = factions[fac]
        local leaderfID = tonumber(leaderfID)
        if thePlayer then
            if player then
                if cmd then
                    if leaderfID > 0 and leaderfID < 4 then
                        setElementData(accSys.getPlayerAcc(find), "pFaction", leaderfID)
                        setElementData(accSys.getPlayerAcc(find), "pFactionRank", 5)
                        for index, c in ipairs(getElementsByType("player")) do
                            local PlayerF = tonumber(getElementData(accSys.getPlayerAcc(c), "pFaction"))
                            if getElementData(c, "LoggedIn") == true then
                                if (PlayerF) == (Player_Faction) then
                                    outputChatBox("#7a7744 [Faction-System]: #FFFFFF Player #FF0000"..find_name.." #FFFFFF Maked leader By #FF0000"..thePlayer_name.." #FFFFFF In Faction:#FFAE00"..fac.name, c, 255, 255, 255, true)
                                end
                            end
                        end
                    else
                        notf.addNotification(thePlayer, "Error: Faction ID (1 ~ 4)", 'error')
                    end
                else
                    notf.addNotification(thePlayer, "Syntax: /ml <player> <faction (1 ~ 4)>", 'info')
                end
            else
                notf.addNotification(thePlayer, "Player Not Found!!", 'error')
            end
        else
            notf.addNotification(thePlayer, "Syntax: /ml <player> <faction (1 ~ 4)>", 'info')
        end
    end
end

--=================================================== Created By GodFather =======================================================