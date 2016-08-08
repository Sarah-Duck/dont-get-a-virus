function drawVirusFight2()
  drawDesktop()
  drawVirus2()
  drawPopups()
  if start.o == true then
    drawMenu()
  end
  drawStart()
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
    love.graphics.print("CURE FOOT FUNCGUS!!", 28, 9)
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
  notification.sound3:play()
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
  love.graphics.draw(v2.c.idle.hands, v2.c.x, v2.c.y, v2.c.r, v2.c.s, v2.c.s, 125, 125)
end
function drawVirus2Stencil()
  love.graphics.setShader(mask_effect)
  playAnimation(v2.c.idle.mask, true, v2.c.x, v2.c.y, v2.c.r, v2.c.s, 125, 125, 0.5)
  love.graphics.setShader()
end
