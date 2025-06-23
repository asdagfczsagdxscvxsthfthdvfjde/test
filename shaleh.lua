local quickMessages = {
        {text = "👑 مرحباً أيها الأبطال! 👑", color = Color3.fromRGB(255, 215, 0)},
        {text = "🔥 ApexMHub في المنطقة! 🔥", color = Color3.fromRGB(255, 100, 100)},
        {text = "💎 by Bo.Sqr - The Legend 💎", color = Color3.fromRGB(138, 43, 226)},
        {text = "⚡ سرعة خارقة! ⚡", color = Color3.fromRGB(255, 193, 7)},
        {text = "🌟 وضع الإله مُفعل! 🌟", color = Color3.fromRGB(0, 255, 255)},
        {text = "🚀 إلى اللانهاية وما بعدها! 🚀", color = Color3.fromRGB(255, 20, 147)}
    }
    
    for i, message in ipairs(quickMessages) do
        local MessageButton = Instance.new("TextButton")
        MessageButton.Name = "MessageButton" .. i
        MessageButton.Parent = ChatPage
        MessageButton.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
        MessageButton.BorderSizePixel = 0
        MessageButton.Position = UDim2.new(0, 10, 0, 80 + (i-1) * 80)
        MessageButton.Size = UDim2.new(1, -20, 0, 70)
        MessageButton.Font = Enum.Font.GothamBold
        MessageButton.Text = message.text
        MessageButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        MessageButton.TextSize = 18
        MessageButton.ZIndex = 13
        
        local MessageCorner = Instance.new("UICorner")
        MessageCorner.CornerRadius = UDim.new(0, 15)
        MessageCorner.Parent = MessageButton
        
        local MessageStroke = Instance.new("UIStroke")
        MessageStroke.Color = message.color
        MessageStroke.Thickness = 3
        MessageStroke.Parent = MessageButton
        
        local MessageGradient = Instance.new("UIGradient")
        MessageGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 50)),
            ColorSequenceKeypoint.new(0.5, message.color),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 50))
        })
        MessageGradient.Rotation = 45
        MessageGradient.Transparency = NumberSequence.new(0.8)
        MessageGradient.Parent = MessageButton
        
        MessageButton.MouseButton1Click:Connect(function()
            sendLegendaryMessage(message.text)
            
            local sendEffect = TweenService:Create(MessageButton, TweenInfo.new(0.2), {
                BackgroundColor3 = message.color
            })
            sendEffect:Play()
            
            sendEffect.Completed:Connect(function()
                local backEffect = TweenService:Create(MessageButton, TweenInfo.new(0.3), {
                    BackgroundColor3 = Color3.fromRGB(25, 25, 45)
                })
                backEffect:Play()
            end)
        end)
        
        MessageButton.MouseEnter:Connect(function()
            local hoverTween = TweenService:Create(MessageButton, TweenInfo.new(0.3), {
                Size = UDim2.new(1, -10, 0, 75)
            })
            hoverTween:Play()
            
            MessageGradient.Transparency = NumberSequence.new(0.6)
        end)
        
        MessageButton.MouseLeave:Connect(function()
            local leaveTween = TweenService:Create(MessageButton, TweenInfo.new(0.3), {
                Size = UDim2.new(1, -20, 0, 70)
            })
            leaveTween:Play()
            
            MessageGradient.Transparency = NumberSequence.new(0.8)
        end)
    end
    
    return ChatPage
end

function createAdvancedPage(parent)
    local AdvancedPage = Instance.new("ScrollingFrame")
    AdvancedPage.Name = "AdvancedPage"
    AdvancedPage.Parent = parent
    AdvancedPage.BackgroundTransparency = 1
    AdvancedPage.Size = UDim2.new(1, -20, 1, -20)
    AdvancedPage.Position = UDim2.new(0, 10, 0, 10)
    AdvancedPage.CanvasSize = UDim2.new(0, 0, 0, 800)
    AdvancedPage.ScrollBarThickness = 8
    AdvancedPage.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
    AdvancedPage.ZIndex = 12
    AdvancedPage.Visible = false
    
    local PageTitle = Instance.new("TextLabel")
    PageTitle.Name = "PageTitle"
    PageTitle.Parent = AdvancedPage
    PageTitle.BackgroundTransparency = 1
    PageTitle.Size = UDim2.new(1, 0, 0, 60)
    PageTitle.Font = Enum.Font.FantasyQuest
    PageTitle.Text = "🚀 القوى المطلقة 🚀"
    PageTitle.TextColor3 = Color3.fromRGB(255, 20, 147)
    PageTitle.TextSize = 28
    PageTitle.TextStrokeTransparency = 0
    PageTitle.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    PageTitle.ZIndex = 13
    
    local advancedTools = {
        {name = "🌟 وضع الإله الكامل", desc = "حصانة مطلقة من كل شيء", func = function() activateGodMode() end},
        {name = "⚡ سرعة الضوء", desc = "أسرع من البرق", func = function() activateLightSpeed() end},
        {name = "🌀 التنقل الفوري", desc = "انتقال فوري لأي مكان", func = function() activateTeleport() end},
        {name = "👻 وضع الشبح", desc = "اختراق كل الحواجز", func = function() activateGhostMode() end},
        {name = "🎭 تغيير الشكل", desc = "تحويل المظهر بالكامل", func = function() activateShapeShift() end},
        {name = "💫 قوة الجاذبية", desc = "التحكم في الجاذبية", func = function() activateGravityControl() end}
    }
    
    for i, tool in ipairs(advancedTools) do
        local row = math.floor((i-1) / 2)
        local col = (i-1) % 2
        
        local ToolButton = Instance.new("TextButton")
        ToolButton.Name = "ToolButton" .. i
        ToolButton.Parent = AdvancedPage
        ToolButton.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
        ToolButton.BorderSizePixel = 0
        ToolButton.Position = UDim2.new(col * 0.5, col * 10 + 5, 0, 80 + row * 120)
        ToolButton.Size = UDim2.new(0.5, -15, 0, 110)
        ToolButton.Font = Enum.Font.GothamBold
        ToolButton.Text = ""
        ToolButton.ZIndex = 13
        
        local ToolCorner = Instance.new("UICorner")
        ToolCorner.CornerRadius = UDim.new(0, 15)
        ToolCorner.Parent = ToolButton
        
        local ToolStroke = Instance.new("UIStroke")
        ToolStroke.Color = Color3.fromRGB(255, 20, 147)
        ToolStroke.Thickness = 3
        ToolStroke.Parent = ToolButton
        
        local ToolTitle = Instance.new("TextLabel")
        ToolTitle.Name = "ToolTitle"
        ToolTitle.Parent = ToolButton
        ToolTitle.BackgroundTransparency = 1
        ToolTitle.Position = UDim2.new(0, 10, 0, 10)
        ToolTitle.Size = UDim2.new(1, -20, 0, 40)
        ToolTitle.Font = Enum.Font.GothamBold
        ToolTitle.Text = tool.name
        ToolTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToolTitle.TextSize = 16
        ToolTitle.TextWrapped = true
        ToolTitle.ZIndex = 14
        
        local ToolDesc = Instance.new("TextLabel")
        ToolDesc.Name = "ToolDesc"
        ToolDesc.Parent = ToolButton
        ToolDesc.BackgroundTransparency = 1
        ToolDesc.Position = UDim2.new(0, 10, 0, 50)
        ToolDesc.Size = UDim2.new(1, -20, 0, 50)
        ToolDesc.Font = Enum.Font.Gotham
        ToolDesc.Text = tool.desc
        ToolDesc.TextColor3 = Color3.fromRGB(180, 180, 200)
        ToolDesc.TextSize = 12
        ToolDesc.TextWrapped = true
        ToolDesc.ZIndex = 14
        
        ToolButton.MouseButton1Click:Connect(tool.func)
    end
    
    return AdvancedPage
end

