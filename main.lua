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
  love.graphics.setDefaultFilter("nearest", "nearest")
  love.graphics.setBackgroundColor(0, 0, 0)
  love.graphics.setNewFont()
  pressstart = love.graphics.newFont("fonts/pressstart.ttf", 12)
  pressstart:setFilter("nearest", "nearest")
  love.graphics.setFont(pressstart)
  loadAssets()
  loadVar()
end
function love.update(dt)
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
  if scene == 1 then
    drawSystem()
  end
  if scene == 0 then
    drawLoading()
  end
end
