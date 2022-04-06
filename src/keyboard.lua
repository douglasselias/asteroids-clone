love.keyboard.keysPressed = {}

function love.keypressed(key)
  love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
  return love.keyboard.keysPressed[key]
end

function ClearKeysPressed()
  love.keyboard.keysPressed = {}
end