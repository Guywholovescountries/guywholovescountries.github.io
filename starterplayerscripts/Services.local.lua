-- Services put this in starterplayerscripts and make it a local script
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Player Data Variables
local currentCoins = 0
local currentStreakDay = 1
local lastClaimTime = 0 -- 0 means available immediately
local ownedItems = {}
local equippedAura = nil
local equippedTrail = nil

-- Create Main ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MainGameHUD"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true 
screenGui.Parent = playerGui

--------------------------------------------------------------------------------
-- VISUAL EFFECTS LOGIC (SPAWNING AURAS & TRAILS ON CHARACTER)
--------------------------------------------------------------------------------

local function applyEffects(character)
	if not character then return end
	local hrp = character:WaitForChild("HumanoidRootPart", 5)