function createSettingsPage(parent)
    local SettingsPage = Instance.new("ScrollingFrame")
    SettingsPage.Name = "SettingsPage"
    SettingsPage.Parent = parent
    SettingsPage.BackgroundTransparency = 1
    SettingsPage.Size = UDim2.new(1, -20, 1, -20)
    SettingsPage.Position = UDim2.new(0, 10, 0, 10)
    SettingsPage.CanvasSize = UDim2.new(0, 0, 0, 600)
    SettingsPage.ScrollBarThickness = 8
    SettingsPage.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
    SettingsPage.ZIndex = 12
    SettingsPage.Visible = false
    
    local PageTitle = Instance.new("TextLabel")
    PageTitle.Name = "PageTitle"
    PageTitle.Parent = SettingsPage
    PageTitle.BackgroundTransparency = 1
    PageTitle.Size = UDim2.new(1, 0, 0, 60)
    PageTitle.Font = Enum.Font.FantasyQuest
    PageTitle.Text = "⚙️ الإعدادات الأسطورية ⚙️"
    PageTitle.TextColor3 = Color3.fromRGB(150, 150, 255)
    PageTitle.TextSize = 28
    PageTitle.TextStrokeTransparency = 0
    PageTitle.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    PageTitle.ZIndex = 13
    
    local DevInfo = Instance.new("Frame")
    DevInfo.Name = "DevInfo"
    DevInfo.Parent = SettingsPage
    DevInfo.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
    DevInfo.BorderSizePixel = 0
    DevInfo.Position = UDim2.new(0, 10, 0, 80)
    DevInfo.Size = UDim2.new(1, -20, 0, 200)
    DevInfo.ZIndex = 13
    
    local DevCorner = Instance.new("UICorner")
    DevCorner.CornerRadius = UDim.new(0, 15)
    DevCorner.Parent = DevInfo
    
    local DevStroke = Instance.new("UIStroke")
    DevStroke.Color = Color3.fromRGB(255, 215, 0)
    DevStroke.Thickness = 3
    DevStroke.Parent = DevInfo
    
    local DevTitle = Instance.new("TextLabel")
    DevTitle.Name = "DevTitle"
    DevTitle.Parent = DevInfo
    DevTitle.BackgroundTransparency = 1
    DevTitle.Position = UDim2.new(0, 20, 0, 15)
    DevTitle.Size = UDim2.new(1, -40, 0, 40)
    DevTitle.Font = Enum.Font.FantasyQuest
    DevTitle.Text = "👑 معلومات المطور الأسطوري 👑"
    DevTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
    DevTitle.TextSize = 20
    DevTitle.ZIndex = 14
    
    local DevDetails = Instance.new("TextLabel")
    DevDetails.Name = "DevDetails"
    DevDetails.Parent = DevInfo
    DevDetails.BackgroundTransparency = 1
    DevDetails.Position = UDim2.new(0, 20, 0, 55)
    DevDetails.Size = UDim2.new(1, -40, 0, 130)
    DevDetails.Font = Enum.Font.GothamBold
    DevDetails.Text = [[🌟 Developer: Bo.Sqr
💎 Status: Legendary Creator
⚡ Expertise: Ultimate Scripting
🔥 Version: ApexMHub v7.00
🚀 Features: 50+ Legendary Tools
💫 Experience: 5+ Years
🎯 Specialty: Game Enhancement
👑 Reputation: #1 Script Developer]]
    DevDetails.TextColor3 = Color3.fromRGB(200, 200, 255)
    DevDetails.TextSize = 14
    DevDetails.TextWrapped = true
    DevDetails.TextXAlignment = Enum.TextXAlignment.Left
    DevDetails.TextYAlignment = Enum.TextYAlignment.Top
    DevDetails.ZIndex = 14
    
    local settingsButtons = {
        {name = "🔄 إعادة تحميل السكربت", func = function() reloadScript() end},
        {name = "🗑️ مسح جميع البيانات", func = function() clearAllData() end},
        {name = "💾 حفظ الإعدادات", func = function() saveSettings() end}
    }
    
    for i, setting in ipairs(settingsButtons) do
        local SettingButton = Instance.new("TextButton")
        SettingButton.Name = "SettingButton" .. i
        SettingButton.Parent = SettingsPage
        SettingButton.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
        SettingButton.BorderSizePixel = 0
        SettingButton.Position = UDim2.new(0, 10, 0, 300 + (i-1) * 70)
        SettingButton.Size = UDim2.new(1, -20, 0, 60)
        SettingButton.Font = Enum.Font.GothamBold
        SettingButton.Text = setting.name
        SettingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        SettingButton.TextSize = 18
        SettingButton.ZIndex = 13
        
        local SettingCorner = Instance.new("UICorner")
        SettingCorner.CornerRadius = UDim.new(0, 15)
        SettingCorner.Parent = SettingButton
        
        SettingButton.MouseButton1Click:Connect(setting.func)
    end
    
    return SettingsPage
end

function toggleLegendaryRob()
    legendaryFeatures.robEnabled = not legendaryFeatures.robEnabled
    if legendaryFeatures.robEnabled then
        showLegendaryNotification("💰 تم تفعيل الروب الأسطوري! 💰", Color3.fromRGB(255, 193, 7))
        startLegendaryRob()
    else
        showLegendaryNotification("❌ تم إيقاف الروب الأسطوري! ❌", Color3.fromRGB(255, 87, 87))
    end
end

function startLegendaryRob()
    spawn(function()
        while legendaryFeatures.robEnabled do
            wait(0.05)
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                for _, obj in pairs(workspace:GetChildren()) do
                    if obj.Name == "MoneyDrop" and obj:FindFirstChild("Handle") then
                        local distance = (obj.Handle.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if distance <= 100 then
                            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, obj.Handle, 0)
                            wait(0.01)
                            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, obj.Handle, 1)
                        end
                    end
                end
            end
        end
    end)
end

function toggleLegendaryAntiHandcuff()
    legendaryFeatures.antiHandcuffEnabled = not legendaryFeatures.antiHandcuffEnabled
    if legendaryFeatures.antiHandcuffEnabled then
        showLegendaryNotification("🛡️ تم تفعيل مانع الكلبشة الأسطوري! 🛡️", Color3.fromRGB(76, 175, 80))
        startLegendaryAntiTitle()
    startLegendaryAntiChar()
    startLegendaryPullAll()
    startLegendaryGodMode()
    startLegendarySpeed()
    startLegendaryFly()
    
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        for i = 1, 10 do
            local effect = Instance.new("Explosion")
            effect.Position = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(math.random(-10, 10), math.random(-5, 5), math.random(-10, 10))
            effect.BlastRadius = 0
            effect.BlastPressure = 0
            effect.Parent = workspace
            wait(0.1)
        end
        
        createParticleEffect(LocalPlayer.Character.HumanoidRootPart, "legendary")
    end
    
    showLegendaryNotification("🔥 ApexMHub Ultimate Mode Activated! 🔥", Color3.fromRGB(255, 215, 0))
end

function sendLegendaryMessage(message)
    if game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") then
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
        showLegendaryNotification("💬 تم إرسال: " .. message, Color3.fromRGB(156, 39, 176))
    else
        local chatService = game:GetService("Chat")
        if chatService then
            chatService:Chat(LocalPlayer.Character.Head, message, Enum.ChatColor.White)
        end
    end
end

function activateGodMode()
    showLegendaryNotification("🌟 وضع الإله الكامل مُفعل! 🌟", Color3.fromRGB(255, 215, 0))
    if LocalPlayer.Character then
        LocalPlayer.Character.Humanoid.MaxHealth = math.huge
        LocalPlayer.Character.Humanoid.Health = math.huge
        
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Anchored = false
                part.CanCollide = false
            end
        end
    end
end

function activateLightSpeed()
    showLegendaryNotification("⚡ سرعة الضوء مُفعلة! ⚡", Color3.fromRGB(255, 255, 100))
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 500
        LocalPlayer.Character.Humanoid.JumpPower = 200
    end
end

function activateTeleport()
    showLegendaryNotification("🌀 التنقل الفوري جاهز! استخدم الماوس للانتقال 🌀", Color3.fromRGB(100, 255, 255))
    
    local connection
    connection = Mouse.Button1Down:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mouse.Hit.Position + Vector3.new(0, 5, 0))
            
            local effect = Instance.new("Explosion")
            effect.Position = LocalPlayer.Character.HumanoidRootPart.Position
            effect.BlastRadius = 0
            effect.BlastPressure = 0
            effect.Parent = workspace
        end
    end)
    
    wait(30)
    if connection then
        connection:Disconnect()
        showLegendaryNotification("🌀 انتهت مدة التنقل الفوري! 🌀", Color3.fromRGB(255, 100, 100))
    end
end

function activateGhostMode()
    showLegendaryNotification("👻 وضع الشبح مُفعل! 👻", Color3.fromRGB(200, 200, 200))
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
                part.Transparency = 0.5
            end
        end
    end
end

function activateShapeShift()
    showLegendaryNotification("🎭 تغيير الشكل مُفعل! 🎭", Color3.fromRGB(255, 100, 255))
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.BrickColor = BrickColor.Random()
                part.Material = Enum.Material.Neon
            end
        end
    end
end

function activateGravityControl()
    showLegendaryNotification("💫 تم تفعيل التحكم في الجاذبية! 💫", Color3.fromRGB(255, 200, 100))
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local bodyPosition = Instance.new("BodyPosition")
        bodyPosition.MaxForce = Vector3.new(4000, 4000, 4000)
        bodyPosition.Position = LocalPlayer.Character.HumanoidRootPart.Position
        bodyPosition.Parent = LocalPlayer.Character.HumanoidRootPart
        bodyPosition.Name = "GravityControl"
        
        spawn(function()
            while bodyPosition.Parent do
                wait()
                if UserInputService:IsKeyDown(Enum.KeyCode.Q) then
                    bodyPosition.Position = bodyPosition.Position + Vector3.new(0, 2, 0)
                elseif UserInputService:IsKeyDown(Enum.KeyCode.E) then
                    bodyPosition.Position = bodyPosition.Position - Vector3.new(0, 2, 0)
                else
                    bodyPosition.Position = LocalPlayer.Character.HumanoidRootPart.Position
                end
            end
        end)
    end
end

function reloadScript()
    showLegendaryNotification("🔄 جاري إعادة تحميل ApexMHub... 🔄", Color3.fromRGB(100, 200, 255))
    
    for feature, enabled in pairs(legendaryFeatures) do
        legendaryFeatures[feature] = false
    end
    
    if game.CoreGui:FindFirstChild("ApexMHub") then
        game.CoreGui:FindFirstChild("ApexMHub"):Destroy()
    end
    
    wait(1)
    
    createLegendaryUI()
    showLegendaryNotification("✅ تم إعادة تحميل ApexMHub بنجاح! ✅", Color3.fromRGB(100, 255, 100))
end

function clearAllData()
    showLegendaryNotification("🗑️ جاري مسح جميع البيانات... 🗑️", Color3.fromRGB(255, 150, 50))
    
    for feature, enabled in pairs(legendaryFeatures) do
        legendaryFeatures[feature] = false
    end
    
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then
                for _, effect in pairs(part:GetChildren()) do
                    if effect:IsA("BodyPosition") or effect:IsA("BodyVelocity") or effect:IsA("BodyAngularVelocity") then
                        effect:Destroy()
                    end
                end
            end
        end
    end
    
    showLegendaryNotification("✅ تم مسح جميع البيانات بنجاح! ✅", Color3.fromRGB(100, 255, 100))
end

