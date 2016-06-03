function loadWin(id, w, h, title, ico, ico16)
  win[id] = {}
  win[id].w = w
  win[id].h = h
  win[id].x = math.random(100, sys.w-win[id].w-100)
  win[id].y = math.random(10, sys.h-win[id].h-100)
  win[id].px = win[id].x
  win[id].py = win[id].y
  win[id].ex = true
  win[id].cvs = love.graphics.newCanvas(win[id].w, win[id].h)
  win[id].fd = false
  win[id].s = 0
  win[id].min = false
  win[id].miny = 0
  win[id].title = title
  win[id].layer = 0
  win[id].panel = 0
  win[id].oldlayer = 0
  win[id].hov = false
  win[id].hover = false
  win[id].update = true
  win[id].icon32 = ico
  win[id].icon16 = ico16
  win[id].exit = true
  win[id].bar = "grey"
  win[id].pan = 0
end
function loadIcon(id, x, y)
  icon[id] = {}
  icon[id].x = x
  icon[id].y = y
  icon[id].ico = win[id].icon32
  icon[id].layer = id
  icon[id].hl = false
  icon[id].cl = false
end
function loadVar()
  di = 0.75
  panel = {}
  panel.thick = 30
  panel.x = 0
  panel.y = 600-panel.thick
  panel.width = sys.width
  panel.height = panel.thick
  panel.s = {}
  panel.s.x = panel.x + 5
  panel.s.y = panel.y + 5
  panel.s.width = 65
  panel.s.height = 20
  panel.s.activate = false
  panel.s.dis = 185
  panel.b = {}
  test = false
  win = {}
  loadWin(1, 250, 400, "Chat", icons[32].chat, icons[16].chat)
  loadWin(2, 650, 550, "Internet", icons[32].internet, icons[16].internet)
  loadWin(3, 450, 400, "Files", icons[32].files, icons[16].files)
  loadWin(4, 200, 150, "Antivirus", icons[32].antivirus, icons[16].antivirus)
  loadWin(5, 450, 400, "Help", icons[32].help, icons[16].help)
  loadWin(6, 400, 550, "Settings", icons[32].settings, icons[16].settings)
  loadWin(7, 400, 400, "Image Viewer", nil, icons[16].image)
  loadWin(8, 400, 300, "Video Player", nil, icons[16].video)
  loadWin(9, 250, 150, "Music Player", nil, icons[16].music)
  win[4].crazy = false
  win[4].crazyLeft = false
  win[4].crazyUp = false
  icon = {}
  for i=1,6 do
    loadIcon(i, 10, 10+(90*i-90))
  end
  winOpen = true
  winHover = false
  minim = love.graphics.getHeight()+10
  start = {}
  start.cvs = love.graphics.newCanvas(250, 350)
  start.o = false
  start.p = false
  start.x = 0
  start.y = 600-30-350+2
  layer = {}
  layer.sentToFront = 0
  desktop.bg.current = 0
  antivirus.prog = 0
  antivirus.status = "Not Scanning"
  antivirus.scanning = false
  av = {}
  av.wings = 0
  av.gun = 0
  av.transform = false
  av.charge = 40
  av.fireb = false
  av.fire = false
  av.bullets = {}
  chat.status = 0
  chat.profilename = "Best Friend"
  colors = {}
  colors.win = {}
  colors.win.light = {220,220,220}
  colors.win.dark = {135,135,135}
  colors.win.normal = {192,192,192}
  colors.font = {}
  colors.font.dark = {50,50,50}
  colors.font.friend = {240,10,10}
  colors.font.you = {10,10,240}
  colors.font.light = {240,240,240}
  notify = {}
  notify.yes = false
  notify.title = ""
  notify.body = ""
  notify.op = 0
  notify.sound = false
  notify.x = sys.w-258
  notify.y = sys.h-135
  notify.timer = 0
  msg = {}
  msg.new = false
  msg.c = 1
  msg.msgs = {}
  msgs = {}
  internet.url = "www.homepage.com"
  internet.urlold = internet.url
  internet.urlc = internet.url
  internet.load = 0
  v1.yes = false
  v1.timer = 0
  v1.shakemin = 0
  v1.shakemax = 0
  v1.introplay = false
  v1.explodeintro = false
  v1.explodeintrotimer = 0
  v1.fightTimer = 60
  v1.turretTimer = 0
  v1.turretAbi = 0
  v1.spm = 1
  v1.abis = 1
  v1.left = false
  v1.shake = 0
  v1.shakex = 0
  v1.shakey = 0
  v1.explodeEndFrame = 1
  v1.complete = false
  v1.fightMinute = 5
  v1.c.x = 0
  v1.c.y = 0
  v1.c.s = 1
  v1.c.r = 0
  v1.c.xd = 0
  v1.c.yd = 0
  v1.c.spx = 0
  v1.c.spy = 0
  v1.c.sp = 1
  v1.c.angle = 0
  v1.c.load = false
  v1.c.eyex = 0
  v1.c.eyey = 0
  v1.c.eyetx = 0
  v1.c.eyety = 0
  v1.c.chat.time = 0
  v1.c.health = 100
  v1.msgs = {}
  v1.c.chat.next = false
  v1.c.chat.msgs = 1
  v1.c.chat.msg = ""
  v1.c.chat.sp = 0.5
  v1.c.chat.char = 0
  v1.turretTimer2 = 0
  v1.specialAbi = false
  v1.bulletSpeed = 0
  v1.specialAbiTime = 70
  expl.deb[1].x = 0
  expl.deb[1].y = 0
  expl.deb[1].ym = 5
  expl.deb[1].xm = -13
  expl.deb[1].r = math.rad(0)
  expl.deb[1].rm = math.rad(-2)
  expl.deb[2].x = 0
  expl.deb[2].y = 0
  expl.deb[2].ym = 7
  expl.deb[2].xm = 23
  expl.deb[2].r = math.rad(0)
  expl.deb[2].rm = math.rad(3)
  expl.deb[3].x = 0
  expl.deb[3].y = 0
  expl.deb[3].ym = 2
  expl.deb[3].xm = 10
  expl.deb[3].r = math.rad(0)
  expl.deb[3].rm = math.rad(1)
  expl.deb.load = false
  std = {}
  std[1] = {}
  std[1].title = "Baby"
  std[1].hl = false
  std[2] = {}
  std[2].title = "Easy"
  std[2].hl = false
  std[3] = {}
  std[3].title = "Normal"
  std[3].hl = true
  std[4] = {}
  std[4].title = "Hard"
  std[4].hl = false
  std[5] = {}
  std[5].title = "Insane"
  std[5].hl = false
  std[6] = {}
  std[6].title = "Impossible"
  std[6].hl = false
  stre = {}
  stre[1] = {}
  stre[1].title = "Native"
  stre[1].hl = true
  stre[2] = {}
  stre[2].title = "1280x720"
  stre[2].hl = false
  stre[3] = {}
  stre[3].title = "1920x1080"
  stre[3].hl = false
  stre[4] = {}
  stre[4].title = "1280x1024"
  stre[4].hl = false
  stre[5] = {}
  stre[5].title = "1440x900"
  stre[5].hl = false
  stre[6] = {}
  stre[6].title = "1366x768"
  stre[6].hl = false
  f = {}
  f.home = {}
  f.home[1] = {name="Documents",x=0,y=0,hl=false}
  f.home[2] = {name="Downloads",x=0,y=0,hl=false}
  f.home[3] = {name="Music",x=0,y=0,hl=false}
  f.home[4] = {name="Pictures",x=0,y=0,hl=false}
  f.home[5] = {name="Videos",x=0,y=0,hl=false}
  f.pictures = {}
  f.pictures[1] = {name="cat.jpg",x=0,y=0,hl=false}
  f.pictures[2] = {name="meme.png",x=0,y=0,hl=false}
  f.documents = {}
  f.music = {}
  f.music[1] = {name="chill.mp3",x=0,y=0,hl=false}
  f.music[2] = {name="rage.mp3",x=0,y=0,hl=false}
  f.videos = {}
  f.videos[1] = {name="wtf.avi",x=0,y=0,hl=false}
  f.videos[2] = {name="lol.avi",x=0,y=0,hl=false}
  f.downloads = {}
  files = f.home
  file = {}
  file.title = "/User/"
  file.p = false
  file.back = false
  picture.img = 0
  mplay = {}
  mplay.volx = 232
  mplay.volpx = mplay.volx
  mplay.volxmax = 10+38+38+38+108
  mplay.volxmin = 10+38+38+38
  mplay.voly = win[9].h-39
  mplay.drag = false
  mplay.m = 0
  mplay.p = false
