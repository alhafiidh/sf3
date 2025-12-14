--========================================
-- LOADER | Forge Script (GitHub)
-- Author : alhafiidh
--========================================

-- 🔗 RAW LINK SCRIPT UTAMA
local SCRIPT_URL = "https://raw.githubusercontent.com/alhafiidh/sf3/master/forge_al.txt"

-- ⚙️ CONFIG
local MAX_RETRY = 3
local RETRY_DELAY = 2

-- 🧠 INTERNAL
local HttpGet = game.HttpGet or game.GetService(game, "HttpService") and function(_, url)
    return game:HttpGet(url)
end

local function loadScript()
    local source = game:HttpGet(SCRIPT_URL)
    local fn = loadstring(source)
    fn()
end

-- 🚀 EXECUTE WITH RETRY
local success, err
for attempt = 1, MAX_RETRY do
    success, err = pcall(loadScript)
    if success then
        print("[Loader] Script berhasil dimuat")
        break
    else
        warn(string.format(
            "[Loader] Gagal load (percobaan %d/%d): %s",
            attempt,
            MAX_RETRY,
            tostring(err)
        ))
        task.wait(RETRY_DELAY)
    end
end

if not success then
    warn("[Loader] Script gagal dimuat setelah beberapa percobaan")
end