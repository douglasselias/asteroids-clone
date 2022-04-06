MainFont = {
  normal = love.graphics.newFont("fonts/Kenney Pixel.ttf", 30),
  big = love.graphics.newFont("fonts/Kenney Pixel.ttf", 50)
}

function DrawBigText(text, x, y)
  love.graphics.setFont(MainFont.big)
  love.graphics.print(text, x, y)
end

function DrawText(text, x, y)
  love.graphics.setFont(MainFont.normal)
  love.graphics.print(text, x, y)
end