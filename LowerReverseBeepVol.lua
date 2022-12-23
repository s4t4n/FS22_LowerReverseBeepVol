LowerReverseBeepVol = {}
-- ToDo
-- create settings HUD, adjustable volume 
-- save xml for mp/sp the volume in mp for each player serverside or clientside ?!
-- 
--
--
--
-- v 0.9.0.1 beta
-- SbSh (s4t4n)
-- 30.11.2022
-- 


local RDSvol = 0.2;  -- volume scale 0.4 means 60 %
local RDver = "0.9.0.0 beta"

 print("load script LRBV FS22_LowerReverseBeepVol version " .. RDver .. " (by SbSh) <--"); -- self.version

function LowerReverseBeepVol:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    local spec = self.spec_motorized

    if self:getIsMotorStarted() then
        if self.isClient then
            local samples = spec.samples
			if samples.reverseDrive ~= nil then
				g_soundManager:setSampleVolumeOffset(samples.reverseDrive, 4)
			end
        end
    end
end

Motorized.onUpdate = Utils.appendedFunction(Motorized.onUpdate, LowerReverseBeepVol.onUpdate)
