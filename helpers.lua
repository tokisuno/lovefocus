local M = {}

local moonshine = require('lib.moonshine')

M.font = love.graphics.newFont("assets/PixAntiqua.ttf", 36)
M.font_big = love.graphics.newFont("assets/PixAntiqua.ttf", 48)
M.guy = love.graphics.newImage("assets/never_give_up.jpg")

M.bg = {}
M.bg.image  = love.graphics.newImage('assets/background.jpg')
M.bg.effect = moonshine(moonshine.effects.gaussianblur)
M.bg.effect.chain(moonshine.effects.vignette)
M.bg.effect.gaussianblur.sigma = 4

M.seconds_to_time = function(seconds)
  local seconds = tonumber(seconds)
  if seconds <= 0 then
    return "00:00:00"
  else
    local hours = string.format("%02.f", math.floor(seconds/3600))
    local mins = string.format("%02.f", math.floor(seconds/60 - (hours * 60)))
    local secs = string.format("%02.f", math.floor(seconds - hours * 3600 - mins * 60))
    return hours..":"..mins..":"..secs
  end
end

M.sfx = {
  bonk = love.audio.newSource('assets/bonk.ogg', 'static'),
  menu = love.audio.newSource('assets/menu.ogg', 'static'),
  ping = love.audio.newSource('assets/ping.ogg', 'static'),
}

M.states = {
  study_wait = require('states.studyWait'),
  study_time = require('states.studyTime'),
  break_wait = require('states.breakWait'),
  break_time = require('states.breakTime'),
}

M.phrases = {
  study_time = "Study time!",
  study_wait = "Ready to go?",
  break_time = "Break time!",
  break_wait = "Breaks are important..."
}

return M
