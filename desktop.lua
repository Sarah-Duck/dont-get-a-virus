function drawDesktop()
  love.graphics.setColor(255,255,255)
  if desktop.bg.current ~= 0 then
    love.graphics.draw(desktop.bg.current, 0, 0, 0, sys.w/1920, sys.h/1280)
  end
  if v1.explodeintro == true and v1.yes == true then
    if expl.frame >= 20 or v1.c.chat.msgs > 1 then
      love.graphics.setColor(256,256,256)
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
        expl.deb[i].y = expl.deb[i].y - (expl.deb[i].ym*sys.s)
        expl.deb[i].ym = expl.deb[i].ym - (1*sys.s)
        expl.deb[i].x = expl.deb[i].x + (expl.deb[i].xm*sys.s)
        expl.deb[i].r = expl.deb[i].r + (expl.deb[i].rm*sys.s)
      end
    end
    if expl.frame <= 89 and v1.c.chat.msgs < 2 then
      love.graphics.setColor(255,255,255)
      love.graphics.draw(expl.pic, expl.frames[math.floor(expl.frame)], win[2].x-750, win[2].y-500, 0, 7, 7)
      expl.frame = expl.frame + 1*sys.s
    end
  end
  if scene == 2 and v1.c.chat.msgs > 35 then
    love.graphics.setColor(0,0,0,100)
    love.graphics.draw(v1.fadeImg,v1.t.x,0,0,2*sys.sw,sys.h)
    love.graphics.draw(v1.fadeImg,sys.w-v1.t.x,sys.h,math.rad(180),2*sys.sw,sys.h)
    drawTentacles()
    removeTentacles()
    love.graphics.setColor(0,0,0,235)
    love.graphics.draw(v1.fadeImg,v1.t.x,0,0,2*sys.sw,sys.h)
    love.graphics.draw(v1.fadeImg,sys.w-v1.t.x,sys.h,math.rad(180),2*sys.sw,sys.h)
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
function addTentacle(x,y,s,sp,dy,d,rl,sy)
  table.insert(v1.t.t, 1, {x=x,y=y,s=s,sy=sy,sp=sp,dy=dy,d=d,rl=rl,t=math.random(1,2),
  r=0,rm=false,si=math.random(0,1),rup=math.random(0,1),syl=math.random(1,3),syc=0,syp=math.random(0,1)})