end
function loadPre()
  love.graphics.setDefaultFilter("nearest", "nearest")
  love.graphics.setBackgroundColor(0, 0, 0)
  love.graphics.setNewFont()
  pressstart = love.graphics.newFont("fonts/pressstart.ttf", 12)
  pressstart:setFilter("nearest", "nearest")
  --pressstarts = love.graphics.newFont("fonts/pressstart.ttf", 10)
  --pressstarts:setFilter("nearest", "nearest")
  pixeloperatorb = love.graphics.newFont("fonts/pixel_operator/PixelOperator8-Bold.ttf", 16)
  pixeloperatorb:setFilter("nearest", "nearest")
  pixeloperator = love.graphics.newFont("fonts/pixel_operator/PixelOperator8.ttf", 16.5)
  pixeloperator:setFilter("nearest", "nearest")
  pixeloperators = love.graphics.newFont("fonts/pixel_operator/PixelOperator-Bold.ttf", 16)
  pixeloperators:setFilter("nearest", "nearest")
  love.graphics.setFont(pressstart)
  love.keyboard.setKeyRepeat(true)
  scene = 0
  loading = 0
  fade = 0
  loaded = false
  loadingId = 1
  time = 0
  fadeOpacity = 0
  sys = {}
  sys.s = 0
  sys.width = love.graphics.getWidth()
  sys.height = love.graphics.getHeight()
  sys.mouse = {}
  sys.mouse.p = {}
  sys.mouse.x = love.mouse.getX
  sys.mouse.y = love.mouse.getY
  sys.mouse.p.x = 0
  sys.mouse.p.y = 0
  sys.mouse.p.p = false
  sys.mouse.drag = false
  sys.w = love.graphics.getWidth()
  sys.h = love.graphics.getHeight()
  virus1Lose = 0
  virus1Pissed = false
