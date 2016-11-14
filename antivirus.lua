function drawAntivirus()
  if antivirus.scanning == true then
    drawDownBox(49, 110, 100, 19, 2)
  else
    drawUpBox(49, 110, 100, 19, 2)
  end
  drawDownBox(10, 40, 180, 30, 2)
  love.graphics.setColor(colors.font.dark)
  love.graphics.print("SCAN NOW", 51, 116)
  love.graphics.print(antivirus.status, 10, 77)
  love.graphics.setColor(0,0,120)
  if antivirus.scanning == true then
    drawBlueBox(13, 44, antivirus.prog, 22, 2)
  end
end
function updateAntivirus()
  if (sys.mouse.p.p == true and win[4].hover == true and antivirus.scanning == false
  and sys.mouse.p.x >= win[4].x+49 and sys.mouse.p.x <= win[4].x+49+100
  and sys.mouse.p.y >= win[4].y+110 and sys.mouse.p.y <= win[4].y+110+19 and scene == 1) then
    antivirus.scanning = true
    antivirus.prog = 0
  end
  if antivirus.scanning == true then
    antivirus.prog = antivirus.prog + (math.random(0,0.5,2,10,1,20,0.1,0.2)*sys.s)
    win[4].update = true
    antivirus.status = "Scanning: " .. math.floor(antivirus.prog/174*100) .. "%"
  end
  if antivirus.prog >= 174 then
    antivirus.prog = 174
    antivirus.scanning = false
    if v1.yes == true or v2.start == true then
      antivirus.status = "VIRUS FOUND!"
    else
      antivirus.status = "0 Viruses Found"
    end
  end
