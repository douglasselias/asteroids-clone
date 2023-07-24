require "src/wrapper/graphics"
require "src/stars"

local id = 0
local entities = {}
local updaterSystems = {}
local rendererSystems = {}

function addEntity(tag, components)
  local entity = {
    id = id,
    active = true,
    tag = tag,
    components = components,
  }
  id = id + 1
  table.insert(entities, entity)
end

function addSystem(systems, tag, fn)
  local system = {
    tag = tag,
    fn = fn,
  }
  table.insert(systems, system)
end

function filterEntities()
end

function runSystems(systems)
  for sys = 1, #systems do
    for ent = 1, # entities do
      if entities[ent].tag == systems[sys].tag then
        systems[sys].fn(entities[ent])
      end
    end
  end
end

-- function renderSystem()
--   for i = 1, #entities do
--     if entities[i].tag == "star" then
--       renderStar(entities[i])
--     end
--   end
-- end