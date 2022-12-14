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

function LowerReverseBeepVol:loadSounds(xmlFile, baseString)
    if self.isClient then
        local spec = self.spec_motorized

        if spec.samples.reverseDrive ~= nil then
            spec.samples.reverseDrive = nil -- drop sample
			--setSampleVolume(spec.samples.reverseDrive, 0.2)
			print("LRBV ------------- it goes ----------------")
			print ("LRBV  Volume= " .. RDSvol .." factor ")
        else
		
             --LowerReverseBeepVol:PrintDebug("LRBV sample name: " .. sample.sampleName);
             --LowerReverseBeepVol:PrintDebug("LRBV spec  name : " .. spec.samples.reverseDrive);
             print("LRBV --> FAIL: spec.samples.reverseDrive is nil = " .. RDSvol);
			 
             print("LRBV --> FAIL: nil content overritten by engine");
			 
			--setSampleVolume(spec.samples.reverseDrive.volumeScale, 0.3) --doesn't work -> samples.reverseDrive = nil index
			-- setSampleVolume(spec.samples.reverseDrive, 0.4 * self:getCurrentSampleVolume(sample)) -- no sample
			--print("LRBV Current vol: " ..self:getCurrentSampleVolume(sample))  -- nil
            spec.samples.reverseDrive = nil -- dropping works = no beepsound
			print("LRBV beep sound dropped")
        end
        
    end
end

Motorized.loadSounds = Utils.appendedFunction(Motorized.loadSounds, LowerReverseBeepVol.loadSounds)
