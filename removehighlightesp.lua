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
    -- Loop through all players in the game
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            -- Remove highlights from existing characters
            removeHighlightsFromCharacter(player.Character)
        end
        -- If a new character is added, remove highlights as well
        player.CharacterAdded:Connect(function(char)
            -- Wait for the character to fully load
            char:WaitForChild("HumanoidRootPart", 5)
            task.wait(0.1) -- Small delay before attempting to remove highlights
            removeHighlightsFromCharacter(char)
        end)
    end
end

-- Toggle callback function (assuming you already have a toggle setup)
local function onToggle(value)
    if not value then
        -- When toggle is off, remove all highlights
        removeAllHighlights()
    end
end

-- Example: Replace with your actual toggle callback
-- toggle.Callback = onToggle
