function drawVirusFight2()
  drawDesktop()
  drawVirus2()
  drawPopups()
  if v2.popshoty < sys.h+1000 then
    if v2.popshots == false then
      v2.c.fire:play()
      v2.popshots = true
    end
    love.graphics.setColor(256,256,256)
    love.graphics.draw(v2.popshot, v2.popshotx+math.random(-v2.popshotsh,v2.popshotsh),
    v2.popshoty+math.random(-v2.popshotsh,v2.popshotsh), v2.popshotr+math.rad(math.random(-v2.popshotsh,v2.popshotsh)), 1, 1, 300, 200)
    if v2.popshotsh > 0 then
      v2.popshotsh = v2.popshotsh - 0.5*sys.s
    end
    v2.popshoty = v2.popshoty + v2.popshotm*sys.s
    v2.popshotm = v2.popshotm + 0.75*sys.s
    v2.popshotr = v2.popshotr + math.rad(1*sys.s)
    if v2.explodeFrame <= 89 then
      love.graphics.setColor(255,255,255)
      love.graphics.draw(expl.pic, expl.frames[math.floor(v2.explodeFrame)], sys.w/2, sys.h/2, 0, 2.5, 2.5, 320/2,240/2)
      v2.explodeFrame = v2.explodeFrame + 1*sys.s
      v1.explosionSound:play()
    end
  end
  if start.o == true then
    drawMenu()
  end
  drawStart()
  if v2.c.chat.msgs == 1 or v2.c.chat.msgs == 6 then
    v2.c.xd = sys.w/2
    v2.c.yd = sys.h/3
    if v2.c.chat.msgs == 6 then
      v2.c.handp = "fist"
    elseif v2.c.chat.msgs == 1 then
      v2.c.handp = "gunfront"
    end
  elseif v2.c.chat.msgs == 2 then
    v2.c.xd = sys.w/3
    v2.c.yd = sys.h/1.7
    v2.c.handp = "gunup"
  elseif v2.c.chat.msgs == 3 then
    v2.c.xd = sys.w/3
    v2.c.yd = sys.h/3
    v2.c.handp = "idle"
  elseif v2.c.chat.msgs == 4 then
    v2.c.xd = sys.w/1.7
    v2.c.yd = sys.h/1.7
  elseif v2.c.chat.msgs == 5 then
    v2.c.xd = sys.w/2
    v2.c.yd = sys.h/2
  elseif v2.c.chat.msgs == 8 then
    v2.c.xd = sys.w/2
    v2.c.yd = sys.h/2
    v2.c.handp = "gunidle"
    if v2.c.cockgunplay == false then
      v2.c.cockgun:play()
      v2.c.cockgunplay = true
    end
  end
end
function drawPopup(id)
  love.graphics.setCanvas(v2.pop.p[id].cvs)
  drawUpBox(0, 0, v2.pop.p[id].w, v2.pop.p[id].h, 4)
  love.graphics.setColor(255,255,255)
  love.graphics.draw(window.bar, 3, 3, 0, (v2.pop.p[id].w-6)/643, 1)
  drawXBox(v2.pop.p[id].w-22, 5)
  --drawMinBox(v2.pop.p[id].w-40, 5)
  love.graphics.setColor(240, 240, 240)
  if v2.pop.p[id].ad == 1 then
    love.graphics.print("FREE PHONE!!!", 28, 9)
  elseif v2.pop.p[id].ad == 2 then
    love.graphics.print("CURE FOOT FUNGUS!!", 28, 9)
  elseif v2.pop.p[id].ad == 3 then
    love.graphics.print("YOU WON!!!", 28, 9)
  elseif v2.pop.p[id].ad == 4 then
    love.graphics.print("BIG PENIS!!!", 28, 9)
  elseif v2.pop.p[id].ad == 5 then
    love.graphics.print("SEXY SINGLES!!!", 28, 9)
  elseif v2.pop.p[id].ad == 6 then
    love.graphics.print("VIRUS ALERT!!!", 28, 9)
  elseif v2.pop.p[id].ad == 7 then
    love.graphics.print("SHOOT THE TABLET!!", 28, 9)
  elseif v2.pop.p[id].ad == 8 then
    love.graphics.print("POPUP BLOCKER!!!", 28, 9)
  elseif v2.pop.p[id].ad == 9 then
    love.graphics.print("A Letter for You.", 28, 9)
  elseif v2.pop.p[id].ad == 10 then
    love.graphics.print("PC BOOSTER!!!", 28, 9)
  end
  love.graphics.setColor(256, 256, 256)
  love.graphics.draw(win[2].icon16, 6, 5)
  drawDownBox(8, 31, v2.pop.p[id].w-16, v2.pop.p[id].h-39, 4)
  love.graphics.draw(v2.pop.a[v2.pop.p[id].ad], 8, 31, 0, (v2.pop.p[id].w-16)/640, (v2.pop.p[id].h-39)/400)
  love.graphics.setCanvas()
