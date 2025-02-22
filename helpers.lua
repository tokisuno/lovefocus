local M = {}
M.font = love.graphics.newFont("assets/PixAntiqua.ttf", 24)

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

M.phrases = {
  study_time = {
    default = love.graphics.newText(M.font, "Study time!")
  },
  break_time = {
    default = "Break time!"
  }
}

return M
