
-- minutes to seconds
local study_seconds = 50 * 60
local break_seconds = 10 * 60

local state = 'menu'
local menus = {
  'menu',
  'study',
  'break'
}

local window_width
local window_height

local help = require('funcs.helpers')

local formatted_time = ''

love.load = function ()
  local font = love.graphics.newFont("assets/PixAntiqua.ttf", 24)
  love.graphics.setFont(font)

  window_width, window_height = love.graphics.getDimensions()
end


love.draw = function ()
  if state == 'menu' then
    draw_menu()
  end
  -- love.graphics.print("hello there", 300, 300)
  love.graphics.print(formatted_time, 100, 100)
  love.graphics.print(window_width .. "x" .. window_height, 100, 300)
end

love.update = function (dt)
  study_seconds = study_seconds - dt
  formatted_time = help.seconds_to_time(study_seconds)
end

local draw_menu = function ()

end

local draw_study = function ()

end

local draw_break = function ()

end

local draw_completion = function ()

end
