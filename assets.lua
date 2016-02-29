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
    battle2 = love.audio.newSource("assets/music/Less Than Three.ogg"),
    battle3 = love.audio.newSource("assets/music/Alphys Takes Action.ogg")
  }
  sound = {
    boot = love.audio.newSource("assets/boot.ogg")
  }
  sound.boot:setLooping(false)
  music.battle1:setLooping(true)
  music.battle2:setLooping(true)
  music.battle3:setLooping(true)
  window = {
    bar = love.graphics.newImage("assets/win_bar.png"),
    barGrey = love.graphics.newImage("assets/win_bar_grey.png")
  }
  chat = {
    online = love.graphics.newImage("assets/chat_status_online.png"),
    offline = love.graphics.newImage("assets/chat_status_offline.png"),
    profile = love.graphics.newImage("assets/chat_profile.png")
  }
end
