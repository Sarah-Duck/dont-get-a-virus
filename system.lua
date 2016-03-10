function drawLayer(id)
  love.graphics.draw(win[layer[id]].cvs, win[layer[id]].x, win[layer[id]].y, 0, win[layer[id]].s)
end
function updateSystem(dt)
  timeNoti(dt)
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
      sendMessage(1, "HEY WAZZUP FOOL")
    end
  end
  if start.o == true and sys.mouse.p.p == true and sys.mouse.p.x > 255 or sys.mouse.p.y < sys.h-380 then
    start.o = false
  end
  for i=1,#layer do
    drawLayer((#layer+1)-i)
  end
  drawStart()
  if start.o == true then
    drawMenu()
  end
  drawNoti()
  if fade == 0 and fadeOpacity ~= 0 then
    love.graphics.setColor(0, 0, 0, fadeOpacity)
    love.graphics.rectangle("fill", 0, 0, sys.w, sys.h)
  elseif fade == 1 then
    love.graphics.setColor(0, 0, 0, fadeOpacity)
    love.graphics.rectangle("fill", 0, 0, sys.w, sys.h)
  end
end
