function loadWin(id, w, h, title, ico, ico16)
  win[id] = {}
  win[id].x = math.random(10, 200)
  win[id].y = math.random(10, 200)
  win[id].w = w
  win[id].h = h
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
  sys = {}
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
  fade = 0
  fadeOpacity = 0
  scene = 1
  loading = 0
  antivirus = {}
  antivirus.prog = 0
  antivirus.status = "Not Scanning"
  antivirus.scanning = false
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
  msgs[1] = "Hey, Wazzup?"
  msgs[2] = "Did you hear the news?"
  msgs[3] = "New Duty of Call game!"
  msgs[4] = "It looks so cool!"
  msgs[5] = "Check it out!"
  msgs[6] = "Want to get it free?"
  msgs[7] = "Search this on the web:"
  msgs[8] = "www.freedownloads.com"
end
