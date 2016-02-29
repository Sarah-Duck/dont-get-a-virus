function drawChat(x, y, hov)
  drawDownBox(8, 70, win[1].w-17, win[1].h-160, 4)
  love.graphics.setColor(250, 250, 250)
  love.graphics.rectangle("fill", 8, 70, win[1].w-17, win[1].h-160, 0.5)
  drawDownBox(8, 320, 165, 70, 4)
  love.graphics.setColor(250, 250, 250)
  love.graphics.rectangle("fill", 8, 320, 165, 70)
  drawUpBox(180, 318, 62, 74, 2)
  love.graphics.setColor(colors.font.dark)
  love.graphics.print("Send", 187, 350)
  drawDownBox(45, 31, win[1].w-53, 30, 2)
  if chat.status == 0 then
    love.graphics.draw(chat.offline, 215, 36)
  elseif chat.status == 1 then
    love.graphics.draw(chat.online, 215, 36)
  end
  love.graphics.draw(chat.profile, 6, 30)
  love.graphics.setColor(colors.font.dark)
  love.graphics.print(chat.profilename, 50, 41)
end
