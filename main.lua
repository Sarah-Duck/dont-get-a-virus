function love.load()
  require "window"
  require "panel"
  require "startmenu"
  love.graphics.setDefaultFilter("nearest", "nearest")
  icons = {
    chat = love.graphics.newImage("assets/icon_chat.png")
  }
  sys = {}
  sys.width = love.graphics.getWidth()
  sys.height = love.graphics.getHeight()
  sys.mouse = {}
  sys.mouse.p = {}
  sys.mouse.x = love.mouse.getX
  sys.mouse.y = love.mouse.getY
  sys.mouse.p.x = 0
  sys.mouse.p.y = 0
  sys.mouse.p.p = false
  sys.mouse.drag = false
  love.graphics.setBackgroundColor(0, 128, 128)
  panel = {}
  panel.thick = 30
  panel.x = 0
  panel.y = 600-panel.thick
  panel.width = sys.width
  panel.height = panel.thick
  panel.s = {}
  panel.s.x = panel.x + 5
  panel.s.y = panel.y + 5
  panel.s.width = 65
  panel.s.height = 20
  panel.s.activate = false
  love.graphics.setNewFont()
  pressstart = love.graphics.newFont("fonts/pressstart.ttf", 12)
  pressstart:setFilter("nearest", "nearest")
  love.graphics.setFont(pressstart)
  test = false
  win = {}
  win[1] = {}
  win[1].x = 100
  win[1].y = 100
  win[1].w = 250
  win[1].h = 400
  win[1].px = win[1].x
  win[1].py = win[1].y
  win[1].ex = true
  win[1].cvs = love.graphics.newCanvas(win[1].w, win[1].h)
  win[1].fd = false
  win[1].s = 1
  win[1].min = false
  win[1].miny = 0
  start = {}
  start.cvs = love.graphics.newCanvas(250, 350)
  start.o = false
  start.p = false
end
function love.update(dt)
  sys.mouse.x = love.mouse.getX()
  sys.mouse.y = love.mouse.getY()
  if love.keyboard.isDown("escape") == true then
    love.event.quit()
  end
  if love.keyboard.isDown("c") == true and win[1].ex == true then
    win[1].ex = false
    win[1].s = 0.2
  end
  if love.keyboard.isDown("u") == true and win[1].min == true then
    win[1].min = false
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
    drawWindow(1, win[1].x, win[1].y, win[1].w, win[1].h, "Chat")
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
end
