function drawPicture()
  drawDownBox(8, 31, win[7].w-17, win[7].h-40, 4)
  if picture.img ~= 0 then
    love.graphics.draw(picture.img, 8, 31)
  end
end
function drawVideo()
  drawDownBox(8, 31, win[8].w-16, win[8].h-82, 4)
  love.graphics.setColor(20,20,20)
  love.graphics.rectangle("fill",8,31,win[8].w-16,win[8].h-82)
  drawControls(8+38,win[8].h-34-8,8)
  if vplay.v ~= 0 then
    love.graphics.draw(vplay.v,8,31)
  end
  drawDownBox(10+38+38+38+150,win[8].h-34+5,118,5,2)
  drawUpBox(vplay.volx,vplay.voly,10,25,2)
end
function drawMusic()
  drawDownBox(8,31,win[9].w-17,win[9].h-82,4)
  love.graphics.setColor(20,20,20)
  love.graphics.rectangle("fill",8,31,win[9].w-17,win[9].h-82)
  drawControls(8+38,win[9].h-34-8,9)
  drawDownBox(10+38+38+38,win[9].h-34+5,118,5,2)
  drawUpBox(mplay.volx,mplay.voly,10,25,2)
  love.graphics.setColor(0,256,0)
  love.graphics.setFont(pixeloperators)
  love.graphics.print(mplay.title, 10,82)
  if mplay.p == true then
    for i=1,10 do
      if mplay.bar[i] == nil then
        mplay.bar[i] = {}
        mplay.bar[i].h = 20
        mplay.bar[i].ht = 20
      else
        if mplay.bar[i].h > mplay.bar[i].ht then
          mplay.bar[i].h = mplay.bar[i].h - 1
        elseif mplay.bar[i].h < mplay.bar[i].ht then
          mplay.bar[i].h = mplay.bar[i].h + 1
        elseif mplay.bar[i].h == mplay.bar[i].ht then
          mplay.bar[i].ht = math.random(0,40)
        end
        love.graphics.rectangle("fill",(23*i)-13,33,21,mplay.bar[i].h)
      end
    end
  end
  love.graphics.setFont(pressstart)
end
function drawControls(x,y,id)
  love.graphics.setColor(256,256,256)
  drawUpBox(x,y,32,32,2)
  if id == 9 then
    love.graphics.draw(but.but,x,y)
  elseif id == 8 and vplay.p == true then
    love.graphics.draw(but.pause,x,y)
  elseif id == 8 and vplay.p == false then
    love.graphics.draw(but.play,x,y)
  end
  drawUpBox(x+38,y,32,32,2)
  love.graphics.draw(but.stop, x+38, y)
  drawUpBox(x-38,y,32,32,2)
  love.graphics.draw(but.back, x-38, y)
end
function updateVideo()
  if vplay.p == true and vplay.v ~= 0 then
    vplay.v:play()
    win[8].update = true
  end
  if win[8].ex == true and vplay.v ~= 0 then
    vplay.v:seek(0)
    vplay.v:pause()
    vplay.v = 0
  end
  if mouseClick(win[8].x+8+38,win[8].y+win[8].h-34-8,32,32) == true and vplay.v ~= 0 and vplay.pr == false then
    if vplay.p == true then
      vplay.v:pause()
      vplay.p = false
      win[8].update = true
    elseif vplay.p == false then
      vplay.p = true
      win[8].update = true
      vplay.v:play()
    end
    vplay.pr = true
  elseif mouseClick(win[8].x+8+38-38,win[8].y+win[8].h-34-8,32,32) == true and vplay.v ~= 0 and vplay.pr == false then
    vplay.v:rewind()
    vplay.p = true
    win[8].update = true
    vplay.pr = true
  elseif mouseClick(win[8].x+8+38+38,win[8].y+win[8].h-34-8,32,32) == true and vplay.m ~= 0 and vplay.pr == false then
    vplay.v:seek(0)
    vplay.v:pause()
    vplay.p = false
    win[8].update = true
    vplay.pr = true
  end
  if mouseClick(win[8].x+vplay.volx,win[8].y+vplay.voly,10,25) == true and layer[1] == 8 then
    vplay.drag = true
  end
  if vplay.v ~= 0 then
    local d = vplay.volx - vplay.volxmin
    local v = 0.00806451612903226 * d
    vplay.v:getSource():setVolume(v)
  end
  if vplay.drag == true then
    if vplay.volpx + (sys.mouse.x - sys.mouse.p.x) <= vplay.volxmax
    and vplay.volpx + (sys.mouse.x - sys.mouse.p.x) >= vplay.volxmin then
      vplay.volx = vplay.volpx + (sys.mouse.x - sys.mouse.p.x)
    elseif vplay.volpx + (sys.mouse.x - sys.mouse.p.x) > vplay.volxmax then
      vplay.volx = vplay.volxmax
    elseif mplay.volpx + (sys.mouse.x - sys.mouse.p.x) < vplay.volxmin then
      vplay.volx = vplay.volxmin
    end
    win[8].update = true
  else
    vplay.volpx = vplay.volx
  end
end
function updateMusic()
  if mouseClick(win[9].x+8+38,win[9].y+win[9].h-34-8,32,32) == true and mplay.m ~= 0 and mplay.pr == false then
    if but.but == but.pause then
      mplay.m:pause()
      mplay.p = false
      but.but = but.play
      win[9].update = true
    elseif but.but == but.play then
      mplay.p = true
      but.but = but.pause
      win[9].update = true
    end
    mplay.pr = true
  elseif mouseClick(win[9].x+8+38-38,win[9].y+win[9].h-34-8,32,32) == true and mplay.m ~= 0 and mplay.pr == false then
    mplay.m:rewind()
    mplay.p = true
    but.but = but.pause
    win[9].update = true
    mplay.pr = true
  elseif mouseClick(win[9].x+8+38+38,win[9].y+win[9].h-34-8,32,32) == true and mplay.m ~= 0 and mplay.pr == false then
    mplay.m:stop()
    mplay.p = false
    but.but = but.play
    win[9].update = true
    mplay.pr = true
  end
  if mplay.p == true and mplay.m ~= 0 then
    win[9].update = true
    mplay.m:play()
  end
  if win[9].ex == true and mplay.m ~= 0 then
    mplay.m:stop()
    mplay.m = 0
  end
  if mplay.m ~= 0 then
    local d = mplay.volx - mplay.volxmin
    local v = 0.00806451612903226 * d
    mplay.m:setVolume(v)
  end
  if mouseClick(win[9].x+mplay.volx,win[9].y+mplay.voly,10,25) == true and layer[1] == 9 then
    mplay.drag = true
  end
  if mplay.drag == true then
    if mplay.volpx + (sys.mouse.x - sys.mouse.p.x) <= mplay.volxmax
    and mplay.volpx + (sys.mouse.x - sys.mouse.p.x) >= mplay.volxmin then
      mplay.volx = mplay.volpx + (sys.mouse.x - sys.mouse.p.x)
    elseif mplay.volpx + (sys.mouse.x - sys.mouse.p.x) > mplay.volxmax then
      mplay.volx = mplay.volxmax
    elseif mplay.volpx + (sys.mouse.x - sys.mouse.p.x) < mplay.volxmin then
      mplay.volx = mplay.volxmin
    end
    win[9].update = true
  else
    mplay.volpx = mplay.volx
  end
end
