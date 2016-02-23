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
  if(sys.mouse.x >= 35 and sys.mouse.x <= 242
  and sys.mouse.y >= start.y+5 and sys.mouse.y <= start.y+5+50) then
    love.graphics.setColor(0,0,120)
    love.graphics.rectangle("fill", 35, 5, 208, 50)
    love.graphics.setColor(220,220,220)
    love.graphics.print("INTERNET", 85, 5+22)
    if sys.mouse.p.p == true and win[2].ex == true then
      win[2].ex = false
      win[2].s = 0.2
      win[2].oldlayer = win[2].layer
      win[2].layer = 1
    end
  else
    love.graphics.rectangle("fill", 35, 5, 208, 50)
    love.graphics.setColor(70,70,70)
    love.graphics.print("INTERNET", 85, 5+22)
  end
  love.graphics.setColor(255,255,255)
  love.graphics.draw(icons[32].internet, 44, 13)
  love.graphics.setColor(192, 192, 192)
  if(sys.mouse.x >= 35 and sys.mouse.x <= 242
  and sys.mouse.y >= start.y+5+55 and sys.mouse.y <= start.y+5+50+55) then
    love.graphics.setColor(0,0,120)
    love.graphics.rectangle("fill", 35, 5+55, 208, 50)
    love.graphics.setColor(220,220,220)
    love.graphics.print("CHAT", 85, 5+55+22)
    if sys.mouse.p.p == true and win[1].ex == true then
      win[1].ex = false
      win[1].s = 0.2
      win[1].oldlayer = win[1].layer
      win[1].layer = 1
    end
  else
    love.graphics.rectangle("fill", 35, 5+55, 208, 50)
    love.graphics.setColor(70,70,70)
    love.graphics.print("CHAT", 85, 5+55+22)
  end
  love.graphics.setColor(255,255,255)
  love.graphics.draw(icons[32].chat, 44, 60+10)
  love.graphics.setColor(192, 192, 192)
  if(sys.mouse.x >= 35 and sys.mouse.x <= 242
  and sys.mouse.y >= start.y+5+55+55 and sys.mouse.y <= start.y+5+50+55+55) then
    love.graphics.setColor(0,0,120)
    love.graphics.rectangle("fill", 35, 5+55+55, 208, 50)
    love.graphics.setColor(220,220,220)
    love.graphics.print("FILES", 85, 5+55+55+22)
    if sys.mouse.p.p == true and win[3].ex == true then
      win[3].ex = false
      win[3].s = 0.2
      win[3].oldlayer = win[3].layer
      win[3].layer = 1
    end
  else
    love.graphics.rectangle("fill", 35, 5+55+55, 208, 50)
    love.graphics.setColor(70,70,70)
    love.graphics.print("FILES", 85, 5+55+55+22)
  end
  love.graphics.setColor(255,255,255)
  love.graphics.draw(icons[32].files, 44, 60+10+54)
  love.graphics.setColor(192, 192, 192)
  if(sys.mouse.x >= 35 and sys.mouse.x <= 242
  and sys.mouse.y >= start.y+5+55+55+55 and sys.mouse.y <= start.y+5+50+55+55+55) then
    love.graphics.setColor(0,0,120)
    love.graphics.rectangle("fill", 35, 5+55+55+55, 208, 50)
    love.graphics.setColor(220,220,220)
    love.graphics.print("ANTIVIRUS", 85, 5+55+55+55+22)
    if sys.mouse.p.p == true and win[4].ex == true then
      win[4].ex = false
      win[4].s = 0.2
      win[4].oldlayer = win[3].layer
      win[4].layer = 1
    end
  else
    love.graphics.rectangle("fill", 35, 5+55+55+55, 208, 50)
    love.graphics.setColor(70,70,70)
    love.graphics.print("ANTIVIRUS", 85, 5+55+55+55+22)
  end
  love.graphics.setColor(255,255,255)
  love.graphics.draw(icons[32].torrentr, 44, 60+10+54+55)
  love.graphics.setColor(192, 192, 192)
  if(sys.mouse.x >= 35 and sys.mouse.x <= 242
  and sys.mouse.y >= start.y+5+55+55+55+55 and sys.mouse.y <= start.y+5+50+55+55+55+55) then
    love.graphics.setColor(0,0,120)
    love.graphics.rectangle("fill", 35, 5+55+55+55+55, 208, 50)
    love.graphics.setColor(220,220,220)
    love.graphics.print("HELP", 85, 5+55+55+55+55+22)
    if sys.mouse.p.p == true and win[5].ex == true then
      win[5].ex = false
      win[5].s = 0.2
      win[5].oldlayer = win[3].layer
      win[5].layer = 1
    end
  else
    love.graphics.rectangle("fill", 35, 5+55+55+55+55, 208, 50)
    love.graphics.setColor(70,70,70)
    love.graphics.print("HELP", 85, 5+55+55+55+55+22)
  end
  love.graphics.setColor(255,255,255)
  love.graphics.draw(icons[32].help, 44, 60+10+54+55+55)
  love.graphics.setColor(192, 192, 192)
  if(sys.mouse.x >= 35 and sys.mouse.x <= 242
  and sys.mouse.y >= start.y+5+55+55+55+55+55 and sys.mouse.y <= start.y+5+50+55+55+55+55+55) then
    love.graphics.setColor(0,0,120)
    love.graphics.rectangle("fill", 35, 5+55+55+55+55+55, 208, 50)
    love.graphics.setColor(220,220,220)
    love.graphics.print("SETTINGS", 85, 5+55+55+55+55+55+22)
    if sys.mouse.p.p == true and win[6].ex == true then
      win[6].ex = false
      win[6].s = 0.2
      win[6].oldlayer = win[3].layer
      win[6].layer = 1
    end
  else
    love.graphics.rectangle("fill", 35, 5+55+55+55+55+55, 208, 50)
    love.graphics.setColor(70,70,70)
    love.graphics.print("SETTINGS", 85, 5+55+55+55+55+55+22)
  end
  love.graphics.setColor(255,255,255)
  love.graphics.draw(icons[32].settings, 44, 60+10+54+55+55+55)
  love.graphics.setCanvas()
  love.graphics.setColor(255,255,255)
  love.graphics.draw(start.cvs, start.x, start.y)
end
