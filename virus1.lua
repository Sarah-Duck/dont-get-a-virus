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
  if v1.timer >= 15 then
    music.tension1:play()
    if win[2].y+v1.c.slime.y >= v1.c.monitorspin.y then
      love.graphics.stencil(scorchStencil, "replace", 1)
      love.graphics.setStencilTest("lequal", 0)
      playAnimation(v1.c.slime, true, win[2].x+v1.c.slime.x, win[2].y+v1.c.slime.y, 0, 2.5, 25, 25, 0.5)
      playAnimation(v1.c.monitorspin, true, win[2].x+v1.c.monitorspin.x, v1.c.monitorspin.y, 0, 1, 100, 100, 0.5)
      love.graphics.setStencilTest()
      v1.c.slime.y = v1.c.slime.y - 1
      v1.c.monitorspin.y = v1.c.monitorspin.y + 1
    end
  end
end
function scorchStencil()
  love.graphics.rectangle("fill", win[2].x+180, win[2].y+295, 400, 500)
end
