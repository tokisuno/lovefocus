local GameStateManager = require('lib.GameStateManager')
local StudyTime = {}

local width, height

local header_y
local time_y

function StudyTime:enter()
	love.graphics.setDefaultFilter('nearest', 'nearest')
	H.font:setFilter('nearest', 'nearest')

	study_timer = 50 * 60
	formatted_time = ''

	width, height = love.graphics.getDimensions()

	header_y = (height/2 - H.font:getHeight() + 14)

	time_y = (height/2 - H.font_big:getHeight() - 50)
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
  love.graphics.setFont(H.font)

  love.graphics.setColor(1, 1, 0)
  love.graphics.print(formatted_time, (width/2-H.font:getWidth(formatted_time)/2), header_y)

  love.graphics.setFont(H.font_big)

  love.graphics.print(H.phrases.study_time, (width/2-H.font_big:getWidth(H.phrases.study_time)/2), time_y)

  -- love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(H.font)
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
