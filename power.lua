local widget = require( "widget" )

local rectangle = display.newRect( 260, 400, 40, 20 )

local colour =
{
    type = "gradient",
    color1 = {1, 0.7, 0.1},
    color2 = {0.9, 0.1, 0.1},
    direction = "up"
}
rectangle:setFillColor( colour )

local trans1 = transition.to( rectangle, { time = 2000, height = 200, y= 310, transition = outinExpo } )
local trans2 = transition.to( rectangle, { delay = 2000, time = 2000, height = 20, y = 400, transition = outinExpo } )

local outRect = display.newRect( 260, 310, 44, 204 )
outRect.strokeWidth = 4
outRect:setFillColor( 1, 1, 1, 0 )
outRect:setStrokeColor( 1, 1, 1 )

local powerGroup = display.newGroup()
powerGroup:insert( rectangle )
powerGroup:insert( outRect )

powerGroup.y = -80

--

local function stopPow( event )
    
    transition.pause( trans1  )
    transition.pause( trans2 )
    local pts = ( rectangle.height - 100 ) / 10
    local ptsText = display.newText( "Your score: "..tostring( pts ), 100, 100 )
    
end

local button1 = widget.newButton(
    {
        onPress = stopPow,
        --
        shape = "circle",
        radius = 10,
        x = 260,
        y = 400,
        radius = 20,
        fillColor = { default = {1, 0, 0}, over = {0.6, 0, 0} }
    }
)

local powGroup = display.newGroup()
powGroup:insert( button1 )
powGroup:insert( rectangle )
powGroup:insert( outRect )