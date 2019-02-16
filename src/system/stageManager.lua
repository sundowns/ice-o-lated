local stageManager = System({})

stageManager.CURRENT_MAP = nil

function stageManager:init()
end

function stageManager:loadStage(pathToStage)
    assert(pathToStage)
    self.CURRENT_MAP = STI(pathToStage)
    INSTANCES.world:emit("stageLoaded", self.CURRENT_MAP)
end

function stageManager:update(dt)
    self.CURRENT_MAP:update(dt)
end

function stageManager:draw()
    self.CURRENT_MAP:draw()
end

return stageManager
