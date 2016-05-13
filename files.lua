function drawFiles()
  drawDownBox(8, 74, win[3].w-17, win[3].h-108, 4)
  drawDownBox(8, 31, win[3].w-17, 34, 4)
  drawDownBox(7, 374, win[3].w-15, 18, 2)
  love.graphics.setColor(250, 250, 250)
  love.graphics.rectangle("fill", 8, 74, win[3].w-17, win[3].h-108)
  love.graphics.rectangle("fill", 8, 31, win[3].w-17, 34)
  drawUpBox(9, 32, 38, 32, 2)
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(internet.back, 11, 32)
  love.graphics.setColor(colors.font.dark)
  love.graphics.print("/User/", 70, 44)
  for i=1,#files do
    if files[i].type == 0 then
      files[i].x = 40
      files[i].y = 80
      if files[i].x*i < 300 then
        files[i].x = (i*80)-43
      end
      love.graphics.setFont(pixeloperators)
      love.graphics.setColor(256,256,256)
      love.graphics.draw(icons[32].file,files[i].x,files[i].y,0,1.5,1.5)
      love.graphics.setColor(colors.font.dark)
      love.graphics.printf(files[i].name,files[i].x-13,files[i].y+48,75,"center")
      love.graphics.setFont(pressstart)
    end
  end
end
