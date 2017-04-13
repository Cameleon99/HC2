--[[
%% properties
%% events
%% globals
--]]

local jT = json.decode(fibaro:getGlobalValue("HomeTable")) -- get the table from global-- get the table from global
local hallState = fibaro:getGlobalValue("HallState")

if ( hallState ~= 'Off' ) then
    fibaro:debug('HallState - ' .. hallState .. ' - set to Off')
    fibaro:call(jT.hall.downlights, "turnOff"); --// turn on the device
    fibaro:setGlobal('HallState', 'Off')
else
    fibaro:debug('HallState already - ' .. hallState .. ' - set to Auto')
    fibaro:setGlobal('HallState', 'Auto')
    fibaro:call(jT.hall.downlights, "turnOff");
end
    
