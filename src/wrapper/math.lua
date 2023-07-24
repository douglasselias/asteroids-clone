function loadRandomSeed()
  math.randomseed(os.time())
end

function randomBetween(initial, final)
  return math.random(initial, final)
end

function deg2rad(deg)
  return math.rad(deg)
end