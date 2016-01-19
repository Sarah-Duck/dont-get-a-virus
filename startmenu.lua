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
  if sys.mouse.x >= 35 and sys.mouse.x <= 242 then
    if sys.mouse.y >= 600-30-350+2+5 and sys.mouse.y <= 600-30-350+2+5+50 then
      love.graphics.setColor(0,0,120)
    end
  end
  love.graphics.rectangle("fill", 35, 5, 208, 50)
  love.graphics.setColor(192, 192, 192)
  if sys.mouse.x >= 35 and sys.mouse.x <= 242 then
    if sys.mouse.y >= 600-30-350+2+5+55 and sys.mouse.y <= 600-30-350+2+5+50+55 then
      love.graphics.setColor(0,0,120)
    end
  end
  love.graphics.rectangle("fill", 35, 5+55, 208, 50)
  love.graphics.setColor(192, 192, 192)
  if sys.mouse.x >= 35 and sys.mouse.x <= 242 then
    if sys.mouse.y >= 600-30-350+2+5+55+55 and sys.mouse.y <= 600-30-350+2+5+50+55+55 then
      love.graphics.setColor(0,0,120)
    end
  end
  love.graphics.rectangle("fill", 35, 5+55+55, 208, 50)
  love.graphics.setColor(192, 192, 192)
  if sys.mouse.x >= 35 and sys.mouse.x <= 242 then
    if sys.mouse.y >= 600-30-350+2+5+55+55+55 and sys.mouse.y <= 600-30-350+2+5+50+55+55+55 then
      love.graphics.setColor(0,0,120)
    end
  end
  love.graphics.rectangle("fill", 35, 5+55+55+55, 208, 50)
  love.graphics.setCanvas()
  love.graphics.setColor(255,255,255)
  love.graphics.draw(start.cvs, 0, 600-30-350+2)
end
