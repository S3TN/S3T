local Library = loadstring(game:HttpGet("https://luacrack.site/index.php/araujozwx/raw/SourceBananaUi"))()

local Window = Library:CreateWindow({
    Title = "🌚Eclipse Hub🌑",
    Desc = "Complete Blox Fruits",
    Image = "rbxassetid://105245380363493"
})

local Tab1 = Window:AddTab("Info / Discord", "rbxassetid://7733960981") 
local Section1 = Tab1:AddLeftGroupbox("Community")

Section1:AddLabel("🎮 Eclipse Hub - Blox Fruits")
Section1:AddLabel("⚡ Version: 3.0")
Section1:AddLabel("👑 Developed by: Eclipse Team")
Section1:AddSeperator("📱 Social")

Section1:AddButton({
    Title = "📌 Join Discord",
    Callback = function()
        setclipboard("https://discord.gg/59v9rx6p")
        Library:Notify({
            Title = "Discord",
            Desc = "Link copied to clipboard!",
            Duration = 3
        })
    end
})

Section1:AddButton({
    Title = "📋 Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.gg/59v9rx6p")
        Library:Notify({
            Title = "Link Copied",
            Desc = "Paste in your browser to join Discord",
            Duration = 3
        })
    end
})

Section1:AddSeperator("📊 Information")

Section1:AddLabel("🌍 World: " .. (World1 and "World 1" or World2 and "World 2" or "World 3"))
Section1:AddLabel("📈 Level: " .. Lv)
Section1:AddLabel("💰 Beli: " .. plr.Data.Beli.Value)
Section1:AddLabel("💎 Fragments: " .. plr.Data.Fragments.Value)

local Tab2 = Window:AddTab("Settings", "rbxassetid://7733954611")
local Section2 = Tab2:AddLeftGroupbox("Combat Settings")

Section2:AddDropdown("SelectWeapon", {
    Title = "Select Weapon Type",
    Values = {"Melee","Sword","Blox Fruit","Gun"},
    Default = "Melee",
    Callback = function(Value)
        _G.ChooseWP = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.ChooseWP == "Melee" then
                for _,v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" then
                        if plr.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.SelectWeapon = v.Name              
                        end
                    end
                end
            elseif _G.ChooseWP == "Sword" then     
                for _,v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Sword" then
                        if plr.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.SelectWeapon = v.Name              
                        end
                    end
                end
            elseif _G.ChooseWP == "Gun" then     
                for _,v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Gun" then
                        if plr.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.SelectWeapon = v.Name              
                        end
                    end
                end
            elseif _G.ChooseWP == "Blox Fruit" then     
                for _,v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Blox Fruit" then
                        if plr.Backpack:FindFirstChild(tostring(v.Name)) then
                            _G.SelectWeapon = v.Name		                    
                        end
                    end
                end        
            end
        end)
    end
end)

Section2:AddToggle("AutoAttack", {
    Title = "Auto Attack (M1)",
    Default = true,
    Callback = function(Value)
        _G.Seriality = Value
    end
})

Section2:AddToggle("BringMob", {
    Title = "Bring Mobs",
    Default = true,
    Callback = function(Value)
        _B = Value
    end
})

Section2:AddToggle("AutoBuso", {
    Title = "Auto Buso Haki",
    Default = true,
    Callback = function(Value)
        Boud = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if Boud then
                local _HasBuso = {"HasBuso","Buso"}
                if not plr.Character:FindFirstChild(_HasBuso[1]) then replicated.Remotes.CommF_:InvokeServer(_HasBuso[2]) end
            end
        end)
    end
end)

Section2:AddToggle("RandomCFrame", {
    Title = "Random CFrame",
    Default = false,
    Callback = function(Value)
        RandomCFrame = Value
    end
})

Section2:AddToggle("AntiAFK", {
    Title = "Anti AFK",
    Default = true,
    Callback = function(Value)
        _G.AntiAFK = Value
    end
})

plr.Idled:connect(function()
    vim2:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vim2:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

Section2:AddSeperator("Stats Allocation")

Section2:AddSlider({
    Title = "Stats Amount",
    Min = 1,
    Max = 100,
    Default = 10,
    Callback = function(Value)
        pSats = Value
    end
})

Section2:AddToggle("AutoMeleeStat", {
    Title = "Auto Melee",
    Default = false,
    Callback = function(Value)
        _G.Auto_Melee = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Melee then statsSetings("Melee",pSats) end
        end)
    end
end)

Section2:AddToggle("AutoDefenseStat", {
    Title = "Auto Defense",
    Default = false,
    Callback = function(Value)
        _G.Auto_Defense = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Defense then statsSetings("Defense",pSats) end
        end)
    end
end)

Section2:AddToggle("AutoSwordStat", {
    Title = "Auto Sword",
    Default = false,
    Callback = function(Value)
        _G.Auto_Sword = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Sword then statsSetings("Sword",pSats) end
        end)
    end
end)

Section2:AddToggle("AutoGunStat", {
    Title = "Auto Gun",
    Default = false,
    Callback = function(Value)
        _G.Auto_Gun = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Gun then statsSetings("Gun",pSats) end
        end)
    end
end)

Section2:AddToggle("AutoFruitStat", {
    Title = "Auto Blox Fruit",
    Default = false,
    Callback = function(Value)
        _G.Auto_DevilFruit = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_DevilFruit then statsSetings("Devil",pSats) end
        end)
    end
end)

local Tab3 = Window:AddTab("Main", "rbxassetid://7733920644")
local Section3 = Tab3:AddLeftGroupbox("Auto Farm")

Section3:AddToggle("FarmLevel", {
    Title = "Auto Farm Level",
    Default = false,
    Callback = function(Value)
        _G.Level = Value
    end
})

spawn(function()
    while wait(Sec) do
        if _G.Level then
            pcall(function()
                local QuestTitle = plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(QuestTitle, QuestNeta()[5]) then replicated.Remotes.CommF_:InvokeServer("AbandonQuest") end
                if plr.PlayerGui.Main.Quest.Visible == false then
                    _tp(QuestNeta()[6])
                    if (Root.Position - QuestNeta()[6].Position).Magnitude <= 5 then replicated.Remotes.CommF_:InvokeServer("StartQuest", QuestNeta()[3], QuestNeta()[2]) end
                elseif plr.PlayerGui.Main.Quest.Visible == true then
                    if workspace.Enemies:FindFirstChild(QuestNeta()[1]) then
                        for i, v in pairs(workspace.Enemies:GetChildren()) do
                            if Attack.Alive(v) then
                                if v.Name == QuestNeta()[1] then
                                    if string.find(QuestTitle, QuestNeta()[5]) then
                                        repeat wait() Attack.Kill(v, _G.Level) until not _G.Level or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                                    else
                                        replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
                                    end
                                end
                            end
                        end
                    else _tp(QuestNeta()[4])
                        if replicated:FindFirstChild(QuestNeta()[1]) then _tp(replicated:FindFirstChild(QuestNeta()[1]).HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) end
                    end
                end
            end)
        end
    end
end)

Section3:AddToggle("FarmNearest", {
    Title = "Auto Farm Nearest",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmNear = Value
    end
})

spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoFarmNear then
                for i,v in pairs(workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") or v:FindFirstChild("HumanoidRootPart") then
                        if v.Humanoid.Health > 0 then
                            repeat wait() Attack.Kill(v,_G.AutoFarmNear) until not _G.AutoFarmNear or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            end
        end)
    end
end)

Section3:AddToggle("FactoryRaid", {
    Title = "Auto Factory Raid",
    Default = false,
    Callback = function(Value)
        _G.AutoFactory = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.AutoFactory then
                local v = GetConnectionEnemies("Core")
                if v then
                    repeat wait()
                        EquipWeapon(_G.SelectWeapon)
                        _tp(CFrame.new(448.46756, 199.356781, -441.389252))
                    until v.Humanoid.Health <= 0 or _G.AutoFactory == false
                else
                    _tp(CFrame.new(448.46756, 199.356781, -441.389252))
                end
            end
        end)
    end
end)

Section3:AddToggle("PirateRaid", {
    Title = "Auto Pirate Raid",
    Default = false,
    Callback = function(Value)
        _G.AutoRaidCastle = Value
    end
})