function saveSettings()
    showLegendaryNotification("💾 تم حفظ الإعدادات! 💾", Color3.fromRGB(100, 255, 200))
end

function showLegendaryNotification(text, color)
    local NotificationGui = Instance.new("ScreenGui")
    NotificationGui.Name = "ApexMHubNotification"
    NotificationGui.Parent = game.CoreGui
    NotificationGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local NotificationFrame = Instance.new("Frame")
    NotificationFrame.Name = "NotificationFrame"
    NotificationFrame.Parent = NotificationGui
    NotificationFrame.BackgroundColor3 = color or Color3.fromRGB(20, 20, 35)
    NotificationFrame.BorderSizePixel = 0
    NotificationFrame.Position = UDim2.new(1, 20, 0, 100)
    NotificationFrame.Size = UDim2.new(0, 400, 0, 100)
    NotificationFrame.ZIndex = 1000
    
    local NotificationCorner = Instance.new("UICorner")
    NotificationCorner.CornerRadius = UDim.new(0, 15)
    NotificationCorner.Parent = NotificationFrame
    
    local NotificationStroke = Instance.new("UIStroke")
    NotificationStroke.Color = Color3.fromRGB(255, 215, 0)
    NotificationStroke.Thickness = 3
    NotificationStroke.Parent = NotificationFrame
    
    local NotificationGradient = Instance.new("UIGradient")
    NotificationGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, color),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, color)
    })
    NotificationGradient.Rotation = 45
    NotificationGradient.Transparency = NumberSequence.new(0.7)
    NotificationGradient.Parent = NotificationFrame
    
    local NotificationLabel = Instance.new("TextLabel")
    NotificationLabel.Name = "NotificationLabel"
    NotificationLabel.Parent = NotificationFrame
    NotificationLabel.BackgroundTransparency = 1
    NotificationLabel.Position = UDim2.new(0, 20, 0, 15)
    NotificationLabel.Size = UDim2.new(1, -40, 1, -30)
    NotificationLabel.Font = Enum.Font.GothamBold
    NotificationLabel.Text = text
    NotificationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotificationLabel.TextSize = 16
    NotificationLabel.TextWrapped = true
    NotificationLabel.TextStrokeTransparency = 0
    NotificationLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    NotificationLabel.ZIndex = 1001
    
    local slideIn = TweenService:Create(NotificationFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Position = UDim2.new(1, -420, 0, 100)})
    slideIn:Play()
    
    local pulseTween = TweenService:Create(NotificationStroke, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Transparency = 0.3
    })
    pulseTween:Play()
    
    spawn(function()
        wait(4)
        local slideOut = TweenService:Create(NotificationFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Position = UDim2.new(1, 20, 0, 100)})
        slideOut:Play()
        
        slideOut.Completed:Connect(function()
            NotificationGui:Destroy()
        end)
    end)
end

function makeLegendaryDraggable(frame, dragHandle)
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    local function updateInput(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            local connection
            connection = UserInputService.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    updateInput(input)
                end
            end)
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    connection:Disconnect()
                end
            end)
        end
    end)
end

function toggleLegendaryUI()
    isUIOpen = not isUIOpen
    local gui = game.CoreGui:FindFirstChild("ApexMHub")
    if gui then
        gui.MainFrame.Visible = isUIOpen
        
        if isUIOpen then
            gui.MainFrame.Size = UDim2.new(0, 0, 0, 0)
            gui.MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            
            local openTween = TweenService:Create(gui.MainFrame, TweenInfo.new(0.7, Enum.EasingStyle.Back), {
                Size = UDim2.new(0, 900, 0, 600),
                Position = UDim2.new(0.5, -450, 0.5, -300)
            })
            openTween:Play()
            
            showLegendaryNotification("🔥 مرحباً بعودتك إلى ApexMHub! 🔥", Color3.fromRGB(255, 215, 0))
        end
    end
end

local legendaryUI = createLegendaryUI()

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Insert then
        toggleLegendaryUI()
    end
end)

spawn(function()
    wait(1)
    showLegendaryNotification("🔥 ApexMHub v7.00 Ultimate تم تحميله بنجاح! 🔥\n👑 Created by Bo.Sqr 👑\n⚡ اضغط Insert لفتح الواجهة ⚡", Color3.fromRGB(255, 215, 0))
    
    wait(3)
    showLegendaryNotification("💎 مرحباً بك في التجربة الأسطورية! 💎\n🌟 استمتع بأقوى سكربت على الإطلاق! 🌟", Color3.fromRGB(138, 43, 226))
end)

game.Players.PlayerRemoving:Connect(function(player)
    if player == LocalPlayer then
        for feature, enabled in pairs(legendaryFeatures) do
            legendaryFeatures[feature] = false
        end
    end
end)

print("🔥 ApexMHub v7.00 Ultimate - تم التحميل بنجاح! 🔥")
print("👑 Created by: Bo.Sqr - The Legendary Developer 👑")
print("🌟 الميزات الأسطورية المتاحة:")
print("💰 سكربت الروب الخارق")
print("🛡️ مانع الكلبشة النهائي") 
print("⚡ مغير الإسم البرقي")
print("🔄 حماية الكاراكتر المطلقة")
print("👥 سحب الجميع المتقدم")
print("🚀 طيران إلهي")
print("⚡ سرعة خارقة")
print("🌟 وضع الإله")
print("💎 واجهة أسطورية متطورة")
print("🎯 نظام التارجت الأسطوري")
print("💬 تواصل أسطوري")
print("🚀 أدوات متقدمة")
print("⚡ اضغط Insert لفتح الواجهة الأسطورية! ⚡")
print("💫 استمتع بالتجربة الأسطورية! 💫")

return ApexMHubHandcuff()
    else
        showLegendaryNotification("❌ تم إيقاف مانع الكلبشة! ❌", Color3.fromRGB(255, 87, 87))
    end
end

function startLegendaryAntiHandcuff()
    spawn(function()
        while legendaryFeatures.antiHandcuffEnabled do
            wait(0.01)
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                if LocalPlayer.Character:FindFirstChild("Handcuffs") then
                    LocalPlayer.Character.Handcuffs:Destroy()
                end
                
                if LocalPlayer.Character.Humanoid.PlatformStand then
                    LocalPlayer.Character.Humanoid.PlatformStand = false
                end
                
                if LocalPlayer.Character.Humanoid.Sit then
                    LocalPlayer.Character.Humanoid.Sit = false
                end
                
                LocalPlayer.Character.Humanoid.WalkSpeed = math.max(LocalPlayer.Character.Humanoid.WalkSpeed, 16)
            end
        end
    end)
end

function toggleLegendaryAntiTitle()
    legendaryFeatures.antiTitleEnabled = not legendaryFeatures.antiTitleEnabled
    if legendaryFeatures.antiTitleEnabled then
        showLegendaryNotification("⚡ تم تفعيل مغير الإسم الأسطوري! ⚡", Color3.fromRGB(255, 152, 0))
        startLegendaryAntiTitle()
    else
        showLegendaryNotification("❌ تم إيقاف مغير الإسم! ❌", Color3.fromRGB(255, 87, 87))
    end
end

