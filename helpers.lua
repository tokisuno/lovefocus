local M = {}
M.font = love.graphics.newFont("assets/PixAntiqua.ttf", 36)
M.font_big = love.graphics.newFont("assets/PixAntiqua.ttf", 48)

M.txt = function (txt)
  return love.graphics.newText(M.font, txt)
end

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
  study_time = {
    default = love.graphics.newText(M.font, "Study time!")
  },
  study_wait = {
    default = love.graphics.newText(M.font, "Ready to go?")
  },
  break_time = {
    default = love.graphics.newText(M.font, "Break time!")
  },
  break_wait = {
    default = love.graphics.newText(M.font, "Breaks are important...")
  }
}

return M
