Width, Height = love.graphics.getDimensions()

Bullet = {
  x = 0,
  y = 0,
  speed = 20,
  angle = math.rad(-90),
  visible = false,
  radius = 3
}

function SetBulletVisible()
  Bullet.visible = true
end

function SetBulletInvisible()
  Bullet.visible = false
end

function IsBulletVisible()
  return Bullet.visible
end

function IsBulletInvisible()
  return not Bullet.visible
end

function IsBulletOutOfBounds()
  return Bullet.x > Width or Bullet.y > Height or Bullet.x < 0 or Bullet.y < 0
end

function UpdateBulletPosition()
  Bullet.x = Bullet.x + math.cos(Bullet.angle) * Bullet.speed
  Bullet.y = Bullet.y + math.sin(Bullet.angle) * Bullet.speed
end

function ResetBulletPosition()
  Bullet.x = Player.x
  Bullet.y = Player.y
  Bullet.angle = Player.angle
end

function DrawBullet()
  love.graphics.setColor(1, 0, 0, 1)
  love.graphics.circle("fill", Bullet.x, Bullet.y, Bullet.radius)
  love.graphics.setColor(1, 1, 1, 1)
end