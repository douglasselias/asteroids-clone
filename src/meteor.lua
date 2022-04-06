MeteorsSprites = {love.graphics.newImage('images/meteor1.png'), love.graphics.newImage('images/meteor2.png'),
                  love.graphics.newImage('images/meteor3.png'), love.graphics.newImage('images/meteor4.png')}

Meteors = {}
MeteorsQty = 10

function CreateMeteors()
  for i = 1, MeteorsQty do
    Meteors[i] = {
      radius = 50,
      destroy = false
    }

    SpawnGap = 50
    StartLeftX = 0 - SpawnGap
    StartRightX = Width + SpawnGap
    StartTopY = 0 - SpawnGap
    StartBottomY = Height + SpawnGap

    local spawnAreaX = math.random(StartLeftX, StartRightX)
    local spawnAreaY = math.random(StartTopY, StartBottomY)

    local shouldSpawnAtX = math.random(0, 1)

    if shouldSpawnAtX == 1 then
      Meteors[i].x = spawnAreaX
      Meteors[i].y = 0 - 50
      Meteors[i].xDir = math.random(-2, 2)
      Meteors[i].yDir = math.random(0.2, 2)
    else
      Meteors[i].x = 0 - 50
      Meteors[i].y = spawnAreaY
      Meteors[i].xDir = math.random(0.2, 2)
      Meteors[i].yDir = math.random(-2, 2)
    end
  end
end

function DestroyAllMeteors()
  for i = 1, MeteorsQty do
    Meteors[i].destroy = true
  end
end

function RespawnMeteors()
  for i = 1, MeteorsQty do
    if Meteors[i].destroy then
      RespawnMeteor(Meteors[i])
    end
  end
end

function RespawnMeteor(meteor)
  meteor.destroy = false
  local spawnAreaX = math.random(StartLeftX, StartRightX)
  local spawnAreaY = math.random(StartTopY, StartBottomY)

  local shouldSpawnAtX = math.random(0, 1)

  if shouldSpawnAtX == 1 then
    meteor.x = spawnAreaX
    meteor.y = 0 - 50
  else
    meteor.x = 0 - 50
    meteor.y = spawnAreaY
  end

  meteor.xDir = math.max(0.5, math.random(-2, 2))
  meteor.yDir = math.max(0.5, math.random(-2, 2))
end

function CheckBulletCollisionWithMeteors()
  for i = 1, MeteorsQty do
    local distX = Bullet.x - Meteors[i].x
    local distY = Bullet.y - Meteors[i].y

    local distance = math.sqrt(math.pow(distX, 2) + math.pow(distY, 2))
    local totalRadii = Bullet.radius + Meteors[i].radius

    if distance <= totalRadii then
      PlayExplosionSFX()
      SetBulletInvisible()
      IncreasePlayerScore()
      Meteors[i].destroy = true
    end
  end
end

function CheckPlayerCollisionWithMeteors()
  for i = 1, MeteorsQty do
    local distPlayerX = Player.x - Meteors[i].x
    local distPlayerY = Player.y - Meteors[i].y
    local distancePlayer = math.sqrt(math.pow(distPlayerX, 2) + math.pow(distPlayerY, 2))
    local totalRadiiPlayer = Player.radius + Meteors[i].radius

    if distancePlayer <= totalRadiiPlayer then
      PlayHurtSFX()
      DecreasePlayerEnergy()
      Meteors[i].destroy = true

      if Player.energy == 0 then
        PlayLoseSFX()
        SetGameOverState()
      end
    end
  end
end

function UpdateMeteorsPositions()
  for i = 1, MeteorsQty do
    Meteors[i].x = (Meteors[i].x + Meteors[i].xDir) % Width
    Meteors[i].y = (Meteors[i].y + Meteors[i].yDir) % Height
  end
end

function DrawMeteors()
  for i = 1, MeteorsQty do
    if Meteors[i].destroy == false then
      local clampedIndex = math.max(1, i % 5)
      love.graphics.draw(MeteorsSprites[clampedIndex], Meteors[i].x, Meteors[i].y, 0, 1, 1,
        MeteorsSprites[clampedIndex]:getWidth() / 2, MeteorsSprites[clampedIndex]:getHeight() / 2)
    end
  end
end