end
function addPopup(rand, x, y, w, h, ad, dup, m)
  if notification.sound3:isPlaying() == true then
    notification.sound3:rewind()
  else
    notification.sound3:play()
  end
  if rand == true then
    table.insert(v2.pop.p, 1, {
      w = math.random(300,800),
      ad = math.random(1,10),
      d = false,
      s = 0.2,
      exit = false,
      add = false,
      dup = true
    })
    v2.pop.p[1].h = v2.pop.p[1].w/math.random(1.4,1.6,1.8,2)
    v2.pop.p[1].x = math.random(0,sys.w-v2.pop.p[1].w)
    v2.pop.p[1].y = math.random(0,sys.h-v2.pop.p[1].h)
    v2.pop.p[1].cvs = love.graphics.newCanvas(v2.pop.p[1].w, v2.pop.p[1].h)
    if v2.pop.p[1].d == false then
      drawPopup(1)
      v2.pop.p[1].d = true
    end
  elseif rand == false then
    table.insert(v2.pop.p, 1, {x=x,y=y,w=w,h=h,ad=ad,d=false,s=0.2,exit=false,add=false,dup=dup,m=m})
    v2.pop.p[1].cvs = love.graphics.newCanvas(v2.pop.p[1].w, v2.pop.p[1].h)
    if v2.pop.p[1].d == false then
      drawPopup(1)
      v2.pop.p[1].d = true
    end
  end
end
function drawPopups()
  v2.pop.hov = 0
  for i=1,#v2.pop.p do
    love.graphics.setColor(255,255,255)
    love.graphics.draw(v2.pop.p[i].cvs, v2.pop.p[i].x,v2.pop.p[i].y,0,v2.pop.p[i].s)
  end
  for i=#v2.pop.p, 1, -1 do
    if v2.pop.hov == 0 and sys.mouse.x >= v2.pop.p[i].x and sys.mouse.x <= v2.pop.p[i].x+v2.pop.p[i].w
    and sys.mouse.y >= v2.pop.p[i].y and sys.mouse.y <= v2.pop.p[i].y+v2.pop.p[i].h then
      v2.pop.hov = i
    end
  end
  for i=1,#v2.pop.p do
    if v2.pop.p[i].s < 1 and v2.pop.p[i].exit == false then
      v2.pop.p[i].s = v2.pop.p[i].s + (0.075/v2.pop.p[i].s)*sys.s
      if v2.pop.p[i].s > 1 then
        v2.pop.p[i].s = 1
      end
    elseif v2.pop.p[i].s > 0 and v2.pop.p[i].exit == true then
      v2.pop.p[i].s = v2.pop.p[i].s - (0.4*v2.pop.p[i].s)*sys.s
      if v2.pop.p[i].s < 0.1 then
        v2.pop.p[i].s = 0
      end
    end
    if mouseClick(v2.pop.p[i].x+v2.pop.p[i].w-22, v2.pop.p[i].y+5, 16, 16) == true and v2.pop.p[i].exit == false and v2.pop.hov == i then
      v2.pop.p[i].exit = true
      if v2.pop.p[i].m == true then
        music.tension2:play()
        scene = 3
      end
    elseif mouseClick(v2.pop.p[i].x+8, v2.pop.p[i].y+31, v2.pop.p[i].w-16, v2.pop.p[i].h-39) == true
    and v2.pop.p[i].exit == false and v2.pop.hov == i and v2.pop.p[i].dup == true then
      v2.pop.p[i].exit = true
      if #v2.pop.p <= 6 then
        v2.pop.add = true
      end
    end
    if v2.pop.p[i].exit == true and v2.pop.p[i].s <= 0 then
      table.remove(v2.pop.p, i)
      collectgarbage("collect")
      break
    end
  end
  if v2.pop.add == true and #v2.pop.p <= 6 then
    addPopup(true)
    addPopup(true)
    v2.pop.add = false
  end
