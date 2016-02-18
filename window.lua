function drawWindow(id)
  love.graphics.setCanvas(win[id].cvs)
  love.graphics.setColor(192, 192, 192)
  love.graphics.rectangle("fill", 0, 0, win[id].w, win[id].h) --Box
  love.graphics.setLineWidth(4)
  love.graphics.setColor(220, 220, 220)
  love.graphics.line(0, win[id].y+win[id].h, 0, 0, 0+win[id].w, 0) --BoxLight
  love.graphics.setColor(150,150,150)
  love.graphics.line(0, 0+win[id].h, 0+win[id].w, 0+win[id].h, 0+win[id].w, 0) --BoxShadow
  love.graphics.setColor(0,0,120)
  love.graphics.rectangle("fill", 0+3, 0+3, win[id].w-7, 20) --Blue Bar
  love.graphics.setColor(192, 192, 192)
  love.graphics.rectangle("fill", 0+win[id].w-22, 0+5, 16, 16) --X Button
  love.graphics.setColor(70,70,70)
  love.graphics.print("X", 0+win[id].w-19, 0+10)
  love.graphics.setColor(192, 192, 192)
  love.graphics.rectangle("fill", 0+win[id].w-40, 0+5, 16, 16) --Minimize Button
  love.graphics.setColor(70,70,70)
  love.graphics.setLineWidth(3)
  love.graphics.line(0+win[id].w-37, 0+13, 0+win[id].w-37+10, 0+13)
  love.graphics.setColor(220, 220, 220)
  love.graphics.print(win[id].title, 0+6, 0+9) --Title
  love.graphics.setCanvas()
  if(sys.mouse.x >= win[id].x and sys.mouse.x <= win[id].x+win[id].w
  and sys.mouse.y >= win[id].y and sys.mouse.y <= win[id].y+win[id].h) then
    win[id].hov = true
  else
    win[id].hov = false
  end
  if layer[1] ~= 0 then
    if win[id].layer ~= 1 and win[layer[1]].hov == true then
      win[id].hover = false
    elseif win[id].layer ~= 1 and win[id].layer ~= 2 and layer[1] ~= 0 and layer[2] ~= 0 then
      if win[layer[1]].hov == true or win[layer[2]].hov == true then
        win[id].hover = false
      else
        win[id].hover = true
      end
    elseif win[id].hov == false then
      win[id].hover = false
    else
      win[id].hover = true
    end
  end
  if win[id].hov == false then
    win[id].hover = false
  end
  if(sys.mouse.p.x >= win[id].x and sys.mouse.p.x <= win[id].x+win[id].w
  and sys.mouse.p.y >= win[id].y and sys.mouse.p.y <= win[id].y+win[id].h) then
  else
    win[id].hover = false
  end
  if win[id].hover == true and sys.mouse.p.p == true and sys.mouse.drag == false then
    win[id].oldlayer = win[id].layer
    win[id].layer = 1
  end
  if(sys.mouse.p.p == true and sys.mouse.p.x >= win[id].x+2 and sys.mouse.p.x <= (win[id].x+2)+(win[id].w-44)
  and sys.mouse.p.y >= win[id].y+2 and sys.mouse.p.y <= win[id].y+22 and win[id].hover == true) then
    sys.mouse.drag = true
  end
  if sys.mouse.p.p == false then
    sys.mouse.drag = false
    win[id].px = win[id].x
    win[id].py = win[id].y
  end
  if sys.mouse.drag == true and win[id].min == false and win[id].ex == false and layer[1] == id then
    win[id].x = win[id].px + (sys.mouse.x - sys.mouse.p.x)
    win[id].y = win[id].py + (sys.mouse.y - sys.mouse.p.y)
  end
  if (sys.mouse.p.p == true and sys.mouse.p.x >= win[id].x+win[id].w-22 and sys.mouse.p.x <= (win[id].x+win[id].w-22)+16 and win[id].ex == false
  and sys.mouse.drag == false and sys.mouse.p.y >= win[id].y+5 and sys.mouse.p.y <= (win[id].y+5)+16 and win[id].hover == true) then
    win[id].ex = true
  end
  if win[id].ex == true and win[id].s ~= 0 then
    win[id].s = win[id].s - 0.2
  elseif win[id].ex == false and win[id].s ~= 0 then
    win[id].s = win[id].s + 0.2
  end
  if win[id].s <= 0 then
    win[id].s = 0
  elseif win[id].s >= 1 then
    win[id].s = 1
  end
  if (win[id].min == false and sys.mouse.p.p == true and sys.mouse.p.x >= win[id].x+win[id].w-40
  and sys.mouse.p.x <= (win[id].x+win[id].w-40)+16 and sys.mouse.drag == false and sys.mouse.p.y >= win[id].y+5
  and sys.mouse.p.y <= (win[id].y+5)+16 and win[id].hover == true) then
    win[id].min = true
  end
  if win[id].min == true and win[id].miny < 800 then
    win[id].y = win[id].y + 100
    win[id].miny = win[id].miny + 100
  end
  if win[id].miny > 800 then
    win[id].miny = 800
  end
  if win[id].min == false and win[id].miny > 0 then
    win[id].y = win[id].y - 100
    win[id].miny = win[id].miny - 100
  end
  if win[id].miny < 0 then
    win[id].miny = 0
  end
  love.graphics.setColor(255,255,255)
