function drawLayer(id)
  if layer[id] ~= 0 then
    love.graphics.draw(win[layer[id]].cvs, win[layer[id]].x, win[layer[id]].y, 0, win[layer[id]].s)
  end
end
function drawSystem()
  love.graphics.setBackgroundColor(0, 128, 128)
  drawDesktop()
  orderWindows()
  if (win[1].hov == false and win[2].hov == false and win[3].hov == false
  and win[4].hov == false and win[5].hov == false and win[6].hov == false) then
    winHover = false
  end
  if(sys.mouse.p.p == true and start.p == false and sys.mouse.p.x >= panel.s.x
  and sys.mouse.p.x <= panel.s.x+panel.s.width
  and sys.mouse.p.y >= panel.s.y and sys.mouse.p.y <= panel.s.y+panel.s.height) then
    start.p = true
    if start.o == true then
      start.o = false
    elseif start.o == false then
      start.o = true
    end
  end
  if start.o == true and sys.mouse.p.p == true and sys.mouse.p.x > 255 or sys.mouse.p.y < 220 then
    start.o = false
  end
  drawLayer(7)
  drawLayer(6)
  drawLayer(5)
  drawLayer(4)
  drawLayer(3)
  drawLayer(2)
  drawLayer(1)
  drawStart()
  if start.o == true then
    drawMenu()
  end
  love.graphics.print(layer[1] .. layer[2] .. layer[3] .. layer[4] .. layer[5] .. layer[6] .. layer[7])
  love.graphics.print(win[1].layer .. win[2].layer .. win[3].layer .. win[4].layer .. win[5].layer .. win[6].layer, 0, 20)
  if fade == 0 and fadeOpacity ~= 0 then
    love.graphics.setColor(0, 0, 0, fadeOpacity)
    love.graphics.rectangle("fill", 0, 0, sys.w, sys.h)
  elseif fade == 1 then
    love.graphics.setColor(0, 0, 0, fadeOpacity)
    love.graphics.rectangle("fill", 0, 0, sys.w, sys.h)
  end
end
