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
  minim = love.graphics.getHeight()+10
  sys.mouse.x = love.mouse.getX()
  sys.mouse.y = love.mouse.getY()
  if love.keyboard.isDown("escape") == true then
    love.window.setMode(800, 600, {fullscreen=false})
    love.event.quit()
  end
  if love.keyboard.isDown("u") == true and win[1].min == true then
    win[1].min = false
    win[2].min = false
  end
  if love.keyboard.isDown("f4") == true then
    love.window.setMode(800, 600, {fullscreen=true, fullscreentype="desktop"})
  elseif love.keyboard.isDown("f5") == true then
    love.window.setMode(800, 600, {fullscreen=false})
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
  drawDesktop()
  orderWindow(1)
  orderWindow(2)
  orderWindow(3)
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
  if layer[7] ~= 0 then
    love.graphics.draw(win[layer[7]].cvs, win[layer[7]].x, win[layer[7]].y, 0, win[layer[7]].s)
  end
  if layer[6] ~= 0 then
    love.graphics.draw(win[layer[6]].cvs, win[layer[6]].x, win[layer[6]].y, 0, win[layer[6]].s)
  end
  if layer[5] ~= 0 then
    love.graphics.draw(win[layer[5]].cvs, win[layer[5]].x, win[layer[5]].y, 0, win[layer[5]].s)
  end
  if layer[4] ~= 0 then
    love.graphics.draw(win[layer[4]].cvs, win[layer[4]].x, win[layer[4]].y, 0, win[layer[4]].s)
  end
  if layer[3] ~= 0 then
    love.graphics.draw(win[layer[3]].cvs, win[layer[3]].x, win[layer[3]].y, 0, win[layer[3]].s)
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
  --love.graphics.print(layer[1] .. layer[2] .. layer[3] .. layer[4] .. layer[5] .. layer[6] .. layer[7])
  --love.graphics.print(win[1].layer .. win[2].layer .. win[3].layer, 0, 20)
  --if win[1].hover == true then
  --  love.graphics.print("YAAAAS", 0, 40)
  --end
end
