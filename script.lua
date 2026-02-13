local plr = game.Players.LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local CommF = rs.Remotes.CommF_
local RunSer = game:GetService("RunService")
local TweenSer = game:GetService("TweenService")
local VU = game:GetService("VirtualUser")

spawn(function()
    plr.Idled:Connect(function()
        VU:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        wait(1)
        VU:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
end)

if plr.Team == nil then
    repeat task.wait()
        pcall(function() CommF:InvokeServer("SetTeam", "Pirates") end)
    until plr.Team ~= nil
end

local Kaitun = {
    Active = true,
    AutoLevel = true,
    SafeFarm = true,
    AutoFruit = true,
    AutoStoreFruit = true,
    AutoGodHuman = true,
    AutoCDK = true,
    AutoSkullGuitar = true,
    AutoBuyHaki = true,
    AutoRaid = true,
    FragmentGoal = 10000
}

local HighValueFruits = {
    "Dragon-Dragon",
    "Kitsune-Kitsune",
    "Yeti-Yeti",
    "Gas-Gas",
    "Tiger-Tiger",
    "Rumble-Rumble",
    "Dough-Dough",
    "T-Rex-T-Rex",
    "Pain-Pain",
    "Gravity-Gravity",
    "Venom-Venom",
    "Control-Control",
    "Spirit-Spirit",
    "Leopard-Leopard",
    "Mammoth-Mammoth",
    "Blizzard-Blizzard",
    "Portal-Portal",
    "Shadow-Shadow",
    "Dark-Dark",
    "Buddha-Human: Buddha Fruit",
    "Quake-Quake",
    "Light-Light"
}

local sg = Instance.new("ScreenGui", game.CoreGui)
sg.Name = "KaitunUI"
local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 320, 0, 220)
frame.Position = UDim2.new(0.5, -160, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,35)
title.BackgroundTransparency = 1
title.Text = "Kaitun Eclipse"
title.TextColor3 = Color3.fromRGB(255,215,0)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 22

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1,-20,1,-50)
status.Position = UDim2.new(0,10,0,40)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(220,220,220)
status.TextSize = 15
status.TextXAlignment = Enum.TextXAlignment.Left
status.TextYAlignment = Enum.TextYAlignment.Top
status.TextWrapped = true

spawn(function()
    while task.wait(1) do
        local gh = (CommF:InvokeServer("BuyGodhuman",true) and "🟢" or "🔴")
        local cdk = ((plr.Backpack:FindFirstChild("Cursed Dual Katana") or plr.Character:FindFirstChild("Cursed Dual Katana")) and "🟢" or "🔴")
        local sg = ((plr.Backpack:FindFirstChild("Skull Guitar") or plr.Character:FindFirstChild("Skull Guitar")) and "🟢" or "🔴")
        local mirror = (plr.Backpack:FindFirstChild("Mirror Fractal") and "🟢" or "🔴")
        local valk = (plr.Backpack:FindFirstChild("Valkyrie Helm") and "🟢" or "🔴")

        local lvl = plr.Data.Level.Value
        local beli = plr.Data.Beli.Value
        local frag = plr.Data.Fragments.Value

        status.Text = string.format(
            "God Human: %s\nCursed Dual Katana: %s\nSkull Guitar: %s\nMirror Fractal: %s\nValkyrie Helm: %s\n\nCurrent Level: %d\nBeli: %d\nFragments: %d",
            gh, cdk, sg, mirror, valk, lvl, beli, frag
        )
    end
end)

local function Tween(cf, spd)
    if not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then return end
    local dist = (plr.Character.HumanoidRootPart.Position - cf.Position).Magnitude
    local ti = TweenInfo.new(dist / (spd or 350), Enum.EasingStyle.Linear)
    local t = TweenSer:Create(plr.Character.HumanoidRootPart, ti, {CFrame = cf})
    t:Play()
    t.Completed:Wait()
end

local World1 = game.PlaceId == 2753915549 or game.PlaceId == 85211729168715
local World2 = game.PlaceId == 4442272183 or game.PlaceId == 79091703265657
local World3 = game.PlaceId == 7449423635 or game.PlaceId == 100117331123089

