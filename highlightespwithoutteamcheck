local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function addHighlightToCharacter(character)
	if not character then return end

	local old = character:FindFirstChild("Highlight")
	if old then old:Destroy() end

	local highlight = Instance.new("Highlight")
	highlight.Name = "Highlight"
	highlight.FillColor = Color3.fromRGB(255, 0, 0)
	highlight.OutlineColor = Color3.new(1, 1, 1)
	highlight.FillTransparency = 0.5
	highlight.OutlineTransparency = 0
	highlight.Adornee = character
	highlight.Parent = character
end

local function setupPlayer(player)
	if player == LocalPlayer then return end

	if player.Character then
		addHighlightToCharacter(player.Character)
	end

	player.CharacterAdded:Connect(function(character)
		addHighlightToCharacter(character)
	end)
end

for _, player in ipairs(Players:GetPlayers()) do
	setupPlayer(player)
end

Players.PlayerAdded:Connect(setupPlayer)
