function drawLoading()
  love.graphics.setBackgroundColor(0, 0, 0)
  love.graphics.setLineWidth(4)
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("line", sys.w/2-125, sys.h/2-15, 250, 30)
  love.graphics.print("Don't Get a Virus", sys.w/2-102, sys.h/2-30)
  love.graphics.setColor(0,0,120)
  love.graphics.rectangle("fill", sys.w/2-125+5, sys.h/2-10, loading, 20)
  if loading ~= 240 then
    loading = loading + 2
  elseif loading == 240 then
    fade = 1
  end
  love.graphics.setColor(0, 0, 0, fadeOpacity)
  love.graphics.rectangle("fill", 0, 0, sys.w, sys.h)
  if fadeOpacity == 255 and loading == 240 then
    scene = 1
    fade = 0
  end
end
