local function ChatFilter(Self,Event,Message)
	local playerName = Message:match("|Hplayer:(.-)|h")
	if playerName then
		if C_FriendList.IsIgnored(playerName) then
			print(playerName.." is Ignored. Announce should be hidden.")
			return;
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