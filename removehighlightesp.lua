-- LocalScript in StarterPlayerScripts

local Players = game:GetService("Players")

-- Function to remove highlights from a character
local function removeHighlightsFromCharacter(character)
    for _, child in ipairs(character:GetChildren()) do
        if child:IsA("Highlight") then
            child:Destroy()
        end
    end
end

-- Function to remove all highlights from all players
local function removeAllHighlights()
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
end

-- Toggle callback function (to be connected to your Rayfield toggle)
local function onToggle(value)
    if not value then
        -- If the toggle is off, remove all highlights
        removeAllHighlights()
    end
end

-- Example usage (replace with your actual toggle logic)
-- Assuming you have a Rayfield toggle that calls `onToggle` with a boolean value
-- toggle.Callback = onToggle
