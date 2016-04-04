function loadAssets()
  icons = {}
  icons[32] = {
    chat = love.graphics.newImage("assets/icon_32_chat.png"),
    internet = love.graphics.newImage("assets/icon_32_internet.png"),
    files = love.graphics.newImage("assets/icon_32_files.png"),
    file = love.graphics.newImage("assets/icon_32_file.png"),
    help = love.graphics.newImage("assets/icon_32_help.png"),
    antivirus = love.graphics.newImage("assets/icon_32_antivirus.png"),
    settings = love.graphics.newImage("assets/icon_32_settings.png")
  }
  icons[16] = {
    chat = love.graphics.newImage("assets/icon_16_chat.png"),
    internet = love.graphics.newImage("assets/icon_16_internet.png"),
    files = love.graphics.newImage("assets/icon_16_files.png"),
    help = love.graphics.newImage("assets/icon_16_help.png"),
    settings = love.graphics.newImage("assets/icon_16_settings.png"),
    antivirus = love.graphics.newImage("assets/icon_16_antivirus.png")
  }
  desktop = {}
  desktop.bg = {
    hills = love.graphics.newImage("assets/bg_hills.jpg"),
    coast = love.graphics.newImage("assets/bg_coast.jpg"),
    cloud = love.graphics.newImage("assets/bg_cloud.jpg"),
    flower = love.graphics.newImage("assets/bg_flower.jpg"),
    city = love.graphics.newImage("assets/bg_city.jpg")
  }
  music = {
    battle1 = love.audio.newSource("assets/music/Thrills And Spills.ogg"),
    battleNSA = love.audio.newSource("assets/music/Less Than Three.ogg"),
    battleUndertale = love.audio.newSource("assets/music/Alphys Takes Action.ogg"),
    battle2 = love.audio.newSource("assets/music/Skyscraper Party.ogg"),
    sad1 = love.audio.newSource("assets/music/Startup Ambiance.ogg"),
    battle3 = love.audio.newSource("assets/music/Without Silence.ogg"),
    fox = love.audio.newSource("assets/music/FOX.ogg"),
    tension1 = love.audio.newSource("assets/music/Storm Chasers.ogg")
  }
  sound = {
    boot = love.audio.newSource("assets/boot.ogg")
  }
  sound.boot:setLooping(false)
  music.battle1:setLooping(true)
  music.battle2:setLooping(true)
  music.battleNSA:setLooping(true)
  music.battleUndertale:setLooping(true)
  window = {
    bar = love.graphics.newImage("assets/win_bar.png"),
    barGrey = love.graphics.newImage("assets/win_bar_grey.png")
  }
  chat = {
    online = love.graphics.newImage("assets/chat_status_online.png"),
    offline = love.graphics.newImage("assets/chat_status_offline.png"),
    profile = love.graphics.newImage("assets/chat_profile.png")
  }
  internet = {
    back = love.graphics.newImage("assets/internet_back.png"),
    freedownloads1 = love.graphics.newImage("assets/internet_freedownloads.png"),
    freedownloads2 = love.graphics.newImage("assets/internet_freedownloads2.png"),
    welcome = love.graphics.newImage("assets/internet_welcome.png"),
    error = love.graphics.newImage("assets/internet_error.png")
  }
  notification = {
    bubble = love.graphics.newImage("assets/notification.png"),
    sound1 = love.audio.newSource("assets/notification1.ogg"),
    sound2 = love.audio.newSource("assets/notification2.ogg")
  }
  v1 = {
    intro = love.audio.newSource("assets/virus1intro.ogg"),
    scorch = love.graphics.newImage("assets/virus_scorch.png")
  }
  v1.c = {}
  v1.c.idle = {}
  v1.c.idle.fs = {}
  v1.c.idle.pic = love.graphics.newImage("assets/virus1_idle.png")
  v1.c.idle.f = 1
  loadAnimation(v1.c.idle.pic, v1.c.idle.fs, 98, 10, 200, 200)
  v1.c.monitorspin = {}
  v1.c.monitorspin.fs = {}
  v1.c.monitorspin.pic = love.graphics.newImage("assets/virus1_monitorspin.png")
  v1.c.monitorspin.f = 1
  v1.c.monitorspin.x = 330
  v1.c.monitorspin.y = -200
  loadAnimation(v1.c.monitorspin.pic, v1.c.monitorspin.fs, 59, 6, 200, 200)
  v1.c.slime = {}
  v1.c.slime.fs = {}
  v1.c.slime.pic = love.graphics.newImage("assets/virus1_slime.png")
  v1.c.slime.f = 1
  v1.c.slime.x = 330
  v1.c.slime.y = 350
  loadAnimation(v1.c.slime.pic, v1.c.slime.fs, 26, 3, 50, 50)
  v1.c.shine = {}
  v1.c.shine.f1 = love.graphics.newImage("assets/shine1.png")
  v1.c.shine.f2 = love.graphics.newImage("assets/shine2.png")
  v1.c.shine.r1 = 0
  v1.c.shine.r2 = 0
  v1.c.shine.s1 = -30
  v1.c.shine.s2 = -40
  v1.c.shine.sm1 = true
  v1.c.shine.sm2 = true
  expl = {}
  expl.frames = {}
  expl.pic = love.graphics.newImage("assets/explosion.png")
  loadAnimation(expl.pic, expl.frames, 89, 9, 320, 240)
  expl.frame = 1
  expl.deb = {}
  expl.deb[1] = {}
  expl.deb[2] = {}
  expl.deb[3] = {}
  expl.deb[1].pic = love.graphics.newImage("assets/debris1.png")
  expl.deb[2].pic = love.graphics.newImage("assets/debris2.png")
  expl.deb[3].pic = love.graphics.newImage("assets/debris3.png")
end
function loadAnimation(pic, quad, frames, limit, w, h)
  local frame = 1
  for i=1,limit do
    local y = i
    for i=1,10 do
      if frame <= frames then
        quad[frame] = love.graphics.newQuad(i*w-w, y*h-h, w, h, pic:getDimensions())
        frame = frame + 1
      end
    end
  end
end
function playAnimation(ani, loop, x, y, r, s, xo, yo, sp)
  love.graphics.draw(ani.pic, ani.fs[math.floor(ani.f)], x, y, r, s, s, xo, yo)
  speed = (60/love.timer.getFPS())*sp
  if loop == true and #ani.fs <= ani.f then
    ani.f = 1
  elseif loop == false and ani.f >= #ani.fs then
  else
    ani.f = ani.f + speed
  end
end
