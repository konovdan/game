-- world_gen.lua
-- Библиотека для генерации мира

local world_gen = {}

function world_gen:CreatePoints(WORLD_WIDTH, WORLD_HEIGHT, POINTS_COOUNT) 
    local POINTS = {}
    for i = 1, POINTS_COOUNT do
        table.insert(POINTS,  { 
            love.math.random(WORLD_WIDTH - 1), 
            love.math.random(WORLD_HEIGHT - 1),
        }) 
    end
    return POINTS
end

return world_gen