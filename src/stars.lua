require "src/wrapper/math"
require "src/wrapper/graphics"

require "src/ecs/entity-manager"

function loadStars(qty)
  for i = 1, qty do
    local star = {
      x = randomBetween(0, Width),
      y = randomBetween(0, Height),
      size = randomBetween(1, 3)
    }
    addEntity("star", star)
  end
end

function updateStar(starEntity)
  local star = starEntity.components
  star.x = star.x + 1
  star.y = star.y + 1
end

function renderStar(starEntity)
  local star = starEntity.components
  local color = {r=1, g=1, b=1, a=0.3}
  local rect =  {
    x = star.x % Width,
    y = star.y % Height,
    w = star.size,
    h = star.size,
  }
  drawRectangle(color, rect)
end