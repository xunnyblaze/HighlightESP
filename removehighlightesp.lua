    local Players = game:GetService("Players")
    
    -- Function to remove highlights from all players
    local function removeAllHighlights()
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                for _, child in ipairs(player.Character:GetChildren()) do
                    if child:IsA("Highlight") then
                        child:Destroy()
                    end
                end
            end
            player.CharacterAdded:Connect(function(character)
                character:WaitForChild("HumanoidRootPart", 5)
                wait(0.1) -- Slight delay for safety
                for _, child in ipairs(character:GetChildren()) do
                    if child:IsA("Highlight") then
                        child:Destroy()
                    end
                end
            end)
        end
    end

    -- Call this when the toggle is turned off
    removeAllHighlights()
]])()
