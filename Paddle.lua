local Paddle = { x, y = 0, 0, speed = 300, width = 60 }

function Paddle:SetInStartPosition()
  self.x, self.y = love.graphics.getWidth()/2, love.graphics.getHeight() - 20
end

function Paddle:Move(direction, dt)
  if direction == "left" and self.x - 6 > 0 then
    self.x = self.x - (self.speed * dt)
  elseif direction == "right" and self.x + self.width < love.graphics.getWidth() - 6 then
    self.x = self.x + (self.speed * dt)
  end
end

function Paddle:Draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, 10)
end

return Paddle
