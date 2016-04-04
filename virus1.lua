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
  if v1.timer >= 17 then
    music.tension1:play()
  end
  if v1.timer >= 35 then
    playAnimation(v1.c.idle, true, win[2].x+v1.c.monitorspin.x, v1.c.monitorspin.y, 0, 1, 100, 100, 0.5)
  end
  if v1.timer >= 15 then
    music.tension1:play()
    if win[2].y+v1.c.slime.y >= v1.c.monitorspin.y then
      love.graphics.stencil(scorchStencil, "replace", 1)
      love.graphics.setStencilTest("lequal", 0)
      playAnimation(v1.c.slime, true, win[2].x+v1.c.slime.x, win[2].y+v1.c.slime.y, 0, 2.5, 25, 25, 0.5)
      playAnimation(v1.c.monitorspin, true, win[2].x+v1.c.monitorspin.x, v1.c.monitorspin.y, 0, 1, 100, 100, 0.5)
      love.graphics.setStencilTest()
      v1.c.slime.y = v1.c.slime.y - 0.75
      v1.c.monitorspin.y = v1.c.monitorspin.y + 1.25
    end
    if win[2].y+v1.c.slime.y <= v1.c.monitorspin.y+120 then
      love.graphics.draw(v1.c.shine.f2, win[2].x+v1.c.monitorspin.x, v1.c.monitorspin.y,
      v1.c.shine.r2, 3+v1.c.shine.s2/10, 3+v1.c.shine.s2/10, 100, 100)
      love.graphics.draw(v1.c.shine.f1, win[2].x+v1.c.monitorspin.x, v1.c.monitorspin.y,
      v1.c.shine.r1, 3+v1.c.shine.s1/10, 3+v1.c.shine.s1/10, 100, 100)
      v1.c.shine.r1 = v1.c.shine.r1 + math.rad(1)
      v1.c.shine.r2 = v1.c.shine.r2 - math.rad(1)
      if v1.c.shine.sm1 == true then
        v1.c.shine.s1 = v1.c.shine.s1 + 0.2
      elseif v1.c.shine.sm1 == false then
        v1.c.shine.s1 = v1.c.shine.s1 - 0.2
      end
      if v1.c.shine.sm2 == true then
        v1.c.shine.s2 = v1.c.shine.s2 + 0.3
      elseif v1.c.shine.sm2 == false then
        v1.c.shine.s2 = v1.c.shine.s2 - 0.3
      end
      if v1.c.shine.s1 >= 5 then
        v1.c.shine.sm1 = false
      elseif v1.c.shine.s1 <= -5 and v1.timer < 35 then
        v1.c.shine.sm1 = true
      end
      if v1.c.shine.s2 >= 0 then
        v1.c.shine.sm2 = false
      elseif v1.c.shine.s2 <= -10 and v1.timer < 35 then
        v1.c.shine.sm2 = true
      end
    end
  end
end
function scorchStencil()
  love.graphics.rectangle("fill", win[2].x+180, win[2].y+295, 400, 500)
end
