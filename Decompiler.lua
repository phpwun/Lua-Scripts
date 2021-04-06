local copy = {
    "Workspace",
    "Players",
    "Lighting",
    "ReplicatedFirst",
    "ReplicatedStorage",
    "StarterGui",
    "StarterPack",
    "StarterPlayer",
    "Teams"
}
local decompileEnabled = true -- If enabled, will decompile LocalScripts/ModuleScripts without using the paramater within the saveinstance function
local useBuiltInDecompiler = false -- If enabled, will use the paramater within the SaveInstance function to decompile(very buggy)
-- Set both of the variables for decompiling to false if you do not want to decompile LocalScripts/ModuleScripts

local games = Instance.new("Folder", game)
games.Name = "GameStorage"

printoutput("\nSteal processing")

function archivable(root)
    for i, v in pairs(root:GetChildren()) do
        if not game.Players:GetPlayerFromCharacter(v) then
            v.Archivable = true
            archivable(v)
        end
    end
end

for _, v in pairs(copy) do
    local folder = Instance.new("Folder", games)
    folder.Name = v

    archivable(game[v])
end

for _, v in pairs(copy) do
    for _, w in pairs(game[v]:GetChildren()) do
        pcall(
            function()
                w:Clone().Parent = games[v]
            end
        )
    end
end

local un_pack = Instance.new("LocalScript", games)
un_pack.Source =
    [[
-- Take this and execute it in the command bar

for _,v in pairs(game:WaitForChild("GameStorage"):GetChildren()) do
for _,w in pairs(v:GetChildren()) do
pcall(function()
w.Parent = game[v.Name]
end)
end
end
]]

function Decompiler(Source)
    for i, v in pairs(Source:children()) do
        if v:IsA("LocalScript") then
            pcall(
                function()
                    v.Source = tostring(decompile(v))
                end
            )
        elseif v:IsA("ModuleScript") then
            pcall(
                function()
                    v.Source = tostring(decompile(v))
                end
            )
        end
        Decompiler(v)
    end
end

if decompileEnabled and not useBuiltInDecompiler then
    pcall(Decompiler, game.GameStorage)
end

saveinstance(
    games,
    game:GetService("MarketplaceService"):GetProductInfo(tonumber(game.PlaceId)).Name,
    useBuiltInDecompiler
)
printoutput("\n Steal complete")
