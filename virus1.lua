function drawVirusFight1()
  drawDesktop()
  drawStart()
  if v1.introplay == false then
    v1.intro:play()
    v1.introplay = true
  end
  if v1.explodeintro == false then
    sys.mouse.drag = false
    love.graphics.setColor(255,255,255)
    love.graphics.draw(win[2].cvs, win[2].x+math.random(v1.shakemin,v1.shakemax),
    win[2].y+math.random(v1.shakemin,v1.shakemax), 0, 1, 1, 0, 0,
    math.rad(math.random(v1.shakemin/10,v1.shakemax/10)),
    math.rad(math.random(v1.shakemin/10,v1.shakemax/10)))
    v1.shakemin = v1.shakemin - 0.1
    v1.shakemax = v1.shakemax + 0.1
  end
  if v1.explodeintrotimer >= 7.7 then
    v1.explodeintro = true
    win[2].s = 0
    win[2].ex = true
    closeWindow(2)
    setWindow(2)
    setPanel(2)
  end
  if v1.c.chat.msgs == 6 then
    win[4].ex = false
    win[4].s = 0.2
    win[4].oldlayer = win[4].layer
    win[4].x = sys.w/2-100+7
    win[4].y = sys.h/2-75
    layer.sentToFront = 4
    antivirus.scanning = true
    antivirus.prog = 0
  end
  if v1.c.chat.msgs > 7 then
    orderWindows()
    if antivirus.status ~= "VIRUS FOUND!" or v1.c.chat.msgs < 12 then
      love.graphics.draw(win[4].cvs, win[4].x, win[4].y, 0, win[4].s)
    elseif antivirus.status == "VIRUS FOUND!" and v1.c.chat.msgs >= 12 then
      if av.transform == false then
        win[4].w = 342
        win[4].x = win[4].x - 138/2
        av.transform = true
      end
      if av.gun == 98 then
        love.graphics.draw(antivirus.gun, win[4].x+138/2+99, win[4].y+5-av.gun, 0, win[4].s, win[4].s, 12)
      elseif av.gun ~= 98 and av.wings == 138/2 then
        love.graphics.draw(antivirus.gun, win[4].x+138/2+99+math.random(-1,1), win[4].y+5-av.gun+math.random(-1,1), 0, win[4].s, win[4].s, 12)
      end
      love.graphics.draw(antivirus.body, win[4].x+138/2+99, win[4].y+5, 0, win[4].s, win[4].s, 80)
      if av.fireb == true then
        drawUpBox(win[4].x+138/2+71, win[4].y+93, 56, 19, 2)
      else
        drawDownBox(win[4].x+138/2+71, win[4].y+93, 56, 19, 2)
      end
      love.graphics.setColor(colors.font.dark)
      love.graphics.print("FIRE", win[4].x+138/2+76, win[4].y+99)
      love.graphics.setColor(255,255,255)
      drawDownBox(win[4].x+138/2+79-1, win[4].y+40-1, 42, 42, 2)
      love.graphics.stencil(chargeStencil, "replace", 1)
      love.graphics.setStencilTest("greater", 0)
      love.graphics.draw(antivirus.charge, win[4].x+138/2+79, win[4].y+40)
      love.graphics.setStencilTest()
      if av.wings == 138/2 then
        love.graphics.draw(antivirus.left, win[4].x+138/2-av.wings, win[4].y, 0, win[4].s)
        love.graphics.draw(antivirus.right, win[4].x+138/2+97+av.wings, win[4].y, 0, win[4].s)
      elseif av.wings ~= 138/2 then
        antivirus.open:play()
        av.wings = av.wings + 0.5
        love.graphics.draw(antivirus.left, win[4].x+138/2-av.wings+math.random(-1,1), win[4].y+math.random(-1,1), 0, win[4].s)
        love.graphics.draw(antivirus.right, win[4].x+138/2+97+av.wings+math.random(-1,1), win[4].y+math.random(-1,1), 0, win[4].s)
      end
      if av.gun == 10 then
        antivirus.opengun:play()
      end
      if av.wings == 138/2 and av.gun ~= 98 then
        av.gun = av.gun + 1
      end
      if av.charge ~= 40 then
        av.fireb = false
      end
      if (sys.mouse.p.x >= win[4].x+138/2+71 and sys.mouse.p.x <= (win[4].x+138/2+71)+56 and av.fireb == true and av.charge == 40
      and sys.mouse.p.y >= win[4].y+93 and sys.mouse.p.y <= (win[4].y+93)+19 and sys.mouse.drag == false and sys.mouse.p.p == true) then
        av.fire = true
        av.fireb = false
        av.charge = 0
        if v1.c.chat.msgs == 15 or v1.c.chat.msgs == 17 or v1.c.chat.msgs == 19 or v1.c.chat.msgs == 21 then
          v1.c.chat.msgs = v1.c.chat.msgs + 1
          v1.c.chat.char = 0
        end
      end
      if (v1.c.chat.msgs == 15 or v1.c.chat.msgs == 17 or v1.c.chat.msgs == 19 or v1.c.chat.msgs == 21) and av.charge == 40 then
        av.fireb = true
      end
      if av.charge < 40 then
        av.charge = av.charge + math.random(1,10,25,40,5,2,8)*delta
      elseif av.charge > 40 then
        av.charge = 40
      end
      if av.fire == true then
        addBullet(win[4].x+138/2+99,win[4].y+5-av.gun,math.rad(-90),25,"av")
        antivirus.laser:play()
        av.fire = false
      end
    end
  end
  if v1.timer >= 16 then
    music.tension1:play()
  end
  if v1.c.shine.ct >= 3 then
    if v1.c.load == false then
      v1.c.x = win[2].x+v1.c.monitorspin.x
      v1.c.y = v1.c.monitorspin.y
      v1.c.xd = v1.c.x
      v1.c.yd = v1.c.y
      v1.c.load = true
    end
    if v1.c.chat.msgs > 30 then
      for i=1,4 do
        v1.turret[i].rt = math.atan2((win[4].y+win[4].h/2 - v1.turret[i].y), (win[4].x+win[4].w/2 - v1.turret[i].x))-math.rad(90)
        if v1.turret[i].r > v1.turret[i].rt then
          if v1.turret[i].r - math.rad(2) < v1.turret[i].rt then
            v1.turret[i].r = v1.turret[i].rt
          else
            v1.turret[i].r = v1.turret[i].r - math.rad(2)
          end
        elseif v1.turret[i].r < v1.turret[i].rt then
          if v1.turret[i].r + math.rad(2) > v1.turret[i].rt then
            v1.turret[i].r = v1.turret[i].rt
          else
            v1.turret[i].r = v1.turret[i].r + math.rad(2)
          end
        end
      end
    end
    if v1.c.chat.msgs > 28 then
      v1.turret[2].x = v1.c.x-120
      v1.turret[2].y = v1.c.y+200-100
      v1.turret[3].x = v1.c.x+120
      v1.turret[3].y = v1.c.y+200-100
      love.graphics.draw(v1.turret1, v1.turret[2].x, v1.turret[2].y, v1.turret[2].r, v1.c.s, v1.c.s, 42, 42)
      love.graphics.draw(v1.turret1, v1.turret[3].x, v1.turret[3].y, v1.turret[3].r, v1.c.s, v1.c.s, 42, 42)
      love.graphics.draw(v1.shipBack, v1.c.x-615/2, v1.c.y-100+20, 0, v1.c.s)
    end
    if v1.c.chat.msgs < 29 then
      love.graphics.setColor(0,0,0,100)
      playAnimation(v1.c.idle, true, v1.c.x+40, v1.c.y+40, v1.c.r, v1.c.s, 100, 100, 0.5)
    end
    love.graphics.setColor(255,255,255)
    love.graphics.draw(v1.c.eye, v1.c.x-32, v1.c.y-50, v1.c.r, v1.c.s*0.9, v1.c.s*1.1)
    if v1.c.chat.msgs < 3 or v1.c.chat.msgs == 26 or v1.c.chat.msgs == 7 or v1.c.chat.msgs == 11 or v1.c.chat.msgs == 15 then
      v1.c.eyetx = v1.c.x+7
      v1.c.eyety = v1.c.y-28
    elseif v1.c.chat.msgs >= 3 and v1.c.chat.msgs <= 7 then
      v1.c.eyetx = sys.mouse.x
      v1.c.eyety = sys.mouse.y
    elseif v1.c.chat.msgs > 7 and v1.c.chat.msgs <= 25 then
      v1.c.eyetx = win[4].x+win[4].w/2
      v1.c.eyety = win[4].y+win[4].h/2
    end
    for i=1,3 do
      if v1.c.eyetx > v1.c.x+7+v1.c.eyex and v1.c.eyex < 15 then
        v1.c.eyex = v1.c.eyex + 1
      elseif v1.c.eyetx < v1.c.x+7+v1.c.eyex and v1.c.eyex > -15 then
        v1.c.eyex = v1.c.eyex - 1
      end
    end
    if v1.c.eyety > v1.c.y-28+v1.c.eyey and v1.c.eyey < 5 then
      v1.c.eyey = v1.c.eyey + 3
    elseif v1.c.eyety < v1.c.y-28+v1.c.eyey and v1.c.eyey > -10 then
      v1.c.eyey = v1.c.eyey - 3
    end
    love.graphics.draw(v1.c.pupil, v1.c.x+7+v1.c.eyex+math.random(0,0.5), v1.c.y-28+v1.c.eyey+math.random(0,0.5), v1.c.r, v1.c.s*1.2, v1.c.s*1.2, 3, 11)
    playAnimation(v1.c.idle, true, v1.c.x, v1.c.y, v1.c.r, v1.c.s, 100, 100, 0.5)
    if v1.c.chat.msgs > 28 then
      v1.turret[1].x = v1.c.x-615/2-10
      v1.turret[1].y = v1.c.y+95-100+20
      v1.turret[4].x = v1.c.x+615/2+10
      v1.turret[4].y = v1.c.y+95-100+20
      love.graphics.draw(v1.shipFront, v1.c.x-615/2, v1.c.y-100+20, 0, v1.c.s)
      love.graphics.draw(v1.turret2, v1.turret[1].x, v1.turret[1].y, v1.turret[1].r, v1.c.s, v1.c.s, 59/2, 40)
      love.graphics.draw(v1.turret2, v1.turret[4].x, v1.turret[4].y, v1.turret[4].r, v1.c.s, v1.c.s, 59/2, 40)
    end
    if v1.c.chat.msgs == 2 then
      v1.c.xd = sys.w/2
      v1.c.yd = sys.h/2
    elseif v1.c.chat.msgs == 8 then
      v1.c.xd = sys.w/2
      v1.c.yd = 200
    elseif v1.c.chat.msgs == 25 then
      v1.c.xd = v1.c.xd
      v1.c.yd = 180
    elseif v1.c.chat.msgs == 26 then
      v1.c.xd = sys.w/2
      v1.c.yd = 250
    elseif v1.c.chat.msgs == 19 or v1.c.chat.msgs == 21 then
      v1.c.yd = 200
      if win[4].x+win[4].w/2 >= 100 and win[4].x+win[4].w/2 <= sys.w-350 then
        v1.c.xd = win[4].x+win[4].w/2
      end
    elseif v1.c.chat.msgs == 28 then
      v1.c.yd = -500
      v1.c.xd = sys.w/2
    elseif v1.c.chat.msgs == 29 then
      v1.c.yd = 180
      v1.c.xd = sys.w/2
    end
    if v1.c.shine.s < -50 and v1.msgs[v1.c.chat.msgs] ~= nil then
      drawBubble(v1.c.x+40, v1.c.y-165, 300, 115, v1.c.chat.msg)
      if (sys.mouse.p.x >= v1.c.x+40 and sys.mouse.p.x <= v1.c.x+40+300
      and sys.mouse.p.y >= v1.c.y-165 and sys.mouse.p.y <= v1.c.y-165+110 and
      v1.c.chat.next == false and sys.mouse.drag == false and v1.c.chat.msgs ~= 15
      and v1.c.chat.msgs ~= 17 and v1.c.chat.msgs ~= 19 and v1.c.chat.msgs ~= 21) then
        v1.c.chat.next = true
        if v1.c.chat.msgs == 23 then
          v1.c.chat.msgs = 26
        else
          v1.c.chat.msgs = v1.c.chat.msgs + 1
        end
        v1.c.chat.char = 0
        v1.c.chat.msg = ""
      end
      if v1.msgs[v1.c.chat.msgs] ~= nil then
        if string.len(v1.msgs[v1.c.chat.msgs]) ~= string.len(v1.c.chat.msg) then
          v1.c.chat.char = v1.c.chat.char + v1.c.chat.sp*(60/love.timer.getFPS())
          v1.c.chat.msg = string.sub(v1.msgs[v1.c.chat.msgs], 1, math.floor(v1.c.chat.char))
        end
      end
    end
    if v1.c.chat.msgs == 8 then
      v1.c.chat.time = v1.c.chat.time + delta
      if v1.c.chat.time > 4 then
        v1.c.chat.msgs = 9
        v1.c.chat.char = 0
        v1.c.chat.msg = ""
      end
    elseif v1.c.chat.msgs == 12 then
      if av.gun == 98 then
        v1.c.chat.msgs = 13
        v1.c.chat.char = 0
        v1.c.chat.msg = ""
      end
    elseif v1.c.chat.msgs == 28 and v1.c.y == -500 then
      v1.c.chat.msgs = 29
      v1.c.chat.char = 0
      v1.c.chat.msg = ""
    elseif v1.c.chat.msgs == 29 and v1.c.y == 180 then
      v1.c.chat.msgs = 30
      v1.c.chat.char = 0
      v1.c.chat.msg = ""
    end
    if v1.c.chat.msgs > 32 and v1.bulletTimer > 1 then
      local x = math.cos(v1.turret[1].r+math.rad(90))*(v1.turret[1].x+148-v1.turret[1].x)
      -math.sin(v1.turret[1].r+math.rad(90))*(v1.turret[1].y-v1.turret[1].y)+v1.turret[1].x
      local y = math.sin(v1.turret[1].r+math.rad(90))*(v1.turret[1].x+148-v1.turret[1].x)
      +math.cos(v1.turret[1].r+math.rad(90))*(v1.turret[1].y-v1.turret[1].y)+v1.turret[1].y
      addBullet(x,y,v1.turret[1].r+math.rad(90),25,"v1")
      v1.bulletTimer = 0
    elseif v1.c.chat.msgs > 32 and v1.bulletTimer < 2 then
      v1.bulletTimer = v1.bulletTimer + delta
    end
    v1.c.sp = math.sqrt(math.abs(v1.c.xd - v1.c.x)*2 + math.abs(v1.c.yd - v1.c.y)*2)/5
    if v1.c.chat.msgs == 8 then
      v1.c.sp = v1.c.sp*2
    end
    v1.c.angle = math.atan2((v1.c.yd - v1.c.y), (v1.c.xd - v1.c.x))
    v1.c.spx = v1.c.sp * math.cos(v1.c.angle)
    v1.c.spy = v1.c.sp * math.sin(v1.c.angle)
    if v1.c.x > v1.c.xd then
      if v1.c.x + v1.c.spx <= v1.c.xd then
        v1.c.x = v1.c.xd
      else
        v1.c.x = v1.c.x + v1.c.spx
      end
    elseif v1.c.x < v1.c.xd then
      if v1.c.x + v1.c.spx >= v1.c.xd then
        v1.c.x = v1.c.xd
      else
        v1.c.x = v1.c.x + v1.c.spx
      end
    end
    if v1.c.y > v1.c.yd then
      if v1.c.y + v1.c.spy <= v1.c.yd then
        v1.c.y = v1.c.yd
      else
        v1.c.y = v1.c.y + v1.c.spy
      end
    elseif v1.c.y < v1.c.yd then
      if v1.c.y + v1.c.spy >= v1.c.yd then
        v1.c.y = v1.c.yd
      else
        v1.c.y = v1.c.y + v1.c.spy
      end
    end
  end
  if v1.timer >= 16 then
    love.graphics.setColor(255,255,255)
    if win[2].y+v1.c.slime.y >= v1.c.monitorspin.y then
      playAnimation(v1.c.slime, true, win[2].x+v1.c.slime.x+math.random(1,4), win[2].y+v1.c.slime.y+math.random(1,4), 0, 2.5, 25, 25, 0.5)
      playAnimation(v1.c.monitorspin, true, win[2].x+v1.c.monitorspin.x, v1.c.monitorspin.y, 0, 1, 100, 100, v1.c.monitorspin.sp)
      v1.c.slime.y = v1.c.slime.y - 0.5
      v1.c.monitorspin.y = v1.c.monitorspin.y + 1.5
    end
    if win[2].y+v1.c.slime.y <= v1.c.monitorspin.y+100 and v1.c.shine.s > -70 then
      love.graphics.setColor(255,255,255,v1.c.shine.opa)
      if v1.shineplay == false then
        v1.shine:play()
        v1.shineplay = true
      end
      love.graphics.draw(v1.c.shine.f2, win[2].x+v1.c.monitorspin.x, v1.c.monitorspin.y,
      v1.c.shine.r2, (3+v1.c.shine.s2/10)+v1.c.shine.s/10, (3+v1.c.shine.s2/10)+v1.c.shine.s/10, 100, 100)
      love.graphics.draw(v1.c.shine.f1, win[2].x+v1.c.monitorspin.x, v1.c.monitorspin.y,
      v1.c.shine.r1, (3+v1.c.shine.s1/10)+v1.c.shine.s/10, (3+v1.c.shine.s1/10)+v1.c.shine.s/10, 100, 100)
      v1.c.shine.r1 = v1.c.shine.r1 + math.rad(1)
      v1.c.shine.r2 = v1.c.shine.r2 - math.rad(1)
      if v1.c.monitorspin.sp ~= 1 then
        v1.c.monitorspin.sp = v1.c.monitorspin.sp + 0.1
        if v1.c.monitorspin.sp >= 1 then
          v1.c.monitorspin.sp = 1
        end
      end
      if v1.c.shine.sm1 == true and v1.c.shine.ct < 3 then
        v1.c.shine.s1 = v1.c.shine.s1 + 0.3*(60/love.timer.getFPS())
      elseif v1.c.shine.sm1 == false then
        v1.c.shine.s1 = v1.c.shine.s1 - 0.3*(60/love.timer.getFPS())
      end
      if v1.c.shine.sm2 == true and v1.c.shine.ct < 3 then
        v1.c.shine.s2 = v1.c.shine.s2 + 0.2*(60/love.timer.getFPS())
      elseif v1.c.shine.sm2 == false then
        v1.c.shine.s2 = v1.c.shine.s2 - 0.2*(60/love.timer.getFPS())
      end
      if v1.c.shine.s1 >= 7 or v1.c.shine.ct >= 3 then
        v1.c.shine.sm1 = false
        v1.c.shine.ct = v1.c.shine.ct + 1
      elseif v1.c.shine.s1 <= -5 and v1.c.shine.ct < 3 then
        v1.c.shine.sm1 = true
      end
      if v1.c.shine.s2 >= 5 or v1.c.shine.ct >= 3 then
        v1.c.shine.sm2 = false
      elseif v1.c.shine.s2 <= -5 and v1.c.shine.ct < 3 then
        v1.c.shine.sm2 = true
      end
      if v1.c.shine.ct <= 3 and v1.c.shine.s < 4 then
        v1.c.shine.s = v1.c.shine.s + 0.2
      elseif v1.c.shine.ct >= 3 and v1.c.shine.s > -80 then
        v1.c.shine.s = v1.c.shine.s - 0.5
        v1.c.shine.opa = v1.c.shine.opa - 5
      end
    end
    if v1.timer < 20 then
      love.graphics.setColor(255,255,255)
      love.graphics.draw(v1.scorchMask, win[2].x-300, win[2].y-100)
    end
  end
  if start.o == true and sys.mouse.p.p == true and sys.mouse.p.x > 255 or sys.mouse.p.y < sys.h-380 then
    start.o = false
  end
  if start.o == true then
    drawMenu()
  end
  drawBullets()