spawn(function()
    while wait(Sec) do
        if _G.AutoRaidCastle then
            pcall(function()
                local CFrameCastleRaid = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-09, 0.380223751, 3.5881019e-08, 1, -1.06665446e-07, -0.380223751, 1.12297109e-07, 0.924894512)
                if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - Root.Position).Magnitude <= 500 then
                    for i,v in pairs(workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if v.Name then
                                if (v.HumanoidRootPart.Position - Root.Position).Magnitude <= 2000 then
                                    repeat wait() Attack.Kill(v,_G.AutoRaidCastle) until not _G.AutoRaidCastle or not v.Parent or v.Humanoid.Health <= 0 or not workspace.Enemies:FindFirstChild(v.Name)
                                end
                            end
                        end
                    end
                else
                    local Castle_Mob = {"Galley Pirate","Galley Captain","Raider","Mercenary","Vampire","Zombie","Snow Trooper","Winter Warrior","Lab Subordinate","Horned Warrior","Magma Ninja","Lava Pirate","Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior","Snow Lurker","Sea Soldier","Water Fighter"}
                    for i = 1,#Castle_Mob do
                        if replicated:FindFirstChild(Castle_Mob[i]) then
                            for _,v in pairs(replicated:GetChildren()) do
                                if table.find(Castle_Mob, v.Name) then _tp(CFrameCastleRaid) end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

Section3:AddSeperator("Boss Farm")

Section3:AddDropdown("SelectBoss", {
    Title = "Select Boss",
    Values = Boss,
    Default = Boss[1] or "No Boss",
    Callback = function(Value)
        _G.FindBoss = Value
    end
})

Section3:AddToggle("AutoBoss", {
    Title = "Auto Boss",
    Default = false,
    Callback = function(Value)
        _G.AutoBoss = Value
    end
})

spawn(function()
    while wait(Sec) do
        if _G.AutoBoss then
            pcall(function()
                local v = GetConnectionEnemies(_G.FindBoss)
                if v then
                    repeat wait() Attack.Kill(v,_G.AutoBoss) until not _G.AutoBoss or v.Humanoid.Health <= 0
                else
                    if QuestBeta()[4] then _tp(QuestBeta()[4]) end
                end
            end)
        end
    end
end)

Section3:AddSeperator("Material Farm")

Section3:AddDropdown("SelectMaterial", {
    Title = "Select Material",
    Values = MaterialList,
    Default = MaterialList[1] or "No Material",
    Callback = function(Value)
        getgenv().SelectMaterial = Value
    end
})

Section3:AddToggle("AutoMaterial", {
    Title = "Auto Material",
    Default = false,
    Callback = function(Value)
        getgenv().AutoMaterial = Value
    end
})

spawn(function()
    local function processEnemy(v, EnemyName)
        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            if v.Name == EnemyName then repeat wait() Attack.Kill(v,getgenv().AutoMaterial) until not getgenv().AutoMaterial or not v.Parent or v.Humanoid.Health <= 0 end
        end
    end
    local function handleEnemySpawns()
        for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
            for _, EnemyName in ipairs(MMon) do
                if string.find(v.Name, EnemyName) then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude >= 10 then
                        _tp(v.CFrame * Pos)
                    end
                end
            end
        end
    end
    while wait() do
        if getgenv().AutoMaterial then
            pcall(function()
                if getgenv().SelectMaterial then MaterialMon(getgenv().SelectMaterial) _tp(MPos) end
                for _, EnemyName in ipairs(MMon) do
                    for _, v in pairs(workspace.Enemies:GetChildren()) do processEnemy(v, EnemyName) end
                end
                handleEnemySpawns()
            end)
        end
    end
end)

local Tab4 = Window:AddTab("Quests", "rbxassetid://7733954611")
local Section4 = Tab4:AddLeftGroupbox("Legendary Items")

Section4:AddToggle("AutoSaber", {
    Title = "Auto Saber Sword",
    Default = false,
    Callback = function(Value)
        _G.AutoSaber = Value
    end
})

spawn(function()
    while wait(.2) do
        pcall(function()
            if _G.AutoSaber and plr.Data.Level.Value >= 200 and not plr.Backpack:FindFirstChild("Saber") and not plr.Character:FindFirstChild("Saber") then
                if workspace.Map.Jungle.Final.Part.Transparency == 0 then
                    if workspace.Map.Jungle.QuestPlates.Door.Transparency == 0 then
                        if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                            _tp(plr.Character.HumanoidRootPart.CFrame)
                            wait(0.5)
                            plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate1.Button.CFrame
                            wait(0.5)
                            plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate2.Button.CFrame
                            wait(0.5)
                            plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate3.Button.CFrame
                            wait(0.5)
                            plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate4.Button.CFrame
                            wait(0.5)
                            plr.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate5.Button.CFrame
                            wait(0.5) 
                        else
                            _tp(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))
                        end
                    else
                        if workspace.Map.Desert.Burn.Part.Transparency == 0 then
                            if plr.Backpack:FindFirstChild("Torch") or plr.Character:FindFirstChild("Torch") then
                                EquipWeapon("Torch")
                                firetouchinterest(plr.Character.Torch.Handle,workspace.Map.Desert.Burn.Fire,0)
                                firetouchinterest(plr.Character.Torch.Handle,workspace.Map.Desert.Burn.Fire,1)
                                _tp(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
                            else
                                _tp(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408)) end
                        else
                            if replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
                                replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
                                wait(0.5)
                                EquipWeapon("Cup")
                                wait(0.5)
                                replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",plr.Character.Cup)
                                wait(Sec)
                                replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") 
                            else
                                if replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
                                    replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                elseif replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
                                    if workspace.Enemies:FindFirstChild("Mob Leader") or replicated:FindFirstChild("Mob Leader") then
                                        _tp(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559))
                                        for i,v in pairs(workspace.Enemies:GetChildren()) do
                                            if v.Name == "Mob Leader" and Attack.Alive(v) then
                                                repeat task.wait() Attack.Kill(v, _G.AutoSaber) until v.Humanoid.Health <= 0 or _G.AutoSaber == false
                                            end
                                        end
                                    end
                                elseif replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
                                    replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                    EquipWeapon("Relic")
                                    _tp(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
                                end
                            end
                        end
                    end
                else
                    if workspace.Enemies:FindFirstChild("Saber Expert") or replicated:FindFirstChild("Saber Expert") then
                        for _,v in pairs(workspace.Enemies:GetChildren()) do
                            if v.Name == "Saber Expert" and Attack.Alive(v) then
                                repeat task.wait() Attack.Kill(v, _G.AutoSaber) until v.Humanoid.Health <= 0 or _G.AutoSaber == false
                                if v.Humanoid.Health <= 0 then replicated.Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic") end		      
                            end
                        end
                    else
                        _tp(CFrame.new(-1401.85046, 29.9773273, 8.81916237, 0.85820812, 8.76083845e-08, 0.513301849, -8.55007443e-08, 1, -2.77243419e-08, -0.513301849, -2.00944328e-08, 0.85820812))
                    end
                end
            end
        end)
    end
end)

Section4:AddToggle("AutoPole", {
    Title = "Auto Pole V1",
    Default = false,
    Callback = function(Value)
        _G.AutoPole = Value
    end
})

spawn(function()
    while wait(Sec) do
        if _G.AutoPole then
            pcall(function()
                local v = GetConnectionEnemies("Thunder God")
                if v then
                    repeat task.wait() Attack.Kill(v, _G.AutoPole) until not _G.AutoPole or not v.Parent or v.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188))
                end
            end)
        end
    end
end)

Section4:AddToggle("AutoPoleV2", {
    Title = "Auto Pole V2",
    Default = false,
    Callback = function(Value)
        _G.AutoPoleV2 = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.AutoPoleV2 then        
                if not GetBP("Pole (1st Form)") then replicated.Remotes.CommF_:InvokeServer("LoadItem","Pole (1st Form)") end
                if not GetBP("Pole (2nd Form)") then replicated.Remotes.CommF_:InvokeServer("LoadItem","Pole (2nd Form)") end      
                if GetBP("Pole (1st Form)") and GetBP("Pole (1st Form)").Level.Value <= 179 then _G.Level = true elseif GetBP("Pole (1st Form)") and GetBP("Pole (1st Form)").Level.Value >= 180 then _G.Level = false end	   
                if not GetBP("Rumble Fruit") then return end
                if GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("Z") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("X") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("C") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("V") and GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("F") then
                    _G.SelectChip = nil
                    _G.Raiding = false
                    _G.Auto_Awakener = false
                    if plr.Data.Fragments.Value >= 5000 then
                        replicated.Remotes.CommF_:InvokeServer("Thunder God", "Talk") wait(Sec)
                        replicated.Remotes.CommF_:InvokeServer("Thunder God", "Sure")
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("Awakener","Check") == nil or replicated.Remotes.CommF_:InvokeServer("Awakener","Check") == 0 then
                    _G.SelectChip = "Rumble"
                    local Buying = replicated.Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip)
                    if Buying then Buying:Stop() end
                    _G.Raiding = true
                    _G.Auto_Awakener = true
                end	   
            end
        end)
    end
