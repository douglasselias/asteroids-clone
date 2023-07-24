function createAudioSource(fileName, audioType)
  return love.audio.newSource("sounds/" + fileName, audioType)
end