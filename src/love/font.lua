Font = love.graphics.newFont("../fonts/Kenney Pixel.ttf")
love.graphics.setFont(Font)

function DrawText(text, size, x, y)
  love.graphics.setNewFont(size)
  love.graphics.print(text, x, y)
end