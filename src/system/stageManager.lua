local stageManager = System({COMPONENTS.counter})
local STAGES_PATH = "stage/"

function stageManager:init()
    self.current_stage_index = 0
    self.current_stage = nil
    self.stages = {
        "tut01",
        "tut02",
        "tut03",
        "tut04",
        "stage01",
        "stage02",
        "stage03",
        "stage04",
        "stage05"
    }
    self.stageText = nil
end

function stageManager:loadStage(path)
    INSTANCES.world:disableUpdates()
    self.current_stage = STI(STAGES_PATH .. self.stages[self.current_stage_index] .. ".lua")
    INSTANCES.world:clear()
    Timer.clear()
    self.stageText =
        love.graphics.newText(love.graphics.getFont(), "Level " .. self.current_stage_index .. " / " .. #self.stages)
    INSTANCES.world:emit("stageLoaded", self.current_stage)
end

function stageManager:nextStage()
    -- save the current score
    for i = 1, self.pool.size do
        e = self.pool:get(i)
        local counter = e:get(COMPONENTS.counter)
        table.insert(_SCORES, {level = self.current_stage_index, moves = counter.value})
        break
    end

    self.current_stage_index = self.current_stage_index + 1
    if self.stages[self.current_stage_index] then
        self:loadStage(STAGES_PATH .. self.stages[self.current_stage_index])
    else
        GamestateManager.switch(victory)
    end
end

function stageManager:draw()
    if self.stageText then
        love.graphics.draw(self.stageText, love.graphics.getWidth() - self.stageText:getWidth() - 20, 20)
    end
end

function stageManager:goalReached()
    love.keyboard.setKeyRepeat(false)
    love.keyboard.setKeyRepeat(true)
    self:nextStage()
end

function stageManager:restartStage()
    self:loadStage(STAGES_PATH .. self.stages[self.current_stage_index])
end

function stageManager:update(dt)
    self.current_stage:update(dt)
end

return stageManager
