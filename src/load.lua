require "src/wrapper/math"
require "src/wrapper/window"

require "src/stars"

function loadGameData()
  setWindowTitle("Asteroids Clone - Refactor")
  loadRandomSeed()

  loadStars(100)
end

function loadSystems()
  addSystem(updateStar)
  addSystem(renderStar)
end
