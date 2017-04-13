--[[
%% properties
%% events
%% globals
--]]

local scene = fibaro:getValue(162, 'sceneActivation')

local jT = json.decode(fibaro:getGlobalValue("HomeTable")) -- get the table from global-- get the table from global
local hallState = fibaro:getGlobalValue("HallState")

if ( hallState ~= 'Bright' ) then
    fibaro:debug('HallState - ' .. hallState .. ' - set to Bright')
    fibaro:call(jT.hall.downlights, "setValue", jT.hall.dimlevel.awake)
    --fibaro:call(jT.hall.downlights, "setValue", jT.hall.dimlevel.sleep)
    --fibaro:call(jT.hall.downlights, "turnOn"); --// turn on the device
    fibaro:setGlobal('HallState', 'Bright')
else
    fibaro:debug('HallState already - ' .. hallState .. ' - set to Auto')
    fibaro:setGlobal('HallState', 'Auto')
    fibaro:call(jT.hall.downlights, "turnOff");
end
    
