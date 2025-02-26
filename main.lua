local interface = require('interface')
local world_gen = require('world_gen')

function ComparePoints(point_1, point_2) --Необходимо для сортировки точек через table.sort по координате X - требуется для шума Воронова
    if point_1[1] < point_2[1] then
        return true
    else
        return false
    end
end

function love.load()
    love.math.setRandomSeed(os.time())

    local WORLD_HEIGHT = 600
    local WORLD_WIDTH = 800
    local WORLD_VORONOI_POINTS_COUNT = 5

    WORLD_VORONOI_POINTS = world_gen:CreatePoints(WORLD_WIDTH, WORLD_HEIGHT, WORLD_VORONOI_POINTS_COUNT) -- Генерация точек для генерации шума (WIP)

    table.sort(WORLD_VORONOI_POINTS, ComparePoints) -- Собственно сортировка точек по координате X

end

function love.update(dt)
end

function love.draw()
    love.graphics.setPointSize(3)
    for i = 1, #WORLD_VORONOI_POINTS do
        love.graphics.points(WORLD_VORONOI_POINTS[i])
    end
end