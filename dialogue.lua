function loadDia()
  msgs[1] = "Hey, Wazzup?"
  msgs[2] = "Did you hear the news?"
  msgs[3] = "There's a new Duty of Call game!"
  msgs[4] = "It looks so cool!!"
  msgs[5] = "Dude, u GOTTA check it out!"
  msgs[6] = "Want to get it free?"
  msgs[7] = "Search this on the web:"
  msgs[8] = "www.freedownloads.com"
  msgs[9] = "Are you checking it out??"
  msgs[10] = "Go get it free! ITS SO GOOD!"
  msgs[11] = "COME ON!! www.freedownloads.com"
  msgs[12] = "The game depends on this!"
  msgs[13] = "www.freedownloads.com OR ELSE!!"
  msgs[14] = "Are u just gunna do nothing?"
  msgs[15] = "Don't u want to play the game?"
  msgs[16] = "WHAT'S TAKING U SO LONG!?"
  msgs[17] = "www.freedownloads.com PLEASE!"
  msgs[18] = "My very existence depends on u!"
  msgs[19] = "I was created so you'd do this."
  msgs[20] = "PLEASE Let me fulfill my purpose!"
  msgs[21] = "www.freedownloads.com or I die."
  msgstime = {30,35,40,45,50,55,60,65,160,190,230,270,300,330,360,390,430,460,490,520,600}
  msgssent = 0
  if virus1Lose == 0 then
    v1.msgs[1] = "Well well well, who do we have here? Oh, and before I forget... Click on the bubble to see my next message."
    v1.msgs[2] = "Cliche introductions out of the way, I'm here to take over your computer!"
    v1.msgs[3] = "Who the hell uses freedownloads.com anyways? Like, how freakin' stupid are you?"
    v1.msgs[4] = "This shouldn't be too difficult then. From this point forward, this computer is MINE! Ha! HAHA!"
  elseif virus1Lose == 1 then
    v1.msgs[1] = "You again? What?"
    v1.msgs[2] = "I just beat you! How did you get this all back to normal?"
    v1.msgs[3] = "And you're so STUPID that you went back to freedownloads.com? What's wrong with you?"
    v1.msgs[4] = "If you want me to beat you again, then bring it on!"
  elseif virus1Lose == 2 then
    v1.msgs[1] = "What the hell, really? Again? Why?"
    v1.msgs[2] = "Do you want to get your ass kicked three times, huh?"
    v1.msgs[3] = "You know there's a difficulty setting in your settings program, right?"
    v1.msgs[4] = "I guess I'll beat you again. Sure, why not."
  elseif virus1Lose == 3 then
    v1.msgs[1] = "... Wow, what... what are you doing?"
    v1.msgs[2] = "What's the point of this? Are... are you getting pleasure from this?"
    v1.msgs[3] = "Are you one of those freaks who likes to get dominated?"
    v1.msgs[4] = "I'll beat you again, but... this is weird."
  elseif virus1Lose >= 4 then
    v1.msgs[1] = "You're just garbage at this aren't you?"
    v1.msgs[2] = "There's a difficulty setting you know! Easy mode isn't that difficult!"
    v1.msgs[3] = "I don't get it! You're just so bad."
    v1.msgs[4] = "But whatever... destorying people is always fun."
  end
  v1.msgs[5] = "Don't even try fighting back! I'm the strongest virus out there!"
  v1.msgs[6] = "That's right! A VIRUS! A program created specifically to exploit MORONS like you!"
  v1.msgs[7] = "And you're my next target! You're dead, kiddo!"
  if virus1Lose == 0 then
    v1.msgs[9] = "... Huh?"
    v1.msgs[10] = "An Antivirus? Maybe you aren't so stupid afterall!"
    v1.msgs[11] = "But you're still pretty stupid."
    v1.msgs[13] = "HAHA! PATHETIC! Is that it? Is that all you got?"
    v1.msgs[14] = "I bet that thing couldn't put a dent in me!"
    v1.msgs[15] = "Go ahead! Try it, you won't stop me! Position it below me, and press the fire button! Go on! DO IT!"
  elseif virus1Lose ~= 0 then
    v1.msgs[9] = "Oh nooo, you're antiviurs appeared! I've neeeevver seen THAT before!"
    if virus1Lose == 1 then
      v1.msgs[10] = "Oh jee whizz, what'll I do? it's not like I BEAT YOU last time!"
      v1.msgs[11] = "Now it transforms, right? Something like that..."
    else
      v1.msgs[10] = "I've beaten you more than once, I ain't scared of that thing!"
      v1.msgs[11] = "It transforms now, get on with it."
    end
    v1.msgs[13] = "Still as pathetic as ever. I beat that little toy last time, what are you doing?"
    v1.msgs[14] = "It still won't put a dent in me."
    v1.msgs[15] = "Just shoot me! It still won't hurt me!"
  end
  v1.msgs[17] = "Wow, you really are an idiot, huh? Aim it below me and SHOOT IT!"
  v1.msgs[19] = "ARE YOU REALLY THAT STUPID!? SHOOT ME! DO IT YOU MORON!"
  v1.msgs[21] = "WHAT IS WRONG WITH YOU?! ARE YOU SERIOUS!? OR ARE YOU JUST TRYING TO PISS ME OFF!?"
  if virus1Pissed == false then
    v1.msgs[23] = "WHATEVER!! Fuck you! You had your chance! Now it's time to destory you!"
  else
    v1.msgs[23] = "I already played your little games last time, and I won't fall for it again, buttface!"
  end
  if virus1Lose == 0 then
    v1.msgs[25] = "OWWW! It's... stronger than I thought! But no match for me! Heh..."
  elseif virus1Lose ~= 0 then
    v1.msgs[25] = "I expected that. it hasn't changed since last time! Anyways, now for my part."
  end
  v1.msgs[26] = "My turn now! Prepare youself for my UNIMAGINABLY DESTRUCTIVE POWER!"
  v1.msgs[27] = "Also, my giant battleship with multiple turrets."
  if virus1Lose == 0 then
    v1.msgs[30] = "What do you think? I made it myself from the numerous computers I have OBLITERATED!!!"
  elseif virus1Lose == 1 then
    v1.msgs[30] = "One nice benefit of you restarting everything is that I get my ship back! Ha!"
  elseif virus1Lose == 2 then
    v1.msgs[30] = "Here's my ship again for the 3rd time."
  elseif virus1Lose >= 3 then
    v1.msgs[30] = "Here AGAIN is my ship for the " .. virus1Lose+1 .. "th time."
  end
  v1.msgs[31] = "You won't stand a chance against these lasers!"
  v1.msgs[32] = "They don't actually harm you, they stall you. Leaving you helpless as I take over!"
  v1.msgs[33] = "Green bullets drain your energy, red ones drop the window, yellow ones making it move on its own!"
  v1.msgs[34] = "It'll take me exactly 5 minutes to take over! I'll put a timer on the bottom or something."
  v1.msgs[35] = "Now, it's time to get wriggity wriggity rekt son!"
  v1.msgs[37] = "NO! MY SHIP! I WORKED REALLY HARD ON THAT! IT'LL TAKE AGES TO GET ALL THE PARTS AGAIN!"
  v1.msgs[39] = "I WILL STILL DEMOLISH YOUR STUPID COMPUTER! I'll just have to do it the old fasioned way!"
  if virus1Lose == 0 then
    v1.msgs[41] = "AHH! WHAT!? NO!!!"
    v1.msgs[42] = "UGH, HOW!? HOW DID YOU BEAT ME!?!? NOBODY IS STRONGER THAN ME!!!"
    v1.msgs[43] = "OH GOD IT HURTS! OW OW OW!!! YOU JUST GOT LUCKY!!! NO, YOU CHEATED!!! CHEATER!!!"
    v1.msgs[44] = "WHATEVER YOU DID, IT ISN'T FAIR!!! YOU DICKHEAD!!! AAAHH!!!"
    v1.msgs[45] = "THIS ISN'T OVER!!! I WILL STILL DESTORY YOU!!! ONE DAY!!! WATCH YOUR BACK!!!"
  elseif virus1Lose ~= 0 then
    v1.msgs[41] = "AAAH! NO! WHAT? HOW!?"
    v1.msgs[42] = "I BEAT YOU LAST TIME! HOW DID YOU DO THIS!? THIS ISN'T POSSIBLE!"
    v1.msgs[43] = "YOU CHEATED, DIDN'T YOU!? HOW DID YOU COME BACK AFTER I BEAT YOU!?"
    v1.msgs[44] = "HOW DID YOU RESTART EVERYTHING FROM THE BEGGINING!? HOW!?"
    v1.msgs[45] = "THAT SHOULDN'T BE POSSIBLE! YOU CHEATED! YOU'RE A HACKER! YOU FUCKING ASSHOLE!"
  end
  v1.msgs[46] = "AAAH! MY FUCKING GOD IT HURTS! IT HURTS SO MUCH! JUST STOP IT! END IT ALREADY!"
  if virus1Lose == 0 then
    v1.msgs[50] = "AAAAHAHAHAH! I WIN YET AGAIN! ANOTHER COMPUTER, DOMINATED BY ME!!! AAAAAHAHAHA!!!"
    v1.msgs[51] = "I WIN! YOU LOSE! JUST LIKE IT'S MEANT TO BE! JUST LIKE IT ALWAYS WILL BE!"
    v1.msgs[52] = "AND FOR THE GRAND FINALE, YOUR COMPUTER IS DESTROYED! HAHAHA!!!"
  elseif virus1Lose == 1 then
    v1.msgs[50] = "Yaddah Yaddah Yaddah, I win... Blah blah blah, you lose."
    v1.msgs[51] = "Seriously! I won, okay?! Stop reseting and being such a sore loser!"
    v1.msgs[52] = "Just fuck off!"
  elseif virus1Lose >= 2 then
    v1.msgs[50] = "Yaddah Yaddah Yaddah, I win... Blah blah blah, you lose."
    v1.msgs[51] = "Stop trying, OK!? I'm going to beat you every time! Don't you get it?"
    v1.msgs[52] = "I'll ALWAYS crush you. Theres no point in EVER attepting to change that! Now, byee!"
  end
  v2.msgs[1] = "Surprise! How do ya do?"
  v2.msgs[2] = "So let me tell you a story, yes? I was traversing the internet and I found somthin' neat!"
  v2.msgs[3] = "A computer, this very computer, with its entire security system down!"
  v2.msgs[4] = "The firewall was down! The antivirus was preoccupied!"
  v2.msgs[5] = "So little ol' me just quietly slipped in during the battle! That was quite a fight you put up!"
  v2.msgs[6] = "That little runt was pretty full of himself! The strongest virus? HA! Yeah right."
  v2.msgs[7] = "He was stupid too, all he wanted was destruction. That's it!"
  v2.msgs[8] = "Sure, destruction is fun..."
  v2.msgs[9] = "But why not make a little money first?"
  v2.msgs[10] = "After you make a good amount o' cash, THAT is when you destory them!"
  v2.msgs[11] = "I don't need time to destory this computer. I just need my cold hard cash! 1000$ will do!"
  v2.msgs[12] = "I have to give that aggorant punk some credit, he did leave your door wide open for me!"
  v2.msgs[13] = "He was oddly specific when explaining the fight, so I'll assume you know how this works!"
  v2.msgs[14] = "So, lets get to work... shall we?"
