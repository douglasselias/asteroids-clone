function CreateFont(size)
  return love.graphics.newFont("fonts/Kenney Pixel.ttf", size)
end

function DrawText(font, text, x, y)
  love.graphics.setFont(font)
  love.graphics.print(text, x, y)
end
