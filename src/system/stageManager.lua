local stageManager = System({})
local STAGES_PATH = "stage/"

function stageManager:init()
    self.current_stage_index = 0
    self.current_stage = nil
    self.stages = {
        "test1.lua",
        "test2.lua",
        "test3.lua"
    }
end

function stageManager:loadStage(path)
    INSTANCES.world:disableUpdates()
    self.current_stage = STI(STAGES_PATH .. self.stages[self.current_stage_index])
    INSTANCES.world:clear()
    Timer.clear()
    INSTANCES.world:emit("stageLoaded", self.current_stage)
end

function stageManager:nextStage()
    self.current_stage_index = self.current_stage_index + 1
    if self.stages[self.current_stage_index] then
        self:loadStage(STAGES_PATH .. self.stages[self.current_stage_index])
    else
        -- u ran out of levels dawg (crash yeet)
        assert(false, "U RAN OUT OF LEVELS DAWGGGGGGGGGGGGGG")
    end
end

function stageManager:goalReached()
    -- probs some other shit idk
    self:nextStage()
end

function stageManager:restartStage()
    self:loadStage(STAGES_PATH .. self.stages[self.current_stage_index])
end

function stageManager:update(dt)
    self.current_stage:update(dt)
end

return stageManager
