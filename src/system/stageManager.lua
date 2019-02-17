local stageManager = System({})
local STAGES_PATH = "stage/"

function stageManager:init()
    self.current_stage_index = 0
    self.current_stage = nil
    self.stages = {
        "test1.lua",
        "test2.lua"
    }
end

function stageManager:nextStage()
    self.current_stage_index = self.current_stage_index + 1
    if self.stages[self.current_stage_index] then
        self.current_stage = STI(STAGES_PATH .. self.stages[self.current_stage_index])
        INSTANCES.world:clear()
        INSTANCES.world:emit("stageLoaded", self.current_stage)
    else
        -- u ran out of levels dawg (crash yeet)
        assert(false, "U RAN OUT OF LEVELS DAWGGGGGGGGGGGGGG")
    end
end

function stageManager:update(dt)
    self.current_stage:update(dt)
end

return stageManager
