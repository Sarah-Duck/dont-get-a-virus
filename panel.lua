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
    love.graphics.setColor(255,255,255)
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
  panel.width = sys.w
  panel.y = sys.h
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
  drawDownBox(sys.w-95,panel.s.y,panel.s.width+25,panel.s.height,2)
  love.graphics.setColor(colors.font.dark)
  clock = os.date("*t")
  if clock.hour > 12 then
    clock.hour = clock.hour - 12
    clock.ayy = "PM"
  else
    clock.ayy = "AM"
  end
  if clock.min < 10 then
    clock.d = clock.hour .. ":0" .. clock.min .. clock.ayy
  else
    clock.d = clock.hour .. ":" .. clock.min .. clock.ayy
  end
  love.graphics.print(clock.d,sys.w-95+3,panel.s.y+7)
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
  if v1.c.chat.msgs > 35 and v1.yes == true then
    drawDownBox(sys.w/2+166-250, panel.s.y, 101*2, panel.s.height,2)
    love.graphics.setColor(100,0,0)
    love.graphics.rectangle("fill",sys.w/2+166+1-250, panel.s.y+1, 200, panel.s.height-2)
    love.graphics.setColor(455-v1.c.health*4.55,v1.c.health*2.55,20)
    love.graphics.rectangle("fill",sys.w/2+166+1-250, panel.s.y+1, v1.c.health*2, panel.s.height-2)
    love.graphics.setColor(colors.font.dark)
    love.graphics.print("VIRUS HEALTH: " .. v1.c.health, sys.w/2-250, panel.s.y+6)
    if math.floor(-(v1.fightTimer-60)) < 10 then
      love.graphics.print("TIMER: " .. v1.fightMinute .. ":0" .. math.floor(-(v1.fightTimer-60)), sys.w/2+130, panel.s.y+6)
    else
      love.graphics.print("TIMER: " .. v1.fightMinute .. ":" .. math.floor(-(v1.fightTimer-60)), sys.w/2+130, panel.s.y+6)
    end
  end
end
function drawNoti()
  notify.x = sys.w-258
  notify.y = sys.h-135
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
    if mouseClick(notify.x,notify.y,250,113) == true then
      if win[1].ex == true then
        win[1].ex = false
        win[1].s = 0.2
      end
      win[1].oldlayer = win[1].layer
      layer.sentToFront = 1
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
function drawMenuItems(id)
  if(sys.mouse.x >= 35 and sys.mouse.x <= 242
  and sys.mouse.y >= start.y+5+(id*55-55) and sys.mouse.y <= start.y+(id*55)) then
    love.graphics.setColor(0,0,120)
    love.graphics.rectangle("fill", 35, 5+(id*55-55), 208, 50)
    love.graphics.setColor(colors.win.light)
    love.graphics.print(win[id].title, 85, 5+22+(id*55-55))
    if sys.mouse.p.p == true and v1.yes == false then
      if win[id].ex == true then
        win[id].ex = false
        win[id].s = 0.2
      end
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
  start.y = sys.h
  start.y = start.y-30-350+2
  love.graphics.setCanvas(start.cvs)
  love.graphics.setColor(192, 192, 192)
  love.graphics.rectangle("fill", 0, 0, 250, 350)
  love.graphics.setColor(220, 220, 220)
  love.graphics.setLineWidth(3.5)
  love.graphics.line(0, 0+350, 0, 0, 0+250, 0) --BoxLight
  love.graphics.setColor(150,150,150)
  love.graphics.line(0+250, 0+350, 0+250, 0) --BoxShadow
  love.graphics.setColor(0,0,120)
  love.graphics.rectangle("fill", 0, 0, 30, 350)
  love.graphics.setColor(192, 192, 192)
  love.graphics.print("WINBLOWS 98 OR SOME SHIT", 11, 340, -1.5708)
  for i=1,6 do
    drawMenuItems(i)
  end
  love.graphics.setCanvas()
  love.graphics.setColor(255,255,255)
  love.graphics.draw(start.cvs, start.x, start.y)
end
