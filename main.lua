function love.load()
  require "window"
  require "panel"
  require "startmenu"
  require "var"
  require "desktop"
  require "internet"
  require "files"
  require "torrent"
  require "help"
  require "chat"
  require "settings"
  love.graphics.setDefaultFilter("nearest", "nearest")
  love.graphics.setBackgroundColor(0, 128, 128)
  love.graphics.setNewFont()
  pressstart = love.graphics.newFont("fonts/pressstart.ttf", 12)
  pressstart:setFilter("nearest", "nearest")
  love.graphics.setFont(pressstart)
  loadVar()
end
function love.update(dt)
  sys.mouse.x = love.mouse.getX()
  sys.mouse.y = love.mouse.getY()
  if love.keyboard.isDown("escape") == true then
    love.event.quit()
  end
  if love.keyboard.isDown("u") == true and win[1].min == true then
    win[1].min = false
    win[2].min = false
  end
end
function love.mousepressed(x, y, button)
  sys.mouse.p.x = x
  sys.mouse.p.y = y
  sys.mouse.p.p = true
end
function love.mousereleased(x, y, button)
  sys.mouse.p.p = false
  start.p = false
end
function love.draw()
  if win[1].ex == true and win[1].s == 0 then
    win[1].layer = 0
    win[1].panel = 0
    if panel.b[1] == 1 then
      panel.b[1] = panel.b[2]
      panel.b[2] = panel.b[3]
      panel.b[3] = panel.b[4]
      panel.b[4] = panel.b[5]
      panel.b[5] = panel.b[6]
      panel.b[6] = panel.b[7]
    elseif panel.b[2] == 1 then
      panel.b[2] = panel.b[3]
      panel.b[3] = panel.b[4]
      panel.b[4] = panel.b[5]
      panel.b[5] = panel.b[6]
      panel.b[6] = panel.b[7]
    end
  elseif win[1].ex == false or win[1].s ~= 0 then
    if layer[1] == 0 then
      layer[1] = 1
      win[1].layer = 1
    end
    if layer[1] == 2 and win[1].layer == 1 then
      layer[2] = 2
      layer[1] = 1
      win[1].layer = 1
      win[2].layer = 2
    end
    if panel.b[1] == 0 then
      panel.b[1] = 1
    elseif panel.b[2] == 0 and panel.b[1] ~= 1 then
      panel.b[2] = 1
    end
    drawWindow(1)
  end
  if win[2].ex == true and win[2].s == 0 then
    win[1].layer = 0
    win[1].panel = 0
    if panel.b[1] == 2 then
      panel.b[1] = panel.b[2]
      panel.b[2] = panel.b[3]
      panel.b[3] = panel.b[4]
      panel.b[4] = panel.b[5]
      panel.b[5] = panel.b[6]
      panel.b[6] = panel.b[7]
    elseif panel.b[2] == 2 then
      panel.b[2] = panel.b[3]
      panel.b[3] = panel.b[4]
      panel.b[4] = panel.b[5]
      panel.b[5] = panel.b[6]
      panel.b[6] = panel.b[7]
    end
  elseif win[2].ex == false or win[2].s ~= 0 then
    if layer[1] == 0 then
      layer[1] = 2
      win[2].layer = 1
    end
    if layer[1] == 1 and win[2].layer == 1 then
      layer[2] = 1
      layer[1] = 2
      win[2].layer = 1
      win[1].layer = 2
    end
    if panel.b[1] == 0 then
      panel.b[1] = 2
    elseif panel.b[2] == 0 and panel.b[1] ~= 2 then
      panel.b[2] = 2
    end
    drawWindow(2)
  end
  if(sys.mouse.p.p == true and start.p == false and sys.mouse.p.x >= panel.s.x
  and sys.mouse.p.x <= panel.s.x+panel.s.width
  and sys.mouse.p.y >= panel.s.y and sys.mouse.p.y <= panel.s.y+panel.s.height) then
    start.p = true
    if start.o == true then
      start.o = false
    elseif start.o == false then
      start.o = true
    end
  end
  if start.o == true and sys.mouse.p.p == true and sys.mouse.p.x > 255 or sys.mouse.p.y < 220 then
    start.o = false
  end
  if layer[2] ~= 0 then
    love.graphics.draw(win[layer[2]].cvs, win[layer[2]].x, win[layer[2]].y, 0, win[layer[2]].s)
  end
  if layer[1] ~= 0 then
    love.graphics.draw(win[layer[1]].cvs, win[layer[1]].x, win[layer[1]].y, 0, win[layer[1]].s)
  end
  drawStart()
  if start.o == true then
    drawMenu()
  end
end
