--[[
%% properties
%% events
%% globals
--]]

local jT = json.decode(fibaro:getGlobalValue("HomeTable")) -- get the table from global-- get the table from global
local kitchenState = fibaro:getGlobalValue("KitchenState")

if ( kitchenState ~= 'Bright' ) then
    fibaro:debug('KitchenState - ' .. kitchenState .. ' - set to Bright')
    fibaro:call(jT.kitchen.lightstrip, "changeBrightness", jT.kitchen.dimlevel.bright)
    fibaro:call(jT.kitchen.lightstrip, "turnOn"); --// turn on the device
    fibaro:setGlobal('KitchenState', 'Bright')
else
    fibaro:debug('KitchenState already - ' .. kitchenState .. ' - set to Auto')
    fibaro:setGlobal('KitchenState', 'Auto')
    fibaro:call(jT.kitchen.lightstrip, "turnOff");
    fibaro:sleep(1000)
    fibaro:call(jT.kitchen.lightstrip, "turnOn");
    fibaro:sleep(1000)
    fibaro:call(jT.kitchen.lightstrip, "turnOff");
end