function startLegendaryAntiTitle()
    spawn(function()
        while legendaryFeatures.antiTitleEnabled do
            wait(0.001)
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
                local randomNames = {"", ".", " ", "  ", "   ", "....", "?", "!", "~", "^", "*"}
                local randomName = randomNames[math.random(1, #randomNames)]
                
                for _, gui in pairs(LocalPlayer.Character.Head:GetChildren()) do
                    if gui:IsA("BillboardGui") then
                        for _, label in pairs(gui:GetChildren()) do
                            if label:IsA("TextLabel") then
                                label.Text = randomName
                            end
                        end
                    end
                end
            end
        end
    end)
end

function toggleLegendaryAntiChar()
    legendaryFeatures.antiCharEnabled = not legendaryFeatures.antiCharEnabled
    if legendaryFeatures.antiCharEnabled then
        showLegendaryNotification("🔄 تم تفعيل حماية الكاراكتر الأسطوري! 🔄", Color3.fromRGB(103, 58, 183))
        startLegendaryAntiChar()
    else
        showLegendaryNotification("❌ تم إيقاف حماية الكاراكتر! ❌", Color3.fromRGB(255, 87, 87))
    end
end

function startLegendaryAntiChar()
    spawn(function()
        while legendaryFeatures.antiCharEnabled do
            wait(0.1)
            if LocalPlayer.Character then
                local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    if humanoid.Health <= 50 then
                        humanoid.Health = humanoid.MaxHealth
                    end
                    
                    if not LocalPlayer.Character.Parent then
                        LocalPlayer:LoadCharacter()
                    end
                end
            end
        end
    end)
end

function toggleLegendaryPullAll()
    legendaryFeatures.pullAllEnabled = not legendaryFeatures.pullAllEnabled
    if legendaryFeatures.pullAllEnabled then
        showLegendaryNotification("👥 تم تفعيل سحب الجميع الأسطوري! 👥", Color3.fromRGB(233, 30, 99))
        startLegendaryPullAll()
    else
        showLegendaryNotification("❌ تم إيقاف سحب الجميع! ❌", Color3.fromRGB(255, 87, 87))
    end
end

function startLegendaryPullAll()
    spawn(function()
        while legendaryFeatures.pullAllEnabled do
            wait(0.3)
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if distance <= 50 then
                            local bodyPosition = Instance.new("BodyPosition")
                            bodyPosition.MaxForce = Vector3.new(8000, 8000, 8000)
                            bodyPosition.Position = LocalPlayer.Character.HumanoidRootPart.Position + LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 3
                            bodyPosition.Parent = player.Character.HumanoidRootPart
                            
                            game:GetService("Debris"):AddItem(bodyPosition, 0.5)
                            
                            if player.Character:FindFirstChild("Humanoid") then
                                player.Character.Humanoid.PlatformStand = true
                                wait(0.1)
                                player.Character.Humanoid.PlatformStand = false
                            end
                        end
                    end
                end
            end
        end
    end)
end

function toggleLegendaryFly()
    legendaryFeatures.flyModeEnabled = not legendaryFeatures.flyModeEnabled
    if legendaryFeatures.flyModeEnabled then
        showLegendaryNotification("🚀 تم تفعيل الطيران الأسطوري! 🚀", Color3.fromRGB(0, 188, 212))
        startLegendaryFly()
    else
        showLegendaryNotification("❌ تم إيقاف الطيران! ❌", Color3.fromRGB(255, 87, 87))
        stopLegendaryFly()
    end
end

function startLegendaryFly()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.Parent = LocalPlayer.Character.HumanoidRootPart
        bodyVelocity.Name = "LegendaryFly"
        
        local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
        bodyAngularVelocity.MaxTorque = Vector3.new(0, 4000, 0)
        bodyAngularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
        bodyAngularVelocity.Parent = LocalPlayer.Character.HumanoidRootPart
        bodyAngularVelocity.Name = "LegendaryFlyRotation"
        
        spawn(function()
            while legendaryFeatures.flyModeEnabled and bodyVelocity.Parent do
                wait()
                local camera = workspace.CurrentCamera
                local moveVector = Vector3.new(0, 0, 0)
                
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    moveVector = moveVector + camera.CFrame.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    moveVector = moveVector - camera.CFrame.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    moveVector = moveVector - camera.CFrame.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    moveVector = moveVector + camera.CFrame.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    moveVector = moveVector + Vector3.new(0, 1, 0)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                    moveVector = moveVector - Vector3.new(0, 1, 0)
                end
                
                bodyVelocity.Velocity = moveVector * 100
            end
        end)
    end
end

function stopLegendaryFly()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("LegendaryFly") then
            LocalPlayer.Character.HumanoidRootPart.LegendaryFly:Destroy()
        end
        if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("LegendaryFlyRotation") then
            LocalPlayer.Character.HumanoidRootPart.LegendaryFlyRotation:Destroy()
        end
    end
end

function toggleLegendarySpeed()
    legendaryFeatures.speedHackEnabled = not legendaryFeatures.speedHackEnabled
    if legendaryFeatures.speedHackEnabled then
        showLegendaryNotification("⚡ تم تفعيل السرعة الأسطورية! ⚡", Color3.fromRGB(255, 87, 34))
        startLegendarySpeed()
    else
        showLegendaryNotification("❌ تم إيقاف السرعة الأسطورية! ❌", Color3.fromRGB(255, 87, 87))
        stopLegendarySpeed()
    end
end

function startLegendarySpeed()
    spawn(function()
        while legendaryFeatures.speedHackEnabled do
            wait()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = 200
                LocalPlayer.Character.Humanoid.JumpPower = 100
            end
        end
    end)
end

function stopLegendarySpeed()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 16
        LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end

function toggleLegendaryGodMode()
    legendaryFeatures.godModeEnabled = not legendaryFeatures.godModeEnabled
    if legendaryFeatures.godModeEnabled then
        showLegendaryNotification("🌟 تم تفعيل وضع الإله! 🌟", Color3.fromRGB(158, 158, 158))
        startLegendaryGodMode()
    else
        showLegendaryNotification("❌ تم إيقاف وضع الإله! ❌", Color3.fromRGB(255, 87, 87))
    end
end

function startLegendaryGodMode()
    spawn(function()
        while legendaryFeatures.godModeEnabled do
            wait(0.1)
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.Health = LocalPlayer.Character.Humanoid.MaxHealth
                LocalPlayer.Character.Humanoid.MaxHealth = math.huge
                
                for _, part in pairs(LocalPlayer.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end
    end)
end

function executeUltimateScript()
    showLegendaryNotification("💎 تم تفعيل جميع القوى الأسطورية! 💎", Color3.fromRGB(255, 20, 147))
    
    legendaryFeatures.robEnabled = true
    legendaryFeatures.antiHandcuffEnabled = true
    legendaryFeatures.antiTitleEnabled = true
    legendaryFeatures.antiCharEnabled = true
    legendaryFeatures.pullAllEnabled = true
    legendaryFeatures.godModeEnabled = true
    legendaryFeatures.speedHackEnabled = true
    legendaryFeatures.flyModeEnabled = true
    
    startLegendaryRob()
    startLegendaryAntiHandcuff()
    startLegendaryAnti        local FeatureTitle = Instance.new("TextLabel")
        FeatureTitle.Name = "FeatureTitle"
        FeatureTitle.Parent = FeatureCard
        FeatureTitle.BackgroundTransparency = 1
        FeatureTitle.Position = UDim2.new(0, 75, 0, 10)
        FeatureTitle.Size = UDim2.new(1, -85, 0, 30)
        FeatureTitle.Font = Enum.Font.GothamBold
        FeatureTitle.Text = feature.title
        FeatureTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        FeatureTitle.TextSize = 16
        FeatureTitle.TextWrapped = true
        FeatureTitle.TextXAlignment = Enum.TextXAlignment.Left
        FeatureTitle.ZIndex = 15
        
        local FeatureDesc = Instance.new("TextLabel")
        FeatureDesc.Name = "FeatureDesc"
        FeatureDesc.Parent = FeatureCard
        FeatureDesc.BackgroundTransparency = 1
        FeatureDesc.Position = UDim2.new(0, 15, 0, 65)
        FeatureDesc.Size = UDim2.new(1, -25, 0, 45)
        FeatureDesc.Font = Enum.Font.Gotham
        FeatureDesc.Text = feature.desc
        FeatureDesc.TextColor3 = Color3.fromRGB(180, 180, 200)
        FeatureDesc.TextSize = 12
        FeatureDesc.TextWrapped = true
        FeatureDesc.TextXAlignment = Enum.TextXAlignment.Left
        FeatureDesc.TextYAlignment = Enum.TextYAlignment.Top
        FeatureDesc.ZIndex = 15
        
        FeatureCard.MouseEnter:Connect(function()
            local glowTween = TweenService:Create(FeatureStroke, TweenInfo.new(0.3), {
                Thickness = 4,
                Transparency = 0
            })
            glowTween:Play()
            
            local gradientTween = TweenService:Create(FeatureGradient, TweenInfo.new(0.3), {
                Transparency = NumberSequence.new(0.6)
            })
            gradientTween:Play()
        end)
        
        FeatureCard.MouseLeave:Connect(function()
            local glowTween = TweenService:Create(FeatureStroke, TweenInfo.new(0.3), {
                Thickness = 2,
                Transparency = 0.3
            })
            glowTween:Play()
            
            local gradientTween = TweenService:Create(FeatureGradient, TweenInfo.new(0.3), {
                Transparency = NumberSequence.new(0.8)
            })
            gradientTween:Play()
        end)
    end
    
    return MainPage
end

function createScriptsPage(parent)
    local ScriptsPage = Instance.new("ScrollingFrame")
    ScriptsPage.Name = "ScriptsPage"
    ScriptsPage.Parent = parent
    ScriptsPage.BackgroundTransparency = 1
    ScriptsPage.Size = UDim2.new(1, -20, 1, -20)
    ScriptsPage.Position = UDim2.new(0, 10, 0, 10)
    ScriptsPage.CanvasSize = UDim2.new(0, 0, 0, 1000)
    ScriptsPage.ScrollBarThickness = 8
    ScriptsPage.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
    ScriptsPage.ZIndex = 12
    ScriptsPage.Visible = false
    
    local PageTitle = Instance.new("TextLabel")
    PageTitle.Name = "PageTitle"
    PageTitle.Parent = ScriptsPage
    PageTitle.BackgroundTransparency = 1
    PageTitle.Size = UDim2.new(1, 0, 0, 60)
    PageTitle.Font = Enum.Font.FantasyQuest
    PageTitle.Text = "⚡ القوى الأسطورية ⚡"
    PageTitle.TextColor3 = Color3.fromRGB(255, 107, 107)
    PageTitle.TextSize = 28
    PageTitle.TextStrokeTransparency = 0
    PageTitle.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    PageTitle.ZIndex = 13
    
    local buttons = {
        {name = "💰 روب الخارق", desc = "جمع كل الأموال في الخادم", func = function() toggleLegendaryRob() end, color = Color3.fromRGB(255, 193, 7)},
        {name = "🛡️ مانع الكلبشة النهائي", desc = "حماية مطلقة من القيود", func = function() toggleLegendaryAntiHandcuff() end, color = Color3.fromRGB(76, 175, 80)},
        {name = "⚡ مغير الإسم البرقي", desc = "تغيير فوري ومستمر", func = function() toggleLegendaryAntiTitle() end, color = Color3.fromRGB(255, 152, 0)},
        {name = "🔄 حماية الكاراكتر", desc = "منع إعادة التعيين", func = function() toggleLegendaryAntiChar() end, color = Color3.fromRGB(103, 58, 183)},
        {name = "👥 سحب الجميع", desc = "قوة جذب خارقة", func = function() toggleLegendaryPullAll() end, color = Color3.fromRGB(233, 30, 99)},
        {name = "🚀 طيران إلهي", desc = "طيران بسرعة الضوء", func = function() toggleLegendaryFly() end, color = Color3.fromRGB(0, 188, 212)},
        {name = "⚡ سرعة خارقة", desc = "سرعة تفوق الخيال", func = function() toggleLegendarySpeed() end, color = Color3.fromRGB(255, 87, 34)},
        {name = "🌟 وضع الإله", desc = "حصانة كاملة", func = function() toggleLegendaryGodMode() end, color = Color3.fromRGB(158, 158, 158)},
        {name = "💎 التفعيل الشامل", desc = "تفعيل جميع القوى", func = function() executeUltimateScript() end, color = Color3.fromRGB(255, 20, 147)}
    }
    
    for i, button in ipairs(buttons) do
        local row = math.floor((i-1) / 3)
        local col = (i-1) % 3
        
        local Button = Instance.new("TextButton")
        Button.Name = button.name
        Button.Parent = ScriptsPage
        Button.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
        Button.BorderSizePixel = 0
        Button.Position = UDim2.new(col * 0.33, col * 10 + 5, 0, 80 + row * 110)
        Button.Size = UDim2.new(0.33, -10, 0, 100)
        Button.Font = Enum.Font.GothamBold
        Button.Text = ""
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 16
        Button.ZIndex = 13
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 15)
        ButtonCorner.Parent = Button
        
        local ButtonStroke = Instance.new("UIStroke")
        ButtonStroke.Color = button.color
        ButtonStroke.Thickness = 3
        ButtonStroke.Parent = Button
        
        local ButtonGradient = Instance.new("UIGradient")
        ButtonGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 50)),
            ColorSequenceKeypoint.new(0.5, button.color),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 50))
        })
        ButtonGradient.Rotation = 45
        ButtonGradient.Transparency = NumberSequence.new(0.7)
        ButtonGradient.Parent = Button
        
        local ButtonTitle = Instance.new("TextLabel")
        ButtonTitle.Name = "ButtonTitle"
        ButtonTitle.Parent = Button
        ButtonTitle.BackgroundTransparency = 1
        ButtonTitle.Position = UDim2.new(0, 10, 0, 10)
        ButtonTitle.Size = UDim2.new(1, -20, 0, 40)
        ButtonTitle.Font = Enum.Font.GothamBold
        ButtonTitle.Text = button.name
        ButtonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        ButtonTitle.TextSize = 16
        ButtonTitle.TextWrapped = true
        ButtonTitle.ZIndex = 14
        
        local ButtonDesc = Instance.new("TextLabel")
        ButtonDesc.Name = "ButtonDesc"
        ButtonDesc.Parent = Button
        ButtonDesc.BackgroundTransparency = 1
        ButtonDesc.Position = UDim2.new(0, 10, 0, 50)
        ButtonDesc.Size = UDim2.new(1, -20, 0, 40)
        ButtonDesc.Font = Enum.Font.Gotham
        ButtonDesc.Text = button.desc
        ButtonDesc.TextColor3 = Color3.fromRGB(180, 180, 200)
        ButtonDesc.TextSize = 12
        ButtonDesc.TextWrapped = true
        ButtonDesc.ZIndex = 14
        
        Button.MouseButton1Click:Connect(button.func)
        
        Button.MouseEnter:Connect(function()
            local hoverTween = TweenService:Create(Button, TweenInfo.new(0.3), {
                BackgroundColor3 = button.color,
                Size = UDim2.new(0.33, -5, 0, 105)
            })
            hoverTween:Play()
            
            ButtonStroke.Thickness = 5
            ButtonGradient.Transparency = NumberSequence.new(0.3)
        end)
        
        Button.MouseLeave:Connect(function()
            local leaveTween = TweenService:Create(Button, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(25, 25, 45),
                Size = UDim2.new(0.33, -10, 0, 100)
            })
            leaveTween:Play()
            
            ButtonStroke.Thickness = 3
            ButtonGradient.Transparency = NumberSequence.new(0.7)
        end)
    end
    
    return ScriptsPage