end
function loadRe()
  loading = 0
  fade = 0
  loaded = true
  loadingId = 1
  time = 0
  fadeOpacity = 0
  v1.c.monitorspin.f = 1
  v1.c.monitorspin.x = 330
  v1.c.monitorspin.y = -200
  v1.c.monitorspin.sp = 0.4
  v1.c.slime.f = 1
  v1.c.slime.x = 330
  v1.c.slime.y = 350
  v1.c.shine.r1 = 0
  v1.c.shine.r2 = 0
  v1.c.shine.s1 = 0
  v1.c.shine.s2 = 0
  v1.c.shine.s = -25
  v1.c.shine.sm1 = true
  v1.c.shine.sm2 = true
  v1.c.shine.ct = 0
  v1.c.shine.opa = 255
  v1.c.idle.f = 1
  v1.turret[1] = {r=math.rad(30),x=0,y=0,rt=math.rad(30),t=0,tl=1}
  v1.turret[2] = {r=math.rad(15),x=0,y=0,rt=math.rad(15),t=0,tl=2}
  v1.turret[3] = {r=math.rad(-15),x=0,y=0,rt=math.rad(-15),t=0,tl=3}
  v1.turret[4] = {r=math.rad(-30),x=0,y=0,rt=math.rad(-30),t=0,tl=4}
  expl.frame = 1
  loadVar()
  loadDia()
  scene = 0
end
