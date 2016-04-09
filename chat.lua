function drawChat()
  drawDownBox(8, 70, win[1].w-17, win[1].h-160, 4)
  love.graphics.setColor(250, 250, 250)
  love.graphics.rectangle("fill", 8, 70, win[1].w-17, win[1].h-160, 0.5)
  drawDownBox(8, 320, win[1].w-17, 70, 4)
  love.graphics.setColor(250, 250, 250)
  love.graphics.rectangle("fill", 8, 320, win[1].w-17, 70)
  drawUpBox(178, 321, 62, 68, 2)
  love.graphics.setColor(colors.font.dark)
  love.graphics.print("Send", 186, 350)
  love.graphics.setColor(255, 255, 255)
  drawDownBox(45, 31, win[1].w-53, 30, 2)
  if chat.status == 0 then
    love.graphics.draw(chat.offline, 215, 36)
  elseif chat.status == 1 then
    love.graphics.draw(chat.online, 215, 36)
  end
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(chat.profile, 6, 30)
  love.graphics.setColor(colors.font.dark)
  love.graphics.print(chat.profilename, 50, 41)
  love.graphics.setFont(pressstarts)
  for i=1,chatlimit() do
    if msg.msgs[i][1] == 1 then
      love.graphics.setColor(colors.font.friend)
      love.graphics.print("Friend:", 12, 310 - (28*i))
    elseif msg.msgs[i][1] == 2 then
      love.graphics.setColor(colors.font.you)
      love.graphics.print("You:", 12, 310 - (28*i))
    end
    love.graphics.setColor(colors.font.dark)
    love.graphics.print("\n" .. msg.msgs[i][2], 12, 310 - (28*i))
  end
  love.graphics.setFont(pressstart)
end
function updateChat()
  if msg.new == true then
    win[1].update = true
    msg.new = false
  end
end
function sendMessage(id, message)
  msg.new = true
  table.insert(msg.msgs, 1, {id, message})
  if win[1].ex == true or layer[1] ~= 1 then
    notifyNow("CHAT NOTIFICATION", "New message from\nBest Friend:\n\n" .. message)
  end
  if msg.c ~= 8 then
    msg.c = msg.c + 1
  end
end
function chatlimit()
  if #msg.msgs <=8 then
    return #msg.msgs
  else
    return 8
  end
end
