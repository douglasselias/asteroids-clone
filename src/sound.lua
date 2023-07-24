require "ecs/entity-manager.lua"

local staticAudioEntityCreator = addEntity("static-audio")

-- local boom = addEntity("static-audio")([{type: "audio", value: createAudioSource("boom.wav", "static")}])



-- Sounds = {
--   explosion = love.audio.newSource('sounds/boom.wav', "static"),
--   shot = love.audio.newSource('sounds/shot.wav', 'static'),
--   click = love.audio.newSource('sounds/coin.wav', 'static'),
--   hurt = love.audio.newSource('sounds/hurt.wav', 'static'),
--   lose = love.audio.newSource('sounds/lose.wav', 'static'),
--   booster = love.audio.newSource('sounds/booster.ogg', 'static'),
--   song = love.audio.newSource('sounds/stargaze.ogg', 'stream'),
-- }

function PlayMainSong()
  Sounds.song:play()
end

function StopMainSong()
  Sounds.song:stop()
end

function PlayClickSFX()
  Sounds.click:stop()
  Sounds.click:play()
end

function PlayShotSFX()
  Sounds.shot:stop()
  Sounds.shot:play()
end

function PlayHurtSFX()
  Sounds.hurt:stop()
  Sounds.hurt:play()
end

function PlayLoseSFX()
  Sounds.lose:stop()
  Sounds.lose:play()
end

function PlayExplosionSFX()
  Sounds.explosion:stop()
  Sounds.explosion:play()
end

function PlayBoosterSFX()
  Sounds.booster:play()
end

function StopBoosterSFX()
  Sounds.booster:stop()
end