end)

Section4:AddToggle("AutoYama", {
    Title = "Auto Yama",
    Default = false,
    Callback = function(Value)
        _G.Auto_Yama = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Yama then
                if replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") < 30 then
                    _G.FarmEliteHunt = true
                elseif replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") > 30 then
                    _G.FarmEliteHunt = false
                    if (workspace.Map.Waterfall.SealedKatana.Handle.Position-plr.Character.HumanoidRootPart.Position).Magnitude >= 20 then
                        _tp(workspace.Map.Waterfall.SealedKatana.Handle.CFrame)
                        local zx = GetConnectionEnemies("Ghost")
                        if zx then
                            repeat wait() Attack.Kill(zx,_G.Auto_Yama) until zx.Humanoid.Health <= 0 or not zx.Parent or not _G.Auto_Yama               
                            fireclickdetector(workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
                        end
                    end
                end
            end
        end)
    end
end)

Section4:AddToggle("AutoTushita", {
    Title = "Auto Tushita",
    Default = false,
    Callback = function(Value)
        _G.Auto_Tushita = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Tushita then
                if workspace.Map.Turtle:FindFirstChild("TushitaGate") then
                    if not GetBP("Holy Torch") then
                        _tp(CFrame.new(5148.03613, 162.352493, 910.548218))
                        wait(0.7)
                    else
                        EquipWeapon("Holy Torch")
                        task.wait(1)
                        repeat task.wait() _tp(CFrame.new(-10752, 417, -9366)) until not _G.Auto_Tushita or (CFrame.new(-10752, 417, -9366).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
                        wait(.7)
                        repeat task.wait() _tp(CFrame.new(-11672, 334, -9474)) until not _G.Auto_Tushita or (CFrame.new(-11672, 334, -9474).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
                        wait(.7)
                        repeat task.wait() _tp(CFrame.new(-12132, 521, -10655)) until not _G.Auto_Tushita or (CFrame.new(-12132, 521, -10655).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
                        wait(.7)
                        repeat task.wait() _tp(CFrame.new(-13336, 486, -6985)) until not _G.Auto_Tushita or (CFrame.new(-13336, 486, -6985).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
                        wait(.7)
                        repeat task.wait() _tp(CFrame.new(-13489, 332, -7925)) until not _G.Auto_Tushita or (CFrame.new(-13489, 332, -7925).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
                    end
                else
                    local v = GetConnectionEnemies("Longma")
                    if v then repeat task.wait() Attack.Kill(v,_G.Auto_Tushita) until v.Humanoid.Health <= 0 or not _G.Auto_Tushita or not v.Parent
                    else 
                        if replicated:FindFirstChild("Longma") then _tp(replicated:FindFirstChild("Longma").HumanoidRootPart.CFrame * CFrame.new(0,40,0)) end
                    end                     
                end
            end
        end)
    end
end)

Section4:AddToggle("AutoCDK", {
    Title = "Auto CDK",
    Default = false,
    Callback = function(Value)
        _G.CDK = Value
    end
})

spawn(function()    
    while wait(Sec) do
        pcall(function()
            if _G.CDK then
                replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
                replicated.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
                replicated.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Boss")
                local v = GetConnectionEnemies("Cursed Skeleton Boss")
                if v then
                    repeat wait()
                        if plr.Character:FindFirstChild("Yama") or plr.Backpack:FindFirstChild("Yama") then EquipWeapon("Yama")
                        elseif plr.Character:FindFirstChild("Tushita") or plr.Backpack:FindFirstChild("Tushita") then EquipWeapon("Tushita")                                    
                        end _tp(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                    until not _G.CDK or not v.Parent or v.Humanoid.Health <= 0                                
                else
                    _tp(CFrame.new(-12318.193359375, 601.9518432617188, -6538.662109375)) wait(.5)
                    _tp(workspace.Map.Turtle.Cursed.BossDoor.CFrame)
                end
            end
        end)
    end
end)

Section4:AddSeperator("Elite Hunter")

Section4:AddToggle("AutoElite", {
    Title = "Auto Elite Hunter",
    Default = false,
    Callback = function(Value)
        _G.FarmEliteHunt = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.FarmEliteHunt then
                if plr.PlayerGui.Main.Quest.Visible == true then
                    if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") or string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") then
                        for i,v in pairs(replicated:GetChildren()) do
                            if string.find(v.Name,"Diablo") or string.find(v.Name,"Urban") or string.find(v.Name,"Deandre") then
                                _tp(v.HumanoidRootPart.CFrame)				
                            end	
                        end
                        for i,v in pairs(Enemies:GetChildren()) do
                            if (string.find(v.Name,"Diablo") or string.find(v.Name,"Urban") or string.find(v.Name,"Deandre")) and Attack.Alive(v) then
                                repeat wait() Attack.Kill(v, _G.FarmEliteHunt) until not _G.FarmEliteHunt or plr.PlayerGui.Main.Quest.Visible == false or not v.Parent or v.Humanoid.Health <=0
                            end
                        end           
                    end        
                else
                    replicated.Remotes.CommF_:InvokeServer("EliteHunter")
                end
            end
        end)
    end
end)

local Tab5 = Window:AddTab("Melee", "rbxassetid://7733920644")
local Section5 = Tab5:AddLeftGroupbox("Fighting Styles")

Section5:AddToggle("AutoSuperhuman", {
    Title = "Auto Superhuman",
    Default = false,
    Callback = function(Value)
        _G.Auto_SuperHuman = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_SuperHuman then
                local M_Beli = plr.Data.Beli.Value
                local M_Frag = plr.Data.Fragments.Value
                if plr:FindFirstChild("WeaponAssetCache") then
                    if not GetBP("Superhuman") then                    
                        if not GetBP("Black Leg") then
                            if (M_Beli >= 150000) then replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg") end
                        elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value < 299 then _G.Level = true elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value >= 300 then _G.Level = false end                        
                        if not GetBP("Electro") then
                            if (M_Beli >= 500000) then replicated.Remotes.CommF_:InvokeServer("BuyElectro") end
                        elseif GetBP("Electro") and GetBP("Electro").Level.Value < 299 then _G.Level = true elseif GetBP("Electro") and GetBP("Electro").Level.Value >= 300 then _G.Level = false end                        
                        if not GetBP("Fishman Karate") then
                            if (M_Beli >= 750000) then replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate") end
                        elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value < 299 then _G.Level = true elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value >= 300 then _G.Level = false end                        
                        if not GetBP("Dragon Claw") then
                            if (M_Frag >= 1500) then replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") end
                        elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value < 299 then _G.Level = true elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value >= 300 then _G.Level = false end
                        replicated.Remotes.CommF_:InvokeServer("BuySuperhuman")          
                    end
                end        
            end
        end)
    end
end)

Section5:AddToggle("AutoDeathStep", {
    Title = "Auto Death Step",
    Default = false,
    Callback = function(Value)
        _G.AutoDeathStep = Value
    end
})

spawn(function()
    while wait(Sec) do
        if _G.AutoDeathStep then
            pcall(function()
                if plr:FindFirstChild("WeaponAssetCache") then  
                    if not GetBP("Death Step") then          
                        if not GetBP("Black Leg") then replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg") end
                        if GetBP("Black Leg") and GetBP("Black Leg").Level.Value >= 400 then replicated.Remotes.CommF_:InvokeServer("BuyDeathStep") _G.Level = false elseif GetBP("Black Leg") and GetBP("Black Leg").Level.Value < 399 then _G.Level = true end
                        if GetBP("Black Leg") or GetBP("Black Leg").Level.Value >= 400 then
                            if workspace.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency == 0 then            
                                if GetBP("Library Key") then repeat wait() _tp(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)) until not _G.AutoDeathStep or (Root.Position == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position)
                                    if (Root.CFrame == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375)) then replicated.Remotes.CommF_:InvokeServer("BuyDeathStep") end     
                                elseif not GetBP("Library Key") then
                                    local v = GetConnectionEnemies("Awakened Ice Admiral")
                                    if v then repeat wait() Attack.Kill(v,_G.AutoDeathStep) until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoDeathStep == false or GetBP("Library Key") or GetBP("Death Step")
                                    else _tp(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
                                    end
                                end		    
                            end
                        end          
                    end
                end
            end)
        end
    end
end)

Section5:AddToggle("AutoSharkman", {
    Title = "Auto Sharkman",
    Default = false,
    Callback = function(Value)
        _G.Auto_SharkMan_Karate = Value
    end
})

spawn(function() 
    while wait(Sec) do
        if _G.Auto_SharkMan_Karate then
            pcall(function()
                if plr:FindFirstChild("WeaponAssetCache") then  
                    if not GetBP("Sharkman Karate") then          
                        if not GetBP("Fishman Karate") then replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate") end
                        if GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value >= 400 then replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate") _G.Level = false elseif GetBP("Fishman Karate") and GetBP("Fishman Karate").Level.Value < 399 then _G.Level = true end
                        if GetBP("Fishman Karate") or GetBP("Fishman Karate").Level.Value >= 400 then           
                            if GetBP("Water Key") then
                                if string.find(replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then  
                                    if GetBP("Water Key") then
                                        repeat wait() _tp(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365)) until not _G.Auto_SharkMan_Karate or (Root.Position == CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position)
                                        replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                                    end
                                end
                            elseif not GetBP("Water Key") then
                                local v = GetConnectionEnemies("Tide Keeper")
                                if v then repeat wait() Attack.Kill(v,_G.Auto_SharkMan_Karate) until not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_SharkMan_Karate == false or GetBP("Water Key") or GetBP("Sharkman Karate")		
                                else _tp(CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625))
                                end
                            end		                  
                        end          
                    end
                end
            end)
        end
    end
end)

Section5:AddToggle("AutoElectricClaw", {
    Title = "Auto Electric Claw",
    Default = false,
    Callback = function(Value)
        _G.Auto_Electric_Claw = Value
    end
})

spawn(function()
    while wait(Sec) do
        if _G.Auto_Electric_Claw then
            pcall(function()
                if plr:FindFirstChild("WeaponAssetCache") then 
                    if not GetBP("Electro") then replicated.Remotes.CommF_:InvokeServer("BuyElectro") end        
                    if GetBP("Electro") and GetBP("Electro").Level.Value >= 400 then
                        if replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start") == nil then notween(CFrame.new(-12548, 337, -7481)) end
                        replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw")
                    elseif GetBP("Electro") and GetBP("Electro").Level.Value < 400 then
                        repeat _G.AutoFarm_Bone = true wait() until not _G.Auto_Electric_Claw or GetBP("Electric Claw") _G.AutoFarm_Bone = false
                    end
                end       
            end)
        end
    end
end)

Section5:AddToggle("AutoDragonTalon", {
    Title = "Auto Dragon Talon",
    Default = false,
    Callback = function(Value)
        _G.AutoDragonTalon = Value
    end
})

spawn(function()
    while wait(Sec) do
        if _G.AutoDragonTalon then
            pcall(function()
                if plr:FindFirstChild("WeaponAssetCache") then 
                    if not GetBP("Dragon Claw") then replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") end        
                    if GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value >= 400 then replicated.Remotes.CommF_:InvokeServer("Bones","Buy",1,1) replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon")
                    elseif GetBP("Dragon Claw") and GetBP("Dragon Claw").Level.Value < 400 then repeat _G.AutoFarm_Bone = true wait() until not _G.AutoDragonTalon or GetBP("Dragon Talon") _G.AutoFarm_Bone = false
                    end         
                end
            end)
        end
    end
end)

Section5:AddToggle("AutoGodhuman", {
    Title = "Auto Godhuman",
    Default = false,
    Callback = function(Value)
        _G.Auto_God_Human = Value
    end
})

spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_God_Human then
                if replicated.Remotes.CommF_:InvokeServer("BuyGodhuman",true) == "Bring me 20 Fish Tails, 20 Magma Ore, 10 Dragon Scales and 10 Mystic Droplets." then
                    if GetM("Dragon Scale") == false or GetM("Dragon Scale") < 10 then
                        if World3 then
                            Lv = 1575
                            _G.Level = true
                        else
                            replicated.Remotes.CommF_:InvokeServer("TravelZou")
                        end
                    elseif GetM("Fish Tail") == false or GetM("Fish Tail") < 20 then
                        if World3 then
                            Lv = 1775
                            _G.Level = true
                        else
                            replicated.Remotes.CommF_:InvokeServer("TravelZou")
                        end
                    elseif GetM("Mystic Droplet") == false or GetM("Mystic Droplet") < 10 then
                        if World2 then
                            Lv = 1425
                            _G.Level = true
                        else
                            replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                        end
                    elseif GetM("Magma Ore") == false or GetM("Magma Ore") < 20 then
                        if World2 then
                            Lv = 1175
                            _G.Level = true
                        else
                            replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                        end  
                    end
                elseif replicated.Remotes.CommF_:InvokeServer("BuyGodhuman",true) == 3 then
                    return nil
                else
                    replicated.Remotes.CommF_:InvokeServer("BuyGodhuman")
                end
            end
        end)
    end
end)

local Tab6 = Window:AddTab("Sea Events", "rbxassetid://7733960981")
local Section6 = Tab6:AddLeftGroupbox("Sea Creatures")

Section6:AddToggle("AutoShark", {
    Title = "Auto Shark",
    Default = false,
    Callback = function(Value)
        _G.Shark = Value
    end
})

Section6:AddToggle("AutoTerrorShark", {
    Title = "Auto Terror Shark",
    Default = false,
    Callback = function(Value)
        _G.TerrorShark = Value
    end
})

Section6:AddToggle("AutoSeaBeast", {
    Title = "Auto Sea Beast",
    Default = false,
    Callback = function(Value)
        _G.SeaBeast1 = Value
    end
})

Section6:AddToggle("AutoLeviathan", {
    Title = "Auto Leviathan",
    Default = false,
    Callback = function(Value)
        _G.Leviathan1 = Value
    end
})

spawn(function()
    while wait() do
        pcall(function()	
            if _G.Shark then local a={"Shark"}if CheckShark()then for b,c in pairs(workspace.Enemies:GetChildren())do if table.find(a,c.Name)then if Attack.Alive(c)then repeat task.wait()Attack.Kill(c,_G.Shark)until _G.Shark==false or not c.Parent or c.Humanoid.Health<=0 end end end end end
            if _G.TerrorShark then local a={"Terrorshark"}if CheckTerrorShark()then for b,c in pairs(workspace.Enemies:GetChildren())do if table.find(a,c.Name)then if Attack.Alive(c)then repeat task.wait()Attack.KillSea(c,_G.TerrorShark)until _G.TerrorShark==false or not c.Parent or c.Humanoid.Health<=0 end end end end end
            if _G.SeaBeast1 then if workspace.SeaBeasts:FindFirstChild("SeaBeast1")then for a,b in pairs(workspace.SeaBeasts:GetChildren())do if b:FindFirstChild("HumanoidRootPart")and b:FindFirstChild("Health")and b.Health.Value>0 then repeat task.wait()spawn(function()_tp(CFrame.new(b.HumanoidRootPart.Position.X,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y+200,b.HumanoidRootPart.Position.Z))end)if plr:DistanceFromCharacter(b.HumanoidRootPart.CFrame.Position)<=500 then MousePos=b.HumanoidRootPart.Position;if CheckF()then weaponSc("Blox Fruit")Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")else Useskills("Melee","Z")Useskills("Melee","X")Useskills("Melee","C")wait(.1)Useskills("Sword","Z")Useskills("Sword","X")wait(.1)Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")wait(.1)Useskills("Gun","Z")Useskills("Gun","X")end end until _G.SeaBeast1==false or not b:FindFirstChild("HumanoidRootPart")or not b.Parent or b.Health.Value<=0 end end end end
            if _G.Leviathan1 then if workspace.SeaBeasts:FindFirstChild("Leviathan")then for a,b in pairs(workspace.SeaBeasts:GetChildren())do if b:FindFirstChild("HumanoidRootPart")and b:FindFirstChild("Leviathan Segment")and b:FindFirstChild("Health")and b.Health.Value>0 then repeat task.wait()spawn(function()_tp(CFrame.new(b.HumanoidRootPart.Position.X,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y+200,b.HumanoidRootPart.Position.Z))end)if plr:DistanceFromCharacter(b.HumanoidRootPart.CFrame.Position)<=500 then MousePos=b:FindFirstChild("Leviathan Segment").Position;if CheckF()then weaponSc("Blox Fruit")Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")else Useskills("Melee","Z")Useskills("Melee","X")Useskills("Melee","C")wait(.1)Useskills("Sword","Z")Useskills("Sword","X")wait(.1)Useskills("Blox Fruit","Z")Useskills("Blox Fruit","X")Useskills("Blox Fruit","C")wait(.1)Useskills("Gun","Z")Useskills("Gun","X")end end until _G.Leviathan1==false or not b:FindFirstChild("HumanoidRootPart")or not b.Parent or b.Health.Value<=0 end end end end
        end)
    end
end)

Section6:AddSeperator("Boats")

Section6:AddDropdown("SelectBoat", {
    Title = "Select Boat",
    Values = {"Guardian","PirateGrandBrigade","MarineGrandBrigade","PirateBrigade","MarineBrigade","PirateSloop","MarineSloop","Beast Hunter"},
    Default = "Guardian",
    Callback = function(Value)
        _G.SelectedBoat = Value
    end
})

Section6:AddToggle("AutoSail", {
    Title = "Auto Sail Boat",
    Default = false,
    Callback = function(Value)
        _G.SailBoats = Value
    end
})

spawn(function()
    while wait() do
        if _G.SailBoats then 
            pcall(function()        
                local myBoat = CheckBoat()
                if not myBoat and not(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)and not(CheckEnemiesBoat()and _G.FishBoat)and not(CheckSeaBeast()and _G.SeaBeast1)and not(_G.PGB and CheckPirateGrandBrigade())and not(_G.HCM and CheckHauntedCrew())and not(_G.Leviathan1 and CheckLeviathan())then
                    local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
                    TeleportToTarget(buyBoatCFrame)
                    if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) end
                elseif myBoat and not(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)and not(CheckEnemiesBoat()and _G.FishBoat)and not(CheckSeaBeast()and _G.SeaBeast1)and not(_G.PGB and CheckPirateGrandBrigade())and not(_G.HCM and CheckHauntedCrew())and not(_G.Leviathan1 and CheckLeviathan())then
                    if plr.Character.Humanoid.Sit == false then
                        local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                        _tp(boatSeatCFrame)
                    else                         
                        if _G.DangerSc == "Lv 1" then CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143)
                        elseif _G.DangerSc == "Lv 2" then CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032)
                        elseif _G.DangerSc == "Lv 3" then CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774)
                        elseif _G.DangerSc == "Lv 4" then CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012)
                        elseif _G.DangerSc == "Lv 5" then CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023)
                        elseif _G.DangerSc == "Lv 6" then CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584)
                        elseif _G.DangerSc == "Lv Infinite" then CFrameSelectedZone = CFrame.new(-10000000, 31, 37016.25)
                        end           
                        repeat wait() 
                            if (not _G.FishBoat and CheckEnemiesBoat()) or (not _G.PGB and CheckPirateGrandBrigade()) or (not _G.TerrorShark and CheckTerrorShark()) then
                                _tp(CFrameSelectedZone * CFrame.new(0,150,0))
                            else
                                _tp(CFrameSelectedZone)
                            end           
                        until _G.SailBoats==false or(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)or CheckSeaBeast()and _G.SeaBeast1 or CheckEnemiesBoat()and _G.FishBoat or _G.Leviathan1 and CheckLeviathan() or _G.HCM and CheckHauntedCrew() or _G.PGB and CheckPirateGrandBrigade() or plr.Character:WaitForChild("Humanoid").Sit==false plr.Character.Humanoid.Sit = false
                    end
                end
            end)
        end
    end
