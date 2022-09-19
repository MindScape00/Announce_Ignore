local ignore_scope = 2
local ignore_scope_def = { "Only Default (Chat/Channel)", "Default+Announce & Phase Announce", "Default+All System Messages" }

local function ChatFilter(Self,Event,Message)
	
	-- dev message testing
	--local clearmsg = gsub(Message,"|cff%x%x%x%x%x%x","");
	--local clearmsg = clearmsg:gsub("|r","");
	--local clearmsg = Message:gsub("|","\\")
	--print(clearmsg)
	--print(Message)
	
	if ignore_scope then
		if ignore_scope == 1 then return; -- return if default, we do nothing..
		elseif ignore_scope == 2 then -- If Filter Scope should be ann/phase ann only
			local annCheck = Message:match("|cff00a2d7Epsilon|r.-:")
			local phaseCheck = Message:match("|cff00a2d7%[.-%]|r |cff.-|Hplayer:.-:")
			
			if annCheck or phaseCheck then
				local playerName = Message:match("|Hplayer:(.-)|h")
				--print(playerName)
				if playerName then
					if C_FriendList.IsIgnored(playerName) then
						--print(playerName.." is Ignored. Message should be hidden.")
						return true;
					end
				end
			end
		elseif ignore_scope == 3 then -- If All Sys Messages
			local playerName = Message:match("|Hplayer:(.-)|h")
			--print(playerName)
			if playerName then
				if C_FriendList.IsIgnored(playerName) then
					--print(playerName.." is Ignored. Message should be hidden.")
					return true;
				end
			end
		end
	end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", ChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_ACHIEVEMENT", ChatFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER_INFORM", ChatFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_COMBAT_XP_GAIN", ChatFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_COMBAT_HONOR_GAIN", ChatFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_COMBAT_FACTION_CHANGE", ChatFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_TRADESKILLS", ChatFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_OPENING", ChatFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_PET_INFO", ChatFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_COMBAT_MISC_INFO", ChatFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_BG_SYSTEM_HORDE", ChatFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_BG_SYSTEM_ALLIANCE", ChatFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_BG_SYSTEM_NEUTRAL", ChatFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_TARGETICONS", ChatFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_CONVERSATION_NOTICE", ChatFilter);

SLASH_ANNOUNCE_IGNORE1 = '/annignore';
function SlashCmdList.ANNOUNCE_IGNORE(msg, editbox) -- 4.
	ignore_scope = ignore_scope + 1
	if ignore_scope > 3 then
		ignore_scope = 1
	end
	print("Announce_Ignore: Filter set to "..ignore_scope_def[ignore_scope].." messages.")
end