local GameStateManager = require('GameStateManager')
local StudyTime = require('states.studyTime')
local help = require('helpers')

font = help.font
love.graphics.setFont(font)

help.sfx.bonk:setVolume(0.5)
help.sfx.menu:setVolume(0.5)
help.sfx.ping:setVolume(0.5)

function love.load()
  love.window.setMode(640, 480)
  GameStateManager:setState(StudyTime)
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
