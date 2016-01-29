function drawStart()
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
    if panel.b[1] == 1 then
      love.graphics.print("Chat", panel.s.x+4+72, panel.s.y+7)
    elseif panel.b[1] == 2 then
      love.graphics.print("Internet", panel.s.x+4+72, panel.s.y+7)
    end
    if (sys.mouse.p.p == true and sys.mouse.p.x >= panel.s.x+72
    and sys.mouse.p.x <= (panel.s.x+72)+(panel.s.width*2)
    and sys.mouse.p.y >= panel.s.y and sys.mouse.p.y <= panel.s.y+panel.s.height) then
      if win[panel.b[1]].min == false then
        win[panel.b[1]].layer = 1
      elseif win[panel.b[1]].min == true then
        win[panel.b[1]].min = false
        win[panel.b[1]].layer = 1
      end
    end
  end
  love.graphics.setColor(150, 150, 150)
  if panel.b[2] ~= 0 then
    love.graphics.rectangle("line", panel.s.x+72+70+67, panel.s.y, panel.s.width*2, panel.s.height)
    love.graphics.setColor(70,70,70)
    if panel.b[2] == 1 then
      love.graphics.print("Chat", panel.s.x+4+72+70+67, panel.s.y+7)
    elseif panel.b[2] == 2 then
      love.graphics.print("Internet", panel.s.x+4+72+70+67, panel.s.y+7)
    end
    if (sys.mouse.p.p == true and sys.mouse.p.x >= panel.s.x+72+70+67
    and sys.mouse.p.x <= (panel.s.x+72+70+67)+(panel.s.width*2)
    and sys.mouse.p.y >= panel.s.y and sys.mouse.p.y <= panel.s.y+panel.s.height) then
      if win[panel.b[2]].min == false then
        win[panel.b[2]].layer = 1
      elseif win[panel.b[2]].min == true then
        win[panel.b[2]].min = false
        win[panel.b[2]].layer = 1
      end
    end
  end
end
