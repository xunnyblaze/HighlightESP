local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer

local function highlightCharacter(character)
    if character and not character:FindFirstChild("Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.FillColor = Color3.fromRGB(255, 255, 0) -- Yellow
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.OutlineTransparency = 0
        highlight.FillTransparency = 0.5
        highlight.Adornee = character
        highlight.Parent = character
    end
end

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= localPlayer then
        player.CharacterAdded:Connect(function(char)
            -- Wait for character to load
            char:WaitForChild("HumanoidRootPart", 5)
            highlightCharacter(char)
        end)
        if player.Character then
            highlightCharacter(player.Character)
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= localPlayer then
        player.CharacterAdded:Connect(function(char)
            char:WaitForChild("HumanoidRootPart", 5)
            highlightCharacter(char)
        end)
    end
end)
