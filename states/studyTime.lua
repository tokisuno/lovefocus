local GameStateManager = require('GameStateManager')
local StudyTime = {}

function StudyTime:enter()
  study_timer = 50 * 60
  formatted_time = ''
end

function StudyTime:update(dt)
  study_timer = study_timer - dt
  formatted_time = H.seconds_to_time(study_timer)

  if study_timer < 0 then
    if not H.sfx.ping:isPlaying() then
      love.audio.play(H.sfx.bonk)
    end
    GameStateManager:setState(H.states.break_wait)
  end
end

function StudyTime:draw()
	love.graphics.setColor(1, 1, 0)
  love.graphics.print(formatted_time, 75, 100)
	-- love.graphics.setColor(1, 1, 0)
  love.graphics.draw(H.phrases.study_time.default, 75, 300)
end

function StudyTime:keypressed(key, scancode, isrepeat)
  if love.keyboard.isDown('lctrl') and love.keyboard.isDown('y') then
    if not H.sfx.bonk:isPlaying() then
      love.audio.play(H.sfx.bonk)
    end
    GameStateManager:setState(H.states.break_wait)
  end
end

return StudyTime