local function QuestCheck()
    local lvl = plr.Data.Level.Value
    local q = {Mon = "", NameMon = "", QName = "", QData = 1, PosQ = CFrame.new(), PosM = CFrame.new()}

    if World1 then
        if lvl <= 9 then
            q.Mon = "Bandit" q.NameMon = "Bandit" q.QName = "BanditQuest1" q.QData = 1 q.PosQ = CFrame.new(1059, 17, 1546) q.PosM = CFrame.new(943, 45, 1562)
        elseif lvl <= 14 then
            q.Mon = "Monkey" q.NameMon = "Monkey" q.QName = "JungleQuest" q.QData = 1 q.PosQ = CFrame.new(-1598, 37, 153) q.PosM = CFrame.new(-1524, 50, 37)
        elseif lvl <= 29 then
            q.Mon = "Gorilla" q.NameMon = "Gorilla" q.QName = "JungleQuest" q.QData = 2 q.PosQ = CFrame.new(-1598, 37, 153) q.PosM = CFrame.new(-1128, 40, -451)
        elseif lvl <= 39 then
            q.Mon = "Pirate" q.NameMon = "Pirate" q.QName = "BuggyQuest1" q.QData = 1 q.PosQ = CFrame.new(-1140, 4, 3829) q.PosM = CFrame.new(-1262, 40, 3905)
        elseif lvl <= 59 then
            q.Mon = "Brute" q.NameMon = "Brute" q.QName = "BuggyQuest1" q.QData = 2 q.PosQ = CFrame.new(-1140, 4, 3829) q.PosM = CFrame.new(-976, 55, 4304)
        elseif lvl <= 74 then
            q.Mon = "Desert Bandit" q.NameMon = "Desert Bandit" q.QName = "DesertQuest" q.QData = 1 q.PosQ = CFrame.new(897, 6, 4389) q.PosM = CFrame.new(924, 7, 4482)
        elseif lvl <= 89 then
            q.Mon = "Desert Officer" q.NameMon = "Desert Officer" q.QName = "DesertQuest" q.QData = 2 q.PosQ = CFrame.new(897, 6, 4389) q.PosM = CFrame.new(1608, 9, 4371)
        elseif lvl <= 99 then
            q.Mon = "Snow Bandit" q.NameMon = "Snow Bandit" q.QName = "SnowQuest" q.QData = 1 q.PosQ = CFrame.new(1385, 87, -1298) q.PosM = CFrame.new(1362, 120, -1531)
        elseif lvl <= 119 then
            q.Mon = "Snowman" q.NameMon = "Snowman" q.QName = "SnowQuest" q.QData = 2 q.PosQ = CFrame.new(1385, 87, -1298) q.PosM = CFrame.new(1243, 140, -1437)
        elseif lvl <= 149 then
            q.Mon = "Chief Petty Officer" q.NameMon = "Chief Petty Officer" q.QName = "MarineQuest2" q.QData = 1 q.PosQ = CFrame.new(-5035, 29, 4326) q.PosM = CFrame.new(-4881, 23, 4274)
        elseif lvl <= 174 then
            q.Mon = "Sky Bandit" q.NameMon = "Sky Bandit" q.QName = "SkyQuest" q.QData = 1 q.PosQ = CFrame.new(-4844, 718, -2621) q.PosM = CFrame.new(-4953, 296, -2899)
        elseif lvl <= 189 then
            q.Mon = "Dark Master" q.NameMon = "Dark Master" q.QName = "SkyQuest" q.QData = 2 q.PosQ = CFrame.new(-4844, 718, -2621) q.PosM = CFrame.new(-5260, 391, -2229)
        elseif lvl <= 209 then
            q.Mon = "Prisoner" q.NameMon = "Prisoner" q.QName = "PrisonerQuest" q.QData = 1 q.PosQ = CFrame.new(5306, 2, 477) q.PosM = CFrame.new(5099, 0, 474)
        elseif lvl <= 249 then
            q.Mon = "Dangerous Prisoner" q.NameMon = "Dangerous Prisoner" q.QName = "PrisonerQuest" q.QData = 2 q.PosQ = CFrame.new(5306, 2, 477) q.PosM = CFrame.new(5655, 16, 866)
        elseif lvl <= 274 then
            q.Mon = "Toga Warrior" q.NameMon = "Toga Warrior" q.QName = "ColosseumQuest" q.QData = 1 q.PosQ = CFrame.new(-1581, 7, -2982) q.PosM = CFrame.new(-1820, 51, -2741)
        elseif lvl <= 299 then
            q.Mon = "Gladiator" q.NameMon = "Gladiator" q.QName = "ColosseumQuest" q.QData = 2 q.PosQ = CFrame.new(-1581, 7, -2982) q.PosM = CFrame.new(-1268, 30, -2996)
        elseif lvl <= 324 then
            q.Mon = "Military Soldier" q.NameMon = "Military Soldier" q.QName = "MagmaQuest" q.QData = 1 q.PosQ = CFrame.new(-5319, 12, 8515) q.PosM = CFrame.new(-5335, 46, 8638)
        elseif lvl <= 374 then
            q.Mon = "Military Spy" q.NameMon = "Military Spy" q.QName = "MagmaQuest" q.QData = 2 q.PosQ = CFrame.new(-5319, 12, 8515) q.PosM = CFrame.new(-5803, 86, 8829)
        elseif lvl <= 399 then
            q.Mon = "Fishman Warrior" q.NameMon = "Fishman Warrior" q.QName = "FishmanQuest" q.QData = 1 q.PosQ = CFrame.new(61122, 18, 1567) q.PosM = CFrame.new(60998, 50, 1534)
        elseif lvl <= 449 then
            q.Mon = "Fishman Commando" q.NameMon = "Fishman Commando" q.QName = "FishmanQuest" q.QData = 2 q.PosQ = CFrame.new(61122, 18, 1567) q.PosM = CFrame.new(61866, 55, 1655)
        elseif lvl <= 474 then
            q.Mon = "God's Guard" q.NameMon = "God's Guard" q.QName = "SkyExp1Quest" q.QData = 1 q.PosQ = CFrame.new(-4720, 846, -1951) q.PosM = CFrame.new(-4720, 846, -1951)
        elseif lvl <= 524 then
            q.Mon = "Shanda" q.NameMon = "Shanda" q.QName = "SkyExp1Quest" q.QData = 2 q.PosQ = CFrame.new(-7861, 5545, -381) q.PosM = CFrame.new(-7741, 5580, -395)
        elseif lvl <= 549 then
            q.Mon = "Royal Squad" q.NameMon = "Royal Squad" q.QName = "SkyExp2Quest" q.QData = 1 q.PosQ = CFrame.new(-7903, 5636, -1412) q.PosM = CFrame.new(-7727, 5650, -1410)
        elseif lvl <= 624 then
            q.Mon = "Royal Soldier" q.NameMon = "Royal Soldier" q.QName = "SkyExp2Quest" q.QData = 2 q.PosQ = CFrame.new(-7903, 5636, -1412) q.PosM = CFrame.new(-7894, 5640, -1629)
        elseif lvl <= 649 then
            q.Mon = "Galley Pirate" q.NameMon = "Galley Pirate" q.QName = "FountainQuest" q.QData = 1 q.PosQ = CFrame.new(5258, 39, 4052) q.PosM = CFrame.new(5391, 70, 4023)
        elseif lvl >= 650 then
            q.Mon = "Galley Captain" q.NameMon = "Galley Captain" q.QName = "FountainQuest" q.QData = 2 q.PosQ = CFrame.new(5258, 39, 4052) q.PosM = CFrame.new(5985, 70, 4790)
        end
    elseif World2 then
        if lvl <= 724 then
            q.Mon = "Raider" q.NameMon = "Raider" q.QName = "Area1Quest" q.QData = 1 q.PosQ = CFrame.new(-427, 73, 1835) q.PosM = CFrame.new(-614, 90, 2240)
        elseif lvl <= 774 then
            q.Mon = "Mercenary" q.NameMon = "Mercenary" q.QName = "Area1Quest" q.QData = 2 q.PosQ = CFrame.new(-427, 73, 1835) q.PosM = CFrame.new(-867, 110, 1621)
        elseif lvl <= 874 then
            q.Mon = "Swan Pirate" q.NameMon = "Swan Pirate" q.QName = "Area2Quest" q.QData = 1 q.PosQ = CFrame.new(635, 73, 919) q.PosM = CFrame.new(635, 73, 919)
        elseif lvl <= 899 then
            q.Mon = "Marine Lieutenant" q.NameMon = "Marine Lieutenant" q.QName = "MarineQuest3" q.QData = 1 q.PosQ = CFrame.new(-2441, 73, -3219) q.PosM = CFrame.new(-2552, 110, -3050)
        elseif lvl <= 949 then
            q.Mon = "Marine Captain" q.NameMon = "Marine Captain" q.QName = "MarineQuest3" q.QData = 2 q.PosQ = CFrame.new(-2441, 73, -3219) q.PosM = CFrame.new(-1695, 110, -3299)
        elseif lvl <= 974 then
            q.Mon = "Zombie" q.NameMon = "Zombie" q.QName = "ZombieQuest" q.QData = 1 q.PosQ = CFrame.new(-5495, 48, -794) q.PosM = CFrame.new(-5715, 90, -917)
        elseif lvl <= 999 then
            q.Mon = "Vampire" q.NameMon = "Vampire" q.QName = "ZombieQuest" q.QData = 2 q.PosQ = CFrame.new(-5495, 48, -794) q.PosM = CFrame.new(-6027, 50, -1130)
        elseif lvl <= 1049 then
            q.Mon = "Snow Trooper" q.NameMon = "Snow Trooper" q.QName = "SnowMountainQuest" q.QData = 1 q.PosQ = CFrame.new(607, 401, -5371) q.PosM = CFrame.new(445, 440, -5175)
        elseif lvl <= 1099 then
            q.Mon = "Winter Warrior" q.NameMon = "Winter Warrior" q.QName = "SnowMountainQuest" q.QData = 2 q.PosQ = CFrame.new(607, 401, -5371) q.PosM = CFrame.new(1224, 460, -5332)
        elseif lvl <= 1124 then
            q.Mon = "Lab Subordinate" q.NameMon = "Lab Subordinate" q.QName = "IceSideQuest" q.QData = 1 q.PosQ = CFrame.new(-6061, 16, -4904) q.PosM = CFrame.new(-5941, 50, -4322)
        elseif lvl <= 1174 then
            q.Mon = "Horned Warrior" q.NameMon = "Horned Warrior" q.QName = "IceSideQuest" q.QData = 2 q.PosQ = CFrame.new(-6061, 16, -4904) q.PosM = CFrame.new(-6306, 50, -5752)
        elseif lvl <= 1199 then
            q.Mon = "Magma Ninja" q.NameMon = "Magma Ninja" q.QName = "FireSideQuest" q.QData = 1 q.PosQ = CFrame.new(-5430, 16, -5298) q.PosM = CFrame.new(-5233, 60, -6227)
        elseif lvl <= 1249 then
            q.Mon = "Lava Pirate" q.NameMon = "Lava Pirate" q.QName = "FireSideQuest" q.QData = 2 q.PosQ = CFrame.new(-5430, 16, -5298) q.PosM = CFrame.new(-4955, 60, -4836)
        elseif lvl <= 1274 then
            q.Mon = "Ship Deckhand" q.NameMon = "Ship Deckhand" q.QName = "ShipQuest1" q.QData = 1 q.PosQ = CFrame.new(1033, 125, 32909) q.PosM = CFrame.new(1033, 125, 32909)
        elseif lvl <= 1299 then
            q.Mon = "Ship Engineer" q.NameMon = "Ship Engineer" q.QName = "ShipQuest1" q.QData = 2 q.PosQ = CFrame.new(1033, 125, 32909) q.PosM = CFrame.new(809, 80, 33090)
        elseif lvl <= 1324 then
            q.Mon = "Ship Steward" q.NameMon = "Ship Steward" q.QName = "ShipQuest2" q.QData = 1 q.PosQ = CFrame.new(973, 125, 33245) q.PosM = CFrame.new(838, 160, 33408)
        elseif lvl <= 1349 then
            q.Mon = "Ship Officer" q.NameMon = "Ship Officer" q.QName = "ShipQuest2" q.QData = 2 q.PosQ = CFrame.new(973, 125, 33245) q.PosM = CFrame.new(1238, 220, 33148)
        elseif lvl <= 1374 then
            q.Mon = "Arctic Warrior" q.NameMon = "Arctic Warrior" q.QName = "FrostQuest" q.QData = 1 q.PosQ = CFrame.new(5669, 28, -6484) q.PosM = CFrame.new(5669, 28, -6484)
        elseif lvl <= 1424 then
            q.Mon = "Snow Lurker" q.NameMon = "Snow Lurker" q.QName = "FrostQuest" q.QData = 2 q.PosQ = CFrame.new(5669, 28, -6484) q.PosM = CFrame.new(5669, 28, -6484)
        elseif lvl <= 1449 then
            q.Mon = "Sea Soldier" q.NameMon = "Sea Soldier" q.QName = "ForgottenQuest" q.QData = 1 q.PosQ = CFrame.new(-3052, 237, -10142) q.PosM = CFrame.new(-3052, 237, -10142)
        elseif lvl <= 1499 then
            q.Mon = "Water Fighter" q.NameMon = "Water Fighter" q.QName = "ForgottenQuest" q.QData = 2 q.PosQ = CFrame.new(-3052, 237, -10142) q.PosM = CFrame.new(-3052, 237, -10142)
        end
    elseif World3 then
        if lvl <= 1549 then
            q.Mon = "Pirate Millionaire" q.NameMon = "Pirate Millionaire" q.QName = "PiratePortQuest" q.QData = 1 q.PosQ = CFrame.new(-290, 44, 5577) q.PosM = CFrame.new(-290, 44, 5577)
        elseif lvl <= 1599 then
            q.Mon = "Pistol Billionaire" q.NameMon = "Pistol Billionaire" q.QName = "PiratePortQuest" q.QData = 2 q.PosQ = CFrame.new(-290, 44, 5577) q.PosM = CFrame.new(-290, 44, 5577)
        elseif lvl <= 1649 then
            q.Mon = "Dragon Crew Warrior" q.NameMon = "Dragon Crew Warrior" q.QName = "AmazonQuest" q.QData = 1 q.PosQ = CFrame.new(5833, 51, -1103) q.PosM = CFrame.new(5833, 51, -1103)
        elseif lvl <= 1699 then
            q.Mon = "Dragon Crew Archer" q.NameMon = "Dragon Crew Archer" q.QName = "AmazonQuest" q.QData = 2 q.PosQ = CFrame.new(5833, 51, -1103) q.PosM = CFrame.new(5833, 51, -1103)
        elseif lvl <= 1749 then
            q.Mon = "Female Islander" q.NameMon = "Female Islander" q.QName = "AmazonQuest2" q.QData = 1 q.PosQ = CFrame.new(5448, 602, 748) q.PosM = CFrame.new(5448, 602, 748)
        elseif lvl <= 1799 then
            q.Mon = "Giant Islander" q.NameMon = "Giant Islander" q.QName = "AmazonQuest2" q.QData = 2 q.PosQ = CFrame.new(5448, 602, 748) q.PosM = CFrame.new(5448, 602, 748)
        elseif lvl <= 1849 then
            q.Mon = "Marine Commodore" q.NameMon = "Marine Commodore" q.QName = "MarineTreeIsland" q.QData = 1 q.PosQ = CFrame.new(2180, 29, -6738) q.PosM = CFrame.new(2180, 29, -6738)
        elseif lvl <= 1899 then
            q.Mon = "Marine Rear Admiral" q.NameMon = "Marine Rear Admiral" q.QName = "MarineTreeIsland" q.QData = 2 q.PosQ = CFrame.new(2180, 29, -6738) q.PosM = CFrame.new(2180, 29, -6738)
        elseif lvl <= 1949 then
            q.Mon = "Fishman Raider" q.NameMon = "Fishman Raider" q.QName = "DeepForestIsland3" q.QData = 1 q.PosQ = CFrame.new(-10581, 332, -8758) q.PosM = CFrame.new(-10550, 380, -8574)
        elseif lvl <= 1999 then
            q.Mon = "Fishman Captain" q.NameMon = "Fishman Captain" q.QName = "DeepForestIsland3" q.QData = 2 q.PosQ = CFrame.new(-10581, 332, -8758) q.PosM = CFrame.new(-10764, 380, -8799)
        elseif lvl <= 2049 then
            q.Mon = "Forest Pirate" q.NameMon = "Forest Pirate" q.QName = "DeepForestIsland" q.QData = 1 q.PosQ = CFrame.new(-13233, 332, -7626) q.PosM = CFrame.new(-13335, 380, -7660)
        elseif lvl <= 2099 then
            q.Mon = "Mythological Pirate" q.NameMon = "Mythological Pirate" q.QName = "DeepForestIsland" q.QData = 2 q.PosQ = CFrame.new(-13233, 332, -7626) q.PosM = CFrame.new(-13844, 520, -7016)
        elseif lvl <= 2149 then
            q.Mon = "Jungle Pirate" q.NameMon = "Jungle Pirate" q.QName = "DeepForestIsland2" q.QData = 1 q.PosQ = CFrame.new(-12682, 391, -9901) q.PosM = CFrame.new(-12166, 380, -10375)
        elseif lvl <= 2199 then
            q.Mon = "Musketeer Pirate" q.NameMon = "Musketeer Pirate" q.QName = "DeepForestIsland2" q.QData = 2 q.PosQ = CFrame.new(-12682, 391, -9901) q.PosM = CFrame.new(-13098, 450, -9831)
        elseif lvl <= 2249 then
            q.Mon = "Reborn Skeleton" q.NameMon = "Reborn Skeleton" q.QName = "HauntedQuest1" q.QData = 1 q.PosQ = CFrame.new(-9481, 142, 5565) q.PosM = CFrame.new(-8680, 190, 5852)
        elseif lvl <= 2299 then
            q.Mon = "Living Zombie" q.NameMon = "Living Zombie" q.QName = "HauntedQuest1" q.QData = 2 q.PosQ = CFrame.new(-9481, 142, 5565) q.PosM = CFrame.new(-10144, 140, 5932)
        elseif lvl <= 2349 then
            q.Mon = "Demonic Soul" q.NameMon = "Demonic Soul" q.QName = "HauntedQuest2" q.QData = 1 q.PosQ = CFrame.new(-9515, 172, 607) q.PosM = CFrame.new(-9275, 210, 6166)
        elseif lvl <= 2399 then
            q.Mon = "Posessed Mummy" q.NameMon = "Posessed Mummy" q.QName = "HauntedQuest2" q.QData = 2 q.PosQ = CFrame.new(-9515, 172, 607) q.PosM = CFrame.new(-9442, 60, 6304)
        elseif lvl <= 2449 then
            q.Mon = "Peanut Scout" q.NameMon = "Peanut Scout" q.QName = "NutsIslandQuest" q.QData = 1 q.PosQ = CFrame.new(-2104, 38, -10194) q.PosM = CFrame.new(-1870, 100, -10225)
        elseif lvl <= 2499 then
            q.Mon = "Peanut President" q.NameMon = "Peanut President" q.QName = "NutsIslandQuest" q.QData = 2 q.PosQ = CFrame.new(-2104, 38, -10194) q.PosM = CFrame.new(-2005, 100, -10585)
        elseif lvl <= 2549 then
            q.Mon = "Ice Cream Chef" q.NameMon = "Ice Cream Chef" q.QName = "IceCreamIslandQuest" q.QData = 1 q.PosQ = CFrame.new(-818, 66, -10964) q.PosM = CFrame.new(-501, 100, -10883)
        elseif lvl <= 2599 then
            q.Mon = "Ice Cream Commander" q.NameMon = "Ice Cream Commander" q.QName = "IceCreamIslandQuest" q.QData = 2 q.PosQ = CFrame.new(-818, 66, -10964) q.PosM = CFrame.new(-690, 100, -11350)
        elseif lvl <= 2624 then
            q.Mon = "Reef Bandit" q.NameMon = "Reef Bandit" q.QName = "SubmergedQuest1" q.QData = 1 q.PosQ = CFrame.new(10882.264, -2086.322, 10034.226) q.PosM = CFrame.new(10736.6191, -2087.8439, 9338.4882)
        elseif lvl <= 2649 then
            q.Mon = "Coral Pirate" q.NameMon = "Coral Pirate" q.QName = "SubmergedQuest1" q.QData = 2 q.PosQ = CFrame.new(10882.264, -2086.322, 10034.226) q.PosM = CFrame.new(10965.1025, -2158.8842, 9177.2597)
        elseif lvl <= 2674 then
            q.Mon = "Sea Chanter" q.NameMon = "Sea Chanter" q.QName = "SubmergedQuest2" q.QData = 1 q.PosQ = CFrame.new(10882.264, -2086.322, 10034.226) q.PosM = CFrame.new(10621.0342, -2087.8440, 10102.0332)
        elseif lvl <= 2699 then
            q.Mon = "Ocean Prophet" q.NameMon = "Ocean Prophet" q.QName = "SubmergedQuest2" q.QData = 2 q.PosQ = CFrame.new(10882.264, -2086.322, 10034.226) q.PosM = CFrame.new(11056.1445, -2001.6717, 10117.4493)
        elseif lvl <= 2724 then
            q.Mon = "High Disciple" q.NameMon = "High Disciple" q.QName = "SubmergedQuest3" q.QData = 1 q.PosQ = CFrame.new(9636.52441, -1992.19507, 9609.52832) q.PosM = CFrame.new(9828.087890625, -1940.908935546875, 9693.0634765625)
        elseif lvl >= 2725 then
            q.Mon = "Grand Devotee" q.NameMon = "Grand Devotee" q.QName = "SubmergedQuest3" q.QData = 2 q.PosQ = CFrame.new(9636.52441, -1992.19507, 9609.52832) q.PosM = CFrame.new(9557.5849609375, -1928.0404052734375, 9859.1826171875)
        end
    end

    return q