end)

local Tab7 = Window:AddTab("Mirage", "rbxassetid://7733954611")
local Section7 = Tab7:AddLeftGroupbox("Mirage Island")

Section7:AddToggle("FindMirage", {
    Title = "Auto Find Mirage",
    Default = false,
    Callback = function(Value)
        _G.FindMirage = Value
    end
})

spawn(function()
    while wait() do
        if _G.FindMirage then 
            pcall(function()
                if not workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island", true) then                
                    local myBoat = CheckBoat()
                    if not myBoat then
                        local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
                        TeleportToTarget(buyBoatCFrame)
                        if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) end
                    else
                        if plr.Character.Humanoid.Sit == false then
                            local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                            _tp(boatSeatCFrame)
                        else            
                            repeat wait()
                                local targetDestination = CFrame.new(-10000000, 31, 37016.25)
                                if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                                    _tp(CFrame.new(-10000000, 150, 37016.25))
                                else
                                    _tp(CFrame.new(-10000000, 31, 37016.25))
                                end
                            until not _G.FindMirage or (targetDestination.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace["_WorldOrigin"].Locations:FindFirstChild("Mirage Island") or plr.Character.Humanoid.Sit == false plr.Character.Humanoid.Sit = false
                        end
                    end
                else
                    _tp(workspace.Map.MysticIsland.Center.CFrame*CFrame.new(0,300,0))
                end
            end)
        end
    end
end)