end
function drawVirus2()
  love.graphics.setColor(255,255,255)
  playAnimation(v2.c.idle, true, v2.c.x, v2.c.y, v2.c.r, v2.c.s, 125, 125, 0.5)
  love.graphics.stencil(drawVirus2Stencil, "replace", 1)
  love.graphics.setStencilTest("greater", 0)
  love.graphics.draw(v2.c.pupil, v2.c.x-26+math.random(-0.7,0.7),v2.c.y-57+math.random(-0.7,0.7),v2.c.r,v2.c.s)
  love.graphics.draw(v2.c.pupil, v2.c.x+21+math.random(-0.7,0.7),v2.c.y-57+math.random(-0.7,0.7),v2.c.r,v2.c.s)
  love.graphics.setStencilTest()
  v2.c.sp = math.sqrt(math.abs(v2.c.xd - v2.c.x)*2 + math.abs(v2.c.yd - v2.c.y)*2)/5
  v2.c.angle = math.atan2((v2.c.yd - v2.c.y), (v2.c.xd - v2.c.x))
  v2.c.spx = v2.c.sp * math.cos(v2.c.angle)
  v2.c.spy = v2.c.sp * math.sin(v2.c.angle)
  if v2.c.x > v2.c.xd then
    if v2.c.x + v2.c.spx <= v2.c.xd then
      v2.c.x = v2.c.xd
    else
      v2.c.x = v2.c.x + v2.c.spx
    end
  elseif v2.c.x < v2.c.xd then
    if v2.c.x + v2.c.spx >= v2.c.xd then
      v2.c.x = v2.c.xd
    else
      v2.c.x = v2.c.x + v2.c.spx
    end
  end
  if v2.c.y > v2.c.yd then
    if v2.c.y + v2.c.spy <= v2.c.yd then
      v2.c.y = v2.c.yd
    else
      v2.c.y = v2.c.y + v2.c.spy
    end
  elseif v2.c.y < v2.c.yd then
    if v2.c.y + v2.c.spy >= v2.c.yd then
      v2.c.y = v2.c.yd
    else
      v2.c.y = v2.c.y + v2.c.spy
    end
  end
  handOpa("idle",v2.c.handsOp)
  handOpa("fist",v2.c.fistOp)
  handOpa("gunup",v2.c.gunupOp)
  handOpa("gunfront",v2.c.gunfrontOp)
  handOpa("gunidle",v2.c.gunidleOp)
  if v2.c.handsOp ~= 0 then
    love.graphics.setColor(256,256,256,v2.c.handsOp)
    love.graphics.draw(v2.c.idle.hands, v2.c.x, v2.c.y, v2.c.r, v2.c.s, v2.c.s, 125, 125)
  end
  if v2.c.fistOp ~= 0 then
    love.graphics.setColor(256,256,256,v2.c.fistOp)
    love.graphics.draw(v2.c.idle.fist, v2.c.x+math.random(-0.2,0.2), v2.c.y+math.random(-0.2,0.2), v2.c.r, v2.c.s, v2.c.s, 125, 125)
  end
  if v2.c.gunidleOp ~= 0 then
    love.graphics.setColor(256,256,256,v2.c.gunidleOp)
    love.graphics.draw(v2.c.idle.gunidle, v2.c.x, v2.c.y, v2.c.r, v2.c.s, v2.c.s, 125, 125)
  end
  if v2.c.gunfrontOp ~= 0 then
    love.graphics.setColor(256,256,256,v2.c.gunfrontOp)
    love.graphics.draw(v2.c.gunfront, v2.c.x, v2.c.y, v2.c.r, v2.c.s, v2.c.s, 125, 125)
  end
  if v2.c.gunupOp ~= 0 then
    love.graphics.setColor(256,256,256,v2.c.gunupOp)
    love.graphics.draw(v2.c.gunup, v2.c.x, v2.c.y, v2.c.r, v2.c.s, v2.c.s, 125, 125)
  end
  if v2.c.chat.time >= 2 and v2.msgs[v2.c.chat.msgs] ~= nil then
    drawBubble(v2.c.x+50, v2.c.y-160, 300, 115, v2.c.chat.msg)
    if mouseClick(v2.c.x+50,v2.c.y-160,300,110) == true and v2.c.chat.next == false then
      v2.c.chat.next = true
      v2.c.chat.msgs = v2.c.chat.msgs + 1
      v2.c.chat.char = 0
      v2.c.chat.msg = ""
    end
    if v2.msgs[v2.c.chat.msgs] ~= nil then
      if string.len(v2.msgs[v2.c.chat.msgs]) ~= string.len(v2.c.chat.msg) then
        v2.c.chat.char = v2.c.chat.char + v2.c.chat.sp*(60/love.timer.getFPS())
        v2.c.chat.msg = string.sub(v2.msgs[v2.c.chat.msgs], 1, math.floor(v2.c.chat.char))
      end
    end
  else
    v2.c.chat.time = v2.c.chat.time + delta
  end
end
function drawVirus2Stencil()
  love.graphics.setShader(mask_effect)
  playAnimation(v2.c.idle.mask, true, v2.c.x, v2.c.y, v2.c.r, v2.c.s, 125, 125, 0.5)
  love.graphics.setShader()
end
function handOpa(hand,opa)
  if v2.c.handp == hand then
    if opa < 256 then
      if hand == "idle" then
        v2.c.handsOp = v2.c.handsOp + 16
      elseif hand == "fist" then
        v2.c.fistOp = v2.c.fistOp + 16
      elseif hand == "gunfront" then
        v2.c.gunfrontOp = v2.c.gunfrontOp + 16
      elseif hand == "gunidle" then
        v2.c.gunidleOp = v2.c.gunidleOp + 16
      elseif hand == "gunup" then
        v2.c.gunupOp = v2.c.gunupOp + 16
      end
    end
  else
    if opa > 0 then
      if hand == "idle" then
        v2.c.handsOp = v2.c.handsOp - 16
      elseif hand == "fist" then
        v2.c.fistOp = v2.c.fistOp - 16
      elseif hand == "gunfront" then
        v2.c.gunfrontOp = v2.c.gunfrontOp - 16
      elseif hand == "gunidle" then
        v2.c.gunidleOp = v2.c.gunidleOp - 16
      elseif hand == "gunup" then
        v2.c.gunupOp = v2.c.gunupOp - 16
      end
    end
  end
end
