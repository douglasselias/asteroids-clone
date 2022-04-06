require 'src/keyboard'
require 'src/player'
require 'src/bullet'
require 'src/sound'
require 'src/meteor'
require 'src/font'
require 'src/state_machine'
require 'src/stars'

function love.load()
  math.randomseed(os.time())
  love.window.setTitle("Asteroids Clone")

  CreateMeteors()
  CreateStars()
  PlayMainSong()
end

function love.update(dt)
  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end

  if IsMenuState() and love.keyboard.wasPressed('down') then
    SetSelectedOptionControls()
    PlayClickSFX()
  end

  if IsMenuState() and love.keyboard.wasPressed('up') then
    SetSelectedOptionStart()
    PlayClickSFX()
  end

  if love.keyboard.wasPressed('return') then
    if IsMenuState() and IsStartOptionSelected() then
      PlayClickSFX()
      SetPlayState()
    elseif IsMenuState() and IsControlsOptionSelected() then
      SetControlsState()
    elseif IsControlsState() then
      SetMenuState()
    elseif IsGameOverState() then
      ResetPlayerState()
      DestroyAllMeteors()
      RespawnMeteors()
      SetMenuState()
      PlayMainSong()
    end
  end

  if IsPlayState() then
    if love.keyboard.isDown('a') then
      RotatePlayerLeft(dt)
    end

    if love.keyboard.isDown('d') then
      RotatePlayerRight(dt)
    end

    if love.keyboard.isDown('w') then
      BoostPlayerForward(dt)
      PlayBoosterSFX()
    end

    if love.keyboard.wasPressed('space') then
      if IsBulletInvisible() then
        SetBulletVisible()
        PlayShotSFX()
      end
    end

    UpdatePlayerPosition()
    UpdatePlayerSpeed()

    UpdateMeteorsPositions()
    CheckPlayerCollisionWithMeteors()

    if IsBulletVisible() then
      UpdateBulletPosition()
      CheckBulletCollisionWithMeteors()

      if IsBulletOutOfBounds() then
        SetBulletInvisible()
      end
    else
      ResetBulletPosition()
    end

    RespawnMeteors()
  end

  ClearKeysPressed()
end

function love.draw()
  if IsMenuState() then
    DrawMenuState()
  elseif IsControlsState() then
    DrawControlsState()
  elseif IsPlayState() then
    DrawPlayState()
  elseif IsGameOverState() then
    DrawGameOverState()
  end

  DrawStars()
end
