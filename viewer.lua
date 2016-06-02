function drawPicture()
  drawDownBox(8, 31, win[7].w-17, win[7].h-40, 4)
  if picture.img ~= 0 then
    love.graphics.draw(picture.img, 8, 31)
  end
end
function drawVideo()
end
function drawMusic()
end
