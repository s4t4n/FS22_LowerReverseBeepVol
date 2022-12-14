
-- ToDo
-- create settings HUD, adjustable volume 
-- save xml for mp/sp the volume in mp for each player serverside or clientside ?!
-- 
--
--
--
-- v 0.9.0.1
-- SbSh (s4t4n)
-- 30.11.2022
-- 
local RDSvol = 0.2;  -- volume scale 0.4 means 60 %
local RDver = "0.9.0.0"
print("¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯")
print("load script LRBV FS22_LowerReverseBeepVol version " .. RDver .. " (by SbSh)  |"); -- self.version
print("________________________________________________________________________________")

LowerReverseBeepVol = {};

function LowerReverseBeepVol.prerequisitesPresent(specializations)
    return true
end;

function LowerReverseBeepVol:loadMap(name)
end

function LowerReverseBeepVol:deleteMap()
end


function LowerReverseBeepVol:update(dt)
end;


function SoundManager:updateSampleAttributes(sample, force)
    if sample ~= nil then
        if sample.isIndoor ~= self.isIndoor or force then
            self:setCurrentSampleAttributes(sample, self.isIndoor)
            sample.isIndoor = self.isIndoor
        end

        local volumeFactor = self:getModifierFactor(sample, "reverseDrive")
        -- local pitchFactor = self:getModifierFactor(sample, "pitch")
        -- local lowpassGainFactor = self:getModifierFactor(sample, "lowpassGain")

		-------------------------------------------------------
		-- Added REA functionality
		if sample.IsMotor then
			local Volume, Pitch, Lowpass = LowerReverseBeepVol:GetVolumePitchLowpassFactor(sample);
			volumeFactor = volumeFactor * Volume;
			-- pitchFactor = pitchFactor * Pitch;
			-- lowpassGainFactor = lowpassGainFactor * Lowpass;
		end;
		-------------------------------------------------------

        setSampleVolume(sample.soundSample, volumeFactor * self:getCurrentSampleVolume(sample))
        -- setSamplePitch(sample.soundSample, pitchFactor * self:getCurrentSamplePitch(sample))
        -- setSampleFrequencyFilter(sample.soundSample, 1.0, lowpassGainFactor * self:getCurrentSampleLowpassGain(sample), 0.0, sample.current.lowpassCutoffFrequency, 0.0, sample.current.lowpassResonance)
    end
end