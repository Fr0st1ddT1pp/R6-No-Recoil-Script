-- ================== CONFIGURATION ===================
EnableRC          = true                  -- Master switch
RequireToggle     = true                  -- Require toggle key
ToggleKey         = "CapsLock"            -- Toggle key (e.g., "CapsLock")

RecoilControlMode = "ECHO"                -- Select operator preset

-- =============== RECOIL VALUES (Presets) ===============
local RecoilPresets = {
    ["ASH/RAM"] = { Vertical = 63, Horizontal = -3 },
    ["LESION/ORYX"] = { Vertical = 22, Horizontal = 0 },
    ["MIRA"] = { Vertical = 27, Horizontal = 0 },
    ["VIGIL/DOKKAEBI/WARDEN"] = { Vertical = 93, Horizontal = 9 },
    ["DOC/ROOK/MELUSI"] = { Vertical = 48, Horizontal = -1 },
    ["VALK"] = { Vertical = 18, Horizontal = 0 },
    ["IANA"] = { Vertical = 49, Horizontal = 1 },
    ["ACE/FUZE"] = { Vertical = 54, Horizontal = -1 },
    ["FENRIR/BANDIT"] = { Vertical = 18, Horizontal = 1 },
    ["YING"] = { Vertical = 42, Horizontal = 0 },
    ["ECHO"] = { Vertical = 44, Horizontal = -1 },
    ["AZAMI/KAPKAN"] = { Vertical = 20, Horizontal = -1 },
    ["KAID/GOYO/SENTRY"] = { Vertical = 17, Horizontal = 1 },
    ["DEIMOS"] = { Vertical = 32, Horizontal = -1 },
    ["ZERO"] = { Vertical = 72, Horizontal = -2 },
    ["TWITCH/SOLID SNAKE"] = { Vertical = 72, Horizontal = -2 },
    ["IQ/GRIM"] = { Vertical = 46, Horizontal = -1 },
    ["MOZZIE/ARUNI"] = { Vertical = 50, Horizontal = -1 },
    ["SMOKE/MUTE"] = { Vertical = 55, Horizontal = -3 },
    ["ELA/DENARI"] = { Vertical = 64, Horizontal = -3 },
    ["FLORES"] = { Vertical = 0, Horizontal = 0 },
    ["BUCK"] = { Vertical = 0, Horizontal = 0 },
    ["STRIKER/MAVERICK"] = { Vertical = 0, Horizontal = 0 }
}
--ALL VALUES MADE FOR 1600 DPI IN GAME SENS, 56-56 0.001 Multiplier un ads only, 1.0x 22, 2.5x 53.


--======== DONT CHANGE ANYTHING BELOW HERE IF YOU DONT KNOW WHAT YOUR DOING ====================

-- =================== SETUP ===========================
local Recoil         = RecoilPresets[RecoilControlMode] or { Vertical = 30, Horizontal = 0 }
local VerticalStrength = Recoil.Vertical        
local HorizontalStrength = Recoil.Horizontal    
local ShootDelay     = 4                        

EnablePrimaryMouseButtonEvents(true)            

-- ================== DISPLAY FUNCTION =================
-- Function to display messages in the log
function DisplayMessage(message)
    OutputLogMessage(message .. "\n")
end

-- ===================== MAIN LOOP ====================
function OnEvent(event, arg)
    if event == "PROFILE_ACTIVATED" then
        ClearLog()
        DisplayMessage("[Recoil Script Activated]")  -- Display activation message
        DisplayMessage(string.format("Current Preset: %s | Vertical: %d | Horizontal: %d", 
                                      RecoilControlMode, VerticalStrength, HorizontalStrength)) 
    end
    
    if EnableRC and (not RequireToggle or IsKeyLockOn(ToggleKey)) then
        if IsMouseButtonPressed(3) then           -- Aim down sights
            while IsMouseButtonPressed(3) do
                if IsMouseButtonPressed(1) then   -- Fire button
                    while IsMouseButtonPressed(1) do
                        MoveMouseRelative(HorizontalStrength, VerticalStrength)
                        Sleep(ShootDelay)
                    end
                end
                Sleep(5)
            end
        end
    end
end