Section7:AddToggle("AutoGear", {
    Title = "Auto Collect Gear",
    Default = false,
    Callback = function(Value)
        _G.TPGEAR = Value
    end
})

spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.TPGEAR then
                for i,v in pairs(workspace.Map:FindFirstChild('MysticIsland'):GetChildren()) do
                    if v.Name == "Part" then
                        if v.ClassName == "MeshPart" then _tp(v.CFrame) end
                    end
                end
            end
        end
    end)
end)

Section7:AddToggle("AutoSkullGuitar", {
    Title = "Auto Skull Guitar",
    Default = false,
    Callback = function(Value)
        _G.Auto_Soul_Guitar = Value
    end
})

task.spawn(function()
    while wait() do
        if _G.Auto_Soul_Guitar then 
            pcall(function() 
                local v = GetConnectionEnemies("Living Zombie")
                if v then 
                    v.HumanoidRootPart.CFrame = CFrame.new(-10138.3974609375, 138.6524658203125, 5902.89208984375)
                    v.Head.CanCollide = false
                    v.Humanoid.Sit = false
                    v.HumanoidRootPart.CanCollide = false
                    v.Humanoid.JumpPower = 0
                    v.Humanoid.WalkSpeed = 0
                    if v.Humanoid:FindFirstChild('Animator') then v.Humanoid:FindFirstChild('Animator'):Destroy() end
                end    
            end)
        end
    end
end)

spawn(function()
    repeat task.wait() until _G.Auto_Soul_Guitar
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Soul_Guitar then
                if World3 then
                    replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
                    replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
                    if replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check") == nil then
                        _tp(CFrame.new(-8655.0166015625, 141.3166961669922, 6160.0224609375))
                        replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
                        replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
                    elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Swamp == false then
                        local v = GetConnectionEnemies("Living Zombie")
                        if v then repeat task.wait() Attack.Kill(v,_G.Auto_Soul_Guitar) until not _G.Auto_Soul_Guitar or v.Humanoid.Health <= 0 or not v.Parent or workspace.Map["Haunted Castle"].SwampWater.Color ~= Color3.fromRGB(117, 0, 0)
                        else _tp(CFrame.new(-10170.7275390625, 138.6524658203125, 5934.26513671875))
                        end
                    elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Gravestones == false then
                        GetFirePlacard("7","Left")
                        GetFirePlacard("6","Left")
                        GetFirePlacard("5","Left")
                        GetFirePlacard("4","Right")
                        GetFirePlacard("3","Left")
                        GetFirePlacard("2","Right")
                        GetFirePlacard("1","Right")
                    elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Ghost == false then
                        replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost")
                        replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost", true)
                    elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Trophies == false then
                        _tp(CFrame.new(-9532.8232421875, 6.471667766571045, 6078.068359375))
                        repeat wait()
                            local z1 = getRT(1)
                            local _z1 = getT(1)
                            if z1 and _z1 then
                                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector"))
                            end
                        until z1 == _z1
                        repeat wait()
                            local z2 = getRT(2)
                            local _z2 = getT(3)
                            if z2 and _z2 then
                                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment3:FindFirstChild("ClickDetector"))
                            end
                        until z2 == _z2
                        repeat wait()
                            local z3 = getRT(3)
                            local _z3 = getT(4)
                            if z3 and _z3 then
                                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment4:FindFirstChild("ClickDetector"))
                            end
                        until z3 == _z3
                        repeat wait()
                            local z4 = getRT(4)
                            local _z4 = getT(7)
                            if z4 and _z4 then
                                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment7:FindFirstChild("ClickDetector"))
                            end
                        until z4 == _z4
                        repeat wait()
                            local z5 = getRT(5)
                            local _z5 = getT(10)
                            if z5 and _z5 then
                                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment10:FindFirstChild("ClickDetector"))    
                            end
                        until z5 == _z5
                        repeat wait()    
                            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment2:FindFirstChild("ClickDetector"))
                            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment5:FindFirstChild("ClickDetector"))
                            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment6:FindFirstChild("ClickDetector"))
                            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment8:FindFirstChild("ClickDetector"))
                            fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment9:FindFirstChild("ClickDetector"))       
                        until workspace.Map["Haunted Castle"].Tablet.Segment2.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment5.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment6.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment8.Line.Rotation.Z == 0 or workspace.Map["Haunted Castle"].Tablet.Segment9.Line.Rotation.Z == 0
                    elseif replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress","Check").Pipes == false then
                        _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
                        _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                        _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                        _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
                        _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                        fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                    end
                end
            end
        end)
    end
