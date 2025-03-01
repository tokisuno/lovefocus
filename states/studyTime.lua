local GameStateManager = require('lib.GameStateManager')
local StudyTime = {}
local moonshine = require('lib.moonshine')

local down

fx = moonshine(moonshine.effects.chromasep)
fx.chain(moonshine.effects.crt)
fx.crt.x = 1.05
fx.crt.y = 1.02
fx.crt.scaleFactor = {1, 1.02}

local width, height
local bg_width, bg_height

local background = {}
local header_y, header_shadow_y
local time_y, time_shadow_y
local move_time

function StudyTime:enter()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  H.font:setFilter('nearest', 'nearest')

  study_timer = 50 * 60
  formatted_time = ''

	width, height = love.graphics.getDimensions()
	bg_width = H.bg.image:getWidth()
	bg_height = H.bg.image:getHeight()

	background.x = width/bg_width
	background.y = height/bg_height

	header_y = (height/2 - H.font:getHeight() + 14)
	header_shadow_y = (height/2 - H.font:getHeight() + 10)

	time_y = (height/2 - H.font_big:getHeight() - 50)
	time_shadow_y = (height/2 - H.font_big:getHeight() - 55)

	move_time = 0
	down = true
end

local move_text = function (time)
	if time > 2 then
		down = not down
		move_time = 0
		print(move_time)
	end
	return 1
end

function StudyTime:update(dt)
  study_timer = study_timer - dt
	move_time = move_time + dt

	if down == false then
		header_y = header_y - move_text(move_time)
		header_shadow_y = header_shadow_y - move_text(move_time)
		time_y = time_y - move_text(move_time)
		time_shadow_y = time_shadow_y - move_text(move_time)
	end
	if down == true then
		header_y = header_y + move_text(move_time)
		header_shadow_y = header_shadow_y + move_text(move_time)
		time_y = time_y + move_text(move_time)
		time_shadow_y = time_shadow_y + move_text(move_time)
	end

  formatted_time = H.seconds_to_time(study_timer)

  if study_timer < 0 then
    if not H.sfx.ping:isPlaying() then
      love.audio.play(H.sfx.bonk)
    end
    GameStateManager:setState(H.states.break_wait)
  end
end

function StudyTime:draw()
  love.graphics.setColor(1, 1, 1)
  fx(function ()
    H.bg.effect(function ()
      love.graphics.draw(H.bg.image, 0, 0, 0, background.x, background.y)
    end)
    love.graphics.setFont(H.font)

    love.graphics.setColor(0, 0, 0)
		love.graphics.print(formatted_time, (width/2-H.font:getWidth(formatted_time)/2), header_y)

    love.graphics.setColor(1, 1, 0)
		love.graphics.print(formatted_time, (width/2-H.font:getWidth(formatted_time)/2), header_shadow_y)

    love.graphics.setFont(H.font_big)

    love.graphics.setColor(0, 0, 0)
		love.graphics.print(H.phrases.study_time, (width/2-H.font_big:getWidth(H.phrases.study_time)/2), time_y)

    love.graphics.setColor(1, 1, 0)
		love.graphics.print(H.phrases.study_time, (width/2-H.font_big:getWidth(H.phrases.study_time)/2), time_shadow_y)

    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(H.font)
  end)
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
