CreateSfxSource = AudioSource("static")
CreateMusicSource = AudioSource("stream")

function AudioSource(type)
  return function(fileName)
     love.audio.newSource("sounds/" .. fileName, type)
  end
end