end)

Section7:AddSeperator("Race V4")

Section7:AddToggle("AutoTrainV4", {
    Title = "Auto Train V4",
    Default = false,
    Callback = function(Value)
        _G.AcientOne = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.AcientOne then
                local BonesTable = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}
                for i=1,#BonesTable do
                    if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then
                        vim1:SendKeyEvent(true, "Y", false, game)
                        replicated.Remotes.CommF_:InvokeServer("UpgradeRace","Buy")
                        _tp(CFrame.new(-8987.041015625, 215.862060546875, 5886.71044921875))
                    elseif plr.Character:FindFirstChild("RaceTransformed").Value == false then
                        local v = GetConnectionEnemies(BonesTable)
                        if v then repeat wait() Attack.Kill(v, _G.AcientOne) until _G.AcientOne == false or v.Humanoid.Health <= 0 or not v.Parent
                        else _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)) 
                        end
                    end
                end
            end
        end)
    end
end)

Section7:AddToggle("AutoTrials", {
    Title = "Auto Complete Trials",
    Default = false,
    Callback = function(Value)
        _G.Complete_Trials = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Complete_Trials then
                if tostring(plr.Data.Race.Value) == "Mink" then
                    notween(workspace.Map.MinkTrial.Ceiling.CFrame * CFrame.new(0,-20,0))
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function() 
            if _G.Complete_Trials then
                if tostring(plr.Data.Race.Value) == "Fishman" then
                    if GetSeaBeastTrial() then            
                        repeat task.wait()
                            spawn(function()_tp(CFrame.new(GetSeaBeastTrial().HumanoidRootPart.Position.X,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 300,GetSeaBeastTrial().HumanoidRootPart.Position.Z))end)
                            MousePos = GetSeaBeastTrial().HumanoidRootPart.Position
                            Useskills("Melee","Z")
                            Useskills("Melee","X")
                            Useskills("Melee","C")
                            wait(.1)
                            Useskills("Sword","Z")
                            Useskills("Sword","X")
                            wait(.1)
                            Useskills("Blox Fruit","Z")
                            Useskills("Blox Fruit","X")
                            Useskills("Blox Fruit","C")
                            wait(.1)
                            Useskills("Gun","Z")
                            Useskills("Gun","X")
                        until _G.Complete_Trials == false or not GetSeaBeastTrial()
                    end          
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Complete_Trials then
                if tostring(plr.Data.Race.Value) == "Cyborg" then
                    _tp(workspace.Map.CyborgTrial.Floor.CFrame * CFrame.new(0,500,0))
                end
            end
        end)
    end
end)

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Complete_Trials then
                if tostring(plr.Data.Race.Value) == "Skypiea" then
                    notween(workspace.Map.SkyTrial.Model.FinishPart.CFrame)
                end
            end
        end)
    end
end)

spawn(function()
    while wait(.1) do   
        pcall(function()
            if _G.Complete_Trials then
                if tostring(plr.Data.Race.Value) == "Human" or tostring(plr.Data.Race.Value) == "Ghoul" then	      
                    local TrialsTables = {"Ancient Vampire","Ancient Zombie"}
                    local v = GetConnectionEnemies(TrialsTables)
                    if v then repeat wait() Attack.Kill(v, _G.Complete_Trials) until _G.Complete_Trials == false or not v.Parent or v.Humanoid.Health <= 0 end		
                end
            end
        end)
    end
end)

local Tab8 = Window:AddTab("Drago", "rbxassetid://7733920644")
local Section8 = Tab8:AddLeftGroupbox("Dojo Quests")

Section8:AddToggle("AutoDojo", {
    Title = "Auto Dojo Trainer",
    Default = false,
    Callback = function(Value)
        _G.Dojoo = Value
    end
})

function printBeltName(data) if type(data) == "table" and data.Quest["BeltName"] then return data.Quest["BeltName"] end end

spawn(function()
    while wait(Sec) do
        if _G.Dojoo then
            pcall(function()
                local args = {[1] = {["NPC"] = "Dojo Trainer",["Command"] = "RequestQuest"}}        
                local progress = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(args))
                local NameBelt = printBeltName(progress)
                if debug == false and not progress and not NameBelt then
                    _tp(CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875))
                    debug = true
                elseif debug == true and (CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                    if NameBelt == "White" then
                        local v = GetConnectionEnemies("Skull Slayer")
                        if v then repeat task.wait() Attack.Kill(v, _G.Dojoo) until not progress or not _G.Dojoo or not Attack.Alive(v)
                        else _tp(CFrame.new(-16759.58984375, 71.28376770019531, 1595.3399658203125))
                        end
                    elseif NameBelt == "Yellow" then
                        repeat task.wait()
                            _G.SeaBeast1 = true
                            _G.TerrorShark = true
                            _G.Shark = true
                            _G.Piranha = true
                            _G.MobCrew = true
                            _G.FishBoat = true
                            _G.SailBoats = true
                        until not _G.Dojoo or not progress
                        _G.SeaBeast1 = false
                        _G.TerrorShark = false
                        _G.Shark = false
                        _G.Piranha = false
                        _G.MobCrew = false
                        _G.FishBoat = false
                        _G.SailBoats = false               
                    elseif NameBelt == "Green" then
                        repeat task.wait()
                            _G.SailBoats = true
                        until not _G.Dojoo or not progress
                        _G.SailBoats = false
                    elseif NameBelt == "Purple" then
                        repeat task.wait()
                            _G.FarmEliteHunt = true
                        until not _G.Dojoo or not progress
                        _G.FarmEliteHunt = false
                    elseif NameBelt == "Red" then
                        repeat task.wait()
                            _G.SailBoats = true
                            _G.FishBoat = true
                        until not _G.Dojoo or not progress
                        _G.SailBoats = false
                        _G.FishBoat = false                      
                    elseif NameBelt == "Black" then
                        repeat task.wait()              
                            if workspace.Map:FindFirstChild("PrehistoricIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then    
                                _G.Prehis_Find = true                   
                                if workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt",true) then
                                    _G.Prehis_Skills = false
                                    _G.Prehis_Find = true
                                else
                                    _G.Prehis_Skills = true
                                    _G.Prehis_Find = false
                                end
                            else
                                _G.Prehis_Find = true
                                _G.Prehis_Skills = false
                            end
                        until not _G.Dojoo or not progress
                        _G.Prehis_Find = false
                        _G.Prehis_Skills = false                        
                    elseif NameBelt == "Orange" or NameBelt == "Blue" then
                        return nil
                    end
                end
                if not progress then
                    debug = false
                    local args = {[1] = {["NPC"] = "Dojo Trainer",["Command"] = "ClaimQuest"}}
                    replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(args))
                end
            end)
        end
    end
end)

Section8:AddToggle("AutoDragonHunter", {
    Title = "Auto Dragon Hunter",
    Default = false,
    Callback = function(Value)
        _G.FarmBlazeEM = Value
    end
})

checkQuesta=function()local a={[1]={["Context"]="Check"}}local b=nil;pcall(function()local c={[1]={["Context"]="RequestQuest"}}game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack(c))end)local d,e=pcall(function()b=game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack(a))end)local f=false;local g;local h;local i;if b then if b.Text then f=true;local j=b.Text;if string.find(tostring(j),"Defeat")then i=1;g=string.sub(tostring(j),8,9)g=tonumber(g)local k={"Hydra Enforcer","Venomous Assailant"}for l,m in pairs(k)do if string.find(j,m)then h=m;break end end elseif string.find(tostring(j),"Destroy")then g=10;i=2;h=nil end end end;return f,h,g,i end
BackTODoJo=function()for a,b in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren())do if b.Name=="NotificationTemplate"then if string.find(b.Text,"Head back to the Dojo to complete more tasks")then return true end end end;return false end
DragonMobClear=function(a,b,c)if workspace.Enemies:FindFirstChild(b)then for d,e in pairs(workspace.Enemies:GetChildren())do if e.Name==b and Attack.Alive(e)then if a then Attack.Kill(e,a)end end end else _tp(c)end end

