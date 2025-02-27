H = require('helpers')
GameStateManager = require('lib.GameStateManager')

love.graphics.setFont(H.font)

H.sfx.bonk:setVolume(0.5)
H.sfx.menu:setVolume(0.5)
H.sfx.ping:setVolume(0.5)

function love.load()
  love.window.setMode(640, 480)
	-- love.graphics.setDefaultFilter('nearest', 'nearest')
  GameStateManager:setState(H.states.study_wait)
end

function love.update(dt)
  GameStateManager:update(dt)
end

function love.draw()
  GameStateManager:draw()
end

function love.keypressed(key, scancode, isrepeat)
  GameStateManager:keypressed(key, scancode, isrepeat)
end