end
function addBullet(x,y,a,s,t)
  if t == "av" then
    table.insert(av.bullets, 1, {x=x,y=y,a=a,s=s,spx=0,spy=0,rm=false})
  end
  if t == "v1" then
    table.insert(v1.bullets, 1, {x=x,y=y,a=a,s=s,spx=0,spy=0,rm=false})
  end
end
function drawBullets()
  for i=1,#v1.bullets do
    v1.bullets[i].spx = v1.bullets[i].s * math.cos(v1.bullets[i].a)
    v1.bullets[i].spy = v1.bullets[i].s * math.sin(v1.bullets[i].a)
    v1.bullets[i].x = v1.bullets[i].x + v1.bullets[i].spx
    v1.bullets[i].y = v1.bullets[i].y + v1.bullets[i].spy
    love.graphics.draw(v1.bullet, v1.bullets[i].x, v1.bullets[i].y, v1.bullets[i].a, 1.5, 1.5, 23/2, 7)
    if v1.bullets[i].x < 0 or v1.bullets[i].x > sys.w or v1.bullets[i].y < 0 or v1.bullets[i].y > sys.h then
      v1.bullets[i].rm = true
    end
    if v1.bullets[i].rm == true then
      table.remove(v1.bullets, i)
    end
  end
  for i=1,#av.bullets do
    av.bullets[i].spx = av.bullets[i].s * math.cos(av.bullets[i].a)
    av.bullets[i].spy = av.bullets[i].s * math.sin(av.bullets[i].a)
    av.bullets[i].x = av.bullets[i].x + av.bullets[i].spx
    av.bullets[i].y = av.bullets[i].y + av.bullets[i].spy
    love.graphics.draw(antivirus.bullet, av.bullets[i].x, av.bullets[i].y, av.bullets[i].a, 1.5, 1.5, 23/2, 7)
    if v1.yes == true then
      if av.bullets[i].x >= v1.c.x-80 and av.bullets[i].x <= v1.c.x+80 and av.bullets[i].y >= v1.c.y-80 and av.bullets[i].y <= v1.c.y+70 then
        if v1.c.chat.msgs >= 15 or v1.c.chat.msgs <= 21 then
          v1.c.chat.msgs = 25
          v1.c.chat.char = 0
          v1.c.chat.msg = ""
        end
        av.bullets[i].rm = true
        antivirus.hit:play()
      end
    end
    if av.bullets[i].x < 0 or av.bullets[i].x > sys.w or av.bullets[i].y < 0 or av.bullets[i].y > sys.h then
      av.bullets[i].rm = true
      if v1.c.chat.msgs >= 15 or v1.c.chat.msgs <= 21 then
        v1.c.chat.msgs = v1.c.chat.msgs + 1
        v1.c.chat.msg = ""
        v1.c.chat.char = 0
      end
    end
    if av.bullets[i].rm == true then
      table.remove(av.bullets, i)
    end
  end
end
function chargeStencil()
   love.graphics.rectangle("fill", win[4].x+138/2+79, win[4].y+40+40, 40, -av.charge)
end
