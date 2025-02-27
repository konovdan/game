local interface = require('interface')
local world_gen = require('world_gen')

function ComparePoints(point_1, point_2) --Необходимо для сортировки точек через table.sort по координате X - требуется для шума Воронова
    if point_1[1] < point_2[1] then
        return true
    else
        return false
    end
end


function IterateWorldDrawing(world)
    for i = 1, #world do
        local world_level_x = world[i]
        for j = 1, #world_level_x do
            if (world_level_x[j] == 0) then
                love.graphics.setColor(0, 0, 0)
            end
            if (world_level_x[j] == 1) then
                love.graphics.setColor(1, 1, 1)
            end
            if (world_level_x[j] == 2) then
                love.graphics.setColor(1, 0.5, 0.5)
            end
            love.graphics.rectangle('fill', (j - 1) * WORLD_CUBE_SIZE, (i - 1) * WORLD_CUBE_SIZE, WORLD_CUBE_SIZE, WORLD_CUBE_SIZE)
        end
    end
end

function love.load()
    love.math.setRandomSeed(os.time())

    local WORLD_HEIGHT = 60
    local WORLD_WIDTH = 80
    WORLD_CUBE_SIZE = 10
    local WORLD_VORONOI_POINTS_COUNT = 5

    WORLD_VORONOI_POINTS = world_gen:CreatePoints(WORLD_WIDTH, WORLD_HEIGHT, WORLD_VORONOI_POINTS_COUNT) -- Генерация точек для генерации шума (WIP)
    WORLD_BLOCKS = world_gen:CreateWorld(WORLD_WIDTH, WORLD_HEIGHT, "TEST_BLANK_HALF_SEA")

    table.sort(WORLD_VORONOI_POINTS, ComparePoints) -- Собственно сортировка точек по координате X
end

function love.update(dt) 
end

function love.draw()
    love.graphics.setPointSize(3)
    for i = 1, #WORLD_VORONOI_POINTS do
        love.graphics.points(WORLD_VORONOI_POINTS[i])
    end
    IterateWorldDrawing(WORLD_BLOCKS)
end