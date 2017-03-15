function drawLoading()
  love.graphics.setBackgroundColor(0, 0, 0)
  love.graphics.setLineWidth(4)
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("line", sys.w/2-125, sys.h/2-15, 250, 30)
  love.graphics.print("Don't Get a Virus", sys.w/2-102, sys.h/2-30)
  love.graphics.setColor(0,0,120)
  love.graphics.rectangle("fill", sys.w/2-125+5, sys.h/2-10, loading, 20)
  if loading < 240 then
    loading = loading + 5
    if loading > loadingId*10 and loaded == false then
      loadAssets(loadingId)
      loadingId = loadingId + 1
    end
  elseif loading >= 240 then
    loading = 240
    fade = 1
  end
  love.graphics.setColor(0, 0, 0, fadeOpacity)
  love.graphics.rectangle("fill", 0, 0, sys.w, sys.h)
  if fadeOpacity == 255 and loading == 240 then
    scene = 1
    fade = 0
    sound.boot:play()
  end
end
function drawBSOD()
  love.audio.stop()
  love.graphics.setBackgroundColor(0,0,120)
  love.graphics.setColor(256,256,256)
  love.graphics.draw(bsod.pic, sys.w/2, sys.h/2, 0, 1, 1, 320, 200)
  if love.keyboard.isDown("return") == true then
    loadRe()
  end
end
function drawPause()
  love.graphics.setBackgroundColor(0,0,120)
  love.graphics.setColor(256,256,256)
  love.graphics.draw(pause.pic, sys.w/2, sys.h/2, 0, 1, 1, 320, 200)
  if love.keyboard.isDown("return") == true then
    love.event.quit()
  end
  if love.keyboard.isDown("escape") == true and pause.esc == false then
    love.audio.resume()
    pause.esc = true
    pause.p = false
    love.graphics.setBackgroundColor(0, 128, 128)
  end
end
function saveGameFile()
  love.filesystem.write("savegame.txt","v1.complete = ".. bool2str(v1.complete) ..";virus1Lose = " .. virus1Lose .. ";v2.complete = ".. bool2str(v2.complete) ..";virus2Lose = " .. virus2Lose .. ";")
end
function resetGameFile()
  love.filesystem.write("savegame.txt","v1.complete = false;virus1Lose = 0;v2.complete = false;virus2Lose = 0;")
end
function loadSave()
  if love.filesystem.exists("savegame.txt") == false then
    saveGameFile()
  else
    loadGame = love.filesystem.load("savegame.txt")
    loadGame()
  end
end
function bool2str(bool)
  if bool == false then
    return "false"
  else
    return "true"
  end
end
