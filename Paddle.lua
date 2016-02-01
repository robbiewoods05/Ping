local Paddle = { x, y = 0, 0, speed = 300, width = 10, height = 60 }

function Paddle:Init(xPos, yPos)
  self.x, self.y = xPos - (self.width / 2), yPos
end

function Paddle:Move(direction, dt)
  local edgeGap = 6

  if direction == "up" and self.y - edgeGap > 0 then
    self.y = self.y - (self.speed * dt)
  elseif direction == "down" and self.x + self.width < love.graphics.getWidth() - edgeGap then
    self.y = self.y + (self.speed * dt)
  end
end

function Paddle:Draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Paddle
