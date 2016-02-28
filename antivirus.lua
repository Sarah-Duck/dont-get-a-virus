function drawAntivirus()
  if antivirus.scanning == true then
    drawDownBox(49, 110, 100, 19, 2)
  else
    drawUpBox(49, 110, 100, 19, 2)
  end
  drawDownBox(10, 40, 180, 30, 2)
  love.graphics.setColor(colors.font.dark)
  love.graphics.print("SCAN NOW", 51, 116)
  love.graphics.print(antivirus.status, 10, 77)
  love.graphics.setColor(0,0,120)
  if antivirus.scanning == true then
    drawBlueBox(13, 44, antivirus.prog, 22, 2)
  end
end
function updateAntivirus()
  if (sys.mouse.p.p == true and win[4].hover == true and antivirus.scanning == false
  and sys.mouse.p.x >= win[4].x+49 and sys.mouse.p.x <= win[4].x+49+100
  and sys.mouse.p.y >= win[4].y+110 and sys.mouse.p.y <= win[4].y+110+19) then
    antivirus.scanning = true
    antivirus.prog = 0
  end
  if antivirus.scanning == true then
    antivirus.prog = antivirus.prog + math.random(0,0.5,2,10,1,20,0.1,0.2)
    win[4].update = true
    antivirus.status = "Scanning: " .. math.floor(antivirus.prog/174*100) .. "%"
  end
  if antivirus.prog >= 174 then
    antivirus.prog = 174
    antivirus.scanning = false
    antivirus.status = "0 Viruses Found"
  end
end
