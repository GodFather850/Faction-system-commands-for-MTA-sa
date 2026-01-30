# Faction-system-commands-for-MTA-sa
Hello, I'm Mohammad, nicknamed Godfather, and today, after 10 days of internet outages in the country, I'm back with a new and useful post.

![MTA](mta131.png)

---

# =============================================
![update](update.png)
# Update Features: (BETA)
```markdown
Fixed Bugs
Optimized Ranks
add meta.xml file
front (chats) optimized
Secure commands upgraded
```
# # =============================================

---

# Features

*This efficient code includes:*

**Extremely high security**

**Clean, readable and extensible**

**Complete and customizable commands**

**Connect to SQL database**

**Connect to SQL database**

**All CMDs have been fully considered, inputs are controlled, and errors are presented in an eye-catching and readable manner.**

---

# How to Run file?

1. ![Click-Me](https://github.com/GodFather850/Faction-system-commands-for-MTA-sa/archive/refs/heads/main.zip)

2.  copy or move lua file and xml file to your recources folder

3.  refresh your Debug Panel `refresh`

4. make folder and move faction.lua in folder

5. start folder `start`

6. if start is faild restart your server ( CTRL + c )

---
# Notifcation
![Notification_Source_is_Ready_Ckick_to_Downloads](https://github.com/GodFather850/MTA-sa-Script-For-Admins-Ban-admin-/tree/main)
---
# optional: 
```lua
-- goto code and change your table name and account system folder name
-- If you pay attention to the loops, the table names inside are also variable. Change them as desired according to the server database.
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
local find_Faction = tonumber(getelementData(accSys.getPlayerAcc(find), "pFaction"))
local Player_Warn = tonumber(getElementData(accSys.getPlayerAcc(thePlayer), "pFactionWarn"))
local find_Warn = tonumber(getElementData(accSys.getPlayerAcc(find), "pFactionWarn"))
local find_Ban_Faction = tonumber(getElementData(accSys.getPlayerAcc(find), "pFactionBan"))
local find_Faction_Punish = tonumber(getElementData(accsys.getPlayerAcc(find), "pFactionPunish"))
```
---
# -👤Created By GodFather

# -📜MTA Scripter • Linux Learner🐧 • Linux User🔥 • python learner 🇺🇸🔥

---
![Tux](https://upload.wikimedia.org/wikipedia/commons/3/35/Tux.svg)