end
function orderWindow(id)
  if win[id].ex == true and win[id].s == 0 then
    if layer[1] == id then
      layer[1] = 0
    end
    if layer[2] == id then
      layer[2] = 0
    end
    if layer[3] == id then
      layer[3] = 0
    end
    if layer[4] == id then
      layer[4] = 0
    end
    if layer[5] == id then
      layer[5] = 0
    end
    if layer[6] == id then
      layer[6] = 0
    end
    if layer[7] == id then
      layer[7] = 0
    end
    win[id].oldlayer = win[id].layer
    win[id].layer = 0
  end
  if win[id].ex == true then
    win[id].hover = false
  end
  if win[id].ex == true and win[id].s == 0 then
    win[id].oldlayer = win[id].layer
    win[id].layer = 0
    win[id].panel = 0
    if panel.b[1] == id then
      panel.b[1] = panel.b[2]
      panel.b[2] = panel.b[3]
      panel.b[3] = panel.b[4]
      panel.b[4] = panel.b[5]
      panel.b[5] = panel.b[6]
      panel.b[6] = panel.b[7]
    elseif panel.b[2] == id then
      panel.b[2] = panel.b[3]
      panel.b[3] = panel.b[4]
      panel.b[4] = panel.b[5]
      panel.b[5] = panel.b[6]
      panel.b[6] = panel.b[7]
    elseif panel.b[3] == id then
      panel.b[3] = panel.b[4]
      panel.b[4] = panel.b[5]
      panel.b[5] = panel.b[6]
      panel.b[6] = panel.b[7]
    end
  elseif win[id].ex == false or win[id].s ~= 0 then
    if layer[1] == 0 and layer[2] == id then
      layer[1] = id
      win[id].oldlayer = win[id].layer
      win[id].layer = 1
    elseif layer[1] == 0 and layer[2] == 0 and layer[3] == id then
      layer[1] = id
      win[id].oldlayer = win[id].layer
      win[id].layer = 1
    elseif layer[1] == 0 and layer[2] == 0 and layer[3] == 0 and layer[4] == id then
      layer[1] = id
      win[id].oldlayer = win[id].layer
      win[id].layer = 1
    elseif(layer[1] == 0 and layer[2] == 0 and layer[3] == 0 and layer[4] == 0
    and layer[5] == id) then
      layer[1] = id
      win[id].oldlayer = win[id].layer
      win[id].layer = 1
    elseif(layer[1] == 0 and layer[2] == 0 and layer[3] == 0 and layer[4] == 0
    and layer[5] == 0 and layer[6] == id) then
      layer[1] = id
      win[id].oldlayer = win[id].layer
      win[id].layer = 1
    elseif(layer[1] == 0 and layer[2] == 0 and layer[3] == 0 and layer[4] == 0
    and layer[5] == 0 and layer[6] == 0 and layer[7] == id) then
      layer[1] = id
      win[id].oldlayer = win[id].layer
      win[id].layer = 1
    end
    if layer[1] ~= id and win[id].layer == 1 then
      if win[id].oldlayer == 2 then
        layer[2] = layer[1]
        layer[1] = id
      elseif win[id].oldlayer == 3 then
        layer[3] = layer[2]
        layer[2] = layer[1]
        layer[1] = id
      elseif win[id].oldlayer == 4 then
        layer[4] = layer[3]
        layer[3] = layer[2]
        layer[2] = layer[1]
        layer[1] = id
      elseif win[id].oldlayer == 5 then
        layer[5] = layer[4]
        layer[4] = layer[3]
        layer[3] = layer[2]
        layer[2] = layer[1]
        layer[1] = id
      elseif win[id].oldlayer == 6 then
        layer[6] = layer[5]
        layer[5] = layer[4]
        layer[4] = layer[3]
        layer[3] = layer[2]
        layer[2] = layer[1]
        layer[1] = id
      else
        layer[7] = layer[6]
        layer[6] = layer[5]
        layer[5] = layer[4]
        layer[4] = layer[3]
        layer[3] = layer[2]
        layer[2] = layer[1]
        layer[1] = id
      end
      win[id].layer = 1
      if layer[7] ~= 0 then
        win[layer[7]].oldlayer = win[layer[7]].layer
        win[layer[7]].layer = 7
      end
      if layer[6] ~= 0 then
        win[layer[6]].oldlayer = win[layer[6]].layer
        win[layer[6]].layer = 6
      end
      if layer[5] ~= 0 then
        win[layer[5]].oldlayer = win[layer[5]].layer
        win[layer[5]].layer = 5
      end
      if layer[4] ~= 0 then
        win[layer[4]].oldlayer = win[layer[4]].layer
        win[layer[4]].layer = 4
      end
      if layer[3] ~= 0 then
        win[layer[3]].oldlayer = win[layer[3]].layer
        win[layer[3]].layer = 3
      end
      if layer[2] ~= 0 then
        win[layer[2]].oldlayer = win[layer[2]].layer
        win[layer[2]].layer = 2
      end
    end
    if layer[2] == id and win[id].layer ~= 2 then
      layer[2] = 0
    end
    if layer[3] == id and win[id].layer ~= 3 then
      layer[3] = 0
    end
    if layer[4] == id and win[id].layer ~= 4 then
      layer[4] = 0
    end
    if layer[5] == id and win[id].layer ~= 5 then
      layer[5] = 0
    end
    if layer[6] == id and win[id].layer ~= 6 then
      layer[6] = 0
    end
    if layer[7] == id and win[id].layer ~= 7 then
      layer[7] = 0
    end
    if panel.b[1] == 0 then
      panel.b[1] = id
    elseif panel.b[2] == 0 and panel.b[1] ~= id then
      panel.b[2] = id
    elseif panel.b[3] == 0 and panel.b[1] ~= id and panel.b[2] ~= id then
      panel.b[3] = id
    end
    drawWindow(id)
  end
end
