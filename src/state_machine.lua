Width, Height = love.graphics.getDimensions()
HalfWidth = Width / 2
HalfHeight = Height / 2

SelectedOption = {
  startOption = 'start_option',
  controlsOption = 'controls_option'
}

GameState = {
  menu = 'menu',
  controls = 'controls',
  game = 'game',
  gameOver = 'game_over'
}

CurrentGameState = GameState.menu
CurrentSelectedOption = SelectedOption.startOption

function IsMenuState()
  return CurrentGameState == GameState.menu
end

function IsPlayState()
  return CurrentGameState == GameState.game
end

function IsGameOverState()
  return CurrentGameState == GameState.gameOver
end

function IsControlsState()
  return CurrentGameState == GameState.controls
end

function SetMenuState()
  CurrentGameState = GameState.menu
end

function SetPlayState()
  CurrentGameState = GameState.game
end

function SetGameOverState()
  CurrentGameState = GameState.gameOver
end

function SetControlsState()
  CurrentGameState = GameState.controls
end

function IsStartOptionSelected()
  return CurrentSelectedOption == SelectedOption.startOption
end

function IsControlsOptionSelected()
  return CurrentSelectedOption == SelectedOption.controlsOption
end

function SetSelectedOptionStart()
  CurrentSelectedOption = SelectedOption.startOption
end

function SetSelectedOptionControls()
  CurrentSelectedOption = SelectedOption.controlsOption
end

function DrawMenuState()
  DrawBigText('Asteroids', HalfWidth - 70, HalfHeight - 30)

  if IsStartOptionSelected() then
    love.graphics.setColor(0.1, 0.7, 0.5, 1)
  end
  DrawText('Start', HalfWidth - 15, HalfHeight + 10)
  love.graphics.setColor(1, 1, 1, 1)

  if IsControlsOptionSelected() then
    love.graphics.setColor(0.1, 0.7, 0.5, 1)
  end
  DrawText('Controls', HalfWidth - 30, HalfHeight + 40)
  love.graphics.setColor(1, 1, 1, 1)
end

function DrawPlayState()
  DrawMeteors()

  if IsBulletVisible() then
    DrawBullet()
  end

  if Player.speed > 0 then
    DrawFire()
  end

  DrawPlayer()
  DrawPlayerScore()
  DrawPlayerEnergy()
end

function DrawGameOverState()
  StopMainSong()
  StopBoosterSFX()

  love.graphics.setColor(1, 0, 0, 1)
  DrawBigText('Game Over', HalfWidth - 70, HalfHeight - 50)

  love.graphics.setColor(1, 1, 1, 1)
  DrawBigText('Total Score: ' .. Player.score, HalfWidth - 100, HalfHeight - 10)
  DrawText('Press Start to Play Again', HalfWidth - 100, HalfHeight + 30)
end

function DrawControlsState()
  DrawBigText('Controls', HalfWidth - 50, HalfHeight - 40)
  DrawText('Press W to move forward', HalfWidth - 100, HalfHeight)
  DrawText('Press A to rotate left', HalfWidth - 100, HalfHeight + 30)
  DrawText('Press D to rotate right', HalfWidth - 100, HalfHeight + 60)
  DrawText('Press Space to shoot', HalfWidth - 100, HalfHeight + 90)
end
