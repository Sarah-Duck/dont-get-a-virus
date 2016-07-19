function drawVirusFight2()
end
function drawPopup(id)
  drawUpBox(v2.pop.p[id].x, v2.pop.p[id].y, v2.pop.p[id].w, v2.pop.p[id].h, 2)
  love.graphics.setColor(255,255,255)
  love.graphics.draw(window.bar, v2.pop.p[id].x+2, v2.pop.p[id].y+2, 0, (v2.pop.p[id].w-6)/643, 1)
  drawXBox(v2.pop.p[id].x+v2.pop.p[id].w-21, v2.pop.p[id].y+4)
  --drawMinBox(v2.pop.p[id].x+v2.pop.p[id].w-39, v2.pop.p[id].y+4)
  love.graphics.setColor(240, 240, 240)
  if v2.pop.p[id].ad == 1 then
    love.graphics.print("FREE PHONE!!!", v2.pop.p[id].x+28, v2.pop.p[id].y+9)
  elseif v2.pop.p[id].ad == 2 then
    love.graphics.print("CURE FOOT FUNCGUS!!", v2.pop.p[id].x+28, v2.pop.p[id].y+9)
  elseif v2.pop.p[id].ad == 3 then
    love.graphics.print("YOU WON!!!", v2.pop.p[id].x+28, v2.pop.p[id].y+9)
  elseif v2.pop.p[id].ad == 4 then
    love.graphics.print("BIG PENIS!!!", v2.pop.p[id].x+28, v2.pop.p[id].y+9)
  elseif v2.pop.p[id].ad == 5 then
    love.graphics.print("SEXY SINGLES!!!", v2.pop.p[id].x+28, v2.pop.p[id].y+9)
  elseif v2.pop.p[id].ad == 6 then
    love.graphics.print("VIRUS ALERT!!!", v2.pop.p[id].x+28, v2.pop.p[id].y+9)
  elseif v2.pop.p[id].ad == 7 then
    love.graphics.print("SHOOT THE TABLET!!", v2.pop.p[id].x+28, v2.pop.p[id].y+9)
  elseif v2.pop.p[id].ad == 8 then
    love.graphics.print("POPUP BLOCKER!!!", v2.pop.p[id].x+28, v2.pop.p[id].y+9)
  elseif v2.pop.p[id].ad == 9 then
    love.graphics.print("A Letter for You.", v2.pop.p[id].x+28, v2.pop.p[id].y+9)
  elseif v2.pop.p[id].ad == 10 then
    love.graphics.print("PC BOOSTER!!!", v2.pop.p[id].x+28, v2.pop.p[id].y+9)
  end
  love.graphics.setColor(256, 256, 256)
  love.graphics.draw(win[2].icon16, v2.pop.p[id].x+6, v2.pop.p[id].y+5)
  drawDownBox(v2.pop.p[id].x+7, v2.pop.p[id].y+30, v2.pop.p[id].w-14, v2.pop.p[id].h-37, 4)
  love.graphics.draw(v2.pop.a[v2.pop.p[id].ad], v2.pop.p[id].x+7, v2.pop.p[id].y+30, 0, (v2.pop.p[id].w-14)/640, (v2.pop.p[id].h-37)/400)
end
function addPopup(rand, x, y, w, h, ad)
  if rand == true then
    table.insert(v2.pop.p, 1, {
      w = math.random(100,800),
      h = math.random(50,500),
      ad = math.random(1,10)
    })
    v2.pop.p[1].x = math.random(0,sys.w-v2.pop.p[1].w)
    v2.pop.p[1].y = math.random(0,sys.h-v2.pop.p[1].h)
  elseif rand == false then
    table.insert(v2.pop.p, 1, {x=x,y=y,w=w,h=h,ad=ad})
  end
end
