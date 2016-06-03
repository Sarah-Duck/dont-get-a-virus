function drawPicture()
  drawDownBox(8, 31, win[7].w-17, win[7].h-40, 4)
  if picture.img ~= 0 then
    love.graphics.draw(picture.img, 8, 31)
  end
end
function drawVideo()
end
function drawMusic()
  drawDownBox(8,31,win[9].w-17,win[9].h-82,4)
  love.graphics.setColor(20,20,20)
  love.graphics.rectangle("fill",8,31,win[9].w-17,win[9].h-82)
  drawControls(8+38,win[9].h-34-8)
  drawDownBox(10+38+38+38,win[9].h-34+5,118,5,2)
  drawUpBox(mplay.volx,mplay.voly,10,25,2)
end
function drawControls(x,y)
  love.graphics.setColor(256,256,256)
  drawUpBox(x,y,32,32,2)
  love.graphics.draw(but.play, x, y)
  drawUpBox(x+38,y,32,32,2)
  love.graphics.draw(but.stop, x+38, y)
  drawUpBox(x-38,y,32,32,2)
  love.graphics.draw(but.back, x-38, y)
end
function updateMusic()
  if mplay.p == true and mplay.m ~= 0 then
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
