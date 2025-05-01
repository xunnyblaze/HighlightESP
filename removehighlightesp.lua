-- LocalScript in StarterPlayerScripts

local Players = game:GetService("Players")

-- Function to remove highlights from all characters
local function removeAllHighlights()
    -- Loop through every player in the game
    for _, player in ipairs(Players:GetPlayers()) do
        -- Check if the player has a character
        if player.Character then
            -- Loop through the character’s children
            for _, child in ipairs(player.Character:GetChildren()) do
                -- If the child is a Highlight object, destroy it
                if child:IsA("Highlight") then
                    child:Destroy()
                end
            end
        end
        
        -- Connect a function to the player's character added event (for respawning players)
        player.CharacterAdded:Connect(function(character)
            -- Wait for the character to load fully
            character:WaitForChild("HumanoidRootPart", 5)
            -- Delay a little to make sure everything is set up
            wait(0.1)
            -- Loop through the character's children and remove highlights
            for _, child in ipairs(character:GetChildren()) do
                if child:IsA("Highlight") then
                    child:Destroy()
                end
            end
        end)
    end
end

-- Call this when the toggle is set to false
local function onToggle(value)
    if not value then
        -- When the toggle is false, remove all the highlights
        removeAllHighlights()
    end
end

-- Replace this with your actual toggle callback, example:
-- toggle.Callback = onToggle
