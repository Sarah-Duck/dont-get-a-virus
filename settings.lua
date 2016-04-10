function drawSettings()
  drawDownBox(8, 30, 384, 25, 2)
  love.graphics.setColor(colors.font.dark)
  love.graphics.print("Wallpaper", 14, 38)
  love.graphics.setColor(255,255,255)
  love.graphics.draw(settings.comp, 200-64, 36+32, 0, 2, 2, 60)
  drawDownBox(262, 37+32, 122, 222, 2)
  love.graphics.setColor(255,255,255)
  love.graphics.rectangle("fill", 263, 38+32, 120, 220)
  if st[1].hl == true then
    desktop.bg.current = 0
  elseif st[2].hl == true then
    desktop.bg.current = desktop.bg.hills
  elseif st[3].hl == true then
    desktop.bg.current = desktop.bg.cloud
  elseif st[4].hl == true then
    desktop.bg.current = desktop.bg.city
  elseif st[5].hl == true then
    desktop.bg.current = desktop.bg.flower
  elseif st[6].hl == true then
    desktop.bg.current = desktop.bg.coast
  end
  love.graphics.stencil(stencilBg, "replace", 1)
  love.graphics.setStencilTest("greater", 0)
  if desktop.bg.current ~= 0 then
    love.graphics.setColor(255,255,255)
    love.graphics.draw(desktop.bg.current, 88-64, 44+32, 0, 0.1)
  else
    love.graphics.setColor(0,128,128)
    love.graphics.rectangle("fill", 88-64, 44+32, 152, 120)
  end
  love.graphics.setStencilTest()
  for i=1,6 do
    drawBgSel(i)
  end
end
function stencilBg()
  love.graphics.rectangle("fill", 88-64, 44+32, 152, 120)
end
function drawBgSel(i)
  if st[i].hl == false then
    love.graphics.setColor(colors.font.dark)
    love.graphics.print(st[i].title, 268, 78+(20*(i-1)))
  elseif st[i].hl == true then
    love.graphics.setColor(0,0,120)
    love.graphics.rectangle("fill", 263, 70+(20*(i-1)), 120, 20)
    love.graphics.setColor(colors.font.light)
    love.graphics.print(st[i].title, 268, 78+(20*(i-1)))
  end
end
function updateSettings()
  for i=1,6 do
    if (layer[1] == 6 and win[6].hover == true and sys.mouse.p.p == true and sys.mouse.drag == false and
    sys.mouse.p.x >= win[6].x+263 and sys.mouse.p.x <= win[6].x+263+120 and
    sys.mouse.p.y >= win[6].y+70+(20*(i-1)) and sys.mouse.y <= win[6].y+70+(20*(i-1))+20) then
      for i=1,6 do
        st[i].hl = false
      end
      st[i].hl = true
      win[6].update = true
    end
  end
end
