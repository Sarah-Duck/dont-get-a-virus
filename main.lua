function love.load()
  require "assets"
  require "window"
  require "panel"
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
  require "virus1"
  require "dialogue"
  loadPre()
  --loadAssets()
  --loadVar()
  --loadDia()
end
function love.update(dt)
  delta = dt
  time = time + dt
  fps = love.timer.getFPS()
  sys.s = 60/fps
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
    for i=1,#win do
      win[i].update = true
    end
  elseif love.keyboard.isDown("f5") == true then
    love.window.setMode(1280, 720, {fullscreen=false})
    for i=1,#win do
      win[i].update = true
    end
  end
  if fade == 1 and fadeOpacity ~= 255 then
    fadeOpacity = fadeOpacity + 5
  elseif fade == 0  and fadeOpacity ~= 0 then
    fadeOpacity = fadeOpacity - 5
  end
  if scene == 1 then
    updateSystem(dt)
  end
  if loaded == true then
    if v1.yes == true and v1.complete == false then
      v1.timer = v1.timer + dt
    end
    if v1.yes == true and v1.timer >= 5 then
      scene = 2
      if v1.explodeintrotimer <= 7.8 then
        v1.explodeintrotimer = v1.explodeintrotimer + dt
      end
    end
  end
end
function love.mousepressed(x, y, button)
  sys.mouse.p.x = x
  sys.mouse.p.y = y
  sys.mouse.p.p = true
end
function love.keyreleased(key)
   if key == "f11" then
      v1.c.chat.msgs = v1.c.chat.msgs + 1
   end
   if key == "f10" then
     v1.c.health = v1.c.health - 5
     v1.spm = v1.spm + 0.5*(sys.h/1080)
   end
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
  elseif scene == 666 then
    drawBSOD()
  end
end
