function drawDesktop()
  love.graphics.setColor(255,255,255)
  if desktop.bg.current ~= 0 then
    love.graphics.draw(desktop.bg.current, 0, 0, 0, sys.w/1920, sys.h/1280)
  end
  if v1.explodeintro == true and v1.yes == true then
    if expl.frame >= 20 or v1.c.chat.msgs > 1 then
      love.graphics.draw(v1.scorch, win[2].x-300, win[2].y-100)
    end
    if expl.deb.load == false then
      expl.deb[1].x = win[2].x
      expl.deb[1].y = win[2].y
      expl.deb[2].x = win[2].x+300
      expl.deb[2].y = win[2].y
      expl.deb[3].x = win[2].x
      expl.deb[3].y = win[2].y+300
      expl.deb.load = true
    end
    if expl.deb[1].y < sys.h or expl.deb[2].y < sys.h or expl.deb[3].y < sys.h then
      for i=1,3 do
        love.graphics.draw(expl.deb[i].pic, expl.deb[i].x, expl.deb[i].y, expl.deb[i].r)
        expl.deb[i].y = expl.deb[i].y - expl.deb[i].ym
        expl.deb[i].ym = expl.deb[i].ym - 1
        expl.deb[i].x = expl.deb[i].x + expl.deb[i].xm
        expl.deb[i].r = expl.deb[i].r + expl.deb[i].rm
      end
    end
    if expl.frame <= 89 and v1.c.chat.msgs < 2 then
      love.graphics.setColor(255,255,255)
      love.graphics.draw(expl.pic, expl.frames[expl.frame], win[2].x-750, win[2].y-500, 0, 7, 7)
      expl.frame = expl.frame + 1
    end
  end
  for i=1,6 do
    drawIcon(i)
    checkIcon(i)
  end
  if sys.mouse.p.p == true and sys.mouse.drag == false then
    love.graphics.setColor(0,80,160,80)
    love.graphics.rectangle("fill", sys.mouse.p.x, sys.mouse.p.y, sys.mouse.x-sys.mouse.p.x, sys.mouse.y-sys.mouse.p.y)
    love.graphics.rectangle("line", sys.mouse.p.x, sys.mouse.p.y, sys.mouse.x-sys.mouse.p.x, sys.mouse.y-sys.mouse.p.y)
  end
end
function drawIcon(id, x, y)
  if icon[id].hl == true then
    love.graphics.setColor(0,0,120)
    love.graphics.rectangle("fill", icon[id].x+55-pressstart:getWidth(win[id].title)/2-6,
    icon[id].y+45, pressstart:getWidth(win[id].title)+10, 25)
  end
  love.graphics.setColor(colors.font.light)
  love.graphics.print(win[id].title, icon[id].x+55, icon[id].y+55, 0, 1, 1, pressstart:getWidth(win[id].title)/2)
  love.graphics.setColor(255,255,255)
  love.graphics.draw(win[id].icon32, icon[id].x+30, icon[id].y, 0, 1.5, 1.5)
end
function checkIcon(id)
  if(sys.mouse.p.x >= icon[id].x+4 and sys.mouse.p.x <= icon[id].x+100 and sys.mouse.p.p == true
  and sys.mouse.p.y >= icon[id].y and sys.mouse.p.y <= icon[id].y+75 and v1.yes == false) then
    if icon[id].hl == false and icon[id].cl == false then
      icon[id].hl = true
      icon[id].cl = true
    elseif icon[id].hl == true and icon[id].cl == false then
      icon[id].hl = false
      icon[id].cl = true
      if win[id].ex == true then
        win[id].ex = false
        win[id].s = 0.2
        win[id].oldlayer = win[id].layer
        layer.sentToFront = id
      end
    end
  elseif sys.mouse.drag == true or sys.mouse.p.x > 120 or sys.mouse.p.y > 550 then
    icon[id].hl = false
  end
end
