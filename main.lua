function love.load(arg)
  player = require "Paddle"
  player:Init(10, love.graphics.getHeight() /2)

  ball = require "Ball"
  ball:Init()

  collision = false
end

function love.update(dt)

  ball:Update(dt, player.x, player.y)

  if love.keyboard.isDown('w') then
    player:Move("up", dt)
  elseif love.keyboard.isDown("s") then
    player:Move("down", dt)
  end
end

function love.draw()
  love.graphics.print("Collide: " .. tostring(collision), 0, 0)
  player:Draw()
  ball:Draw()
end
