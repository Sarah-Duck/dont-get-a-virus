function drawStart()
  panel.width = love.graphics.getWidth( )
  panel.y = love.graphics.getHeight()
  panel.y = panel.y - panel.thick
  panel.s.y = panel.y + 5
  love.graphics.setColor(192, 192, 192)
  love.graphics.rectangle("fill", panel.x, panel.y, panel.width, panel.height)
  love.graphics.setColor(220, 220, 220)
  love.graphics.setLineWidth(2)
  love.graphics.line(panel.x, panel.y, panel.width, panel.y)
  love.graphics.setColor(150, 150, 150)
  love.graphics.rectangle("line", panel.s.x, panel.s.y, panel.s.width, panel.s.height)
  love.graphics.setColor(70,70,70)
  love.graphics.print("START", panel.s.x+4, panel.s.y+7)
  love.graphics.setColor(150, 150, 150)
  if panel.b[1] ~= 0 then
    love.graphics.rectangle("line", panel.s.x+72, panel.s.y, panel.s.width*2, panel.s.height)
    love.graphics.setColor(70,70,70)
    love.graphics.print(win[panel.b[1]].title, panel.s.x+4+77, panel.s.y+7)
    if (sys.mouse.p.p == true and sys.mouse.p.x >= panel.s.x+72
    and sys.mouse.p.x <= (panel.s.x+72)+(panel.s.width*2)
    and sys.mouse.p.y >= panel.s.y and sys.mouse.p.y <= panel.s.y+panel.s.height) then
      if win[panel.b[1]].min == false then
        win[panel.b[1]].oldlayer = win[panel.b[1]].layer
        win[panel.b[1]].layer = 1
      elseif win[panel.b[1]].min == true then
        win[panel.b[1]].min = false
        win[panel.b[1]].oldlayer = win[panel.b[1]].layer
        win[panel.b[1]].layer = 1
      end
    end
  end
  love.graphics.setColor(150, 150, 150)
  if panel.b[2] ~= 0 then
    love.graphics.rectangle("line", panel.s.x+72+70+67, panel.s.y, panel.s.width*2, panel.s.height)
    love.graphics.setColor(70,70,70)
    love.graphics.print(win[panel.b[2]].title, panel.s.x+4+77+137, panel.s.y+7)
    if (sys.mouse.p.p == true and sys.mouse.p.x >= panel.s.x+72+70+67
    and sys.mouse.p.x <= (panel.s.x+72+70+67)+(panel.s.width*2)
    and sys.mouse.p.y >= panel.s.y and sys.mouse.p.y <= panel.s.y+panel.s.height) then
      if win[panel.b[2]].min == false then
        win[panel.b[2]].oldlayer = win[panel.b[2]].layer
        win[panel.b[2]].layer = 1
      elseif win[panel.b[2]].min == true then
        win[panel.b[2]].min = false
        win[panel.b[2]].oldlayer = win[panel.b[2]].layer
        win[panel.b[2]].layer = 1
      end
    end
  end
  love.graphics.setColor(150, 150, 150)
  if panel.b[3] ~= 0 then
    love.graphics.rectangle("line", panel.s.x+72+137+137, panel.s.y, panel.s.width*2, panel.s.height)
    love.graphics.setColor(70,70,70)
    love.graphics.print(win[panel.b[3]].title, panel.s.x+4+77+137+137, panel.s.y+7)
    if (sys.mouse.p.p == true and sys.mouse.p.x >= panel.s.x+72+70+67+137
    and sys.mouse.p.x <= (panel.s.x+72+137+137)+(panel.s.width*2)
    and sys.mouse.p.y >= panel.s.y and sys.mouse.p.y <= panel.s.y+panel.s.height) then
      if win[panel.b[3]].min == false then
        win[panel.b[3]].oldlayer = win[panel.b[3]].layer
        win[panel.b[3]].layer = 1
      elseif win[panel.b[3]].min == true then
        win[panel.b[3]].min = false
        win[panel.b[3]].oldlayer = win[panel.b[3]].layer
        win[panel.b[3]].layer = 1
      end
    end
  end
  love.graphics.setColor(150, 150, 150)
  if panel.b[4] ~= 0 then
    love.graphics.rectangle("line", panel.s.x+72+137+137+137, panel.s.y, panel.s.width*2, panel.s.height)
    love.graphics.setColor(70,70,70)
    love.graphics.print(win[panel.b[4]].title, panel.s.x+4+77+137+137+137, panel.s.y+7)
    if (sys.mouse.p.p == true and sys.mouse.p.x >= panel.s.x+72+70+67+137+137
    and sys.mouse.p.x <= (panel.s.x+72+137+137+137)+(panel.s.width*2)
    and sys.mouse.p.y >= panel.s.y and sys.mouse.p.y <= panel.s.y+panel.s.height) then
      if win[panel.b[4]].min == false then
        win[panel.b[4]].oldlayer = win[panel.b[4]].layer
        win[panel.b[4]].layer = 1
      elseif win[panel.b[4]].min == true then
        win[panel.b[4]].min = false
        win[panel.b[4]].oldlayer = win[panel.b[4]].layer
        win[panel.b[4]].layer = 1
      end
    end
  end
  love.graphics.setColor(150, 150, 150)
  if panel.b[5] ~= 0 then
    love.graphics.rectangle("line", panel.s.x+72+137+137+137+137, panel.s.y, panel.s.width*2, panel.s.height)
    love.graphics.setColor(70,70,70)
    love.graphics.print(win[panel.b[5]].title, panel.s.x+4+77+137+137+137+137, panel.s.y+7)
    if (sys.mouse.p.p == true and sys.mouse.p.x >= panel.s.x+72+70+67+137+137+137
    and sys.mouse.p.x <= (panel.s.x+72+137+137+137+137)+(panel.s.width*2)
    and sys.mouse.p.y >= panel.s.y and sys.mouse.p.y <= panel.s.y+panel.s.height) then
      if win[panel.b[5]].min == false then
        win[panel.b[5]].oldlayer = win[panel.b[5]].layer
        win[panel.b[5]].layer = 1
      elseif win[panel.b[5]].min == true then
        win[panel.b[5]].min = false
        win[panel.b[5]].oldlayer = win[panel.b[5]].layer
        win[panel.b[5]].layer = 1
      end
    end
  end
  love.graphics.setColor(150, 150, 150)
  if panel.b[6] ~= 0 then
    love.graphics.rectangle("line", panel.s.x+72+137+137+137+137+137, panel.s.y, panel.s.width*2, panel.s.height)
    love.graphics.setColor(70,70,70)
    love.graphics.print(win[panel.b[6]].title, panel.s.x+4+77+137+137+137+137+137, panel.s.y+7)
    if (sys.mouse.p.p == true and sys.mouse.p.x >= panel.s.x+72+70+67+137+137+137+137
    and sys.mouse.p.x <= (panel.s.x+72+137+137+137+137+137)+(panel.s.width*2)
    and sys.mouse.p.y >= panel.s.y and sys.mouse.p.y <= panel.s.y+panel.s.height) then
      if win[panel.b[6]].min == false then
        win[panel.b[6]].oldlayer = win[panel.b[6]].layer
        win[panel.b[6]].layer = 1
      elseif win[panel.b[6]].min == true then
        win[panel.b[6]].min = false
        win[panel.b[6]].oldlayer = win[panel.b[6]].layer
        win[panel.b[6]].layer = 1
      end
    end
  end
end
