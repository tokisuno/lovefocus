local help = require('helpers')
local BreakTime = require('states.breakTime')
local GameStateManager = require('GameStateManager')
local StudyTime = {}

function StudyTime:enter()
  study_timer = 50 * 60
  formatted_time = ''
end

function StudyTime:update(dt)
  study_timer = study_timer - dt
  formatted_time = help.seconds_to_time(study_timer)

  if study_timer < 0 then
    if not help.sfx.bonk:isPlaying() then
      love.audio.play(help.sfx.bonk)
    end
    GameStateManager:setState(BreakTime)
  end
end

function StudyTime:draw()
  love.graphics.print(formatted_time, 75, 100)
  love.graphics.draw(help.phrases.study_time.default, 75, 300)
end

function StudyTime:keypressed(key, scancode, isrepeat)
  -- if key == "w" then
  --   GameStateManager:setState(BreakTime)
  -- end
end

return StudyTime
