function drawPanelButton(id)
  love.graphics.setColor(150, 150, 150)
  if panel.b[id] ~= nil then
    if layer[1] == panel.b[id] and win[panel.b[id]].min == false then
      drawDownBox(panel.s.x+72+(panel.s.dis*id-panel.s.dis), panel.s.y, panel.s.width*2.75, panel.s.height, 2)
    else
      drawUpBox(panel.s.x+72+(panel.s.dis*id-panel.s.dis), panel.s.y, panel.s.width*2.75, panel.s.height, 2)
    end
    love.graphics.setColor(70,70,70)
    love.graphics.print(win[panel.b[id]].title, panel.s.x+4+90+(panel.s.dis*id-panel.s.dis), panel.s.y+7)
    love.graphics.setColor(256,256,256)
    love.graphics.draw(win[panel.b[id]].icon16, panel.s.x+4+72+(panel.s.dis*id-panel.s.dis), panel.s.y+2)
    if (sys.mouse.p.p == true and sys.mouse.p.x >= panel.s.x+72+(panel.s.dis*id-panel.s.dis)
    and sys.mouse.p.x <= (panel.s.x+72+(panel.s.dis*id-panel.s.dis))+(panel.s.width*2.75)
    and sys.mouse.p.y >= panel.s.y and sys.mouse.p.y <= panel.s.y+panel.s.height and v1.yes == false) then
      if win[panel.b[id]].min == false then
        layer.sentToFront = panel.b[id]
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
  love.graphics.setColor(colors.win.normal)
  love.graphics.rectangle("fill", panel.x, panel.y, panel.width, panel.height)
  love.graphics.setColor(colors.win.light)
  love.graphics.setLineWidth(1.5)
  love.graphics.line(panel.x, panel.y, panel.width, panel.y)
  love.graphics.setColor(colors.win.dark)
  if start.o == true then
    drawDownBox(panel.s.x, panel.s.y, panel.s.width, panel.s.height, 2)
  else
    drawUpBox(panel.s.x, panel.s.y, panel.s.width, panel.s.height, 2)
  end
  love.graphics.setColor(colors.font.dark)
  love.graphics.print("START", panel.s.x+4, panel.s.y+7)
  drawPanelButton(1)
  drawPanelButton(2)
  drawPanelButton(3)
  drawPanelButton(4)
  drawPanelButton(5)
  drawPanelButton(6)
  if(sys.mouse.p.p == true and start.p == false and sys.mouse.p.x >= panel.s.x
  and sys.mouse.p.x <= panel.s.x+panel.s.width
  and sys.mouse.p.y >= panel.s.y and sys.mouse.p.y <= panel.s.y+panel.s.height) then
    start.p = true
    if start.o == true then
      start.o = false
    elseif start.o == false then
      start.o = true
      --sendMessage(1, msgs[msg.c])
    end
  end
end
function drawNoti()
  if notify.yes == true or notify.op ~= 0 then
    love.graphics.setColor(255, 255, 255, notify.op)
    love.graphics.draw(notification.bubble, notify.x, notify.y)
    love.graphics.setColor(colors.font.dark, notify.op)
    love.graphics.print(notify.title, notify.x+10, notify.y+10)
    love.graphics.printf(notify.body, notify.x+10, notify.y+30, 200)
    if notify.sound == true then
      notification.sound1:play()
      notify.sound = false
    end
    if notify.op ~= 255 and notify.yes == true then
      notify.op = notify.op + 17
    elseif notify.op ~= 0 and notify.yes == false then
      notify.op = notify.op - 17
    end
  end
end
function timeNoti(dt)
  notify.timer = notify.timer + dt
  if notify.timer >= 4 then
    notify.yes = false
    notify.timer = 0
    notify.sound = false
  end
end
function notifyNow(title, body)
  if notify.yes == false and notify.sound == false then
    notify.sound = true
    notify.timer = 0
  end
  notify.yes = true
  notify.title = title
  notify.body = body
end
