DEVELOPER_DEBUG = true

lrh = function(...)
	UtilsDebug.Print(...)
end

lrw = function(...)
	Log.Info(...)
end

function GameLuaStart:DevelopStart()
	NeedNotchSupport = false
	LrhInit()
end

function GameLuaStart:DevelopUpdate()
	LrhUpdate()
end

local _type = type
local _tostring = tostring
local _pairs = pairs
local _string_format = string.format

LrhInit = function()
	-- EventMgr.Instance:AddListener(event_name.show_panel, function(name) LahmPanelOpen(name) end)
end

LrhUpdate = function()
	if Input.GetKeyDown(KeyCode.T) then
		local serverData = {
			cmd = "task.halfhour_info",
			resp = {
				ret = 200,
				pts = 70000,
				round = 971,
				order_config = {
					[1] = {
						order = 8,
						star = 40,
						pts = 40000,
					},
					[2] = {
						score = 0,
						pts = 55000,
						money = 1400,
						star = 45,
						order = 9,
					},
					[3] = {
						score = 0,
						pts = 70000,
						money = 1500,
						star = 50,
						order = 10,
					},
				},
				left_s = 1075,
			},
		}

		LobbyManager.Instance:OnTaskHalfhourInfo(serverData)
	end
	if Input.GetKeyDown(KeyCode.Q) then
		EventMgr.Instance:Fire(EventName.LEAGUE_USER_RANK_UPDATE)
	end
	if Input.GetKeyDown(KeyCode.W) then
		PanelManager.Instance:Show(PanelID.NotEnoughPanel)
	end
	if Input.GetKeyDown(KeyCode.Alpha1) then
		lrh("mid=", UserData.Instance:GetUserID())
	end
	if Input.GetKeyDown(KeyCode.Alpha2) then
		local public = { 0x38, 0x0b, 0x26 }
		local hands = { 0x39, 0x17 }
		local possibleData = TexasCardAlgorithm.GetPossibleCardType(public, hands)
		lrh(possibleData)
	end
	if Input.GetKeyDown(KeyCode.Alpha3) then
        lrh("random=", math.random(1, 2))
	end
	if Input.GetKeyDown(KeyCode.Alpha4) then
		EventMgr.Instance:Fire(EventName.ROOM_GAME_SELF_WIN)
	end
	if Input.GetKeyDown(KeyCode.Alpha5) then
		DialogManager.Instance:Show(DialogID.CustomRewardDialog, {{type=CustomRewardEnum.RewardType.Money, num=100}})
	end
	if Input.GetKeyDown(KeyCode.M) then
		--        LuaCallToolkit.SaveUUID("liu_00000001")
		LuaCallToolkit.SaveUUID("10214")
	end
	if Input.GetKeyDown(KeyCode.N) then
		LuaCallToolkit.SaveUUID()
	end
end
