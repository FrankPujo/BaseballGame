local functs = require( "functs" )
local data = require( "data" )

local xCent = data.xx
local yCent = data.yy
local wait = data.time

math.randomseed( os.time() )

local rnX = math.random( xCent - 60, yCent + 60 )
local rnY = math.random( xCent - 90, yCent + 90 )

local ball1 = display.newCircle( rnX, 20, 10 )
local ball2 = display.newCircle( 300, rnY, 10 )

local zone = display.newCircle( xCent, yCent, 30 )
zone.strokeWidth = 2
zone:setFillColor( 0.8, 0.3, 0, 0.5 )
zone:setStrokeColor( 0.6, 0.2, 0 )

local function dragZone( event )
    
    local zone = event.target
    
    zone.x = event.x
    zone.y = event.y
    
end
zone:addEventListener( "touch", dragZone )

local doHit = functs.hitArr( ball1, ball2, wait, rnX, rnY )

local finHit = functs.hitDon( zone.x, zone.y, rnX, rnY )

timer.performWithDelay( wait, functs.hitDon )

local hitGroup = display.newGroup()
hitGroup:insert( ball1 )
hitGroup:insert( ball2 )
hitGroup:insert( zone )