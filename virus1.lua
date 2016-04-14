function drawVirusFight1()
  drawDesktop()
  drawStart()
  if v1.introplay == false then
    v1.intro:play()
    v1.introplay = true
  end
  if v1.explodeintro == false then
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
  if v1.timer >= 16 then
    music.tension1:play()
  end
  if v1.c.shine.ct >= 3 then
    if v1.c.load == false then
      v1.c.x = win[2].x+v1.c.monitorspin.x
      v1.c.y = v1.c.monitorspin.y
      v1.c.load = true
    end
    love.graphics.setColor(0,0,0,100)
    playAnimation(v1.c.idle, true, v1.c.x-40, v1.c.y+40, v1.c.r, v1.c.s, 100, 100, 0.5)
    love.graphics.setColor(255,255,255)
    playAnimation(v1.c.idle, true, v1.c.x, v1.c.y, v1.c.r, v1.c.s, 100, 100, 0.5)
    if v1.c.shine.s < -50 then
      drawBubble(v1.c.x+40, v1.c.y-160, 300, 110, v1.c.chat.msg)
      if (sys.mouse.p.x >= v1.c.x+40 and sys.mouse.p.x <= v1.c.x+40+300
      and sys.mouse.p.y >= v1.c.y-160 and sys.mouse.p.y <= v1.c.y-160+110 and
      v1.c.chat.next == false and sys.mouse.drag == false) then
        v1.c.chat.next = true
        v1.c.chat.msgs = v1.c.chat.msgs + 1
        v1.c.chat.char = 0
      end
      if string.len(v1.msgs[v1.c.chat.msgs]) ~= string.len(v1.c.chat.msg) then
        v1.c.chat.char = v1.c.chat.char + v1.c.chat.sp*(60/love.timer.getFPS())
        v1.c.chat.msg = string.sub(v1.msgs[v1.c.chat.msgs], 1, math.floor(v1.c.chat.char))
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