end

function createTargetPage(parent)
    local TargetPage = Instance.new("ScrollingFrame")
    TargetPage.Name = "TargetPage"
    TargetPage.Parent = parent
    TargetPage.BackgroundTransparency = 1
    TargetPage.Size = UDim2.new(1, -20, 1, -20)
    TargetPage.Position = UDim2.new(0, 10, 0, 10)
    TargetPage.CanvasSize = UDim2.new(0, 0, 0, 700)
    TargetPage.ScrollBarThickness = 8
    TargetPage.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
    TargetPage.ZIndex = 12
    TargetPage.Visible = false
    
    local PageTitle = Instance.new("TextLabel")
    PageTitle.Name = "PageTitle"
    PageTitle.Parent = TargetPage
    PageTitle.BackgroundTransparency = 1
    PageTitle.Size = UDim2.new(1, 0, 0, 60)
    PageTitle.Font = Enum.Font.FantasyQuest
    PageTitle.Text = "🎯 التارجت الأسطوري 🎯"
    PageTitle.TextColor3 = Color3.fromRGB(255, 193, 7)
    PageTitle.TextSize = 28
    PageTitle.TextStrokeTransparency = 0
    PageTitle.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    PageTitle.ZIndex = 13
    
    local InputFrame = Instance.new("Frame")
    InputFrame.Name = "InputFrame"
    InputFrame.Parent = TargetPage
    InputFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
    InputFrame.BorderSizePixel = 0
    InputFrame.Position = UDim2.new(0, 10, 0, 80)
    InputFrame.Size = UDim2.new(1, -20, 0, 80)
    InputFrame.ZIndex = 13
    
    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 15)
    InputCorner.Parent = InputFrame
    
    local InputStroke = Instance.new("UIStroke")
    InputStroke.Color = Color3.fromRGB(255, 193, 7)
    InputStroke.Thickness = 3
    InputStroke.Parent = InputFrame
    
    local PlayerInput = Instance.new("TextBox")
    PlayerInput.Name = "PlayerInput"
    PlayerInput.Parent = InputFrame
    PlayerInput.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    PlayerInput.BorderSizePixel = 0
    PlayerInput.Position = UDim2.new(0, 15, 0, 15)
    PlayerInput.Size = UDim2.new(1, -30, 0, 50)
    PlayerInput.Font = Enum.Font.GothamBold
    PlayerInput.PlaceholderText = "⚡ أدخل اسم اللاعب المستهدف هنا... ⚡"
    PlayerInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 170)
    PlayerInput.Text = ""
    PlayerInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    PlayerInput.TextSize = 18
    PlayerInput.ZIndex = 14
    
    local PlayerInputCorner = Instance.new("UICorner")
    PlayerInputCorner.CornerRadius = UDim.new(0, 10)
    PlayerInputCorner.Parent = PlayerInput
    
    local CopyFrame = Instance.new("Frame")
    CopyFrame.Name = "CopyFrame"
    CopyFrame.Parent = TargetPage
    CopyFrame.BackgroundTransparency = 1
    CopyFrame.Position = UDim2.new(0, 10, 0, 180)
    CopyFrame.Size = UDim2.new(1, -20, 0, 80)
    CopyFrame.ZIndex = 13
    
    local CopyButton = Instance.new("TextButton")
    CopyButton.Name = "CopyButton"
    CopyButton.Parent = CopyFrame
    CopyButton.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
    CopyButton.BorderSizePixel = 0
    CopyButton.Size = UDim2.new(1, 0, 1, 0)
    CopyButton.Font = Enum.Font.GothamBold
    CopyButton.Text = "📋 نسخ الأوامر الأسطورية 📋"
    CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CopyButton.TextSize = 20
    CopyButton.ZIndex = 14
    
    local CopyCorner = Instance.new("UICorner")
    CopyCorner.CornerRadius = UDim.new(0, 15)
    CopyCorner.Parent = CopyButton
    
    local CopyStroke = Instance.new("UIStroke")
    CopyStroke.Color = Color3.fromRGB(255, 215, 0)
    CopyStroke.Thickness = 3
    CopyStroke.Parent = CopyButton
    
    local CommandsFrame = Instance.new("Frame")
    CommandsFrame.Name = "CommandsFrame"
    CommandsFrame.Parent = TargetPage
    CommandsFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    CommandsFrame.BorderSizePixel = 0
    CommandsFrame.Position = UDim2.new(0, 10, 0, 280)
    CommandsFrame.Size = UDim2.new(1, -20, 0, 380)
    CommandsFrame.ZIndex = 13
    
    local CommandsCorner = Instance.new("UICorner")
    CommandsCorner.CornerRadius = UDim.new(0, 15)
    CommandsCorner.Parent = CommandsFrame
    
    local CommandsStroke = Instance.new("UIStroke")
    CommandsStroke.Color = Color3.fromRGB(138, 43, 226)
    CommandsStroke.Thickness = 2
    CommandsStroke.Parent = CommandsFrame
    
    local CommandsScroll = Instance.new("ScrollingFrame")
    CommandsScroll.Name = "CommandsScroll"
    CommandsScroll.Parent = CommandsFrame
    CommandsScroll.BackgroundTransparency = 1
    CommandsScroll.Position = UDim2.new(0, 15, 0, 15)
    CommandsScroll.Size = UDim2.new(1, -30, 1, -30)
    CommandsScroll.CanvasSize = UDim2.new(0, 0, 0, 500)
    CommandsScroll.ScrollBarThickness = 6
    CommandsScroll.ScrollBarImageColor3 = Color3.fromRGB(138, 43, 226)
    CommandsScroll.ZIndex = 14
    
    local CommandsLabel = Instance.new("TextLabel")
    CommandsLabel.Name = "CommandsLabel"
    CommandsLabel.Parent = CommandsScroll
    CommandsLabel.BackgroundTransparency = 1
    CommandsLabel.Size = UDim2.new(1, 0, 0, 500)
    CommandsLabel.Font = Enum.Font.SourceCodePro
    CommandsLabel.Text = "🌟 ستظهر الأوامر الأسطورية هنا بعد إدخال اسم اللاعب... 🌟"
    CommandsLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
    CommandsLabel.TextSize = 16
    CommandsLabel.TextWrapped = true
    CommandsLabel.TextXAlignment = Enum.TextXAlignment.Left
    CommandsLabel.TextYAlignment = Enum.TextYAlignment.Top
    CommandsLabel.ZIndex = 15
    
    CopyButton.MouseButton1Click:Connect(function()
        local playerName = PlayerInput.Text
        if playerName ~= "" then
            local commands = string.format([[
.fat %s
.size %s 0
.height %s 0.01
.neon %s
.speed %s 0
.color %s pink
.titlepk %s خنيًٍٍٍثً
]], playerName, playerName, playerName, playerName, playerName, playerName, playerName)
            
            CommandsLabel.Text = commands
            
            if setclipboard then
                setclipboard(commands)
                showLegendaryNotification("🔥 تم نسخ الأوامر الأسطورية إلى الحافظة! 🔥", Color3.fromRGB(76, 175, 80))
            else
                showLegendaryNotification("💎 الأوامر الأسطورية جاهزة للنسخ! 💎", Color3.fromRGB(255, 193, 7))
            end
            
            local copyEffect = TweenService:Create(CopyButton, TweenInfo.new(0.2), {
                Size = UDim2.new(1, 20, 1, 10)
            })
            copyEffect:Play()
            
            copyEffect.Completed:Connect(function()
                local backEffect = TweenService:Create(CopyButton, TweenInfo.new(0.2), {
                    Size = UDim2.new(1, 0, 1, 0)
                })
                backEffect:Play()
            end)
        else
            showLegendaryNotification("⚠️ يرجى إدخال اسم اللاعب أولاً! ⚠️", Color3.fromRGB(255, 87, 87))
            
            local shakeInfo = TweenInfo.new(0.1, Enum.EasingStyle.Bounce, Enum.EasingDirection.InOut, 3, true)
            local shakeTween = TweenService:Create(InputFrame, shakeInfo, {
                Position = UDim2.new(0, 15, 0, 80)
            })
            shakeTween:Play()
        end
    end)
    
    return TargetPage
