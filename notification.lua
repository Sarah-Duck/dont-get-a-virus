function drawNoti()
  if notify.yes == true or notify.op ~= 0 then
    love.graphics.setColor(255, 255, 255, notify.op)
    love.graphics.draw(notification.bubble, notify.x, notify.y)
    love.graphics.setColor(colors.font.dark, notify.op)
    love.graphics.print(notify.title, notify.x+10, notify.y+10)
    love.graphics.printf(notify.body, notify.x+10, notify.y+30, 200)
    if notify.sound == true then
      notification.sound1:play()
      notify.sound = false
    end
    if notify.op ~= 255 and notify.yes == true then
      notify.op = notify.op + 17
    elseif notify.op ~= 0 and notify.yes == false then
      notify.op = notify.op - 17
    end
  end
end
function timeNoti(dt)
  notify.timer = notify.timer + dt
  if notify.timer >= 4 then
    notify.yes = false
    notify.timer = 0
    notify.sound = false
  end
end
function notifyNow(title, body)
  if notify.yes == false and notify.sound == false then
    notify.sound = true
    notify.timer = 0
  end
  notify.yes = true
  notify.title = title
  notify.body = body
end