spawn(function()
    while wait() do 
        if _G.FarmBlazeEM then
            pcall(function()              
                local a,v,h,x = checkQuesta()                  
                if a == true and not BackTODoJo() then
                    if x == 1 then
                        if v == "Hydra Enforcer" or v == "Venomous Assailant" then            
                            repeat wait()
                                DragonMobClear(true, v, CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
                            until not _G.FarmBlazeEM or not a or BackTODoJo()                            
                        end      
                    elseif x == 2 then
                        if workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true) then
                            repeat wait()                
                                spawn(function() _tp(workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).CFrame * CFrame.new(4,0,0)) end)
                                if (workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position - Root.Position).Magnitude <= 200 then
                                    MousePos = workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position
                                    Useskills("Melee","Z")
                                    Useskills("Melee","X")
                                    Useskills("Melee","C")
                                    wait(.5)
                                    Useskills("Sword","Z")
                                    Useskills("Sword","X")
                                    wait(.5)
                                    Useskills("Blox Fruit","Z")
                                    Useskills("Blox Fruit","X")
                                    Useskills("Blox Fruit","C")
                                    wait(.5)
                                    Useskills("Gun","Z")
                                    Useskills("Gun","X")
                                end
                            until not _G.FarmBlazeEM or not a or BackTODoJo()
                        end
                    end
                else
                    _tp(CFrame.new(5813, 1208, 884))
                    DragonMobClear(false, nil, nil) 
                end
            end)
        end
    end
end)

spawn(function()
    while wait(.1) do 
        if _G.FarmBlazeEM then
            pcall(function()              
                if workspace.EmberTemplate:FindFirstChild("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.EmberTemplate.Part.CFrame        
                end
            end)
        end
    end
end)

Section8:AddToggle("AutoDragoV1", {
    Title = "Auto Drago V1",
    Default = false,
    Callback = function(Value)
        _G.DragoV1 = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.DragoV1 then     
                if GetM("Dragon Egg") <= 0 then
                    repeat wait()
                        _G.Prehis_Find = true
                        _G.Prehis_Skills = true
                        _G.Prehis_DE = true
                    until not _G.DragoV1 or GetM("Dragon Egg") >= 1
                    _G.Prehis_Find = false
                    _G.Prehis_Skills = false
                    _G.Prehis_DE = false
                end
            end
        end)
    end
end)

Section8:AddToggle("AutoDragoV2", {
    Title = "Auto Drago V2",
    Default = false,
    Callback = function(Value)
        _G.AutoFireFlowers = Value
    end
})

spawn(function()
    while wait(Sec) do
        if _G.AutoFireFlowers then
            local FireFlower = workspace:FindFirstChild("FireFlowers")
            local v = GetConnectionEnemies("Forest Pirate")
            if v then repeat wait() Attack.Kill(v,_G.AutoFireFlowers) until not _G.AutoFireFlowers or not v.Parent or v.Humanoid.Health <= 0 or FireFlower
            else _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
            end      
            if FireFlower then
                for i, v in pairs(FireFlower:GetChildren()) do
                    if (v:IsA("Model") and v.PrimaryPart) then
                        local FlowerPos = v.PrimaryPart.Position;
                        local playerRoot = game.Players.LocalPlayer.Character.HumanoidRootPart.Position;
                        local Magnited = (FlowerPos - playerRoot).Magnitude;
                        if (Magnited <= 100) then
                            vim1:SendKeyEvent(true, "E", false, game) wait(1.5) vim1:SendKeyEvent(false, "E", false, game)
                        else
                            _tp(CFrame.new(FlowerPos));
                        end
                    end
                end
            end
        end
    end
end)

Section8:AddToggle("AutoDragoV3", {
    Title = "Auto Drago V3",
    Default = false,
    Callback = function(Value)
        _G.DragoV3 = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.DragoV3 then     
                repeat wait()
                    _G.DangerSc = "Lv Infinite"
                    _G.SailBoats = true
                    _G.TerrorShark = true
                until not _G.DragoV3
                _G.DangerSc = "Lv 1"
                _G.SailBoats = false
                _G.TerrorShark = false
            end
        end)
    end
end)

local Tab9 = Window:AddTab("Prehistoric", "rbxassetid://7733960981")
local Section9 = Tab9:AddLeftGroupbox("Volcanic Island")

Section9:AddToggle("FindPrehistoric", {
    Title = "Auto Find Prehistoric",
    Default = false,
    Callback = function(Value)
        _G.Prehis_Find = Value
    end
})

spawn(function()
    while wait() do
        if _G.Prehis_Find then 
            pcall(function()
                if not workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island", true) then                
                    local myBoat = CheckBoat()
                    if not myBoat then
                        local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
                        TeleportToTarget(buyBoatCFrame)
                        if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat) end
                    else
                        if plr.Character.Humanoid.Sit == false then
                            local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                            _tp(boatSeatCFrame)
                        else                            
                            repeat wait() 
                                local targetDestination = CFrame.new(-10000000, 31, 37016.25)
                                if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                                    _tp(CFrame.new(-10000000, 150, 37016.25))
                                else
                                    _tp(CFrame.new(-10000000, 31, 37016.25))
                                end
                            until not _G.Prehis_Find or (targetDestination.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island") or plr.Character.Humanoid.Sit == false plr.Character.Humanoid.Sit = false
                        end
                    end
                else
                    if (workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island").CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 then _tp(workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island").CFrame)end
                    if workspace.Map:FindFirstChild("PrehistoricIsland", true) or workspace["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island", true) then            
                        if workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt", true) then
                            if plr:DistanceFromCharacter(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.CFrame.Position) <= 150 then
                                fireproximityprompt(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.ProximityPrompt, math.huge)
                                vim1:SendKeyEvent(true, "E", false, game) wait(1.5) vim1:SendKeyEvent(false, "E", false, game)
                            end
                            _tp(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.CFrame)              
                        end
                    end
                end
            end)
        end
    end
end)

Section9:AddToggle("AutoPatchVolcano", {
    Title = "Auto Patch Volcano",
    Default = false,
    Callback = function(Value)
        _G.Prehis_Skills = Value
    end
})

spawn(function()
    while wait() do
        if _G.Prehis_Skills then
            local prehistoricIsland = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
            if prehistoricIsland then
                for _, obj in pairs(prehistoricIsland:GetDescendants()) do
                    if obj:IsA("Part") and obj.Name:lower():find("lava") then obj:Destroy() end
                    if obj:IsA("MeshPart") and obj.Name:lower():find("lava") then obj:Destroy() end
                end
                local lavaModel = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava")
                if lavaModel and lavaModel:IsA("Model") then lavaModel:Destroy() end
                local Island = workspace.Map:FindFirstChild("PrehistoricIsland")
                if Island then   
                    local trialTeleport = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")   
                    for _, v in pairs(Island:GetDescendants()) do
                        if v.Name == "TouchInterest" then
                            if not (trialTeleport and v:IsDescendantOf(trialTeleport)) then
                                v.Parent:Destroy()
                            end
                        end
                    end
                end  
            end
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.Prehis_Skills then
                if workspace.Enemies:FindFirstChild("Lava Golem") then
                    local v = GetConnectionEnemies("Lava Golem")
                    if v then repeat wait()Attack.Kill(v,_G.Prehis_Skills) v.Humanoid:ChangeState(15)until not _G.Prehis_Skills or not v.Parent or v.Humanoid.Health <= 0 end
                end
                for i,v in pairs(game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks:GetChildren()) do
                    if v:FindFirstChild("VFXLayer") then
                        if v:FindFirstChild("VFXLayer").At0.Glow.Enabled == true or v.VFXLayer.At0.Glow.Enabled == true then
                            repeat wait()
                                _tp(v.VFXLayer.CFrame)
                                if v.VFXLayer.At0.Glow.Enabled == true and plr:DistanceFromCharacter(v.VFXLayer.CFrame.Position) <= 150 then
                                    MousePos = v.VFXLayer.CFrame.Position
                                    Useskills("Melee","Z") wait(.5)
                                    Useskills("Melee","X") wait(.5)
                                    Useskills("Melee","C") wait(.5)
                                    Useskills("Blox Fruit","Z") wait(.5)
                                    Useskills("Blox Fruit","X") wait(.5)
                                    Useskills("Blox Fruit","C")
                                end   
                            until not _G.Prehis_Skills or v:FindFirstChild("VFXLayer").At0.Glow.Enabled == false or v.VFXLayer.At0.Glow.Enabled == false            
                        end
                    end
                end
            end
        end)
    end
end)

Section9:AddToggle("AutoCollectBones", {
    Title = "Auto Collect Dino Bones",
    Default = false,
    Callback = function(Value)
        _G.Prehis_DB = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Prehis_DB then
                if workspace:FindFirstChild("DinoBone") then
                    for i,v in pairs(workspace:GetChildren()) do
                        if v.Name == "DinoBone" then _tp(v.CFrame) end
                    end
                end
            end
        end)
    end
end)

