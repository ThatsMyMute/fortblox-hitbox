 getgenv().Condition = true
    getgenv().HeadSize = 15
    getgenv().Disabled = true

    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")

    while getgenv().Condition do
        getgenv().Disabled = true

        RunService.RenderStepped:Connect(function()
            if getgenv().Disabled then
                for _, player in ipairs(Players:GetPlayers()) do
                    if player.Name ~= Players.LocalPlayer.Name then
                        pcall(function()
                            local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                            if humanoidRootPart then
                                humanoidRootPart.Size = Vector3.new(getgenv().HeadSize, getgenv().HeadSize, getgenv().HeadSize)
                                humanoidRootPart.Transparency = 0.7
                                humanoidRootPart.BrickColor = BrickColor.new("Really blue")
                                humanoidRootPart.Material = "Neon"
                                humanoidRootPart.CanCollide = false
                            end
                        end)
                    end
                end
            end
        end)

        wait(3)
    end