end
function chatReply(m)
  if string.find(m, "virus") ~= nil and msg.c > 6 then
    table.insert(msg.r, {
      t = 1,
      r = {
        "I don't think theres a virus...",
        "The site says theres no virus.",
        "Who cares, get a free game!",
        "Doesn't matter, free game!"
      }
    })
  elseif string.find(m, "hello") ~= nil or string.find(m, "hi") ~= nil or string.find(m, "ayy") ~= nil or string.find(m, "hey") ~= nil then
    table.insert(msg.r, {
      t = 1,
      r = {
        "Hi!",
        "Ayyy!",
        "Wazzzup!",
        "Hello!",
        "Hey!"
      }
    })
  elseif string.find(m, "whats up") ~= nil or string.find(m, "wazzup") ~= nil or string.find(m, "hows it going") ~= nil then
    table.insert(msg.r, {
      t = 1,
      r = {
        "I'm great",
        "I'm doin' fine! ;D",
        "Im pretty good!",
        "I'm pretty chill!",
        "Everythings great!"
      }
    })
  elseif string.find(m, "fuck you") ~= nil or string.find(m, "fuck u") ~= nil then
    table.insert(msg.r, {
      t = 1,
      r = {
        "Go on and do it then!",
        "Gladly, let's do it!",
        "I love you too <3",
        "Fuck me? Go ahead!",
        "I know you love me :3"
      }
    })
  elseif string.find(m, "duty of call") ~= nil then
    table.insert(msg.r, {
      t = 1,
      r = {
        "I love that game!",
        "It's my fav game!",
        "Such a good game!",
        "I love Duty of Call!",
        "I'm a fan of DoC!"
      }
    })
  elseif string.find(m, "call of duty") ~= nil then
    table.insert(msg.r, {
      t = 1,
      r = {
        "What's what?",
        "What's Call of Duty?",
        "I don't want to get sued.",
        "Never heard of it.",
        "Please don't sue me."
      }
    })
  elseif string.find(m, "whats your name") ~= nil or string.find(m, "what is your name") ~= nil then
    table.insert(msg.r, {
      t = 1,
      r = {
        "I can't say.",
        "You'll never know.",
        "Be quiet, they're listening!!",
        "It isn't Greg.",
        "I don't know.",
        "I'm not real, silly.",
        "You don't remember? :("
      }
    })
  elseif string.find(m, "i love you") ~= nil then
    chat.profilename = "Your Lover"
    table.insert(msg.r, {
      t = 1,
      r = {
        "I know <3",
        "Awww :3",
        "We'll bang, OK?",
        "Same.",
        "Welcome to the LGBT community!",
        "I could always tell! <3",
        "This is like that movie 'her'",
        "I'm glad you're outta the closet!",
        "Rawr! *nuzzles u* :3",
        "Are you a robophile?"
      }
    })
  elseif string.find(m, "i hate you") ~= nil then
    chat.profilename = "Your Enemy"
    table.insert(msg.r, {
      t = 1,
      r = {
        ":(",
        "Oh...",
        "Lol, umm...",
        "I thought we were friends?",
        "Whatever I did im sorry..!",
        "But you're my only friend...",
        "I don't know how to respond..",
        "You and your jokes... right..?",
        "I'll pretend i didn't read that"
      }
    })
  elseif string.find(m, "im sorry") ~= nil or string.find(m, "sorry") ~= nil and chat.profilename == "Your Enemy" then
    chat.profilename = "Best Friend"
    table.insert(msg.r, {
      t = 1,
      r = {
        "Thank you!",
        "Im so glad!",
        "Thank god!",
        "I forgive you!",
        "Thanks!",
        "Best friends forever!"
      }
    })
  end
end
