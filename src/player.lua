require "src/wrapper/graphics"
require "src/wrapper/math"

Player = {
  sprite = loadImage('images/ship.png'),
  booster = loadImage('images/fire.png'),
  x = HalfWidth,
  y = HalfHeight,
  radius = 5,
  angle = deg2rad(-90),
  rotationSpeed = 10,
  speed = 0,
  boost = 10,
  friction = 0.1,
  energy = 3,
  score = 0,
}

function RotatePlayerLeft(dt)
  Player.angle = Player.angle + -Player.rotationSpeed * dt
end

function RotatePlayerRight(dt)
  Player.angle = Player.angle + Player.rotationSpeed * dt
end

function BoostPlayerForward(dt)
  Player.speed = Player.speed + Player.boost * dt
end

function UpdatePlayerPosition()
  Player.x = (Player.x + math.cos(Player.angle) * Player.speed) % Width
  Player.y = (Player.y + math.sin(Player.angle) * Player.speed) % Height
end

function UpdatePlayerSpeed()
  Player.speed = math.max(0, Player.speed - Player.friction)

  if Player.speed == 0 then
    StopBoosterSFX()
  end
end

function IncreasePlayerScore()
  Player.score = Player.score + 100
end

function DecreasePlayerEnergy()
  Player.energy = Player.energy - 1
end

function ResetPlayerState()
  Player.x = Width / 2
  Player.y = Height / 2
  Player.speed = 0
  Player.angle = math.rad(-90)
  Player.energy = 3
  Player.score = 0
end

function DrawPlayer()
  love.graphics.draw(Player.sprite, Player.x, Player.y, math.rad(math.deg(Player.angle) + 90), 1, 1,
  Player.sprite:getWidth() / 2, Player.sprite:getHeight() / 2)
end

function DrawFire()
  love.graphics.setColor(1, 0, 0, 1)
  love.graphics.draw(Player.booster, Player.x + math.cos(Player.angle) * -5, Player.y + math.sin(Player.angle) * -5,
    math.rad(math.deg(Player.angle) + 90), 0.1, 0.1, Player.booster:getWidth() / 2, Player.booster:getHeight() / 2)
  love.graphics.setColor(1, 1, 1, 1)
end

function DrawPlayerEnergy()
  love.graphics.print('Energy:', 10, 40)
  local offset = 70

  for i = 1, Player.energy do
    if Player.energy == 3 then
      love.graphics.setColor(0, 1, 0, 1)
    end
    if Player.energy == 2 then
      love.graphics.setColor(1, 1, 0, 1)
    end
    if Player.energy == 1 then
      love.graphics.setColor(1, 0, 0, 1)
    end
    love.graphics.rectangle('fill', (10 * i) + offset + (i * 10), 47, 15, 15)
    love.graphics.setColor(1, 1, 1, 1)
  end
end

function DrawPlayerScore()
  love.graphics.setFont(MainFont.normal)
  love.graphics.print('Score: ' .. Player.score, 10, 20)
end