end
function drawTentacles()
  love.graphics.setColor(256,256,256)
  v1.t.time = v1.t.time - delta
  if v1.t.x <= -30 then
    v1.t.x = v1.t.x + delta*5
  elseif v1.t.x > -30 then
    v1.t.x = -30
  end
  if v1.t.time <= 0 then
    v1.t.time = 0.3
    addTentacle(math.random(-20,0),sys.h+300,math.random(6,10),
    math.random(2,6),-300,true,math.random(5,45),math.random(6,10))
    addTentacle(math.random(-20,0),-300,math.random(6,10),
    math.random(2,6),sys.h+300,false,math.random(2,20),math.random(6,10))
  end
  for i=1,#v1.t.t do
    if v1.t.t[i].syp == 0 and v1.c.chat.msgs <= 40 then
      if v1.t.t[i].syc <= v1.t.t[i].syl then
        v1.t.t[i].syc = v1.t.t[i].syc + math.random(0.1,0.02,0.05,0.01,0.08,0.065)*sys.s+((v1.t.t[i].syl-v1.t.t[i].syc)/10)*sys.s
      elseif v1.t.t[i].syc > v1.t.t[i].syl then
        v1.t.t[i].syp = 1
        v1.t.t[i].syl = math.random(0,3)
      end
    elseif v1.t.t[i].syp == 1 and v1.c.chat.msgs <= 40 then
      if v1.t.t[i].syc >= -v1.t.t[i].syl then
        v1.t.t[i].syc = v1.t.t[i].syc - math.random(0.1,0.2,0.05,0.01,0.08,0.065)*sys.s+((-v1.t.t[i].syl-v1.t.t[i].syc)/10)*sys.s
      elseif v1.t.t[i].r < -v1.t.t[i].syl then
        v1.t.t[i].syp = 0
        v1.t.t[i].syl = math.random(0,3)
      end
    end
    if v1.t.t[i].rup == 0 and v1.c.chat.msgs <= 40 then
      if v1.t.t[i].r <= v1.t.t[i].rl then
        v1.t.t[i].r = v1.t.t[i].r + math.random(0.1,0.2,0.3,0.4,0.5,1,2)*sys.s+((v1.t.t[i].rl-v1.t.t[i].r)/10)*sys.s
      elseif v1.t.t[i].r > v1.t.t[i].rl then
        v1.t.t[i].rup = 1
        v1.t.t[i].rl = math.random(2,20)
      end
    elseif v1.t.t[i].rup == 1 and v1.c.chat.msgs <= 40 then
      if v1.t.t[i].r >= -v1.t.t[i].rl then
        v1.t.t[i].r = v1.t.t[i].r - math.random(0.1,0.2,0.3,0.4,0.5,1,2)*sys.s+((-v1.t.t[i].rl-v1.t.t[i].r)/10)*sys.s
      elseif v1.t.t[i].r < -v1.t.t[i].rl then
        v1.t.t[i].rup = 0
        v1.t.t[i].rl = math.random(2,20)
      end
    end
    if v1.t.t[i].si == 0 then
      if v1.t.t[i].t == 1 then
        love.graphics.draw(v1.tent1,v1.t.t[i].x+v1.t.x+v1.shakex,v1.t.t[i].y+v1.shakey,math.rad(-90+v1.t.t[i].r),v1.t.t[i].s*sys.sh,v1.t.t[i].sy*sys.sw+v1.t.t[i].syc,16)
      elseif v1.t.t[i].t == 2 then
        love.graphics.draw(v1.tent2,v1.t.t[i].x+v1.t.x+v1.shakex,v1.t.t[i].y+v1.shakey,math.rad(-90+v1.t.t[i].r),v1.t.t[i].s*sys.sh,v1.t.t[i].sy*sys.sw+v1.t.t[i].syc,16)
      end
    elseif v1.t.t[i].si == 1 then
      if v1.t.t[i].t == 1 then
        love.graphics.draw(v1.tent1,(-v1.t.t[i].x)+(sys.w-v1.t.x)+v1.shakex,v1.t.t[i].y+v1.shakey,math.rad(90+v1.t.t[i].r),v1.t.t[i].s*sys.sh,v1.t.t[i].sy*sys.sw+v1.t.t[i].syc,16)
      elseif v1.t.t[i].t == 2 then
        love.graphics.draw(v1.tent2,(-v1.t.t[i].x)+(sys.w-v1.t.x)+v1.shakex,v1.t.t[i].y+v1.shakey,math.rad(90+v1.t.t[i].r),v1.t.t[i].s*sys.sh,v1.t.t[i].sy*sys.sw+v1.t.t[i].syc,16)
      end
    end
    if v1.t.t[i].d == false and v1.c.chat.msgs <= 40 then
      v1.t.t[i].y = v1.t.t[i].y + v1.t.t[i].sp*sys.s
      if v1.t.t[i].y >= v1.t.t[i].dy then
        v1.t.t[i].rm = true
      end
    elseif v1.t.t[i].d == false and v1.c.chat.msgs <= 40 then
      v1.t.t[i].y = v1.t.t[i].y - v1.t.t[i].sp*sys.s
      if v1.t.t[i].y <= v1.t.t[i].dy then
        v1.t.t[i].rm = true
      end
    end
  end
end
function removeTentacles()
  for i=1,#v1.t.t do
    if v1.t.t[i].rm == true then
      table.remove(v1.t.t, i)
      return
    end
  end
end
