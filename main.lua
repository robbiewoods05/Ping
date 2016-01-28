function love.load(arg)
  player = require "Paddle"
  player:SetInStartPosition()
  love.keyboard.setKeyRepeat(true)
end

function love.update(dt)
    if love.keyboard.isDown('left') then
      player:Move("left", dt)
    elseif love.keyboard.isDown("right") then
      player:Move("right", dt)
    end
end

function love.draw()
  player:Draw()
end
