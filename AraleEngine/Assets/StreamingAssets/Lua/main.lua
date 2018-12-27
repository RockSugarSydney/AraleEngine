--====================================================
--don't modify the code in this block
--don't modify the lua file in common,permit only System developer
--main.lua is lua code entry
print(package.path)
require "common/LClass"
require "common/LObject"
--=====================your code begin=================
--==============unity
CU = CS.UnityEngine
UI = CU.UI
Matrix4x4 = CS.UnityEngine.Matrix4x4
Quaternion = CS.UnityEngine.Quaternion
Vector3 = CS.UnityEngine.Vector3
Vector2 = CS.UnityEngine.Vector2
--==============引擎
GRoot = CS.Arale.Engine.GRoot
AssetRef = CS.Arale.Engine.AssetRef
WindowMgr = CS.Arale.Engine.WindowMgr
EventListener = CS.Arale.Engine.EventListener
SceneMgr = CS.Arale.Engine.SceneMgr
EventMgr = CS.Arale.Engine.EventMgr
TimeMgr = CS.Arale.Engine.TimeMgr
NetworkMgr = CS.Arale.Engine.NetworkMgr
Window = CS.Arale.Engine.Window
UISwitch = CS.UISwitch
LHelp    = CS.LHelp
ProtoWriter = CS.ProtoBuf.ProtoWriter
WireType = CS.ProtoBuf.WireType
NetMgr = CS.NetMgr
typeof(EventMgr)
--==============模板
--通过Debug.Log(typeof(List<object>)模板类的真实名称
--List_object= CS.System.Collections.Generic.List`1[System.Object]
--==============第三方库
Json = require 'rapidjson'
Proto= require 'common/protoc'
PB   = require 'pb'
Lpeg = require 'lpeg'
--==============
require "game/ui/LStartWindow"
require "game/ui/LLoginWindow"
require "game/ui/LLanLoginWindow"
require "game/ui/LMainWindow"
require "game/ui/LPlayerWindow"
require "game/ui/LTaskWindow"
require "game/ui/LSkillWindow"
require "game/ui/LShopWindow"
require "game/ui/shop/LShopItem"
require "game/ui/LForginWindow"
require "game/ui/LBagWindow"
require "game/ui/bag/LBag"
require "game/ui/bag/LBagItem"
require "game/ui/bag/LItemSlot"
require "game/ui/LRoleCreateWindow"
require "game/ui/LRoleCreateWindowItem"
print("require all ok");
--=====================================================
function  main( ... )
	WindowMgr.SetWindowRes ("StartWindow", "UI/StartWindow")
	WindowMgr.SetWindowRes ("UpdateWindow", "UI/UpdateWindow")
	WindowMgr.SetWindowRes ("LoginWindow", "UI/LoginWindow")
	WindowMgr.SetWindowRes ("LanLoginWindow", "UI/LanLoginWindow")
	WindowMgr.SetWindowRes ("MainWindow", "UI/MainWindow")
	WindowMgr.SetWindowRes ("ShopWindow", "UI/ShopWindow")
	WindowMgr.SetWindowRes ("SkillWindow", "UI/SkillWindow")
	WindowMgr.SetWindowRes ("TaskWindow", "UI/TaskWindow")
	WindowMgr.SetWindowRes ("PlayerWindow", "UI/PlayerWindow")
	WindowMgr.SetWindowRes ("ForginWindow", "UI/ForginWindow")
	WindowMgr.SetWindowRes ("ImbedWindow", "UI/ImbedWindow")
	WindowMgr.SetWindowRes ("BagWindow", "UI/BagWindow")
	WindowMgr.SetWindowRes ("RoleCreateWindow", "UI/RoleCreateWindow")

	EventMgr.single:AddListener(GRoot.EventSceneLoad, onSceneLoaded)
	EventMgr.single:AddListener("Game.Login", onLogin)
	EventMgr.single:AddListener("Game.Logout", onLogout)

	--LBag:Init()

	if GRoot.single.mLaunchFlag~=0 then return end
	SceneMgr.single:LoadScene("Login")
	print("main.lua ok");
end

function onSceneLoaded(evt)
	local levelName = evt.data
	print("scene:"..levelName);
	if levelName == "Login" then
		WindowMgr.single:GetWindow("StartWindow", true)
	elseif levelName == "Main" then
		WindowMgr.single:GetWindow("MainWindow", true)
	end
end

function onLogin(evt)
	SceneMgr.single:LoadScene("Main")
end

function onLogout(evt)
	NetMgr.single:deinit();
	SceneMgr.single:LoadScene("Login")
end
--====================================================