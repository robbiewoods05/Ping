local Ball = {  x, y, speed, edge  = 0, 0, 0, 0 }

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function Ball:Init()
  self.edge, self.speed = 10, 230
  self.x, self.y = love.graphics.getWidth() - self.edge, love.graphics.getHeight() / 2

end

function Ball:Draw()
  love.graphics.rectangle("fill", self.x, self.y, self.edge, self.edge)
end

function Ball:Update(dt, playerX, playerY)
  if CheckCollision(self.x, self.y, self.edge, self.edge, playerX, playerY, 10, 60) then
    self.x = self.x - (self.speed * dt)
  elseif self.x - self.edge >= love.graphics.getWidth() then
    self.x = self.x + (self.speed * dt)
  end
end

return Ball
