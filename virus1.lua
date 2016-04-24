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
    love.graphics.setColor(0,0,0,100)
    playAnimation(v1.c.idle, true, v1.c.x+40, v1.c.y+40, v1.c.r, v1.c.s, 100, 100, 0.5)
    love.graphics.setColor(255,255,255)
    love.graphics.draw(v1.c.eye, v1.c.x-32, v1.c.y-50, v1.c.r, v1.c.s*0.9, v1.c.s*1.1)
    if v1.c.chat.msgs < 3 or v1.c.chat.msgs >= 11 or v1.c.chat.msgs == 7 then
      v1.c.eyetx = v1.c.x+7
      v1.c.eyety = v1.c.y-28
    elseif v1.c.chat.msgs >= 3 and v1.c.chat.msgs <= 7 then
      v1.c.eyetx = sys.mouse.x
      v1.c.eyety = sys.mouse.y
    elseif v1.c.chat.msgs > 7 and v1.c.chat.msgs <= 10 then
      v1.c.eyetx = win[4].x+100
      v1.c.eyety = win[4].y+75
    end
    if v1.c.eyetx > v1.c.x+7+v1.c.eyex and v1.c.eyex < 15 then
      v1.c.eyex = v1.c.eyex + 3
    elseif v1.c.eyetx < v1.c.x+7+v1.c.eyex and v1.c.eyex > -15 then
      v1.c.eyex = v1.c.eyex - 3
    end
    if v1.c.eyety > v1.c.y-28+v1.c.eyey and v1.c.eyey < 5 then
      v1.c.eyey = v1.c.eyey + 3
    elseif v1.c.eyety < v1.c.y-28+v1.c.eyey and v1.c.eyey > -10 then
      v1.c.eyey = v1.c.eyey - 3
    end
    love.graphics.draw(v1.c.pupil, v1.c.x+7+v1.c.eyex+math.random(0,0.5), v1.c.y-28+v1.c.eyey+math.random(0,0.5), v1.c.r, v1.c.s*1.2, v1.c.s*1.2, 3, 11)
    playAnimation(v1.c.idle, true, v1.c.x, v1.c.y, v1.c.r, v1.c.s, 100, 100, 0.5)
    if v1.c.chat.msgs == 2 then
      v1.c.xd = sys.w/2
      v1.c.yd = sys.h/2
    elseif v1.c.chat.msgs == 8 then
      v1.c.xd = sys.w/2
      v1.c.yd = 200
    end
    if v1.c.shine.s < -50 and v1.msgs[v1.c.chat.msgs] ~= nil then
      drawBubble(v1.c.x+40, v1.c.y-165, 300, 115, v1.c.chat.msg)
      if (sys.mouse.p.x >= v1.c.x+40 and sys.mouse.p.x <= v1.c.x+40+300
      and sys.mouse.p.y >= v1.c.y-165 and sys.mouse.p.y <= v1.c.y-165+110 and
      v1.c.chat.next == false and sys.mouse.drag == false) then
        v1.c.chat.next = true
        v1.c.chat.msgs = v1.c.chat.msgs + 1
        v1.c.chat.char = 0
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
      end
    elseif v1.c.chat.msgs == 12 then
      if av.gun == 98 then
        v1.c.chat.msgs = 13
      end
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
end
function drawBubble(x,y,w,h,m)
  love.graphics.setColor(255,255,255)
  love.graphics.rectangle("fill", x+20, y, w-40, h)
  love.graphics.rectangle("fill", x, y+20, w, h-40)
  love.graphics.draw(v1.corner, x, y, 0, 2)
  love.graphics.draw(v1.corner, x+w, y, 0, -2, 2)
  love.graphics.draw(v1.corner, x+w, y+h, 0, -2, -2)
  love.graphics.draw(v1.cornerSpike, x, y+h-20, 0, 2)
  love.graphics.setColor(0,0,0)
  love.graphics.setLineWidth(1.5)
  love.graphics.line(x+20, y+1, x+w-20, y+1)
  love.graphics.line(x+30, y+h-1, x+w-20, y+h-1)
  love.graphics.line(x+1, y+20, x+1, y+h-20)
  love.graphics.line(x+w-1, y+20, x+w-1, y+h-20)
  love.graphics.setFont(pixeloperator)
  love.graphics.printf(m,x+15,y+15,w-30)
  love.graphics.setFont(pressstart)
end
