local GameStateManager = require('GameStateManager')
local BreakTime = {}

function BreakTime:enter()
  break_timer = 10 * 60
  formatted_time = ''
end

function BreakTime:update(dt)
  break_timer = break_timer - dt
  formatted_time = H.seconds_to_time(break_timer)

  if break_timer < 0 then
    if not H.sfx.bonk:isPlaying() then
      love.audio.play(H.sfx.bonk)
    end
    GameStateManager:setState(H.states.study_wait)
  end
end

function BreakTime:draw()
  love.graphics.print(formatted_time, 75, 100)
  love.graphics.print('Break time!', 75, 300)
end

function BreakTime:keypressed(key, scancode, isrepeat)
  if love.keyboard.isDown('lctrl') and love.keyboard.isDown('y') then
    if not H.sfx.menu:isPlaying() then
      love.audio.play(H.sfx.menu)
    end
    GameStateManager:setState(H.states.study_wait)
  end
end

return BreakTime
