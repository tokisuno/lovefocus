local GameStateManager = require('lib.GameStateManager')
local BreakWait = {}

function BreakWait:enter()
end

function BreakWait:update(dt)
end

function BreakWait:draw()
  love.graphics.print(H.phrases.break_wait, 75, 300)
end

function BreakWait:keypressed(key, scancode, isrepeat)
  if love.keyboard.isDown('lctrl') and love.keyboard.isDown('y') then
    if not H.sfx.ping:isPlaying() then
      love.audio.play(H.sfx.ping)
    end
    GameStateManager:setState(H.states.break_time)
  end
end

return BreakWait
