
function love.load()
    math.randomseed(os.time())

    local WORLD_HEIGHT = 600
    local WORLD_WIDTH = 800
    local WORLD_VORONOI_POINTS_COUNT = 5
    local WORLD_VORONOI_MINIMAL_DIST = 100

    WORLD_VORONOI_POINTS_COORDINATES = {}

    for i = 1, WORLD_VORONOI_POINTS_COUNT, 1 do
        table.insert(WORLD_VORONOI_POINTS_COORDINATES, math.random(WORLD_WIDTH - 1)) --x-координата
        table.insert(WORLD_VORONOI_POINTS_COORDINATES, math.random(WORLD_HEIGHT - 1)) --y-координата
    end

end

function love.update(dt)
end

function love.draw()
    love.graphics.setPointSize(3)
    love.graphics.points(WORLD_VORONOI_POINTS_COORDINATES)
end