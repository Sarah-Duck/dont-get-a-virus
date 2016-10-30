function drawVirusFight1()
  drawDesktop()
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
    v1.shakemin = v1.shakemin - (0.1*sys.s)
    v1.shakemax = v1.shakemax + (0.1*sys.s)
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
    win[4].y = sys.h/2+50
    layer.sentToFront = 4
    antivirus.scanning = true
    antivirus.prog = 0
    expl.frame = 1
  end
  if v1.c.chat.msgs > 7 then
    drawAntivirusFight()
  end
  if v1.timer >= 16 and v1.c.chat.msgs < 36 then
    music.tension1:play()
  end
  if v1.c.shine.ct >= 3 then
    if v1.c.chat.msgs >= 41 and v1.c.chat.msgs < 50 then
      v1.shake = (v1.c.chat.msgs-40)*3
      v1.shakex = math.random(v1.shake,-v1.shake)
      v1.shakey = math.random(v1.shake,-v1.shake)
      v1.rumbleLoop:setPitch(v1.shake/6)
    end
    if v1.shake > 0 and v1.c.chat.msgs < 41 then
      v1.shakex = math.random(v1.shake,-v1.shake)
      v1.shakey = math.random(v1.shake,-v1.shake)
      v1.shake = v1.shake - 0.3*sys.s
    elseif v1.shake < 0 and v1.c.chat.msgs < 41 then
      v1.shake = 0
      v1.shakex = 0
      v1.shakey = 0
    end
    if v1.c.load == false then
      v1.c.x = win[2].x+v1.c.monitorspin.x
      v1.c.y = v1.c.monitorspin.y
      v1.c.xd = v1.c.x
      v1.c.yd = v1.c.y
      v1.c.load = true
    end
    if v1.c.chat.msgs > 30 and v1.c.chat.msgs ~= 37 and v1.c.chat.msgs ~= 38 and v1.c.chat.msgs < 41 then
      for i=1,4 do
        if v1.specialAbi == false or v1.c.health <= 20 then
          v1.turret[i].rt = math.atan2((win[4].y+win[4].h/2 - v1.turret[i].y), (win[4].x+win[4].w/2 - v1.turret[i].x))-math.rad(90)
        elseif v1.specialAbi == true and v1.turretTimer < 30 then
          v1.turret[i].rt = 0
        end
        if v1.turret[i].r > v1.turret[i].rt then
          if v1.turret[i].r - math.rad((2*sys.s)*di) < v1.turret[i].rt then
            v1.turret[i].r = v1.turret[i].rt
          else
            v1.turret[i].r = v1.turret[i].r - math.rad((2*sys.s)*di)
          end
        elseif v1.turret[i].r < v1.turret[i].rt then
          if v1.turret[i].r + math.rad((2*sys.s)*di) > v1.turret[i].rt then
            v1.turret[i].r = v1.turret[i].rt
          else
            v1.turret[i].r = v1.turret[i].r + math.rad((2*sys.s)*di)
          end
        end
      end
    end
    if v1.c.chat.msgs > 28 and expl.frame <= 10 then
      v1.turret[2].x = v1.c.x-120+v1.shakex
      v1.turret[2].y = v1.c.y+200-100+v1.shakey
      v1.turret[3].x = v1.c.x+120+v1.shakex
      v1.turret[3].y = v1.c.y+200-100+v1.shakey
      love.graphics.draw(v1.turret1, v1.turret[2].x, v1.turret[2].y, v1.turret[2].r, v1.c.s, v1.c.s, 42, 42)
      love.graphics.draw(v1.turret1, v1.turret[3].x, v1.turret[3].y, v1.turret[3].r, v1.c.s, v1.c.s, 42, 42)
      love.graphics.draw(v1.shipBack, v1.c.x-615/2+v1.shakex, v1.c.y-100+20+v1.shakey, 0, v1.c.s)
    end
    if v1.c.chat.msgs < 29 then
      love.graphics.setColor(0,0,0,100)
      playAnimation(v1.c.idle, true, v1.c.x+40, v1.c.y+40, v1.c.r, v1.c.s, 100, 100, 0.5)
    end
    love.graphics.setColor(255,255,255)
    love.graphics.draw(v1.c.eye, v1.c.x-32+v1.shakex, v1.c.y-50+v1.shakey, v1.c.r, v1.c.s*0.9, v1.c.s*1.1)
    if v1.c.chat.msgs < 3 or v1.c.chat.msgs == 26 or v1.c.chat.msgs == 7 or v1.c.chat.msgs == 11 or v1.c.chat.msgs == 15 then
      v1.c.eyetx = v1.c.x+7
      v1.c.eyety = v1.c.y-28
    elseif av.bullets[1] ~= nil then
      v1.c.eyetx = av.bullets[1].x
      v1.c.eyety = av.bullets[1].y
    elseif v1.c.chat.msgs > 7 and v1.c.chat.msgs <= 25 then
      v1.c.eyetx = win[4].x+win[4].w/2
      v1.c.eyety = win[4].y+win[4].h/2
    else
      v1.c.eyetx = sys.mouse.x
      v1.c.eyety = sys.mouse.y
    end
    for i=1,3 do
      if v1.c.eyetx > v1.c.x+7+v1.c.eyex and v1.c.eyex < 15 then
        v1.c.eyex = v1.c.eyex + 1*sys.s
      elseif v1.c.eyetx < v1.c.x+7+v1.c.eyex and v1.c.eyex > -15 then
        v1.c.eyex = v1.c.eyex - 1*sys.s
      end
    end
    if v1.c.eyety > v1.c.y-28+v1.c.eyey and v1.c.eyey < 5 then
      v1.c.eyey = v1.c.eyey + 3*sys.s
    elseif v1.c.eyety < v1.c.y-28+v1.c.eyey and v1.c.eyey > -10 then
      v1.c.eyey = v1.c.eyey - 3*sys.s
    end
    v1.lid.bTimer = v1.lid.bTimer - delta
    if v1.lid.bTimer <= 0 then
      v1.lid.b = true
    end
    if v1.lid.b == true then
      v1.lid.lowyd = 0
      v1.lid.upyd = 0
    end
    if v1.lid.upy == 0 and v1.lid.lowy == 0 then
      v1.lid.lowyd = 25
      v1.lid.upyd = -25
      v1.lid.b = false
      v1.lid.bTimer = math.random(4,8)
    end
    if v1.lid.lowy > v1.lid.lowyd then
      if v1.lid.lowy - 3*sys.s < v1.lid.lowyd then
        v1.lid.lowy = v1.lid.lowyd
      else
        v1.lid.lowy = v1.lid.lowy - 3*sys.s
      end
    elseif v1.lid.lowy < v1.lid.lowyd then
      if v1.lid.lowy + 3*sys.s > v1.lid.lowyd then
        v1.lid.lowy = v1.lid.lowyd
      else
        v1.lid.lowy = v1.lid.lowy + 3*sys.s
      end
    end
    if v1.lid.upy > v1.lid.upyd then
      if v1.lid.upy - 3*sys.s < v1.lid.upyd then
        v1.lid.upy = v1.lid.upyd
      else
        v1.lid.upy = v1.lid.upy - 3*sys.s
      end
    elseif v1.lid.upy < v1.lid.upyd then
      if v1.lid.upy + 3*sys.s > v1.lid.upyd then
        v1.lid.upy = v1.lid.upyd
      else
        v1.lid.upy = v1.lid.upy + 3*sys.s
      end
    end
    love.graphics.draw(v1.c.pupil, v1.c.x+7+v1.c.eyex+math.random(0,0.5)+v1.shakex, v1.c.y-28+v1.c.eyey+math.random(0,0.5)+v1.shakey, v1.c.r, v1.c.s*1.2, v1.c.s*1.2, 3, 11)
    if v1.lid.upy ~= -25 then
      love.graphics.draw(v1.lidup, v1.c.x-43+v1.shakex, v1.c.y-58+v1.lid.upy+v1.shakey, v1.c.r, v1.c.s*1.1)
    end
    if v1.lid.lowy ~= 25 then
      love.graphics.draw(v1.lidlow, v1.c.x-43+v1.shakex, v1.c.y-58+v1.lid.lowy+v1.shakey, v1.c.r, v1.c.s*1.1)
    end
    playAnimation(v1.c.idle, true, v1.c.x+v1.shakex, v1.c.y+v1.shakey, v1.c.r, v1.c.s, 100, 100, 0.5)
    if v1.c.chat.msgs > 28 and expl.frame <= 10 then
      v1.turret[1].x = v1.c.x-615/2-10+v1.shakex
      v1.turret[1].y = v1.c.y+95-100+20+v1.shakey
      v1.turret[4].x = v1.c.x+615/2+10+v1.shakex
      v1.turret[4].y = v1.c.y+95-100+20+v1.shakey
      love.graphics.draw(v1.shipFront, v1.c.x-615/2+v1.shakex, v1.c.y-100+20+v1.shakey, 0, v1.c.s)
      love.graphics.draw(v1.turret2, v1.turret[1].x, v1.turret[1].y, v1.turret[1].r, v1.c.s, v1.c.s, 59/2, 40)
      love.graphics.draw(v1.turret2, v1.turret[4].x, v1.turret[4].y, v1.turret[4].r, v1.c.s, v1.c.s, 59/2, 40)
    elseif v1.c.chat.msgs >= 36 and v1.c.chat.msgs <= 38 and expl.frame > 10 then
      love.graphics.draw(v1.turret2, v1.turret[1].x, v1.turret[1].y, v1.turret[1].r, v1.c.s, v1.c.s, 59/2, 40)
    elseif v1.c.chat.msgs >= 39 then
      love.graphics.draw(v1.turret2Held, v1.turret[1].x+v1.shakex, v1.turret[1].y+v1.shakey, v1.turret[1].r, v1.c.s, v1.c.s, 59/2+14, 40)
      v1.turret[1].x = v1.c.x-45
      v1.turret[1].y = v1.c.y+20
    end
    if expl.frame <= 89 and v1.c.health < 25 then
      love.graphics.setColor(255,255,255)
      love.graphics.draw(expl.pic, expl.frames[math.floor(expl.frame)], v1.c.x-615/2-800, v1.c.y-100+20-700, 0, 7, 7)
      expl.frame = expl.frame + (1*sys.s)
      v1.explosionSound:play()
    end
    if v1.c.chat.msgs == 2 then
      v1.c.xd = sys.w/2
      v1.c.yd = sys.h/2
    elseif v1.c.chat.msgs == 8 or v1.c.chat.msgs == 41 or v1.c.chat.msgs == 39 or v1.c.chat.msgs == 50 then
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
      v1.c.yd = 140
      v1.c.xd = sys.w/2
    elseif v1.c.chat.msgs == 37 then
      v1.c.xd = sys.w/2
      v1.c.yd = 160
    elseif v1.c.chat.msgs == 38 then
      v1.c.xd = v1.turret[1].x+45
      v1.c.yd = v1.turret[1].y-20
    end
    if v1.c.shine.s < -50 and v1.msgs[v1.c.chat.msgs] ~= nil then
      drawBubble(v1.c.x+40, v1.c.y-135, 300, 115, v1.c.chat.msg)
      if mouseClick(v1.c.x+40,v1.c.y-135,300,110) == true and
      v1.c.chat.next == false and v1.c.chat.msgs ~= 15 and
      v1.c.chat.msgs ~= 17 and v1.c.chat.msgs ~= 19 and v1.c.chat.msgs ~= 21 then
        v1.c.chat.next = true
        if v1.c.chat.msgs == 23 then
          v1.c.chat.msgs = 26
          virus1Pissed = true
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
          if math.floor(v1.c.chat.char) ~= math.floor(v1.prevChar) then
            v1.voice:setPitch(math.random(8,12)/10)
            v1.voice:setVolume(1)
            if v1.voice:isPlaying() == true then
              v1.voice:rewind()
            else
              v1.voice:play()
            end
            v1.prevChar = math.floor(v1.c.chat.char)
          end
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
    elseif v1.c.chat.msgs == 29 and v1.c.y == 140 then
      v1.c.chat.msgs = 30
      v1.c.chat.char = 0
      v1.c.chat.msg = ""
    elseif v1.c.health <= 20 and expl.frame >= 89 and v1.c.chat.msgs == 36 then
      v1.c.chat.msgs = 37
      v1.c.chat.char = 0
      v1.c.chat.msg = ""
    elseif v1.c.chat.msgs == 38 and v1.c.x == v1.turret[1].x+45 then
      v1.c.chat.msgs = 39
      v1.c.chat.char = 0
      v1.c.chat.msg = ""
    elseif v1.c.chat.msgs == 40 and v1.c.health <= 0 then
      music.battle1:stop()
      v1.shine:stop()
      v1.rumbleLoop:play()
      v1.c.chat.msgs = 41
      v1.c.chat.char = 0
      v1.c.chat.msg = ""
    end
    if v1.c.chat.msgs == 36 or v1.c.chat.msgs == 40 then
      v1.fightTimer = v1.fightTimer + delta
      if v1.fightMinute == 0 and v1.fightTimer > 59 then
        v1.c.chat.msgs = 50
      end
      if v1.fightTimer > 59 then
        v1.fightMinute = v1.fightMinute - 1
        v1.fightTimer = 0
      end
      if v1.c.health > 20 then
        v1.turretTimer = v1.turretTimer + delta
        v1.turretTimer2 = v1.turretTimer2 + delta
      else
        v1.turretTimer = 0
      end
      music.tension1:stop()
      music.battle1:play()
      for i=1,4 do
        if v1.specialAbi == true and v1.turretTimer2 < v1.specialAbiTime+1 then
          v1.turret[i].tl = 1.5
        end
        if v1.turret[i].t > v1.turret[i].tl and v1.c.health > 20 then
          v1.bulletSpeed = ((6*(0.75+(v1.spm/4)))*(sys.h/1080))*di
          if v1.specialAbi == true then
            v1.bulletSpeed = v1.bulletSpeed/3
          end
          local x = math.cos(v1.turret[i].r+math.rad(90))*(v1.turret[i].x+148-v1.turret[i].x)
          -math.sin(v1.turret[i].r+math.rad(90))*(v1.turret[i].y-v1.turret[i].y)+v1.turret[i].x
          local y = math.sin(v1.turret[i].r+math.rad(90))*(v1.turret[i].x+148-v1.turret[i].x)
          +math.cos(v1.turret[i].r+math.rad(90))*(v1.turret[i].y-v1.turret[i].y)+v1.turret[i].y
          addBullet(x,y,v1.turret[i].r+math.rad(90),v1.bulletSpeed,"v1",i)
          if v1.laserSound:isPlaying() == true then
            v1.laserSound:rewind()
          else
            v1.laserSound:play()
          end
          v1.turret[i].t = 0
          if v1.specialAbi == false then
            v1.turret[i].tl = (((math.random(2,5)/v1.spm)*2)*(1080/sys.h))/di
          else
            v1.turret[i].tl = 3
          end
        elseif v1.c.chat.msgs == 40 and v1.turret[i].t > v1.turret[i].tl and i == 1 then
          local x = math.cos(v1.turret[i].r+math.rad(90))*(v1.turret[i].x+148-v1.turret[i].x)
          -math.sin(v1.turret[i].r+math.rad(90))*(v1.turret[i].y-v1.turret[i].y)+v1.turret[i].x
          local y = math.sin(v1.turret[i].r+math.rad(90))*(v1.turret[i].x+148-v1.turret[i].x)
          +math.cos(v1.turret[i].r+math.rad(90))*(v1.turret[i].y-v1.turret[i].y)+v1.turret[i].y
          addBullet(x,y,v1.turret[i].r+math.rad(90),((6*(0.75+(v1.spm/4)))*(sys.h/1080))*di,"v1",math.random(1,5))
          if v1.laserSound:isPlaying() == true then
            v1.laserSound:rewind()
          else
            v1.laserSound:play()
          end
          v1.turret[i].t = 0
          if v1.specialAbi == false then
            v1.turret[i].tl = (math.random(0.2,1,1.5)*(1080/sys.h))/di
          else
            v1.turret[i].tl = 2
          end
        elseif v1.turret[i].t < v1.turret[i].tl and v1.turretTimer < 30 then
          v1.turret[i].t = v1.turret[i].t+delta
        end
      end
      if v1.c.x == v1.c.xd and v1.turretTimer < 30 then
        if v1.left == true then
          v1.left = false
          if v1.c.health > 70 or v1.specialAbi == true then
            v1.c.xd = sys.w-320
          else
            v1.c.xd = math.random(sys.w-260, sys.w/2+1)
          end
        else
          v1.left = true
          if v1.c.health > 70 or v1.specialAbi == true then
            v1.c.xd = 320
          else
            v1.c.xd = math.random(260, sys.w/2-1)
          end
        end
      end
      if v1.turretTimer2 >= v1.specialAbiTime and v1.turretTimer2 <= v1.specialAbiTime+4 and v1.turretTimer < 30 then
        v1.specialAbi = true
      else
        v1.specialAbi = false
      end
      if v1.turretTimer2 > v1.specialAbiTime+4 then
        v1.specialAbiTime = v1.specialAbiTime + math.random(20,70)
      end
      if v1.c.y == v1.c.yd and v1.c.health < 55 and v1.turretTimer < 30 then
        v1.c.yd = math.random(80,sys.h/2-(120*(1080/sys.h)))
      elseif v1.turretTimer < 30 and v1.c.health > 50 then
        v1.c.yd = 120
      end
      if v1.turretTimer >= 30 and v1.c.health > 20 then
        v1.c.xd = win[4].x+win[4].w/2
        v1.c.yd = win[4].y-400
        if v1.turretTimer >= 31 and v1.turretAbi == 0 then
          for i=1,4 do
            local x = math.cos(v1.turret[i].r+math.rad(90))*(v1.turret[i].x+148-v1.turret[i].x)
            -math.sin(v1.turret[i].r+math.rad(90))*(v1.turret[i].y-v1.turret[i].y)+v1.turret[i].x
            local y = math.sin(v1.turret[i].r+math.rad(90))*(v1.turret[i].x+148-v1.turret[i].x)
            +math.cos(v1.turret[i].r+math.rad(90))*(v1.turret[i].y-v1.turret[i].y)+v1.turret[i].y
            addBullet(x,y,v1.turret[i].r+math.rad(90),20*di,"v1",2)
          end
          if v1.laserSound:isPlaying() == true then
            v1.laserSound:rewind()
          else
            v1.laserSound:play()
          end
            v1.turretAbi = 1
        end
        if v1.turretTimer >= 31.5 and v1.turretAbi == 1 then
          for i=1,4 do
            local x = math.cos(v1.turret[i].r+math.rad(90))*(v1.turret[i].x+148-v1.turret[i].x)
            -math.sin(v1.turret[i].r+math.rad(90))*(v1.turret[i].y-v1.turret[i].y)+v1.turret[i].x
            local y = math.sin(v1.turret[i].r+math.rad(90))*(v1.turret[i].x+148-v1.turret[i].x)
            +math.cos(v1.turret[i].r+math.rad(90))*(v1.turret[i].y-v1.turret[i].y)+v1.turret[i].y
            addBullet(x,y,v1.turret[i].r+math.rad(90),20*di,"v1",v1.abis)
          end
          if v1.abis == 5 then
            v1.abis = 1
          elseif v1.abis == 1 then
            v1.abis = 5
          end
          if v1.laserSound:isPlaying() == true then
            v1.laserSound:rewind()
          else
            v1.laserSound:play()
          end
          v1.turretAbi = 2
        end
        if v1.turretAbi == 2 and v1.turretTimer >= 33 then
          v1.turretTimer = 0
          v1.turretAbi = 0
        end
      end
    end
    v1.c.sp = math.sqrt(math.abs(v1.c.xd - v1.c.x)*2 + math.abs(v1.c.yd - v1.c.y)*2)/5
    if v1.c.chat.msgs == 8 then
      v1.c.sp = v1.c.sp*2
    end
    v1.c.sp = v1.c.sp*v1.spm
    if v1.c.health < 25 then
      v1.c.sp = v1.c.sp*0.25
    end
    v1.c.sp = v1.c.sp*sys.s
    if v1.specialAbi == true then
      v1.c.sp = v1.c.sp*2
    end
    if v1.c.chat.msgs == 36 or v1.c.chat.msgs == 40 then
      v1.c.sp = v1.c.sp*di
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
  if v1.timer >= 16 and v1.c.chat.msgs < 2 then
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
      v1.c.shine.r1 = v1.c.shine.r1 + (math.rad(1)*sys.s)
      v1.c.shine.r2 = v1.c.shine.r2 - (math.rad(1)*sys.s)
      if v1.c.monitorspin.sp ~= 1 then
        v1.c.monitorspin.sp = v1.c.monitorspin.sp + 0.1*sys.s
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
        v1.c.shine.s = v1.c.shine.s + 0.2*sys.s
      elseif v1.c.shine.ct >= 3 and v1.c.shine.s > -80 then
        v1.c.shine.s = v1.c.shine.s - 0.5*sys.s
        v1.c.shine.opa = v1.c.shine.opa - 5*sys.s
      end
    end
  end
  if start.o == true and sys.mouse.p.p == true and sys.mouse.p.x > 255 or sys.mouse.p.y < sys.h-380 then
    start.o = false
  end
  if start.o == true then
    drawMenu()
  end
  drawBullets()
  drawStart()
  if v1.c.chat.msgs == 47 or v1.c.chat.msgs == 53 then
    if v1.c.chat.msgs == 47 then
      v1.complete = true
    end
    love.graphics.setColor(255,255,255)
    love.graphics.draw(expl.pic, expl.frames[math.floor(v1.explodeEndFrame)], v1.c.x, v1.c.y, 0, 20, 20, 320/2,240/2)
    v1.explodeEndFrame = v1.explodeEndFrame + 1*sys.s
    v1.explosionSound:play()
    v1.rumbleLoop:stop()
    if v1.explodeEndFrame >= 20 then
      v1.yes = false
      if v1.c.chat.msgs == 47 then
        win[4].w = 200
        antivirus.status = "Virus Defeated"
        win[4].update = true
        scene = 1
        time = 0
        av.transform = false
      elseif v1.c.chat.msgs == 53 then
        virus1Lose = virus1Lose + 1
        scene = 666
      end
    end
  end
