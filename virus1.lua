function drawVirusFight1()
  drawDesktop()
  drawStart()
  if virus1.introplay == false then
    virus1.intro:play()
    virus1.introplay = true
  end
  if virus1.explodeintro == false then
    love.graphics.setColor(255,255,255)
    love.graphics.draw(win[2].cvs, win[2].x+math.random(virus1.shakemin,virus1.shakemax),
    win[2].y+math.random(virus1.shakemin,virus1.shakemax), 0, 1, 1, 0, 0,
    math.rad(math.random(virus1.shakemin/10,virus1.shakemax/10)),
    math.rad(math.random(virus1.shakemin/10,virus1.shakemax/10)))
    virus1.shakemin = virus1.shakemin - 0.1
    virus1.shakemax = virus1.shakemax + 0.1
  end
  if virus1.explodeintrotimer >= 7.7 then
    virus1.explodeintro = true
  end
  if virus1.timer >= 15 then
    music.tension1:play()
  end
end
