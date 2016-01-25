function love.load()
  require "window"
  require "panel"
  require "startmenu"
  require "var"
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
  elseif win[1].ex == false or win[1].s ~= 0 then
    drawWindow(1)
    layer[1].id = 1
  end
  if win[2].ex == true and win[2].s == 0 then
  elseif win[2].ex == false or win[2].s ~= 0 then
    drawWindow(2)
    layer[1].id = 2
  end
  drawStart()
  if(sys.mouse.p.p == true and start.p == false and sys.mouse.p.x >= panel.s.x and sys.mouse.p.x <= panel.s.x+panel.s.width
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
  if start.o == true then
    drawMenu()
  end
  if layer[2].cvs ~= nil then
    love.graphics.setColor(255,255,255)
    love.graphics.draw(layer[2])
  end
  if layer[1].cvs ~= nil then
    love.graphics.setColor(255,255,255)
    love.graphics.draw(layer[1].cvs, layer[1].x, layer[1].y, 0, layer[1].s)
  end
end
