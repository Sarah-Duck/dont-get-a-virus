function drawMenuItems(id)
  if(sys.mouse.x >= 35 and sys.mouse.x <= 242
  and sys.mouse.y >= start.y+5+(id*55-55) and sys.mouse.y <= start.y+(id*55)) then
    love.graphics.setColor(0,0,120)
    love.graphics.rectangle("fill", 35, 5+(id*55-55), 208, 50)
    love.graphics.setColor(colors.win.light)
    love.graphics.print(win[id].title, 85, 5+22+(id*55-55))
    if sys.mouse.p.p == true and win[id].ex == true then
      win[id].ex = false
      win[id].s = 0.2
      win[id].oldlayer = win[id].layer
      layer.sentToFront = id
      start.o = false
    end
  else
    love.graphics.rectangle("fill", 35, 5+(id*55-55), 208, 50)
    love.graphics.setColor(colors.font.dark)
    love.graphics.print(win[id].title, 85, 5+22+(id*55-55))
  end
  love.graphics.setColor(255,255,255)
  love.graphics.draw(win[id].icon32, 44, 13+(id*55-55))
  love.graphics.setColor(colors.win.normal)
end
function drawMenu()
  start.y = love.graphics.getHeight()
  start.y = start.y-30-350+2
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
  drawMenuItems(1)
  drawMenuItems(2)
  drawMenuItems(3)
  drawMenuItems(4)
  drawMenuItems(5)
  drawMenuItems(6)
  love.graphics.setCanvas()
  love.graphics.setColor(255,255,255)
  love.graphics.draw(start.cvs, start.x, start.y)
end
