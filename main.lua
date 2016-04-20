function love.load()
  require "assets"
  require "window"
  require "panel"
  require "startmenu"
  require "var"
  require "desktop"
  require "internet"
  require "files"
  require "antivirus"
  require "help"
  require "chat"
  require "settings"
  require "system"
  require "loading"
  require "elements"
  require "notification"
  require "virus1"
  require "dialogue"
  love.graphics.setDefaultFilter("nearest", "nearest")
  love.graphics.setBackgroundColor(0, 0, 0)
  love.graphics.setNewFont()
  pressstart = love.graphics.newFont("fonts/pressstart.ttf", 12)
  pressstart:setFilter("nearest", "nearest")
  --pressstarts = love.graphics.newFont("fonts/pressstart.ttf", 10)
  --pressstarts:setFilter("nearest", "nearest")
  pixeloperatorb = love.graphics.newFont("fonts/pixel_operator/PixelOperator8-Bold.ttf", 16)
  pixeloperatorb:setFilter("nearest", "nearest")
  pixeloperator = love.graphics.newFont("fonts/pixel_operator/PixelOperator8.ttf", 16.5)
  pixeloperator:setFilter("nearest", "nearest")
  pixeloperators = love.graphics.newFont("fonts/pixel_operator/PixelOperator-Bold.ttf", 16)
  pixeloperators:setFilter("nearest", "nearest")
  love.graphics.setFont(pressstart)
  love.keyboard.setKeyRepeat(true)
  loadAssets()
  loadVar()
  loadDia()
end
function love.update(dt)
  time = dt
  sys.w = love.graphics.getWidth()
  sys.h = love.graphics.getHeight()
  minim = love.graphics.getHeight()+10
  sys.mouse.x = love.mouse.getX()
  sys.mouse.y = love.mouse.getY()
  if love.keyboard.isDown("escape") == true then
    love.event.quit()
  end
  if love.keyboard.isDown("f4") == true then
    love.window.setMode(800, 600, {fullscreen=true, fullscreentype="desktop"})
  elseif love.keyboard.isDown("f5") == true then
    love.window.setMode(1280, 720, {fullscreen=false})
  end
  if fade == 1 and fadeOpacity ~= 255 then
    fadeOpacity = fadeOpacity + 5
  elseif fade == 0  and fadeOpacity ~= 0 then
    fadeOpacity = fadeOpacity - 5
  end
  if scene == 1 then
    updateSystem(dt)
  end
  if v1.yes == true then
    v1.timer = v1.timer + dt
  end
  if v1.yes == true and v1.timer >= 5 then
    scene = 2
    if v1.explodeintrotimer <= 7.8 then
      v1.explodeintrotimer = v1.explodeintrotimer + dt
    end
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
  for i=1,6 do
    icon[i].cl = false
  end
  if v1.msgs[v1.c.chat.msgs] ~= nil then
    if string.len(v1.msgs[v1.c.chat.msgs]) == string.len(v1.c.chat.msg) and v1.yes == true then
      v1.c.chat.next = false
    end
  end
end
function love.draw()
  if scene == 1 then
    drawSystem()
  elseif scene == 0 then
    drawLoading()
  elseif scene == 2 then
    drawVirusFight1()
  end
end
