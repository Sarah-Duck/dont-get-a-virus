function loadAssets(id)
  if id == 1 then
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
  end
  if id == 2 then
    icons[16] = {
      chat = love.graphics.newImage("assets/icon_16_chat.png"),
      internet = love.graphics.newImage("assets/icon_16_internet.png"),
      files = love.graphics.newImage("assets/icon_16_files.png"),
      help = love.graphics.newImage("assets/icon_16_help.png"),
      settings = love.graphics.newImage("assets/icon_16_settings.png"),
      antivirus = love.graphics.newImage("assets/icon_16_antivirus.png"),
      image = love.graphics.newImage("assets/icon_16_image.png"),
      video = love.graphics.newImage("assets/icon_16_video.png"),
      music = love.graphics.newImage("assets/icon_16_music.png"),
      document = love.graphics.newImage("assets/icon_16_document.png")
    }
  end
  if id == 3 then
    icons[48] = {
      imageFile = love.graphics.newImage("assets/icon_48_imagefile.png"),
      videoFile = love.graphics.newImage("assets/icon_48_videofile.png"),
      musicFile = love.graphics.newImage("assets/icon_48_musicfile.png"),
      downloadFile = love.graphics.newImage("assets/icon_48_downloadfile.png"),
      documentFile = love.graphics.newImage("assets/icon_48_documentfile.png")
    }
  end
  if id == 4 then
    desktop = {}
    desktop.bg = {
      hills = love.graphics.newImage("assets/bg_hills.jpg"),
      coast = love.graphics.newImage("assets/bg_coast.jpg"),
      cloud = love.graphics.newImage("assets/bg_cloud.jpg"),
      flower = love.graphics.newImage("assets/bg_flower.jpg"),
      city = love.graphics.newImage("assets/bg_city.jpg")
    }
    st = {}
    st[1] = {}
    st[1].title = "Default"
    st[1].hl = false
    st[2] = {}
    st[2].title = "Hills"
    st[2].hl = false
    st[3] = {}
    st[3].title = "Clouds"
    st[3].hl = false
    st[4] = {}
    st[4].title = "City"
    st[4].hl = false
    st[5] = {}
    st[5].title = "Flower"
    st[5].hl = false
    st[6] = {}
    st[6].title = "Coast"
    st[6].hl = false
  end
  if id == 5 then
    music = {
      battle1 = love.audio.newSource("assets/music/Thrills And Spills.ogg"),
      battleUndertale = love.audio.newSource("assets/music/Alphys Takes Action.ogg"),
      battle2 = love.audio.newSource("assets/music/Skyscraper Party.ogg"),
      sad1 = love.audio.newSource("assets/music/Startup Ambiance.ogg"),
      battle3 = love.audio.newSource("assets/music/Without Silence.ogg"),
      fox = love.audio.newSource("assets/music/FOX.ogg"),
      tension1 = love.audio.newSource("assets/music/Storm Chasers.ogg"),
      chill = love.audio.newSource("assets/music/How it Begins.ogg"),
      rage = love.audio.newSource("assets/music/Fight or Flight.ogg"),
      sophie = love.audio.newSource("assets/music/Close My Mouth.ogg"),
      ohyeah = love.audio.newSource("assets/music/Down N Dirty.ogg"),
      finale = love.audio.newSource("assets/music/Ich Grolle Nicht.ogg"),
      tension2 = love.audio.newSource("assets/music/Overturn.ogg")
    }
  end
  if id == 6 then
    sound = {
      boot = love.audio.newSource("assets/boot.ogg")
    }
    sound.boot:setLooping(false)
    music.battle1:setLooping(true)
    music.battle2:setLooping(true)
    music.tension2:setLooping(true)
    music.battleUndertale:setLooping(true)
  end
  if id == 7 then
    window = {
      bar = love.graphics.newImage("assets/win_bar.png"),
      barGrey = love.graphics.newImage("assets/win_bar_grey.png")
    }
  end
  if id == 8 then
    settings = {
      comp = love.graphics.newImage("assets/computer.png")
    }
    picture = {
      cat = love.graphics.newImage("assets/cat.jpg"),
      art = love.graphics.newImage("assets/art.jpg")
    }
    but = {
      play = love.graphics.newImage("assets/button_play.png"),
      pause = love.graphics.newImage("assets/button_pause.png"),
      back = love.graphics.newImage("assets/button_back.png"),
      stop = love.graphics.newImage("assets/button_stop.png")
    }
    but.but = but.pause
  end
  if id == 9 then
    chat = {
      online = love.graphics.newImage("assets/chat_status_online.png"),
      offline = love.graphics.newImage("assets/chat_status_offline.png"),
      profile = love.graphics.newImage("assets/chat_profile.png")
    }
    v2 = {}
    v2.pop = {}
    v2.pop.a = {}
    for i=1,10 do
      v2.pop.a[i] = love.graphics.newImage("assets/popup" .. i .. ".png")
    end
    v2.popshot = love.graphics.newImage("assets/popup_shot.png")
  end
  if id == 10 then
    internet = {
      back = love.graphics.newImage("assets/internet_back.png"),
      freedownloads1 = love.graphics.newImage("assets/internet_freedownloads.png"),
      freedownloads2 = love.graphics.newImage("assets/internet_freedownloads2.png"),
      welcome = love.graphics.newImage("assets/internet_welcome.png"),
      error = love.graphics.newImage("assets/internet_error.png"),
      utube = love.graphics.newImage("assets/internet_utube.png")
    }
  end
  if id == 11 then
    antivirus = {
      gun = love.graphics.newImage("assets/antivirus_turret_gun.png"),
      body = love.graphics.newImage("assets/antivirus_turret_body.png"),
      left = love.graphics.newImage("assets/antivirus_turret_leftwing.png"),
      right = love.graphics.newImage("assets/antivirus_turret_rightwing.png"),
      open = love.audio.newSource("assets/antivirus_open.ogg"),
      opengun = love.audio.newSource("assets/antivirus_open_gun.ogg"),
      laser = love.audio.newSource("assets/antivirus_laser.ogg"),
      bullet = love.graphics.newImage("assets/bullet_blue.png"),
      hit = love.audio.newSource("assets/antivirus_hit.ogg"),
      charge = love.graphics.newImage("assets/antivirus_charge.png")
    }
  end
  if id == 12 then
    notification = {
      bubble = love.graphics.newImage("assets/notification.png"),
      sound1 = love.audio.newSource("assets/notification1.ogg"),
      sound2 = love.audio.newSource("assets/notification2.ogg"),
      sound3 = love.audio.newSource("assets/notification3.ogg")
    }
    notification.sound1:setVolume(0.5)
    notification.sound2:setVolume(0.5)
  end
  if id == 13 then
    v1 = {
      intro = love.audio.newSource("assets/virus1intro.ogg"),
      shine = love.audio.newSource("assets/shine.ogg"),
      scorch = love.graphics.newImage("assets/virus_scorch.png"),
      scorchMask = love.graphics.newImage("assets/virus_scorch_mask.png"),
      shineplay = false,
      corner = love.graphics.newImage("assets/chat_bubble_corner.png"),
      cornerSpike = love.graphics.newImage("assets/chat_bubble_cornerspike.png"),
      turret1 = love.graphics.newImage("assets/virus1_turret.png"),
      turret2 = love.graphics.newImage("assets/virus1_turret2.png"),
      turret2Held = love.graphics.newImage("assets/virus1_turret2_held.png"),
      shipFront = love.graphics.newImage("assets/virus1_ship_front.png"),
      shipBack = love.graphics.newImage("assets/virus1_ship_back.png"),
      rumbleLoop = love.audio.newSource("assets/rumble_loop.ogg"),
      tent1 = love.graphics.newImage("assets/tentacle1.png"),
      tent2 = love.graphics.newImage("assets/tentacle2.png"),
      lidup = love.graphics.newImage("assets/v1_upper_eyelid.png"),
      lidlow = love.graphics.newImage("assets/v1_lower_eyelid.png")
    }
  end
  if id == 14 then
    v1.c = {}
    v1.c.chat = {}
    v1.fadeImg = love.graphics.newImage("assets/fade.png")
    v1.rumbleLoop:setLooping(true)
    v1.turret = {}
    v1.turret[1] = {r=math.rad(30),x=0,y=0,rt=math.rad(30),t=0,tl=1}
    v1.turret[2] = {r=math.rad(15),x=0,y=0,rt=math.rad(15),t=0,tl=2}
    v1.turret[3] = {r=math.rad(-15),x=0,y=0,rt=math.rad(-15),t=0,tl=3}
    v1.turret[4] = {r=math.rad(-30),x=0,y=0,rt=math.rad(-30),t=0,tl=4}
    v1.laserSound = love.audio.newSource("assets/virus1_laser.ogg")
    v1.laserSound:setVolume(0.6)
    v1.explosionSound = love.audio.newSource("assets/explosion.ogg")
    v1.bullets = {}
    v1.bullet = love.graphics.newImage("assets/bullet_green.png")
    v1.bulletRed = love.graphics.newImage("assets/bullet_red.png")
    v1.bulletYellow = love.graphics.newImage("assets/bullet_yellow.png")
    v1.c.idle = {}
    v1.c.idle.fs = {}
    v1.c.idle.pic = love.graphics.newImage("assets/virus1_idle_noeye.png")
    v1.c.pupil = love.graphics.newImage("assets/virus1_pupil.png")
    v1.c.eye = love.graphics.newImage("assets/eye_thing.png")
    v1.c.idle.f = 1
    loadAnimation(v1.c.idle.pic, v1.c.idle.fs, 98, 10, 200, 200)
    v1.c.monitorspin = {}
    v1.c.monitorspin.fs = {}
    v1.c.monitorspin.pic = love.graphics.newImage("assets/virus1_monitorspin.png")
    v1.c.monitorspin.f = 1
    v1.c.monitorspin.x = 330
    v1.c.monitorspin.y = -200
    v1.c.monitorspin.sp = 0.4
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
    v1.c.shine.s1 = 0
    v1.c.shine.s2 = 0
    v1.c.shine.s = -25
    v1.c.shine.sm1 = true
    v1.c.shine.sm2 = true
    v1.c.shine.ct = 0
    v1.c.shine.opa = 255
    v2.c = {}
    v2.c.idle = {}
    v2.c.idle.fs = {}
    v2.c.idle.pic = love.graphics.newImage("assets/virus2_idle.png")
    v2.c.pupil = love.graphics.newImage("assets/virus2_pupil.png")
    v2.c.idle.hands = love.graphics.newImage("assets/virus2_hands_idle.png")
    v2.c.idle.gunidle = love.graphics.newImage("assets/virus2_hands_gunidle.png")
    v2.c.idle.fist = love.graphics.newImage("assets/virus2_hands_fist.png")
    v2.c.idle.f = 1
    v2.c.cockgun = love.audio.newSource("assets/virus2_shotgun_cock.ogg")
    v2.c.fire = love.audio.newSource("assets/virus2_shotgun_fire.ogg")
    v2.c.cockgunplay = false
    loadAnimation(v2.c.idle.pic, v2.c.idle.fs, 37, 10, 250, 250)
    v2.c.idle.mask = {}
    v2.c.idle.mask.fs = {}
    v2.c.idle.mask.pic = love.graphics.newImage("assets/virus2_idle_mask.png")
    v2.c.idle.mask.f = 1
    loadAnimation(v2.c.idle.mask.pic, v2.c.idle.mask.fs, 37, 10, 250, 250)
  end
  if id == 15 then
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
  if id == 16 then
    video = {}
    video.attacktortoise = love.graphics.newVideo("assets/attacktortoise.ogv")
    loadVar()
    mask_effect = love.graphics.newShader[[
      vec4 effect (vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
        if (Texel(texture, texture_coords).rgb == vec3(0.0)) {
         discard;
        }
        return vec4(1.0);
      }
    ]]
  end
  if id == 17 then
    loadDia()
  end
  if id == 18 then
    bsod = {}
    bsod.pic = love.graphics.newImage("assets/bsod.png")
    pause.pic = love.graphics.newImage("assets/pause.png")
  end
  if id == 19 then
    loaded = true
  end
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
  if ani == v2.c.idle.mask then
    ani.f = v2.c.idle.f
  end
  if ani.fs[math.floor(ani.f)] ~= nil then
    love.graphics.draw(ani.pic, ani.fs[math.floor(ani.f)], x, y, r, s, s, xo, yo)
  end
  if loop == true and #ani.fs <= ani.f then
    ani.f = 1
  elseif loop == false and ani.f >= #ani.fs then
  else
    ani.f = ani.f + sys.s*sp
  end
end