end

function createChatPage(parent)
    local ChatPage = Instance.new("ScrollingFrame")
    ChatPage.Name = "ChatPage"
    ChatPage.Parent = parent
    ChatPage.BackgroundTransparency = 1
    ChatPage.Size = UDim2.new(1, -20, 1, -20)
    ChatPage.Position = UDim2.new(0, 10, 0, 10)
    ChatPage.CanvasSize = UDim2.new(0, 0, 0, 600)
    ChatPage.ScrollBarThickness = 8
    ChatPage.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
    ChatPage.ZIndex = 12
    ChatPage.Visible = false
    
    local PageTitle = Instance.new("TextLabel")
    PageTitle.Name = "PageTitle"
    PageTitle.Parent = ChatPage
    PageTitle.BackgroundTransparency = 1
    PageTitle.Size = UDim2.new(1, 0, 0, 60)
    PageTitle.Font = Enum.Font.FantasyQuest
    PageTitle.Text = "💬 التواصل الأسطوري 💬"
    PageTitle.TextColor3 = Color3.fromRGB(156, 39, 176)
    PageTitle.TextSize = 28
    PageTitle.TextStrokeTransparency = 0
    PageTitle.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    PageTitle.ZIndex = 13        StatValue.Name = "StatValue"
        StatValue.Parent = StatCard
        StatValue.BackgroundTransparency = 1
        StatValue.Position = UDim2.new(0, 45, 0, 5)
        StatValue.Size = UDim2.new(1, -55, 0, 30)
        StatValue.Font = Enum.Font.GothamBold
        StatValue.Text = stat.value
        StatValue.TextColor3 = Color3.fromRGB(255, 215, 0)
        StatValue.TextSize = 18
        StatValue.TextXAlignment = Enum.TextXAlignment.Left
        StatValue.ZIndex = 15
        
        local StatTitle = Instance.new("TextLabel")
        StatTitle.Name = "StatTitle"
        StatTitle.Parent = StatCard
        StatTitle.BackgroundTransparency = 1
        StatTitle.Position = UDim2.new(0, 10, 0, 35)
        StatTitle.Size = UDim2.new(1, -20, 0, 60)
        StatTitle.Font = Enum.Font.Gotham
        StatTitle.Text = stat.title
        StatTitle.TextColor3 = Color3.fromRGB(180, 180, 200)
        StatTitle.TextSize = 12
        StatTitle.TextWrapped = true
        StatTitle.TextXAlignment = Enum.TextXAlignment.Left
        StatTitle.TextYAlignment = Enum.TextYAlignment.Top
        StatTitle.ZIndex = 15
    end
    
    local FeaturesFrame = Instance.new("Frame")
    FeaturesFrame.Name = "FeaturesFrame"
    FeaturesFrame.Parent = MainPage
    FeaturesFrame.BackgroundTransparency = 1
    FeaturesFrame.Position = UDim2.new(0, 10, 0, 270)
    FeaturesFrame.Size = UDim2.new(1, -20, 0, 600)
    FeaturesFrame.ZIndex = 13
    
    local FeaturesTitle = Instance.new("TextLabel")
    FeaturesTitle.Name = "FeaturesTitle"
    FeaturesTitle.Parent = FeaturesFrame
    FeaturesTitle.BackgroundTransparency = 1
    FeaturesTitle.Size = UDim2.new(1, 0, 0, 40)
    FeaturesTitle.Font = Enum.Font.GothamBold
    FeaturesTitle.Text = "⚡ الميزات الأسطورية المتاحة ⚡"
    FeaturesTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
    FeaturesTitle.TextSize = 22
    FeaturesTitle.ZIndex = 14
    
    local features = {
        {title = "💰 سكربت الروب الخارق", desc = "جمع الأموال بسرعة الضوء مع حماية كاملة", icon = "💰", color = Color3.fromRGB(255, 193, 7)},
        {title = "🛡️ مانع الكلبشة النهائي", desc = "حماية 100% من جميع أنواع الكلبشة والقيود", icon = "🛡️", color = Color3.fromRGB(76, 175, 80)},
        {title = "⚡ مغير الإسم البرقي", desc = "تغيير الإسم بسرعة فائقة لتجنب الكشف", icon = "⚡", color = Color3.fromRGB(255, 152, 0)},
        {title = "🔄 حماية الكاراكتر المطلقة", desc = "منع إعادة تعيين الشخصية بالكامل", icon = "🔄", color = Color3.fromRGB(103, 58, 183)},
        {title = "👥 سحب الجميع المتقدم", desc = "سحب كافة اللاعبين بقوة خارقة", icon = "👥", color = Color3.fromRGB(233, 30, 99)},
        {title = "🚀 وضع الطيران الإلهي", desc = "طيران بسرعة وسلاسة لا محدودة", icon = "🚀", color = Color3.fromRGB(0, 188, 212)},
        {title = "⚡ تسريع خارق", desc = "سرعة فائقة تفوق الخيال", icon = "⚡", color = Color3.fromRGB(255, 87, 34)},
        {title = "🌟 وضع الإله", desc = "حصانة كاملة من جميع الأضرار", icon = "🌟", color = Color3.fromRGB(158, 158, 158)}
    }
    
    for i, feature in ipairs(features) do
        local row = math.floor((i-1) / 2)
        local col = (i-1) % 2
        
        local FeatureCard = Instance.new("Frame")
        FeatureCard.Name = "FeatureCard" .. i
        FeatureCard.Parent = FeaturesFrame
        FeatureCard.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
        FeatureCard.BorderSizePixel = 0
        FeatureCard.Position = UDim2.new(col * 0.5, col * 10 + 5, 0, 50 + row * 130)
        FeatureCard.Size = UDim2.new(0.5, -15, 0, 120)
        FeatureCard.ZIndex = 14
        
        local FeatureCorner = Instance.new("UICorner")
        FeatureCorner.CornerRadius = UDim.new(0, 15)
        FeatureCorner.Parent = FeatureCard
        
        local FeatureStroke = Instance.new("UIStroke")
        FeatureStroke.Color = feature.color
        FeatureStroke.Thickness = 2
        FeatureStroke.Parent = FeatureCard
        
        local FeatureGradient = Instance.new("UIGradient")
        FeatureGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 40)),
            ColorSequenceKeypoint.new(0.5, feature.color),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 40))
        })
        FeatureGradient.Rotation = 45
        FeatureGradient.Transparency = NumberSequence.new(0.8)
        FeatureGradient.Parent = FeatureCard
        
        local FeatureIcon = Instance.new("TextLabel")
        FeatureIcon.Name = "FeatureIcon"
        FeatureIcon.Parent = FeatureCard
        FeatureIcon.BackgroundTransparency = 1
        FeatureIcon.Position = UDim2.new(0, 15, 0, 10)
        FeatureIcon.Size = UDim2.new(0, 50, 0, 50)
        FeatureIcon.Font = Enum.Font.GothamBold
        FeatureIcon.Text = feature.icon
        FeatureIcon.TextColor3 = feature.color
        FeatureIcon.TextSize = 28
        FeatureIcon.ZIndex = 15
        -- ApexMHub v7.00 Ultimate by Bo.Sqr

local ApexMHub = {}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local isUIOpen = false
local currentPage = "main"
local targetPlayer = ""
local legendaryFeatures = {
    robEnabled = false,
    antiHandcuffEnabled = false,
    antiTitleEnabled = false,
    antiCharEnabled = false,
    pullAllEnabled = false,
    godModeEnabled = false,
    speedHackEnabled = false,
    flyModeEnabled = false
}

local function createParticleEffect(parent, particleType)
    local effect = Instance.new("Attachment")
    effect.Parent = parent
    
    local particle = Instance.new("ParticleEmitter")
    particle.Parent = effect
    particle.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    particle.Lifetime = NumberRange.new(1.0, 2.0)
    particle.Rate = 50
    particle.SpreadAngle = Vector2.new(45, 45)
    particle.Speed = NumberRange.new(5, 10)
    
    if particleType == "legendary" then
        particle.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 215, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 105, 180)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(138, 43, 226))
        })
    elseif particleType == "fire" then
        particle.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 100)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
        })
    end
    
    return particle
