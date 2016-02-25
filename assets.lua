function loadAssets()
  icons = {}
  icons[32] = {
    chat = love.graphics.newImage("assets/icon_32_chat.png"),
    internet = love.graphics.newImage("assets/icon_32_internet.png"),
    files = love.graphics.newImage("assets/icon_32_files.png"),
    file = love.graphics.newImage("assets/icon_32_file.png"),
    help = love.graphics.newImage("assets/icon_32_help.png"),
    torrentr = love.graphics.newImage("assets/icon_32_torrentr.png"),
    settings = love.graphics.newImage("assets/icon_32_settings.png")
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
end
