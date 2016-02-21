function drawDesktop()
  love.graphics.setColor(255,255,255)
  if desktop.bg.current ~= 0 then
    love.graphics.draw(desktop.bg.current, 0, 0, 0, sys.w/1920, sys.h/1280)
  end
  if sys.mouse.p.p == true and sys.mouse.drag == false then
    love.graphics.setColor(0,80,160,80)
    love.graphics.rectangle("fill", sys.mouse.p.x, sys.mouse.p.y, sys.mouse.x-sys.mouse.p.x, sys.mouse.y-sys.mouse.p.y)
    love.graphics.rectangle("line", sys.mouse.p.x, sys.mouse.p.y, sys.mouse.x-sys.mouse.p.x, sys.mouse.y-sys.mouse.p.y)
  end
end
