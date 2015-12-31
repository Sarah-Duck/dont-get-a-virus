function love.load()
  sys = {}
  sys.width = love.graphics.getWidth()
  sys.height = love.graphics.getHeight()
  sys.mouse = {}
  sys.mouse.x = love.mouse.getX
  sys.mouse.y = love.mouse.getY
  love.graphics.setBackgroundColor(0, 128, 128)
  panel = {}
  panel.thick = 35
  panel.x = 0
  panel.y = sys.height-panel.thick
  panel.width = sys.width
  panel.height = panel.thick
  panel.s = {}
  panel.s.x = panel.x + 5
  panel.s.y = panel.y + 5
  panel.s.width = 65
  panel.s.height = 25
  panel.s.activate = false
  love.graphics.setNewFont("fonts/pressstart.ttf", 12)
  test = false
end
function love.update(dt)
  sys.mouse.x = love.mouse.getX()
  sys.mouse.y = love.mouse.getY()
  if love.keyboard.isDown("escape") == true then
    love.event.quit()
  end
  if love.mouse.isDown(1) then
    if sys.mouse.x >= panel.s.x and sys.mouse.x <= panel.s.x+panel.s.width then
      if sys.mouse.y >= panel.s.y and sys.mouse.y <= panel.s.y+panel.s.height then
        test = true
      end
    end
  end
end
function love.draw()
  love.graphics.setColor(192, 192, 192)
  love.graphics.rectangle("fill", panel.x, panel.y, panel.width, panel.height)
  love.graphics.setColor(220, 220, 220)
  love.graphics.setLineWidth(3)
  love.graphics.line(panel.x, panel.y, panel.width, panel.y)
  love.graphics.setColor(165, 165, 165)
  love.graphics.rectangle("line", panel.s.x, panel.s.y, panel.s.width, panel.s.height)
  love.graphics.setColor(70,70,70)
  love.graphics.print("START", panel.s.x+4, panel.s.y+9)
  if test == true then
    love.graphics.print("IT WORKS")
  end
end
