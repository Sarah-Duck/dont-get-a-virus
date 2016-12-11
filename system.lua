function drawLayer(id)
  --love.graphics.setColor(0,0,0,30)
  --love.graphics.rectangle("fill", win[layer[id]].x+20, win[layer[id]].y+20, win[layer[id]].w, win[layer[id]].h)
  love.graphics.setColor(256,256,256)
  love.graphics.draw(win[layer[id]].cvs, win[layer[id]].x, win[layer[id]].y, 0, win[layer[id]].s)
end
function updateSystem(dt)
  timeNoti(dt)
  if time >= msgstime[msg.c] and msgssent < msg.c and v1.yes == false and v1.complete == false then
    sendMessage(1, msgs[msg.c])
    chat.status = 1
    msgssent = msgssent + 1
  end
  if v1.complete == true and v2.start == false and v2.complete == false then
    v2.startTime = v2.startTime + dt
    if virus2Lose == 0 then
      if v2.startTime >= 20 then
        v2.start = true
        addPopup(false, sys.w/2-300, sys.h/2-200, 600, 400, 1, false, true)
      end
    elseif virus2Lose ~= 0 then
      if v2.startTime >= 8 then
        v2.start = true
        addPopup(false, sys.w/2-300, sys.h/2-200, 600, 400, 1, false, true)
      end
    end
    if v2.startTime >= v2.startPopups and v2.start == false then
      v2.startPopups = v2.startPopups + math.random(2,10)
      addPopup(true)
    end
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
  if start.o == true and sys.mouse.p.p == true and sys.mouse.p.x > 255 or sys.mouse.p.y < sys.h-380 then
    start.o = false
  end
  for i=1,#layer do
    drawLayer((#layer+1)-i)
  end
  if v1.complete == true and v2.complete == false then
    drawPopups()
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
