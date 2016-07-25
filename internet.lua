function drawInternet()
  drawDownBox(8, 74, win[2].w-50, win[2].h-108, 4)
  drawDownBox(8, 31, win[2].w-17, 34, 4)
  drawDownBox(7, 524, win[2].w-15, 18, 2)
  drawDownBox(616, 73, 26, win[2].h-107, 2)
  drawUpBox(618, 75, 22, 22, 2)
  drawUpBox(618, 75+24, 22, 391, 2)
  drawUpBox(618, win[2].h-113+55, 22, 22, 2)
  love.graphics.setColor(250, 250, 250)
  love.graphics.rectangle("fill", 8, 74, win[2].w-50, win[2].h-108)
  love.graphics.rectangle("fill", 8, 31, win[2].w-17, 34)
  drawUpBox(9, 32, 38, 32, 2)
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(internet.back, 11, 32)
  love.graphics.setColor(colors.font.dark)
  love.graphics.print(internet.url .. internetBlink(), 70, 44)
  love.graphics.stencil(internetStencil, "replace", 1)
  love.graphics.setStencilTest("greater", 0)
  love.graphics.setColor(255, 255, 255)
  if internet.urlc == "www.homepage.com" or internet.urlc == "homepage.com" then
    love.graphics.draw(internet.welcome, 8, 74)
  elseif internet.urlc == "www.freedownloads.com" or internet.urlc == "freedownloads.com" then
    love.graphics.draw(internet.freedownloads1, 8, 74)
    if v1.complete == false then
      v1.yes = true
    end
  else
    love.graphics.draw(internet.error, 8, 74)
  end
  love.graphics.setStencilTest()
end
function updateInternet()
  if layer[1] == 2 then
    internet.blinkTimer = internet.blinkTimer + delta
    if internet.blinkTimer >= 0.5 then
      if internet.blink == true then
        internet.blink = false
      else
        internet.blink = true
      end
      internet.blinkTimer = 0
    end
  else
    internet.blinkTimer = 0
  end
  internet.urlold = internet.url
  function love.keypressed(key)
    if key == "backspace" and layer[1] == 2 and v1.yes == false then
      internet.url = string.sub(internet.url, 1, string.len(internet.url)-1)
      if internet.url ~= internet.urlold then
        win[2].update = true
        internet.blink = true
        internet.blinkTimer = 0
      end
    end
    if key == "return" and layer[1] == 2 then
      internet.urlc = internet.url
      win[2].update = true
      internet.load = 0
    end
    if key == "backspace" and layer[1] == 1 and v1.yes == false then
      chat.msg = string.sub(chat.msg, 1, string.len(chat.msg)-1)
      if chat.msg ~= chat.msgold then
        win[1].update = true
        chat.blink = true
        chat.blinkTimer = 0.5
      end
    end
    if key == "return" and layer[1] == 1 and chat.msg ~= "" then
      sendMessage(2, chat.msg)
      if chat.status == 1 then
        chatReply(string.lower(chat.msg))
      end
      chat.msg = ""
    end
  end
  function love.textinput(t)
    if layer[1] == 2 and v1.yes == false then
      internet.url = internet.url .. t
      if internet.url ~= internet.urlold then
        win[2].update = true
        internet.blink = true
        internet.blinkTimer = 0
      end
    end
    if layer[1] == 1 and v1.yes == false then
      if string.len(chat.msg) < 18 then
        chat.msg = chat.msg .. t
      end
      if chat.msg ~= chat.msgold then
        win[1].update = true
        chat.blink = true
        chat.blinkTimer = 0.5
      end
    end
  end
  if internet.load ~= 442 then
    if math.random(1,3) == 3 then
      internet.load = internet.load + (math.random(0,20)*sys.s)
      win[2].update = true
    end
  end
end
function internetStencil()
  love.graphics.rectangle("fill", 8, 74, 600, internet.load)
end
function internetBlink()
  if layer[1] == 2 then
    if internet.blink == true then
      return "|"
    else
      return ""
    end
  else
    return ""
  end
end
