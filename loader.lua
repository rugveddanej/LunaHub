local function loadScriptFromGitHub(url)
    local success, scriptContent = pcall(function()
        return game:HttpGet(url)
    end)

    if success then
        local loadedFunction, loadError = loadstring(scriptContent)
        if loadedFunction then
            pcall(loadedFunction)
        else
            warn("Error loading script: ", loadError)
        end
    else
        warn("Error fetching script from URL:", url)
    end
end

-- Define a table with game IDs and corresponding script URLs
local gameScripts = {
    [11468034852] = "https://raw.githubusercontent.com/rugveddanej/LunaHub/main/Project_Slayer/mugen-train", -- Replace with actual game ID and script URL
    [2345678901] = "https://raw.githubusercontent.com/username/repo/branch/path/to/script2.lua"  -- Replace with actual game ID and script URL
}

-- Get the current game ID
local currentGameId = game.PlaceId

-- Check if there's a script for the current game
local scriptUrl = gameScripts[currentGameId]
if scriptUrl then
    -- Load and execute the script
    loadScriptFromGitHub(scriptUrl)
else
    warn("No script found for this game.")
end
