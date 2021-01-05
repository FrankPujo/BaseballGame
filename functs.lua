functs = {}

---------

functs.hitArr = function( ball, Sball, waiting, X, Y )
    
    transition.to( ball, { time = waiting, x = X, y = Y, transition = easing.linear } )
    transition.to( Sball, { time = waiting, x = X, y = Y, transition = easing.linear } )
    
    return
end

---------

functs.hitDon = function( zoneX, zoneY, X, Y )
    
    local distance = math.sqrt( (math.abs(zoneX - X))^2 + (math.abs(zoneY - Y))^2 )
    local hitPoints = ( 100 - distance ) / 10
    
    print( hitPoints )
    
    return hitPoints
end

---------

return functs