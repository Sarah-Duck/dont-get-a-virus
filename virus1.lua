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
  end
  if v1.timer >= 20 then
    music.tension1:play()
  end
  if v1.c.shine.ct >= 3 then
    if v1.c.load == false then
      v1.c.x = win[2].x+v1.c.monitorspin.x
      v1.c.y = v1.c.monitorspin.y
      v1.c.load = true
    end
    love.graphics.setColor(0,0,0,150)
    playAnimation(v1.c.idle, true, v1.c.x-40, v1.c.y+40, v1.c.r, v1.c.s, 100, 100, 0.5)
    love.graphics.setColor(255,255,255)
    playAnimation(v1.c.idle, true, v1.c.x, v1.c.y, v1.c.r, v1.c.s, 100, 100, 0.5)
  end
  if v1.timer >= 15 then
    love.graphics.setColor(255,255,255)
    if win[2].y+v1.c.slime.y >= v1.c.monitorspin.y then
      playAnimation(v1.c.slime, true, win[2].x+v1.c.slime.x+math.random(1,4), win[2].y+v1.c.slime.y+math.random(1,4), 0, 2.5, 25, 25, 0.5)
      playAnimation(v1.c.monitorspin, true, win[2].x+v1.c.monitorspin.x, v1.c.monitorspin.y, 0, 1, 100, 100, v1.c.monitorspin.sp)
      v1.c.slime.y = v1.c.slime.y - 0.5
      v1.c.monitorspin.y = v1.c.monitorspin.y + 1.5
    end
    if win[2].y+v1.c.slime.y <= v1.c.monitorspin.y+100 and v1.c.shine.s > -70 then
      love.graphics.setColor(255,255,255,v1.c.shine.opa)
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
        v1.c.shine.s1 = v1.c.shine.s1 + 0.2
      elseif v1.c.shine.sm1 == false then
        v1.c.shine.s1 = v1.c.shine.s1 - 0.2
      end
      if v1.c.shine.sm2 == true and v1.c.shine.ct < 3 then
        v1.c.shine.s2 = v1.c.shine.s2 + 0.3
      elseif v1.c.shine.sm2 == false then
        v1.c.shine.s2 = v1.c.shine.s2 - 0.3
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
end
