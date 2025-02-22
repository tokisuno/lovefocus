local help = require('helpers')
-- next module tba
local GameStateManager = require('GameStateManager')
local BreakTime = {}

local screenWidth, screenHeight = love.graphics.getDimensions()

function BreakTime:enter()
  break_timer = 10 * 60
  formatted_time = ''
end

function BreakTime:update(dt)
  break_timer = break_timer - dt
  formatted_time = help.seconds_to_time(break_timer)
end

function BreakTime:draw()
  love.graphics.print(formatted_time, 75, 100)
  love.graphics.print('break time!', 75, 300)
end

function BreakTime:keypressed(key, scancode, isrepeat)
  -- if key == "w" then
  --   print('this was pressed')
  -- end
end

return BreakTime
