function love.load()
  system = {}
  system.width = love.graphics.getWidth()
  system.height = love.graphics.getHeight()
  system.mouse = {}
  system.mouse.x = love.mouse.getX
  system.mouse.y = love.mouse.getY
  love.graphics.setBackgroundColor(0, 128, 128)
end
function love.update(dt)
  system.mouse.x = love.mouse.getX
  system.mouse.y = love.mouse.getY
  if love.keyboard.isDown("escape") == true then
    love.event.quit()
  end
end
function love.draw()
  love.graphics.rectangle("fill", 0, system.height-26, system.width, 26)
end
