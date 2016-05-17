function drawHelp()
  drawDownBox(8, 31, win[5].w-200, win[3].h-40, 4)
  love.graphics.rectangle("fill", 8, 31, win[5].w-200, win[3].h-40)
  drawDownBox(267, 31, win[5].w-277, win[3].h-40, 4)
  love.graphics.rectangle("fill", 267, 31, win[5].w-277, win[3].h-40)
  love.graphics.setFont(pixeloperators)
  love.graphics.setColor(colors.font.dark)
  love.graphics.printf(
  "This game functions like a parody of the Windows 98 operating system, with " ..
  "similarly styled programs and such. Using your antivirus, you fend off " ..
  "different computer viruses whose sole purpose is to destroy your computer. If you can't beat them in time, you lose! " ..
  "To control the antivirus, you drag it around " ..
  "like you would a window on your computer, and press the fire button to shoot " ..
  "your enemies! The health bar on the bottom indicates the viruses health, and the timer " ..
  "displays how much time is left. A difficulty setting is present in the settings menu, " ..
  "if you are finding it too challenging/easy. To activate the fight, follow the instructions from " ..
  "your best friend, in the chat window. Good luck, and have fun!",
  11,34,win[5].w-205,"left"
  )
  love.graphics.printf(
  [[Created By
  Chris B.

  Created With
  Love2D, Blender, GIMP, Audacity, and Atom

  Music
  ‘Thrills And Spills’ By Jay Man - OurMusicBox
  ‘Storm Chasers’ By Silent Partner

  Sound Effects
  Freesound.org and the Youtube Audio Library]],
  268,34,win[5].w-284,"center"
  )
  love.graphics.setFont(pressstart)
end
