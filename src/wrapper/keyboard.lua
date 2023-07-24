keysPressed = {}

function keyPressed(key)
  keysPressed[key] = true
end

function keyWasPressed(key)
  return keysPressed[key]
end

function clearKeysPressed()
  keysPressed = {}
end