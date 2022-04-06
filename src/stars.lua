stars = {}

function CreateStars()
  for i = 1, 100 do
    stars[i] = {
      x = math.random(0, love.graphics.getWidth()),
      y = math.random(0, love.graphics.getHeight()),
      size = math.random(1, 3)
    }
  end
end

function DrawStars()
  for i = 1, #stars do
    love.graphics.setColor(1, 1, 1, 0.3)
    love.graphics.rectangle('fill', stars[i].x % Width, stars[i].y % Height, stars[i].size, stars[i].size)
    love.graphics.setColor(1, 1, 1, 1)
    stars[i].x = stars[i].x + 1
    stars[i].y = stars[i].y + 1
  end
end
