function drawPanelButton(id)
  love.graphics.setColor(150, 150, 150)
  if panel.b[id] ~= 0 then
    love.graphics.rectangle("line", panel.s.x+72+(137*id-137), panel.s.y, panel.s.width*2, panel.s.height)
    love.graphics.setColor(70,70,70)
    love.graphics.print(win[panel.b[id]].title, panel.s.x+4+77+(137*id-137), panel.s.y+7)
    if (sys.mouse.p.p == true and sys.mouse.p.x >= panel.s.x+72+(137*id-137)
    and sys.mouse.p.x <= (panel.s.x+72+(137*id-137))+(panel.s.width*2)
    and sys.mouse.p.y >= panel.s.y and sys.mouse.p.y <= panel.s.y+panel.s.height) then
      if win[panel.b[id]].min == false then
        win[panel.b[id]].oldlayer = win[panel.b[id]].layer
        win[panel.b[id]].layer = 1
      elseif win[panel.b[id]].min == true then
        win[panel.b[id]].min = false
        win[panel.b[id]].oldlayer = win[panel.b[id]].layer
        win[panel.b[id]].layer = 1
      end
    end
  end
end
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
  drawPanelButton(1)
  drawPanelButton(2)
  drawPanelButton(3)
  drawPanelButton(4)
  drawPanelButton(5)
  drawPanelButton(6)
end
