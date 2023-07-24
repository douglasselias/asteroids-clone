require "src/wrapper/keyboard"
require "src/wrapper/event"
require "src/ecs/entity-manager"

-- require "src/font"

require "src/load"

function love.load()
  loadGameData()

  -- BigFont = CreateFont(50)
  -- NormalFont = CreateFont(30)

  -- CreateMeteors()
  -- CreateStars()
  -- PlayMainSong()
end

function love.update(dt)
  if keyWasPressed("escape") then
    quit()
  end

  -- if IsMenuState() and love.keyboard.wasPressed('down') then
  --   SetSelectedOptionControls()
  --   PlayClickSFX()
  -- end

  -- if IsMenuState() and love.keyboard.wasPressed('up') then
  --   SetSelectedOptionStart()
  --   PlayClickSFX()
  -- end

  -- if love.keyboard.wasPressed('return') then
  --   if IsMenuState() and IsStartOptionSelected() then
  --     PlayClickSFX()
  --     SetPlayState()
  --   elseif IsMenuState() and IsControlsOptionSelected() then
  --     SetControlsState()
  --   elseif IsControlsState() then
  --     SetMenuState()
  --   elseif IsGameOverState() then
  --     ResetPlayerState()
  --     DestroyAllMeteors()
  --     RespawnMeteors()
  --     SetMenuState()
  --     PlayMainSong()
  --   end
  -- end

  -- if IsPlayState() then
  --   if love.keyboard.isDown('a') then
  --     RotatePlayerLeft(dt)
  --   end

  --   if love.keyboard.isDown('d') then
  --     RotatePlayerRight(dt)
  --   end

  --   if love.keyboard.isDown('w') then
  --     BoostPlayerForward(dt)
  --     PlayBoosterSFX()
  --   end

  --   if love.keyboard.wasPressed('space') then
  --     if IsBulletInvisible() then
  --       SetBulletVisible()
  --       PlayShotSFX()
  --     end
  --   end

  --   UpdatePlayerPosition()
  --   UpdatePlayerSpeed()

  --   UpdateMeteorsPositions()
  --   CheckPlayerCollisionWithMeteors()

  --   if IsBulletVisible() then
  --     UpdateBulletPosition()
  --     CheckBulletCollisionWithMeteors()

  --     if IsBulletOutOfBounds() then
  --       SetBulletInvisible()
  --     end
  --   else
  --     ResetBulletPosition()
  --   end

  --   RespawnMeteors()
  -- end
  updateSystem()

  clearKeysPressed()
end

function love.draw()
  -- if IsMenuState() then
  --   DrawMenuState()
  -- elseif IsControlsState() then
  --   DrawControlsState()
  -- elseif IsPlayState() then
  --   DrawPlayState()
  -- elseif IsGameOverState() then
  --   DrawGameOverState()
  -- end

  -- DrawStars()
end
