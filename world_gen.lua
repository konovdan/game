-- world_gen.lua
-- Библиотека для генерации мира

-- ID блоков:
-- 1 - Белый блокозаменитель
-- 2 - Розовый блокозаменитель

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

function world_gen:CreateWorld(WORLD_WIDTH, WORLD_HEIGHT, GENERATION_TYPE)
    local WORLD_BLOCKS_ID = {}
    if GENERATION_TYPE == "TEST_BLANK_HALF_SEA" then
        for i = 1, WORLD_HEIGHT do
            local WORLD_X_LEVEL = {}
            for j = 1, WORLD_WIDTH do
                local BLOCK_ID = 0
                if i > (WORLD_HEIGHT / 2) then
                    BLOCK_ID = 1
                    if j % 2 == 0 then
                        BLOCK_ID = 2
                    end
                end
                table.insert(WORLD_X_LEVEL, BLOCK_ID)
            end
            table.insert(WORLD_BLOCKS_ID, WORLD_X_LEVEL)
        end
    end
    return WORLD_BLOCKS_ID
end

return world_gen