local xCent = display.contentCenterX
local yCent = display.contentCenterY

local zone = display.newCircle( xCent, yCent, 30 )
zone.strokeWidth = 2
zone:setFillColor( 0.8, 0.3, 0, 0.5 )
zone:setStrokeColor( 0.6, 0.2, 0 )

local function dragZone( event )
    
    local zone = event.target
    
    zone.x = event.x
    zone.y = event.y
        
    return true
end

zone:addEventListener( "touch", dragZone )

-------------------------------------------------

local rnX = math.random( xCent - 120, xCent + 120 )
local rnY = math.random( yCent - 180, yCent + 180 )

local ball1 = display.newCircle( rnX, 20, 10 )
local ball2 = display.newCircle( 300, rnY, 10 )

transition.to( ball1, { time = 800, x = rnX, y = rnY } )
transition.to( ball2, { time = 800, x = rnX, y = rnY } )

local function hit( listener )
    local distance = math.sqrt( (math.abs(zone.x - rnX))^2 + (math.abs(zone.y - rnY))^2 )
    print( distance )
    local points = (100 - distance )/10
    --delete points
    local pointsText = display.newText( "Points: "..tostring(points), 100, 100 )
end

timer.performWithDelay( 800, hit )

local hitGroup = display.newGroup()
hitGroup:insert( zone )
hitGroup:insert( ball1 )
hitGroup:insert( ball2 )

return hitGroup