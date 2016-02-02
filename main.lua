function love.load(arg)
  player = require "Paddle"
  player:Init(10, love.graphics.getHeight() /2)

  ball = require "Ball"
  ball:Init()

  collision = false
end

function love.update(dt)
  ball:CheckCollision(player.x, player.y)
  ball:Update(dt)


  if love.keyboard.isDown('w') then
    player:Move("up", dt)
  elseif love.keyboard.isDown("s") then
    player:Move("down", dt)
  elseif love.keyboard.isDown('escape') then
    love.event.quit()
  end
end

function love.draw()
  if ball.xV ~= nil then
    love.graphics.print("xV: " .. ball.xV, 0, 0)
    love.graphics.print("yV: " .. ball.yV, 80, 0)
  end
  love.graphics.print("X Velocity: " .. ball.velX, 0, 40)
  love.graphics.print("Y Velocity: " .. ball.velY, 80, 80)

  player:Draw()
  ball:Draw()
end
