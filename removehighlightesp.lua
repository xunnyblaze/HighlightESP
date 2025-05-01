local Players = game:GetService("Players")

local function removeHighlightsFromCharacter(character)
    for _, child in ipairs(character:GetChildren()) do
        if child:IsA("Highlight") then
            child:Destroy()
        end
    end
end

for _, player in ipairs(Players:GetPlayers()) do
    if player.Character then
        removeHighlightsFromCharacter(player.Character)
    end
    player.CharacterAdded:Connect(function(char)
        char:WaitForChild("HumanoidRootPart", 5)
        task.wait(0.1)
        removeHighlightsFromCharacter(char)
    end)
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        char:WaitForChild("HumanoidRootPart", 5)
        task.wait(0.1)
        removeHighlightsFromCharacter(char)
    end)
end)