end
function addBullet(x,y,a,s,t,id)
  if t == "av" then
    table.insert(av.bullets, 1, {x=x,y=y,a=a,s=s*sys.s,spx=0,spy=0,rm=false})
  end
  if t == "v1" then
    table.insert(v1.bullets, 1, {x=x,y=y,a=a,s=s*sys.s,spx=0,spy=0,rm=false,id=id})
  end
  if t == "v2" then
    table.insert(v2.bullets, 1, {x=x,y=y,a=a,s=s*sys.s,spx=0,spy=0,rm=false,id=id})
  end
end
function drawBullets()
  for i=1,#v1.bullets do
    if v1.bullets[i] ~= nil then
      v1.bullets[i].spx = v1.bullets[i].s * math.cos(v1.bullets[i].a)
      v1.bullets[i].spy = v1.bullets[i].s * math.sin(v1.bullets[i].a)
      v1.bullets[i].x = v1.bullets[i].x + v1.bullets[i].spx
      v1.bullets[i].y = v1.bullets[i].y + v1.bullets[i].spy
      if v1.bullets[i].id == 2 or v1.bullets[i].id == 3 then
        love.graphics.draw(v1.bulletRed, v1.bullets[i].x, v1.bullets[i].y, v1.bullets[i].a, 1.5, 1.5, 23/2, 7)
      elseif v1.bullets[i].id == 1 or v1.bullets[i].id == 4 then
        love.graphics.draw(v1.bullet, v1.bullets[i].x, v1.bullets[i].y, v1.bullets[i].a, 1.5, 1.5, 23/2, 7)
      elseif v1.bullets[i].id == 5 then
        love.graphics.draw(v1.bulletYellow, v1.bullets[i].x, v1.bullets[i].y, v1.bullets[i].a, 1.5, 1.5, 23/2, 7)
      end
      if v1.bullets[i].x < 0 or v1.bullets[i].x > sys.w or v1.bullets[i].y < 0 or v1.bullets[i].y > sys.h then
        v1.bullets[i].rm = true
      end
      if (v1.bullets[i].x >= win[4].x and v1.bullets[i].x <= win[4].x+win[4].w
      and v1.bullets[i].y >= win[4].y and v1.bullets[i].y <= win[4].y+win[4].h) then
        v1.bullets[i].rm = true
        if v1.bullets[i].id == 1 or v1.bullets[i].id == 4 then
          if av.charge - 10 < 0 then
            av.charge = 0
          else
            av.charge = av.charge - 10
          end
          av.shake = 4
        elseif v1.bullets[i].id == 2 or v1.bullets[i].id == 3 then
          sys.mouse.drag = false
          win[4].hover = false
          av.shake = 4
        elseif v1.bullets[i].id == 5 then
          sys.mouse.drag = false
          win[4].hover = false
          win[4].crazy = true
          av.shake = 4
        end
        if antivirus.hit:isPlaying() == true then
          antivirus.hit:rewind()
        else
          antivirus.hit:play()
        end
      end
      if v1.bullets[i].rm == true then
        table.remove(v1.bullets, i)
      end
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
        if v1.c.chat.msgs >= 15 and v1.c.chat.msgs <= 22 then
          v1.c.chat.msgs = 25
          v1.c.chat.char = 0
          v1.c.chat.msg = ""
        end
        if v1.c.chat.msgs == 40 then
          v1.c.health = v1.c.health - 5
          v1.spm = v1.spm + 0.20*(sys.h/1080)
        end
        v1.shake = 10
        av.bullets[i].rm = true
        if antivirus.hit:isPlaying() == true then
          antivirus.hit:rewind()
        else
          antivirus.hit:play()
        end
      end
      if av.bullets[i].x >= v1.c.x-615/2 and av.bullets[i].x <= v1.c.x-615/2+615 and av.bullets[i].y >= v1.c.y-100+20
      and av.bullets[i].y <= v1.c.y-100+20+200 and v1.c.chat.msgs > 35 and v1.c.health > 20 then
        v1.c.health = v1.c.health - 5
        v1.shake = 10
        v1.spm = v1.spm + 0.25*(sys.h/1080)
        av.bullets[i].rm = true
        if antivirus.hit:isPlaying() == true then
          antivirus.hit:rewind()
        else
          antivirus.hit:play()
        end
      end
    end
    if v2.start == true then
      if av.bullets[i].x >= v2.c.x-110 and av.bullets[i].x <= v2.c.x+110 and av.bullets[i].y >= v2.c.y-110 and av.bullets[i].y <= v2.c.y+110 then
        v2.c.health = v2.c.health - 5
        v2.spm = v2.spm + 0.20*(sys.h/1080)
        v2.shake = 10
        av.bullets[i].rm = true
        if antivirus.hit:isPlaying() == true then
          antivirus.hit:rewind()
        else
          antivirus.hit:play()
        end
      end
    end
    if av.bullets[i].x < 0 or av.bullets[i].x > sys.w or av.bullets[i].y < 0 or av.bullets[i].y > sys.h then
      av.bullets[i].rm = true
      if v1.c.chat.msgs >= 15 and v1.c.chat.msgs <= 22 and virus1Pissed == false then
        v1.c.chat.msgs = v1.c.chat.msgs + 1
        v1.c.chat.msg = ""
        v1.c.chat.char = 0
      elseif v1.c.chat.msgs >= 15 and v1.c.chat.msgs <= 22 and virus1Pissed == true then
        v1.c.chat.msgs = 23
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
function drawVirus1StartThing()
  love.graphics.setColor(255,255,255)
  if win[2].y+v1.c.slime.y >= v1.c.monitorspin.y then
    playAnimation(v1.c.slime, true, win[2].x+v1.c.slime.x+math.random(1,4), win[2].y+v1.c.slime.y+math.random(1,4), 0, 2.5, 25, 25, 0.5)
    playAnimation(v1.c.monitorspin, true, win[2].x+v1.c.monitorspin.x, v1.c.monitorspin.y, 0, 1, 100, 100, v1.c.monitorspin.sp)
    v1.c.slime.y = v1.c.slime.y - 0.5*sys.s
    v1.c.monitorspin.y = v1.c.monitorspin.y + 1.5*sys.s
  end
  if v1.timer < 20 then
    love.graphics.setColor(255,255,255)
    love.graphics.draw(v1.scorchMask, win[2].x-300, win[2].y-100)
  end
end