end
function drawAntivirusFight()
  love.graphics.setColor(255,255,255)
  orderWindows()
  if antivirus.status ~= "VIRUS FOUND!" or (v1.c.chat.msgs < 12 and scene == 2) or (v2.c.chat.msgs < 21 and scene == 3) then
    love.graphics.draw(win[4].cvs, win[4].x+av.shakex, win[4].y+av.shakey, 0, win[4].s)
  elseif antivirus.status == "VIRUS FOUND!" and v1.c.chat.msgs >= 12 or v2.c.chat.msgs >= 21 then
    if av.transform == false then
      win[4].w = 342
      win[4].x = win[4].x - 138/2
      av.transform = true
    end
    if av.gun == 98 then
      love.graphics.draw(antivirus.gun, win[4].x+138/2+99+av.shakex, win[4].y+5-av.gun+av.shakey, 0, win[4].s, win[4].s, 12)
    elseif av.gun ~= 98 and av.wings == 138/2 then
      love.graphics.draw(antivirus.gun, win[4].x+138/2+99+math.random(-1,1), win[4].y+5-av.gun+math.random(-1,1), 0, win[4].s, win[4].s, 12)
    end
    love.graphics.draw(antivirus.body, win[4].x+138/2+99+av.shakex, win[4].y+5+av.shakey, 0, win[4].s, win[4].s, 80)
    drawDownBox(win[4].x+138/2+79-2+av.shakex, win[4].y+93-4+11+av.shakey, 44, 17, 2)
    love.graphics.setColor(455-(av.health*2.5)*4.55,(av.health*2.5)*2.55,20)
    love.graphics.rectangle("fill", win[4].x+138/2+79-1+av.shakex, win[4].y+93-3+11+av.shakey, av.health*1.05, 15)
    love.graphics.setColor(colors.font.dark)
    love.graphics.setFont(pixeloperators)
    love.graphics.print("HP:" .. av.health, win[4].x+138/2+79+2+av.shakex, win[4].y+93-4+11+av.shakey)
    love.graphics.setFont(pressstart)
    love.graphics.setColor(255,255,255)
    drawDownBox(win[4].x+138/2+79-1+av.shakex, win[4].y+40-1+av.shakey, 42, 42, 2)
    love.graphics.stencil(chargeStencil, "replace", 1)
    love.graphics.setStencilTest("greater", 0)
    love.graphics.draw(antivirus.charge, win[4].x+138/2+79+av.shakex, win[4].y+40+av.shakey)
    love.graphics.setStencilTest()
    if av.wings >= 138/2 then
      av.wings = 138/2
      love.graphics.draw(antivirus.left, win[4].x+138/2-av.wings+av.shakex, win[4].y+av.shakey, 0, win[4].s)
      love.graphics.draw(antivirus.right, win[4].x+138/2+97+av.wings+av.shakex, win[4].y+av.shakey, 0, win[4].s)
    elseif av.wings < 138/2 then
      antivirus.open:play()
      av.wings = av.wings + 0.5*sys.s
      love.graphics.draw(antivirus.left, win[4].x+138/2-av.wings+math.random(-1,1)+av.shakex, win[4].y+math.random(-1,1)+av.shakey, 0, win[4].s)
      love.graphics.draw(antivirus.right, win[4].x+138/2+97+av.wings+math.random(-1,1)+av.shakex, win[4].y+math.random(-1,1)+av.shakey, 0, win[4].s)
    end
    if av.shake > 0 then
      av.shakex = math.random(av.shake,-av.shake)
      av.shakey = math.random(av.shake,-av.shake)
      if av.dead == false then
        av.shake = av.shake - 0.1*sys.s
      else
        av.shake = av.shake - 0.3*sys.s
      end
    elseif av.shake < 0 then
      av.shake = 0
      av.shakex = 0
      av.shakey = 0
    end
    if av.gun == 10 then
      antivirus.opengun:play()
    end
    if av.wings == 138/2 and av.gun < 98 then
      av.gun = av.gun + 1*sys.s
    end
    if av.gun > 98 then
      av.gun = 98
    end
    if av.charge ~= 40 then
      av.fireb = false
    end
    if av.fireb == true and av.charge == 40 and love.keyboard.isDown("space") then
      av.fire = true
      av.fireb = false
      av.charge = 0
      if scene == 2 then
        if v1.c.chat.msgs == 15 or v1.c.chat.msgs == 17 or v1.c.chat.msgs == 19 or v1.c.chat.msgs == 21 then
          v1.c.chat.msgs = v1.c.chat.msgs + 1
          v1.c.chat.char = 0
        end
      end
    end
    if scene == 2 then
      if (v1.c.chat.msgs == 15 or v1.c.chat.msgs == 17 or v1.c.chat.msgs == 19 or v1.c.chat.msgs == 21 or v1.c.chat.msgs == 36 or v1.c.chat.msgs == 40) and av.charge == 40 then
        av.fireb = true
      else
        av.fireb = false
      end
    elseif scene == 3 then
      if (v2.c.chat.msgs == 24 or v2.c.chat.msgs == 30) and av.charge == 40 then
        av.fireb = true
      else
        av.fireb = false
      end
    end
    if av.charge < 40 and av.health > 0 then
      av.charge = av.charge + (math.random(4,12,25,40,5,2,10)*delta)/di
    elseif av.charge > 40 then
      av.charge = 40
    elseif av.health <= 0 and av.charge > 0 then
      av.charge = av.charge - (math.random(4,12,25,40,5,2,10)*delta)*5
    elseif av.health <= 0 and av.charge < 0 then
      av.charge = 0
    end
    if av.health <= 0 and av.dead == false then
      av.dead = true
      antivirus.shutdown:play()
      av.shake = 50
    end
    if av.dead == true then
      av.health = 0
    end
    if av.fire == true then
      addBullet(win[4].x+138/2+99,win[4].y+5-av.gun,math.rad(-90),25,"av")
      if antivirus.laser:isPlaying() == true then
        antivirus.laser:rewind()
      else
        antivirus.laser:play()
      end
      av.fire = false
    end
  end
end
