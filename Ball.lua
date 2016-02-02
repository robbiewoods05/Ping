local Ball = {  x, y, velX, velY, edge, xV, yV  = 0, 0, 0, 0, 0, 0, collided = false }

function Collide(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function Ball:Init()
  self.edge, self.velX, self.velY = 10, -230, 0
  self.x, self.y = love.graphics.getWidth() - self.edge, love.graphics.getHeight() / 2

end

function Ball:Draw()
  love.graphics.rectangle("fill", self.x, self.y, self.edge, self.edge)
end

function Ball:Update(dt)
    self.x = self.x + (self.velX * dt)
    self.y = self.y + (self.velY * dt)
end

function Ball:CheckCollision(playerX, playerY)
  -- Ball & paddle TODO: Add Y movement
  if Collide(self.x, self.y, self.edge, self.edge, playerX, playerY, 10, 60) then
    local intersectPc = self.x - playerY
    angleMultiplier, degToRad =  math.abs(intersectPc / 30), (math.pi*2)/360

     xV = math.cos(90 * angleMultiplier * degToRad) * 230
     yV = math.sin(90 * angleMultiplier * degToRad) * 160

    if intersectPc < 0 then
      yV = 0 - yV
    end

    if (self.velX > 0) then
      xV = 0 - xV
    end

    self.velX = xV
    self.velY = yV
  end

  -- Ball and right wall
  if self.x >= love.graphics.getWidth() then
    self.velX = -230
  end

  -- Ball and top wall
  if self.y <= 0 then
    self.velY = 50
  end

  -- Ball and bottom wall
  if self.y >= love.graphics.getHeight() - self.edge then
    self.velY = -50
  end
end

return Ball