end

local function createLegendaryUI()
    if game.CoreGui:FindFirstChild("ApexMHub") then
        game.CoreGui:FindFirstChild("ApexMHub"):Destroy()
    end
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ApexMHub"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    local BackgroundEffects = Instance.new("Frame")
    BackgroundEffects.Name = "BackgroundEffects"
    BackgroundEffects.Parent = ScreenGui
    BackgroundEffects.BackgroundTransparency = 1
    BackgroundEffects.Size = UDim2.new(1, 0, 1, 0)
    BackgroundEffects.ZIndex = 0
    
    for i = 1, 50 do
        local particle = Instance.new("Frame")
        particle.Name = "Particle" .. i
        particle.Parent = BackgroundEffects
        particle.BackgroundColor3 = Color3.fromHSV(math.random(), 0.8, 1)
        particle.BorderSizePixel = 0
        particle.Size = UDim2.new(0, math.random(2, 6), 0, math.random(2, 6))
        particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
        particle.BackgroundTransparency = math.random(0.3, 0.8)
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(1, 0)
        corner.Parent = particle
        
        local moveInfo = TweenInfo.new(
            math.random(10, 20),
            Enum.EasingStyle.Linear,
            Enum.EasingDirection.InOut,
            -1,
            true
        )
        local moveTween = TweenService:Create(particle, moveInfo, {
            Position = UDim2.new(math.random(), 0, math.random(), 0),
            Rotation = 360,
            BackgroundColor3 = Color3.fromHSV((math.random() + tick()) % 1, 0.8, 1)
        })
        moveTween:Play()
    end
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -450, 0.5, -300)
    MainFrame.Size = UDim2.new(0, 900, 0, 600)
    MainFrame.Visible = false
    MainFrame.ZIndex = 10
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 20)
    MainCorner.Parent = MainFrame
    
    local OuterStroke = Instance.new("UIStroke")
    OuterStroke.Color = Color3.fromRGB(255, 215, 0)
    OuterStroke.Thickness = 4
    OuterStroke.Transparency = 0.2
    OuterStroke.Parent = MainFrame
    
    local GlowFrame = Instance.new("Frame")
    GlowFrame.Name = "GlowFrame"
    GlowFrame.Parent = ScreenGui
    GlowFrame.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    GlowFrame.BackgroundTransparency = 0.8
    GlowFrame.BorderSizePixel = 0
    GlowFrame.Position = UDim2.new(0.5, -460, 0.5, -310)
    GlowFrame.Size = UDim2.new(0, 920, 0, 620)
    GlowFrame.ZIndex = 5
    
    local GlowCorner = Instance.new("UICorner")
    GlowCorner.CornerRadius = UDim.new(0, 25)
    GlowCorner.Parent = GlowFrame
    
    local pulseInfo = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
    local pulseTween = TweenService:Create(GlowFrame, pulseInfo, {
        BackgroundTransparency = 0.6,
        Size = UDim2.new(0, 940, 0, 640)
    })
    pulseTween:Play()
    
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Parent = MainFrame
    TitleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    TitleBar.BorderSizePixel = 0
    TitleBar.Size = UDim2.new(1, 0, 0, 80)
    TitleBar.ZIndex = 11
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 20)
    TitleCorner.Parent = TitleBar
    
    local TitleGradient = Instance.new("UIGradient")
    TitleGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 40)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(40, 20, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 40))
    })
    TitleGradient.Rotation = 45
    TitleGradient.Parent = TitleBar
    
    local LogoLabel = Instance.new("TextLabel")
    LogoLabel.Name = "LogoLabel"
    LogoLabel.Parent = TitleBar
    LogoLabel.BackgroundTransparency = 1
    LogoLabel.Position = UDim2.new(0, 25, 0, 5)
    LogoLabel.Size = UDim2.new(0, 400, 0, 40)
    LogoLabel.Font = Enum.Font.FantasyQuest
    LogoLabel.Text = "🔥 ApexMHub v7.00 Ultimate 🔥"
    LogoLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    LogoLabel.TextSize = 24
    LogoLabel.TextStrokeTransparency = 0
    LogoLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    LogoLabel.TextXAlignment = Enum.TextXAlignment.Left
    LogoLabel.ZIndex = 12
    
    local logoColorInfo = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
    local logoColorTween = TweenService:Create(LogoLabel, logoColorInfo, {
        TextColor3 = Color3.fromRGB(255, 105, 180)
    })
    logoColorTween:Play()
    
    local DevLabel = Instance.new("TextLabel")
    DevLabel.Name = "DevLabel"
    DevLabel.Parent = TitleBar
    DevLabel.BackgroundTransparency = 1
    DevLabel.Position = UDim2.new(0, 25, 0, 45)
    DevLabel.Size = UDim2.new(0, 400, 0, 25)
    DevLabel.Font = Enum.Font.GothamBold
    DevLabel.Text = "👑 Created by: Bo.Sqr | 🌟 Legendary Developer 🌟"
    DevLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
    DevLabel.TextSize = 14
    DevLabel.TextXAlignment = Enum.TextXAlignment.Left
    DevLabel.ZIndex = 12
    
    local ButtonsFrame = Instance.new("Frame")
    ButtonsFrame.Name = "ButtonsFrame"
    ButtonsFrame.Parent = TitleBar
    ButtonsFrame.BackgroundTransparency = 1
    ButtonsFrame.Position = UDim2.new(1, -120, 0, 15)
    ButtonsFrame.Size = UDim2.new(0, 100, 0, 50)
    ButtonsFrame.ZIndex = 12
    
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = ButtonsFrame
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 193, 7)
    MinimizeButton.BorderSizePixel = 0
    MinimizeButton.Position = UDim2.new(0, 0, 0, 0)
    MinimizeButton.Size = UDim2.new(0, 40, 0, 40)
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Text = "─"
    MinimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    MinimizeButton.TextSize = 20
    MinimizeButton.ZIndex = 13
    
    local MinimizeCorner = Instance.new("UICorner")
    MinimizeCorner.CornerRadius = UDim.new(0, 12)
    MinimizeCorner.Parent = MinimizeButton
    
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = ButtonsFrame
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 59, 92)
    CloseButton.BorderSizePixel = 0
    CloseButton.Position = UDim2.new(0, 50, 0, 0)
    CloseButton.Size = UDim2.new(0, 40, 0, 40)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "✕"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 18
    CloseButton.ZIndex = 13
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 12)
    CloseCorner.Parent = CloseButton
    
    local SideBar = Instance.new("Frame")
    SideBar.Name = "SideBar"
    SideBar.Parent = MainFrame
    SideBar.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
    SideBar.BorderSizePixel = 0
    SideBar.Position = UDim2.new(0, 0, 0, 80)
    SideBar.Size = UDim2.new(0, 250, 1, -80)
    SideBar.ZIndex = 11
    
    local SideCorner = Instance.new("UICorner")
    SideCorner.CornerRadius = UDim.new(0, 15)
    SideCorner.Parent = SideBar
    
    local SideGradient = Instance.new("UIGradient")
    SideGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 25)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 15, 35))
    })
    SideGradient.Rotation = 90
    SideGradient.Parent = SideBar
    
    local NavigationFrame = Instance.new("ScrollingFrame")
    NavigationFrame.Name = "NavigationFrame"
    NavigationFrame.Parent = SideBar
    NavigationFrame.BackgroundTransparency = 1
    NavigationFrame.Position = UDim2.new(0, 15, 0, 20)
    NavigationFrame.Size = UDim2.new(1, -30, 1, -40)
    NavigationFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    NavigationFrame.ScrollBarThickness = 6
    NavigationFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
    NavigationFrame.ZIndex = 12
    
    local navButtons = {
        {name = "🏠 الرئيسية", icon = "🏠", page = "main", color = Color3.fromRGB(100, 200, 255)},
        {name = "⚡ السكربتات", icon = "⚡", page = "scripts", color = Color3.fromRGB(255, 100, 100)},
        {name = "🎯 التارجت", icon = "🎯", page = "target", color = Color3.fromRGB(255, 200, 100)},
        {name = "💬 الشات", icon = "💬", page = "chat", color = Color3.fromRGB(200, 255, 100)},
        {name = "🚀 متقدم", icon = "🚀", page = "advanced", color = Color3.fromRGB(255, 100, 255)},
        {name = "⚙️ الإعدادات", icon = "⚙️", page = "settings", color = Color3.fromRGB(150, 150, 255)}
    }
    
    local navButtonObjects = {}
    
    for i, button in ipairs(navButtons) do
        local NavButton = Instance.new("TextButton")
        NavButton.Name = button.page .. "Button"
        NavButton.Parent = NavigationFrame
        NavButton.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
        NavButton.BorderSizePixel = 0
        NavButton.Position = UDim2.new(0, 0, 0, (i-1) * 70)
        NavButton.Size = UDim2.new(1, 0, 0, 60)
        NavButton.Font = Enum.Font.GothamBold
        NavButton.Text = button.name
        NavButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        NavButton.TextSize = 16
        NavButton.ZIndex = 13
        
        local NavCorner = Instance.new("UICorner")
        NavCorner.CornerRadius = UDim.new(0, 15)
        NavCorner.Parent = NavButton
        
        local NavStroke = Instance.new("UIStroke")
        NavStroke.Color = button.color
        NavStroke.Thickness = 2
        NavStroke.Transparency = 0.5
        NavStroke.Parent = NavButton
        
        local NavGlow = Instance.new("UIGradient")
        NavGlow.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 50)),
            ColorSequenceKeypoint.new(0.5, button.color),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 50))
        })
        NavGlow.Rotation = 45
        NavGlow.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.8),
            NumberSequenceKeypoint.new(0.5, 0.6),
            NumberSequenceKeypoint.new(1, 0.8)
        })
        NavGlow.Parent = NavButton
        
        navButtonObjects[button.page] = NavButton
        
        NavButton.MouseEnter:Connect(function()
            local hoverTween = TweenService:Create(NavButton, TweenInfo.new(0.3), {
                BackgroundColor3 = button.color,
                Size = UDim2.new(1, 10, 0, 65)
            })
            hoverTween:Play()
            
            NavStroke.Transparency = 0
            NavGlow.Transparency = NumberSequence.new(0.3)
        end)
        
        NavButton.MouseLeave:Connect(function()
            local leaveTween = TweenService:Create(NavButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(25, 25, 40),
                Size = UDim2.new(1, 0, 0, 60)
            })
            leaveTween:Play()
            
            NavStroke.Transparency = 0.5
            NavGlow.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.8),
                NumberSequenceKeypoint.new(0.5, 0.6),
                NumberSequenceKeypoint.new(1, 0.8)
            })
        end)
        
        NavButton.MouseButton1Click:Connect(function()
            switchPage(button.page)
            
            local clickEffect = Instance.new("Explosion")
            clickEffect.Position = Vector3.new(0, 0, 0)
            clickEffect.BlastRadius = 0
            clickEffect.BlastPressure = 0
            clickEffect.Visible = false
            clickEffect.Parent = workspace
            
            local clickTween = TweenService:Create(NavButton, TweenInfo.new(0.1), {
                Size = UDim2.new(1, -10, 0, 55)
            })
            clickTween:Play()
            
            clickTween.Completed:Connect(function()
                local backTween = TweenService:Create(NavButton, TweenInfo.new(0.1), {
                    Size = UDim2.new(1, 10, 0, 65)
                })
                backTween:Play()
            end)
        end)
    end
    
    NavigationFrame.CanvasSize = UDim2.new(0, 0, 0, #navButtons * 70)
    
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Parent = MainFrame
    ContentFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 18)
    ContentFrame.BorderSizePixel = 0
    ContentFrame.Position = UDim2.new(0, 250, 0, 80)
    ContentFrame.Size = UDim2.new(1, -250, 1, -80)
    ContentFrame.ZIndex = 11
    
    local ContentCorner = Instance.new("UICorner")
    ContentCorner.CornerRadius = UDim.new(0, 15)
    ContentCorner.Parent = ContentFrame
    
    local ContentGradient = Instance.new("UIGradient")
    ContentGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 25)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 10, 30))
    })
    ContentGradient.Rotation = 135
    ContentGradient.Parent = ContentFrame
    
    createLegendaryPages(ContentFrame)
    
    CloseButton.MouseButton1Click:Connect(function()
        toggleLegendaryUI()
    end)
    
    MinimizeButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        isUIOpen = false
        showLegendaryNotification("🔥 ApexMHub تم تصغيره! اضغط Insert للعودة", Color3.fromRGB(255, 193, 7))
    end)
    
    makeLegendaryDraggable(MainFrame, TitleBar)
    
    return ScreenGui
