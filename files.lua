function drawFiles()
  drawDownBox(8, 74, win[3].w-17, win[3].h-108, 4)
  drawDownBox(8, 31, win[3].w-17, 34, 4)
  drawDownBox(7, 374, win[3].w-15, 18, 2)
  love.graphics.setColor(250, 250, 250)
  love.graphics.rectangle("fill", 8, 74, win[3].w-17, win[3].h-108)
  love.graphics.rectangle("fill", 8, 31, win[3].w-17, 34)
  if file.back == false then
    drawUpBox(9, 32, 38, 32, 2)
  else
    drawDownBox(9, 32, 38, 32, 2)
  end
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(internet.back, 11, 32)
  love.graphics.setColor(colors.font.dark)
  love.graphics.print(file.title, 70, 44)
  for i=1,#files do
    files[i].x = 40
    if i < 6 then
      files[i].y = 80
      files[i].x = (i*80)-43
    elseif i >= 6 then
      files[i].y = 150
      files[i].x = ((i-5)*80)-43
    end
    love.graphics.setFont(pixeloperators)
    love.graphics.setColor(256,256,256)
    if f.home == files then
      love.graphics.draw(icons[32].file,files[i].x,files[i].y,0,1.5,1.5)
    elseif files == f.pictures then
      love.graphics.draw(icons[48].imageFile,files[i].x,files[i].y,0,1,1)
    elseif files == f.videos then
      love.graphics.draw(icons[48].videoFile,files[i].x,files[i].y,0,1,1)
    elseif files == f.music then
      love.graphics.draw(icons[48].musicFile,files[i].x,files[i].y,0,1,1)
    elseif files == f.downloads then
      love.graphics.draw(icons[48].downloadFile,files[i].x,files[i].y,0,1,1)
    elseif files == f.documents then
      love.graphics.draw(icons[48].documentFile,files[i].x,files[i].y,0,1,1)
    end
    if files[i].hl == true then
      love.graphics.setColor(0,0,120)
      love.graphics.rectangle("fill", files[i].x-13,files[i].y+48,75,20)
      love.graphics.setColor(colors.font.light)
      love.graphics.printf(files[i].name,files[i].x-13,files[i].y+48,75,"center")
    else
      love.graphics.setColor(colors.font.dark)
      love.graphics.printf(files[i].name,files[i].x-13,files[i].y+48,75,"center")
    end
    love.graphics.setFont(pressstart)
  end
end
function updateFiles()
  for i=1,#files do
    if mouseClick(win[3].x+files[i].x,win[3].y+files[i].y,80,70) == true
    and layer[1] == 3 and file.p == false then
      file.p = true
      if files[i].hl == false then
        for i=1,#files do
          files[i].hl = false
        end
        files[i].hl = true
        win[3].update = true
      elseif files[i].hl == true then
        win[3].update = true
        if f.home == files then
          file.title = "/User/" .. files[i].name .. "/"
          if i == 4 then
            files = f.pictures
          elseif i == 1 then
            files = f.documents
          elseif i == 2 then
            files = f.downloads
          elseif i == 3 then
            files = f.music
          elseif i == 5 then
            files = f.videos
          end
          return
        elseif files == f.pictures then
          if i == 1 and picture.img ~= picture.cat then
            picture.img = picture.cat
            win[7].update = true
          elseif i == 2 and picture.img ~= picture.art then
            picture.img = picture.art
            win[7].update = true
          end
          openFileWindow(7)
        elseif files == f.videos then
          if i == 1 and vplay.v ~= video.attacktortoise then
            if vplay.v ~= 0 then
              vplay.v:stop()
            end
            vplay.v = video.attacktortoise
            vplay.p = true
          end
          openFileWindow(8)
        elseif files == f.music then
          if i == 1 and mplay.m ~= music.chill then
            if mplay.m ~= 0 then
              mplay.m:stop()
            end
            mplay.m = music.chill
            mplay.p = true
            mplay.title = "How it Begins - Kevin Macleod"
          elseif i == 2 and mplay.m ~= music.rage then
            if mplay.m ~= 0 then
              mplay.m:stop()
            end
            mplay.m = music.rage
            mplay.p = true
            mplay.title = "Fight or Flight - Ethan Meixsell"
          elseif i == 3 and mplay.m ~= music.sophie then
            if mplay.m ~= 0 then
              mplay.m:stop()
            end
            mplay.m = music.sophie
            mplay.p = true
            mplay.title = "Close My Mouth - Silent Partner"
          elseif i == 4 and mplay.m ~= music.ohyeah then
            if mplay.m ~= 0 then
              mplay.m:stop()
            end
            mplay.m = music.ohyeah
            mplay.p = true
            mplay.title = "Down N' Dirty - Jingle Punks"
          elseif i == 5 and mplay.m ~= music.finale then
            if mplay.m ~= 0 then
              mplay.m:stop()
            end
            mplay.m = music.finale
            mplay.p = true
            mplay.title = "Ich Grolle Nicht - Ron Meixsell"
          end
          openFileWindow(9)
        end
      end
    end
  end
  if mouseClick(win[3].x+9,win[3].y+32,38,32) == true and layer[1] == 3 and files ~= f.home then
    files = f.home
    file.title = "/User/"
    win[3].update = true
    file.back = true
  elseif file.back == true and sys.mouse.p.p == false then
    file.back = false
    win[3].update = true
  end
end
function openFileWindow(id)
  if win[id].ex == true then
    if win[3].x+win[3].w+win[id].w+15 < sys.w then
      win[id].x = win[3].x+win[3].w+15
    else
      win[id].x = win[3].x-15-win[id].w
    end
    win[id].y = win[3].y
    win[id].ex = false
    win[id].s = 0.2
    win[id].oldlayer = win[id].layer
    layer.sentToFront = id
  end
end
