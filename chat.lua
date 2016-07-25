function drawChat()
  drawDownBox(8, 70, win[1].w-17, win[1].h-160, 4)
  love.graphics.setColor(250, 250, 250)
  love.graphics.rectangle("fill", 8, 70, win[1].w-17, win[1].h-160, 0.5)
  drawDownBox(8, 320, win[1].w-17, 70, 4)
  love.graphics.setColor(250, 250, 250)
  love.graphics.rectangle("fill", 8, 320, win[1].w-17, 70)
  if mouseClick(win[1].x+178, win[1].y+321, 62, 68) == true and layer[1] == 1 then
    drawDownBox(178, 321, 62, 68, 2)
  else
    drawUpBox(178, 321, 62, 68, 2)
  end
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
  love.graphics.setFont(pixeloperators)
  for i=1,chatlimit() do
    if msg.msgs[i][1] == 1 or msg.msgs[i][1] == 3 then
      love.graphics.setColor(colors.font.friend)
      love.graphics.print("Friend:", 12, 300 - (28*i))
    elseif msg.msgs[i][1] == 2 then
      love.graphics.setColor(colors.font.you)
      love.graphics.print("You:", 12, 300 - (28*i))
    end
    love.graphics.setColor(colors.font.dark)
    love.graphics.print("\n" .. msg.msgs[i][2], 12, 300 - (28*i))
  end
  love.graphics.setColor(colors.font.dark)
  if chat.blink == true then
    love.graphics.print(chat.msg .. "_", 10, 320)
  elseif chat.blink == false then
    love.graphics.print(chat.msg, 10, 320)
  end
  love.graphics.print(18-string.len(chat.msg) .. "/18", 10, 370)
  love.graphics.setFont(pressstart)
end
function updateChat()
  if mouseClick(win[1].x+178, win[1].y+321, 62, 68) == true and layer[1] == 1 then
    if chat.msg ~= "" then
      sendMessage(2, chat.msg)
      if chat.status == 1 then
        chatReply(string.lower(chat.msg))
      end
      chat.msg = ""
    end
    win[1].update = true
  end
  chat.blinkTimer = chat.blinkTimer - delta
  if chat.blinkTimer <= 0 then
    if chat.blink == true then
      chat.blink = false
    elseif chat.blink == false then
      chat.blink = true
    end
    win[1].update = true
    chat.blinkTimer = 0.5
  end
  chat.msgold = chat.msg
  if msg.new == true then
    win[1].update = true
    msg.new = false
  end
  for i=1, #msg.r do
    msg.r[i].t = msg.r[i].t - delta
  end
  for i=1, #msg.r do
    if msg.r[i].t <= 0 then
      sendMessage(3, msg.r[i].r[math.random(1,#msg.r[i].r)])
      table.remove(msg.r, i)
      break
    end
  end
end
function sendMessage(id, message)
  msg.new = true
  table.insert(msg.msgs, 1, {id, message})
  if win[1].ex == true or layer[1] ~= 1 then
    notifyNow("CHAT NOTIFICATION", "New message from\nBest Friend:\n" .. message)
  end
  if msg.c ~= 21 and id == 1 then
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