end

function createLegendaryPages(parent)
    local pages = {
        main = createMainPage(parent),
        scripts = createScriptsPage(parent),
        target = createTargetPage(parent),
        chat = createChatPage(parent),
        advanced = createAdvancedPage(parent),
        settings = createSettingsPage(parent)
    }
    
    for pageName, page in pairs(pages) do
        page.Visible = (pageName == "main")
    end
    
    function switchPage(pageName)
        for name, page in pairs(pages) do
            page.Visible = (name == pageName)
        end
        
        local navButtons = parent.Parent:FindFirstChild("SideBar"):FindFirstChild("NavigationFrame"):GetChildren()
        for _, button in pairs(navButtons) do
            if button:IsA("TextButton") then
                if button.Name == pageName .. "Button" then
                    button.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
                    button.TextColor3 = Color3.fromRGB(0, 0, 0)
                else
                    button.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
                    button.TextColor3 = Color3.fromRGB(255, 255, 255)
                end
            end
        end
        
        currentPage = pageName
        showLegendaryNotification("🎯 تم التبديل إلى: " .. pageName, Color3.fromRGB(100, 255, 100))
    end
end

function createMainPage(parent)
    local MainPage = Instance.new("ScrollingFrame")
    MainPage.Name = "MainPage"
    MainPage.Parent = parent
    MainPage.BackgroundTransparency = 1
    MainPage.Size = UDim2.new(1, -20, 1, -20)
    MainPage.Position = UDim2.new(0, 10, 0, 10)
    MainPage.CanvasSize = UDim2.new(0, 0, 0, 1200)
    MainPage.ScrollBarThickness = 8
    MainPage.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
    MainPage.ZIndex = 12
    
    local WelcomeFrame = Instance.new("Frame")
    WelcomeFrame.Name = "WelcomeFrame"
    WelcomeFrame.Parent = MainPage
    WelcomeFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
    WelcomeFrame.BorderSizePixel = 0
    WelcomeFrame.Position = UDim2.new(0, 10, 0, 10)
    WelcomeFrame.Size = UDim2.new(1, -20, 0, 120)
    WelcomeFrame.ZIndex = 13
    
    local WelcomeCorner = Instance.new("UICorner")
    WelcomeCorner.CornerRadius = UDim.new(0, 15)
    WelcomeCorner.Parent = WelcomeFrame
    
    local WelcomeGradient = Instance.new("UIGradient")
    WelcomeGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 20, 60)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(60, 30, 90)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 20, 60))
    })
    WelcomeGradient.Rotation = 45
    WelcomeGradient.Parent = WelcomeFrame
    
    local WelcomeStroke = Instance.new("UIStroke")
    WelcomeStroke.Color = Color3.fromRGB(255, 215, 0)
    WelcomeStroke.Thickness = 3
    WelcomeStroke.Parent = WelcomeFrame
    
    local WelcomeTitle = Instance.new("TextLabel")
    WelcomeTitle.Name = "WelcomeTitle"
    WelcomeTitle.Parent = WelcomeFrame
    WelcomeTitle.BackgroundTransparency = 1
    WelcomeTitle.Position = UDim2.new(0, 20, 0, 10)
    WelcomeTitle.Size = UDim2.new(1, -40, 0, 50)
    WelcomeTitle.Font = Enum.Font.FantasyQuest
    WelcomeTitle.Text = "🌟 مرحباً في ApexMHub الأسطوري 🌟"
    WelcomeTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
    WelcomeTitle.TextSize = 28
    WelcomeTitle.TextStrokeTransparency = 0
    WelcomeTitle.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    WelcomeTitle.ZIndex = 14
    
    local WelcomeDesc = Instance.new("TextLabel")
    WelcomeDesc.Name = "WelcomeDesc"
    WelcomeDesc.Parent = WelcomeFrame
    WelcomeDesc.BackgroundTransparency = 1
    WelcomeDesc.Position = UDim2.new(0, 20, 0, 60)
    WelcomeDesc.Size = UDim2.new(1, -40, 0, 50)
    WelcomeDesc.Font = Enum.Font.GothamBold
    WelcomeDesc.Text = "💎 السكربت الأقوى والأحدث | 👑 by Bo.Sqr 👑 | 🔥 تجربة لا تُنسى 🔥"
    WelcomeDesc.TextColor3 = Color3.fromRGB(200, 200, 255)
    WelcomeDesc.TextSize = 16
    WelcomeDesc.TextWrapped = true
    WelcomeDesc.ZIndex = 14
    
    local StatsFrame = Instance.new("Frame")
    StatsFrame.Name = "StatsFrame"
    StatsFrame.Parent = MainPage
    StatsFrame.BackgroundTransparency = 1
    StatsFrame.Position = UDim2.new(0, 10, 0, 150)
    StatsFrame.Size = UDim2.new(1, -20, 0, 100)
    StatsFrame.ZIndex = 13
    
    local stats = {
        {title = "💰 المال المجمع", value = "∞", icon = "💰"},
        {title = "🛡️ الحماية النشطة", value = "100%", icon = "🛡️"},
        {title = "⚡ سرعة التنفيذ", value = "0.001ms", icon = "⚡"},
        {title = "🎯 دقة التارجت", value = "99.9%", icon = "🎯"}
    }
    
    for i, stat in ipairs(stats) do
        local StatCard = Instance.new("Frame")
        StatCard.Name = "StatCard" .. i
        StatCard.Parent = StatsFrame
        StatCard.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
        StatCard.BorderSizePixel = 0
        StatCard.Position = UDim2.new((i-1) * 0.25, 5, 0, 0)
        StatCard.Size = UDim2.new(0.25, -10, 1, 0)
        StatCard.ZIndex = 14
        
        local StatCorner = Instance.new("UICorner")
        StatCorner.CornerRadius = UDim.new(0, 12)
        StatCorner.Parent = StatCard
        
        local StatStroke = Instance.new("UIStroke")
        StatStroke.Color = Color3.fromRGB(100 + i * 30, 200 - i * 20, 255 - i * 40)
        StatStroke.Thickness = 2
        StatStroke.Parent = StatCard
        
        local StatIcon = Instance.new("TextLabel")
        StatIcon.Name = "StatIcon"
        StatIcon.Parent = StatCard
        StatIcon.BackgroundTransparency = 1
        StatIcon.Position = UDim2.new(0, 10, 0, 5)
        StatIcon.Size = UDim2.new(0, 30, 0, 30)
        StatIcon.Font = Enum.Font.GothamBold
        StatIcon.Text = stat.icon
        StatIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
        StatIcon.TextSize = 20
        StatIcon.ZIndex = 15
        
        local StatValue = Instance.new("TextLabel")
        StatValue