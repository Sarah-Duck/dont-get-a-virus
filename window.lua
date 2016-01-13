function drawWindow(id, x, y, w, h, t)
  love.graphics.setCanvas(win[1].cvs)
  love.graphics.setColor(192, 192, 192)
  love.graphics.rectangle("fill", 0, 0, w, h) --Box
  love.graphics.setLineWidth(4)
  love.graphics.setColor(220, 220, 220)
  love.graphics.line(0, y+h, 0, 0, 0+w, 0) --BoxLight
  love.graphics.setColor(150,150,150)
  love.graphics.line(0, 0+h, 0+w, 0+h, 0+w, 0) --BoxShadow
  love.graphics.setColor(0,0,120)
  love.graphics.rectangle("fill", 0+3, 0+3, w-7, 20) --Blue Bar
  love.graphics.setColor(192, 192, 192)
  love.graphics.rectangle("fill", 0+w-22, 0+5, 16, 16) --X Button
  love.graphics.setColor(70,70,70)
  love.graphics.print("X", 0+w-19, 0+10)
  love.graphics.setColor(192, 192, 192)
  love.graphics.rectangle("fill", 0+w-40, 0+5, 16, 16) --Minimize Button
  love.graphics.setColor(70,70,70)
  love.graphics.setLineWidth(3)
  love.graphics.line(0+w-37, 0+13, 0+w-37+10, 0+13)
  love.graphics.setColor(220, 220, 220)
  love.graphics.print(t, 0+6, 0+9) --Title
  love.graphics.setCanvas()
  if sys.mouse.p.p == true and sys.mouse.p.x >= x+2 and sys.mouse.p.x <= (x+2)+(w-44) then
    if sys.mouse.p.y >= y+2 and sys.mouse.p.y <= y+22 then
      sys.mouse.drag = true
      test = true
    end
  end
  if sys.mouse.p.p == false then
    sys.mouse.drag = false
    win[id].px = win[id].x
    win[id].py = win[id].y
  end
  if sys.mouse.drag == true and win[id].min == false and win[id].ex == false then
    win[id].x = win[id].px + (sys.mouse.x - sys.mouse.p.x)
    win[id].y = win[id].py + (sys.mouse.y - sys.mouse.p.y)
  end
  if sys.mouse.p.p == true and sys.mouse.p.x >= x+w-22 and sys.mouse.p.x <= (x+w-22)+16 then
    if sys.mouse.drag == false and sys.mouse.p.y >= y+5 and sys.mouse.p.y <= (y+5)+16 then
      win[id].ex = true
    end
  end
  if win[id].ex == true and win[id].s ~= 0 then
    win[id].s = win[id].s - 0.2
  elseif win[id].ex == false and win[id].s ~= 0 then
    win[id].s = win[id].s + 0.2
  end
  if win[id].s <= 0 then
    win[id].s = 0
  elseif win[id].s >= 1 then
    win[id].s = 1
  end
  if win[id].min == false and sys.mouse.p.p == true and sys.mouse.p.x >= x+w-40 and sys.mouse.p.x <= (x+w-40)+16 then
    if sys.mouse.drag == false and sys.mouse.p.y >= y+5 and sys.mouse.p.y <= (y+5)+16 then
      win[id].min = true
    end
  end
  if win[id].min == true and win[id].miny < 800 then
    win[id].y = win[id].y + 100
    win[id].miny = win[id].miny + 100
  end
  if win[id].miny > 800 then
    win[id].miny = 800
  end
  if win[id].min == false and win[id].miny > 0 then
    win[id].y = win[id].y - 100
    win[id].miny = win[id].miny - 100
  end
  if win[id].miny < 0 then
    win[id].miny = 0
  end
  love.graphics.setColor(255,255,255)
  love.graphics.draw(win[id].cvs, win[id].x, win[id].y, 0, win[id].s)
end
