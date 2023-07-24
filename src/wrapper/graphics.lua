-- function CreateFont(size)
--   return love.graphics.newFont("fonts/Kenney Pixel.ttf", size)
-- end

-- function DrawText(font, text, x, y)
--   love.graphics.setFont(font)
--   love.graphics.print(text, x, y)
-- end


Width, Height = love.graphics.getDimensions()
HalfWidth = Width / 2
HalfHeight = Height / 2

function loadImage(path)
  return love.graphics.newImage(path)
end

function drawRectangle(color, rect)
  -- love.graphics.setColor(1,1,1,0.3)
  love.graphics.setColor(color)

  love.graphics.rectangle("fill", rect.x, rect.y, rect.w, rect.h)
  love.graphics.setColor(1, 1, 1, 1)
end