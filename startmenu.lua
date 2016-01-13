function drawMenu()
  love.graphics.setCanvas(start.cvs)
  love.graphics.setColor(192, 192, 192)
  love.graphics.rectangle("fill", 0, 0, 250, 350)
  love.graphics.setColor(220, 220, 220)
  love.graphics.setLineWidth(4)
  love.graphics.line(0, 0+350, 0, 0, 0+250, 0) --BoxLight
  love.graphics.setColor(150,150,150)
  love.graphics.line(0+250, 0+350, 0+250, 0) --BoxShadow
  love.graphics.setColor(0,0,120)
  love.graphics.rectangle("fill", 0, 0, 30, 350)
  love.graphics.setColor(192, 192, 192)
  love.graphics.print("WINBLOWS 98 OR SOME SHIT", 11, 340, -1.5708)
  love.graphics.setCanvas()
  love.graphics.setColor(255,255,255)
  love.graphics.draw(start.cvs, 0, 600-30-350+2)
end