end

spawn(function()
    while task.wait(1) do
        pcall(function()
            local points = plr.Data.Points.Value
            if points > 0 then
                if plr.Data.Stats.Melee.Level.Value < 2800 then
                    CommF:InvokeServer("AddPoint", "Melee", points)
                elseif plr.Data.Stats.Defense.Level.Value < 2800 then
                    CommF:InvokeServer("AddPoint", "Defense", points)
                elseif plr.Data.Stats.Sword.Level.Value < 2800 then
                    CommF:InvokeServer("AddPoint", "Sword", points)
                end
            end
        end)
    end
end)

spawn(function()
    while Kaitun.Active do
        task.wait(0.3)
        pcall(function()
            local lvl = plr.Data.Level.Value
            local sea = plr.Data.World.Value or 1
            local q = QuestCheck()

            if lvl >= 700 and sea == 1 then
                CommF:InvokeServer("TravelDressrosa")
            end
            if lvl >= 1500 and sea == 2 then
                CommF:InvokeServer("TravelZou")
            end

            if Kaitun.AutoGodHuman and lvl >= 2000 then
                CommF:InvokeServer("BuyGodhuman")
            end

            if lvl >= 1100 and sea >= 2 and Kaitun.AutoRaid and plr.Data.Fragments.Value < Kaitun.FragmentGoal then
                local tool = plr.Character:FindFirstChildOfClass("Tool")
                if tool and tool.ToolTip == "Blox Fruit" then
                    local fruitName = tool.Name
                    local isHighValue = false
                    for _, high in pairs(HighValueFruits) do
                        if fruitName == high then
                            isHighValue = true
                            break
                        end
                    end
                    if isHighValue then return end
                end
                CommF:InvokeServer("RaidsNpc", "Select", "Random")
            end

            if Kaitun.AutoBuyHaki then
                CommF:InvokeServer("BuyHaki", "Geppo")
                CommF:InvokeServer("BuyHaki", "Buso")
                CommF:InvokeServer("BuyHaki", "Soru")
                CommF:InvokeServer("KenTalk", "Buy")
            end
            if plr.Character:FindFirstChild("HasBuso") then CommF:InvokeServer("Buso") end
            if plr.Character:FindFirstChild("KenHaki") then CommF:InvokeServer("Ken") end

            if Kaitun.AutoFruit then
                for _, v in pairs(workspace:GetChildren()) do
                    if v.Name:find("Fruit") and v:FindFirstChild("Handle") then
                        Tween(v.Handle.CFrame * CFrame.new(0,5,0))
                    end
                end
            end
            if Kaitun.AutoStoreFruit then
                for _, tool in pairs(plr.Backpack:GetChildren()) do
                    if tool.ToolTip == "Blox Fruit" then
                        CommF:InvokeServer("StoreFruit", tool:GetAttribute("OriginalName"), tool)
                    end
                end
            end

            if Kaitun.AutoLevel and Kaitun.SafeFarm then
                if plr.PlayerGui.Main.Quest.Visible == false then
                    Tween(q.PosQ)
                    if (plr.Character.HumanoidRootPart.Position - q.PosQ.Position).Magnitude < 15 then
                        CommF:InvokeServer("StartQuest", q.QName, q.QData)
                    end
                else
                    local mob = workspace.Enemies:FindFirstChild(q.Mon)
                    if mob and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
                        Tween(mob.HumanoidRootPart.CFrame * CFrame.new(0, 60, 0))
                    else
                        Tween(q.PosM * CFrame.new(0, 60, 0))
                    end
                end
            end
        end)
    end
end)