Section9:AddToggle("AutoCollectEggs", {
    Title = "Auto Collect Dragon Eggs",
    Default = false,
    Callback = function(Value)
        _G.Prehis_DE = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Prehis_DE then
                if workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg") then _tp(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg").Molten.CFrame) fireproximityprompt(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs.DragonEgg.Molten.ProximityPrompt, 30) end        
            end
        end)
    end
end)

local Tab10 = Window:AddTab("Raids", "rbxassetid://7733954611")
local Section10 = Tab10:AddLeftGroupbox("Raid Settings")

Section10:AddDropdown("SelectChip", {
    Title = "Select Chip",
    Values = {"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix","Dough"},
    Default = "Flame",
    Callback = function(Value)
        _G.SelectChip = Value
    end
})

Section10:AddToggle("AutoStartRaid", {
    Title = "Auto Start Raid",
    Default = false,
    Callback = function(Value)
        _G.Auto_StartRaid = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_StartRaid then
                if plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible == false then
                    if GetBP("Special Microchip") then
                        if World2 then
                            _tp(CFrame.new(-6438.73535, 250.645355, -4501.50684))
                            fireclickdetector(workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                        elseif World3 then                   
                            replicated.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-08, 0.914313197, -1.90943332e-08, 1, 3.8755779e-08, -0.914313197, -1.76180437e-09, -0.405007899))
                            fireclickdetector(workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                        end
                    end
                end
            end
        end)
    end
end)

Section10:AddToggle("AutoCompleteRaid", {
    Title = "Auto Complete Raid",
    Default = false,
    Callback = function(Value)
        _G.Raiding = Value
    end
})

spawn(function()
    pcall(function() 
        while wait(Sec) do
            if _G.Raiding then  
                if plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible == true then          
                    local islands = {"Island5","Island 4", "Island 3", "Island 2", "Island 1"}
                    for _, island in ipairs(islands) do
                        local location = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild(island)
                        if location then
                            for i,v in pairs(workspace.Enemies:GetChildren()) do
                                if v:FindFirstChild("Humanoid") or v:FindFirstChild("HumanoidRootPart") then
                                    if v.Humanoid.Health > 0 then
                                        repeat wait() Attack.Kill(v,_G.Raiding) NextIs=false until not _G.Raiding or not v.Parent or v.Humanoid.Health <= 0 NextIs=true
                                    end
                                end
                            end
                        end
                    end
                else
                    NextIs = false
                end
            else
                NextIs = false
            end
        end
    end)
end)

Section10:AddToggle("AutoAwakening", {
    Title = "Auto Awakening",
    Default = false,
    Callback = function(Value)
        _G.Auto_Awakener = Value
    end
})

spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Awakener then
                replicated.Remotes.CommF_:InvokeServer("Awakener","Check")
                replicated.Remotes.CommF_:InvokeServer("Awakener","Awaken")
            end
        end)
    end
end)

local Tab11 = Window:AddTab("Misc", "rbxassetid://7733960981")
local Section11 = Tab11:AddLeftGroupbox("Teleports")

local Location = {}
for i,v in pairs(workspace["_WorldOrigin"].Locations:GetChildren()) do  
    table.insert(Location ,v.Name)
end

Section11:AddDropdown("TeleportIsland", {
    Title = "Select Island",
    Values = Location,
    Default = Location[1] or "Island",
    Callback = function(Value)
        _G.Island = Value
    end
})

Section11:AddToggle("AutoTeleport", {
    Title = "Teleport to Island",
    Default = false,
    Callback = function(Value)
        _G.Teleport = Value
    end
})

spawn(function()
    if _G.Teleport then
        for i,v in pairs(workspace["_WorldOrigin"].Locations:GetChildren()) do
            if v.Name == _G.Island then
                repeat wait()
                    _tp(v.CFrame * CFrame.new(0, 30, 0)) 
                until not _G.Teleport or Root.CFrame == v.CFrame
            end
        end
    end
end)

Section11:AddButton({
    Title = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})

Section11:AddButton({
    Title = "Hop Server",
    Callback = function()
        Hop()
    end
})

Section11:AddSeperator("ESP Options")

Section11:AddToggle("ESPPlayers", {
    Title = "ESP Players",
    Default = false,
    Callback = function(Value)
        PlayerEsp = Value
    end
})

spawn(function()
    while PlayerEsp do wait()
        EspPly()
    end
end)

Section11:AddToggle("ESPFruits", {
    Title = "ESP Fruits",
    Default = false,
    Callback = function(Value)
        DevilFruitESP = Value
    end
})

spawn(function()
    while DevilFruitESP do wait()
        DevEsp() 
    end
end)

Section11:AddToggle("ESPChests", {
    Title = "ESP Chests",
    Default = false,
    Callback = function(Value)
        ChestESP = Value
    end
})

spawn(function()
    while ChestESP do wait()
        ChestEsp() 
    end
end)

Section11:AddToggle("ESPIslands", {
    Title = "ESP Islands",
    Default = false,
    Callback = function(Value)
        IslandESP = Value
    end
})

spawn(function()
    while IslandESP do wait()
        LocationEsp() 
    end
end)

Section11:AddSeperator("Graphics")

Section11:AddToggle("RTXMode", {
    Title = "RTX Mode",
    Default = false,
    Callback = function(Value)
        _G.RTXMode = Value
    end
})

spawn(function()
    local a = game.Lighting
    local c = Instance.new("ColorCorrectionEffect", a)
    local e = Instance.new("ColorCorrectionEffect", a)
    OldAmbient = a.Ambient
    OldBrightness = a.Brightness
    OldColorShift_Top = a.ColorShift_Top
    OldBrightnessc = c.Brightness
    OldContrastc = c.Contrast
    OldTintColorc = c.TintColor
    OldTintColore = e.TintColor    
    if not _G.RTXMode then return end
    while _G.RTXMode do wait()
        a.Ambient = Color3.fromRGB(33, 33, 33)
        a.Brightness = 0.3
        c.Brightness = 0.176
        c.Contrast = 0.39
        c.TintColor = Color3.fromRGB(217, 145, 57)
        game.Lighting.FogEnd = 999
        if not plr.Character.HumanoidRootPart:FindFirstChild("PointLight") then
            local a2 = Instance.new("PointLight")
            a2.Parent = plr.Character.HumanoidRootPart
            a2.Range = 15
            a2.Color = Color3.fromRGB(217, 145, 57)
        end
        if not _G.RTXMode then
            a.Ambient = OldAmbient
            a.Brightness = OldBrightness
            a.ColorShift_Top = OldColorShift_Top
            c.Contrast = OldContrastc
            c.Brightness = OldBrightnessc
            c.TintColor = OldTintColorc
            e.TintColor = OldTintColore
            game.Lighting.FogEnd = 2500
            plr.Character.HumanoidRootPart:FindFirstChild("PointLight"):Destroy()
        end
    end
end)

Section11:AddToggle("FullBright", {
    Title = "Full Bright",
    Default = false,
    Callback = function(Value)
        bright = Value
    end
})

spawn(function()
    while wait() do
        pcall(function()
            if bright then
                Lighting.Ambient = Color3.new(1, 1, 1)
                Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
                Lighting.ColorShift_Top = Color3.new(1, 1, 1)
            else
                Lighting.Ambient = Color3.new(0, 0, 0)
                Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
                Lighting.ColorShift_Top = Color3.new(0, 0, 0)
            end
        end)
    end
end)

Section11:AddButton({
    Title = "Low CPU Mode",
    Callback = function()
        LowCpu()
    end
})

Section11:AddButton({
    Title = "Unload UI",
    Callback = function()
        Library:DestroyUI()
    end
})

-- Services
local CoreGui = game:GetService("CoreGui")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ControlButtonGUI"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ImageButton com novo ID
local ToggleButton = Instance.new("ImageButton")
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0.15, 0, 0.15, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BorderSizePixel = 0
ToggleButton.Image = "rbxassetid://112518061635682"
ToggleButton.Parent = ScreenGui

-- UICorner para bordas arredondadas
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(1, 0)
Corner.Parent = ToggleButton

-- Clique envia tecla End
ToggleButton.MouseButton1Click:Connect(function()
    VirtualInputManager:SendKeyEvent(true, "End", false, game)
    VirtualInputManager:SendKeyEvent(false, "End", false, game)
end)

-- Arrasto funcional
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    ToggleButton.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = ToggleButton.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

ToggleButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

Library:Notify({
    Title = "Eclipse Hub",
    Desc = "Script loaded with " .. #Window.Tabs .. " tabs!",
    Duration = 3
})
