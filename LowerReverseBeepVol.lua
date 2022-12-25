LowerReverseBeepVol = {}
-- ToDo
-- create settings HUD, adjustable volume 
-- save xml for mp/sp the volume in mp for each player serverside or clientside ?!
-- 
--
-- v 0.9.1.1
-- SbSh / frvetz
-- 30.11.2022 - 0.9..
-- 22.12.2022 - 0.9.1.1 md:1.0.0.0
-- 


local RDSvol = 0.4  -- volume scale 0.4 means 60 %
local RDver = "0.9.1.1"
local RDauthor = "SbSh / frvetz"

 print("load script LRBV FS22_LowerReverseBeepVol version " .. RDver .. " ".. RDauthor .." <--") -- self.version

function LowerReverseBeepVol:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    local spec = self.spec_motorized

    if self:getIsMotorStarted() then
        if self.isClient then
            local samples = spec.samples
			if samples.reverseDrive ~= nil then
				g_soundManager:setSampleVolumeOffset(samples.reverseDrive, RDSvol)
			end
        end
    end
end

Motorized.onUpdate = Utils.appendedFunction(Motorized.onUpdate, LowerReverseBeepVol.onUpdate)

