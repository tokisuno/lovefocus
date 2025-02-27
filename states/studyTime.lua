local GameStateManager = require('lib.GameStateManager')
local StudyTime = {}
local moonshine = require('lib.moonshine')

fx = moonshine(moonshine.effects.chromasep)
fx.chain(moonshine.effects.crt)
fx.crt.x = 1.05
fx.crt.y = 1.02
fx.crt.scaleFactor = {1, 1.02}

function StudyTime:enter()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  H.font:setFilter('nearest', 'nearest')

  study_timer = 50 * 60
  formatted_time = ''

  -- image = love.graphics.newImage('assets/sprites/char/Idle.png')
  -- local grid = anim8.newGrid(32, 32, image:getWidth(), image:getHeight())
  -- animation = anim8.newAnimation(grid('1-4', 1), 0.2)
  -- bg.effect.chain(moonshine.effects.crt)
end

function StudyTime:update(dt)
  study_timer = study_timer - dt
  formatted_time = H.seconds_to_time(study_timer)
  -- animation:update(dt)

  if study_timer < 0 then
    if not H.sfx.ping:isPlaying() then
      love.audio.play(H.sfx.bonk)
    end
    GameStateManager:setState(H.states.break_wait)
  end
end

function StudyTime:draw()
  -- love.graphics.setColor(1, 1, 1)
  love.graphics.setColor(1, 1, 1)
  fx(function ()
    H.bg.effect(function ()
      love.graphics.draw(H.bg.image, 0, 0, 0, love.graphics.getWidth()/H.bg.image:getWidth(), love.graphics.getHeight()/H.bg.image:getHeight())
    end)
    -- love.graphics.draw(H.bg.image, 0, 0, 0, 640/H.bg.image:getWidth(), 480/H.bg.image:getHeight())

    love.graphics.setFont(H.font)

    love.graphics.setColor(0, 0, 0)
    love.graphics.print(formatted_time, (love.graphics.getWidth( )/2-H.font:getWidth(formatted_time)/2), (love.graphics.getHeight()/2 - H.font:getHeight() + 14))

    love.graphics.setColor(1, 1, 0)
    love.graphics.print(formatted_time, (love.graphics.getWidth( )/2-H.font:getWidth(formatted_time)/2), (love.graphics.getHeight()/2 - H.font:getHeight() + 10))

    love.graphics.setFont(H.font_big)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print(H.phrases.study_time, (love.graphics.getWidth()/2-H.font_big:getWidth(H.phrases.study_time)/2), (love.graphics.getHeight()/2 - H.font_big:getHeight() - 50))
    love.graphics.setColor(1, 1, 0)
    love.graphics.print(H.phrases.study_time, (love.graphics.getWidth()/2-H.font_big:getWidth(H.phrases.study_time)/2), (love.graphics.getHeight()/2 - H.font_big:getHeight() - 55))

    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(H.font)
  end)

  -- animation:draw(image, 400, 320, nil, 5)
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
