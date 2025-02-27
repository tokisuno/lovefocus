local GameStateManager = require('lib.GameStateManager')
local StudyWait = {}

function StudyWait:enter()
end

function StudyWait:update(dt)
	-- sprite_time = sprite_time + dt
end

function StudyWait:draw()
	love.graphics.setColor(1, 1, 0)
  love.graphics.print(H.phrases.study_wait, 75, 100)
end

function StudyWait:keypressed(key, scancode, isrepeat)
  if love.keyboard.isDown('lctrl') and love.keyboard.isDown('y') then
    if not H.sfx.menu:isPlaying() then
      love.audio.play(H.sfx.bonk)
    end
    GameStateManager:setState(H.states.study_time)
  end
end

return StudyWait
