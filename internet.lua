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
  love.graphics.print(internet.url, 70, 44)
  love.graphics.setColor(255, 255, 255)
  if internet.urlc == "www.homepage.com" then
    love.graphics.draw(internet.welcome, 8, 74)
  elseif internet.urlc == "www.freedownloads.com" then
    love.graphics.draw(internet.freedownloads1, 8, 74)
    virus1.yes = true
  else
    love.graphics.draw(internet.error, 8, 74)
  end
end
function updateInternet()
  internet.urlold = internet.url
  function love.keypressed(key)
    if key == "backspace" and layer[1] == 2 then
      internet.url = string.sub(internet.url, 1, string.len(internet.url)-1)
      if internet.url ~= internet.urlold then
        win[2].update = true
      end
    end
    if key == "return" and layer[1] == 2 then
      internet.urlc = internet.url
      win[2].update = true
    end
  end
  function love.textinput(t)
    if layer[1] == 2 then
      internet.url = internet.url .. t
      if internet.url ~= internet.urlold then
        win[2].update = true
      end
    end
  end
end
