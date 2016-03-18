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
    fox = love.audio.newSource("assets/music/FOX.ogg")
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
  virus1 = {
    intro = love.audio.newSource("assets/virus1intro.ogg"),
    scorch = love.graphics.newImage("assets/virus_scorch.png")
  }
end
