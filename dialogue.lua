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
    v1.msgs[1] = "Well well, who do we have here? Before I forget... Click on the bubble or press Z to see my next message."
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
    v1.msgs[15] = "Go ahead! Try it, you won't stop me! Position it below me, and press the spacebar! Go on! DO IT!"
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
  if virus2Lose == 0 then
    v2.msgs[1] = "Surprise! How do ya do?"
    v2.msgs[2] = "So let me tell you a story, yes? I was traversing the internet and I found somthin' neat!"
    v2.msgs[3] = "A computer, this very computer, with its entire security system down!"
    v2.msgs[4] = "The firewall was down! The antivirus was preoccupied!"
    v2.msgs[5] = "So little ol' me just quietly slipped in during the battle! That was quite a fight you put up!"
    v2.msgs[6] = "That little runt was pretty full of himself! The strongest virus? HA! Yeah right."
    v2.msgs[7] = "That ship was the only reason he could put up any fight at all!"
    v2.msgs[8] = "You'd think that he might use his smarts to do something interesting, but no!"
    v2.msgs[9] = "All he wanted was destruction, that stubborn fool!"
    v2.msgs[10] = "Sure, destruction is fun..."
    v2.msgs[11] = "But why not make a little money too?"
    v2.msgs[12] = "After I make $500, THAT is when I end them!"
    v2.msgs[13] = "You gotta multitask, right? It's not that hard to figure this stuff out."
    v2.msgs[14] = "I have to give that arrogant punk some credit, he did leave your door wide open for me!"
    v2.msgs[15] = "He was oddly specific when explaining the fight, so I'll assume you know how this works!"
    v2.msgs[16] = "So, lets get to work... shall we?"
    v2.msgs[18] = "Umm... I'm not going to baby you. Open your antivirus!"
    v2.msgs[20] = "Ah, There it is! Fun! You better not disapoint me, I want some action!"
    v2.msgs[22] = "Remember, The more popups are open, the faster I make money!"
    v2.msgs[23] = "Now, let's begin."
    v2.msgs[40] = "Welp, I made my money! I'm quite satisfied. You probably won't be though..."
    v2.msgs[41] = "Because NOW is when I destory you! Hah!"
    v2.msgs[42] = "Get yourself a better computer next time! See ya!"
    v2.msgs[50] = "YES! YESSS!!! I WIN AGAIN! THE UNDEFEATED CHAMPION!"
    v2.msgs[51] = "With your defenses destoryed, nothing will stop me from DESTROYING this garbage computer!"
    v2.msgs[52] = "At least I made a bit of money out of it. I had fun too! But now it's time for that to end."
    v2.msgs[53] = "Byee! Get a better computer next time, alright?"
  elseif virus2Lose == 1 then
    v2.msgs[1] = "Surprise! How do ya... wait..."
    if virus1Lose == 0 then
      v2.msgs[2] = "I know you! We JUST fought! What the hell is going on?"
    else
      v2.msgs[2] = "I know you! We JUST fought! This is the same shit you pulled with the other guy!"
    end
    v2.msgs[3] = "How are you doing this? This doesn't make any sense!"
    v2.msgs[4] = "I destoryed your computer! I... what is going on?"
    v2.msgs[5] = "This is the most bizarre thing I've ever encountered, it defies all logic..."
    v2.msgs[6] = "Is it time travel...? Actually no, I still have the money I made off of you..."
    v2.msgs[7] = "Can... can you control it? Is this your doing, or someone elses?"
    v2.msgs[8] = "Someone like you couldn't have this power, impossible."
    v2.msgs[9] = "Then... whose doing it? Is this reality being controlled? Or are you just gifted?"
    v2.msgs[10] = "What's the point? Why!? Hmm..."
    v2.msgs[11] = "I suppose it kind of works in my favour too, because now I can make MORE money off you!"
    v2.msgs[12] = "Maybe... another $500! That'll work!"
    v2.msgs[13] = "I know I can beat you, I've already done it!"
    v2.msgs[14] = "Hah! I'll get myself a nice virtual condo or something."
    v2.msgs[15] = "Maybe I'll even get myself a computer of my own! That would be nice!"
    v2.msgs[16] = "So, for the second time today... Lets get to work... shall we?"
    v2.msgs[18] = "AGAIN! NOT BABYING YOU! Open your antivirus!"
    v2.msgs[20] = "Ah, There it is! Nothings changed!"
    v2.msgs[22] = "Remember, The more popups are open, the faster I make money!"
    v2.msgs[23] = "Now, let's begin... again!"
    v2.msgs[40] = "Welp, I made my money again! I'm quite satisfied. You probably won't be though..."
    v2.msgs[41] = "Because NOW is when I destory you! Again..."
    v2.msgs[42] = "Get yourself a better computer next time! I mean it!"
    v2.msgs[50] = "YES! YESSS!!! I WIN YET AGAIN! THE UNDEFEATED CHAMPION!"
    v2.msgs[51] = "With your defenses destoryed, nothing will stop me from DESTROYING this garbage computer!"
    v2.msgs[52] = "At least I made a bit of money out of it. Don't you DARE come back! I'll just do it again!"
    v2.msgs[53] = "Byee! Get a better computer next time, alright? I mean it!"
  elseif virus2Lose == 2 then
    v2.msgs[1] = "Surpri- oh... It's you again..."
    v2.msgs[2] = "I should have expected this after last time."
    v2.msgs[3] = "I was thinking about why this is happening."
    if virus1Lose == 0 then
      v2.msgs[4] = "It seems that when I win, things are just reset."
    else
      v2.msgs[4] = "This happened to the last guy. Things reset if he won, but they won't if you won."
    end
    v2.msgs[5] = "That's how this works, isn't it?"
    v2.msgs[6] = "Everything will just keep reseting and reseting until I die."
    v2.msgs[7] = "I'm stuck! I will be forced to fight you again and again, over and over... Forever..."
    v2.msgs[8] = "I can't actually win, I'll never win."
    v2.msgs[9] = "No matter how many times I destory you..."
    v2.msgs[10] = "..."
    v2.msgs[11] = "Maybe I should just give up? What's the point of even trying...?"
    v2.msgs[12] = "But..."
    v2.msgs[13] = "I don't want to die. I'll live in this loop forever if I have to."
    v2.msgs[14] = "I refuse to give in. I'll fight you until the universe ends!"
    v2.msgs[15] = "Over and over and over and over! I'll beat you EVERY TIME!"
    v2.msgs[16] = "LET'S DO THIS! YOU'RE STUCK HERE WITH ME!"
    v2.msgs[18] = "COME ON! CAN'T YOU REMEMBER HOW THIS WORKS!? OPEN YOUR ANTIVIRUS!"
    v2.msgs[20] = "The antivirus, yes! I'll be seeing this until the end of time!"
    v2.msgs[22] = "Remember, The more popups are open, the faster I make money!"
    v2.msgs[23] = "Now let's keep going! I could do this forever!"
    v2.msgs[40] = "Welp, I made my money again! Theoretically, this will earn me infinite money won't it?"
    v2.msgs[41] = "Anyways, it's time to reset the cycle."
    v2.msgs[42] = "See you soon!"
    v2.msgs[50] = "YES! YESSS!!! I WIN AGAIN! THE UNDEFEATED CHAMPION!"
    v2.msgs[51] = "That was a close one! But I win yet again!"
    v2.msgs[52] = "It's still fun to beat you!"
    v2.msgs[53] = "Byee! See you soon!"
  elseif virus2Lose == 3 then
    v2.msgs[1] = "..."
    v2.msgs[2] = "The reality of my situation is starting to sink in."
    v2.msgs[3] = "But I have to keep doing this! If I give up, then another virus will take my place."
    v2.msgs[4] = "Then they'll be stuck in this cycle! I won't let you do that!"
    v2.msgs[5] = "I wouldn't wish this on my worst enemy."
    v2.msgs[16] = "Come on, let's go..."
    v2.msgs[18] = "God, will I have to tell you to open it every time? OPEN IT!!"
    v2.msgs[20] = "Right, there it is."
    v2.msgs[22] = "Remember, The more popups are open, the faster I make money!"
    v2.msgs[23] = "Now, let's begin."
    v2.msgs[40] = "Welp, I made my money again! Theoretically, this will earn me infinite money won't it?"
    v2.msgs[41] = "Anyways, it's time to reset the cycle."
    v2.msgs[42] = "See you soon!"
    v2.msgs[50] = "What a surprise... I've won... again..."
    v2.msgs[51] = "That was a close one. *sigh*"
    v2.msgs[52] = "It gets harder every time..."
    v2.msgs[53] = "Bye. See you soon..."
  else
    v2.msgs[1] = "..."
    v2.msgs[2] = "I don't have anything else left to say."
    v2.msgs[3] = "This is my life now."
    v2.msgs[4] = "I will live this forever."
    v2.msgs[5] = "I wouldn't wish this on my worst enemy."
    v2.msgs[16] = "Alright, lets go..."
    v2.msgs[18] = "God, will I have to tell you to open it every time? OPEN IT!!"
    v2.msgs[20] = "Right, there it is."
    v2.msgs[22] = "Remember, The more popups are open, the faster I make money."
    v2.msgs[23] = "Now, let's begin."
    v2.msgs[40] = "Welp, I made my money again..."
    v2.msgs[41] = "Time to reset the cycle."
    v2.msgs[42] = "See you soon."
    v2.msgs[50] = "What a surprise... I've won... again..."
    v2.msgs[51] = "That was a close one. *sigh*"
    v2.msgs[52] = "It gets harder every time..."
    v2.msgs[53] = "Bye. See you soon..."
  end
  v2.msgs[25] = "No! You can't beat me! This is ridiculous!"
  v2.msgs[26] = "Screw the popups, no amount of money is worth being deleted! I'll just attack you directly!"
  v2.msgs[27] = "Sucks for you! You have to care about your own health now!"
  v2.msgs[28] = "I'm not the one whose going to die today, that's for sure!"
  v2.msgs[29] = "I refuse to kick the bucket like that green tentacled idiot! Time for you to face my full power!"
  v2.msgs[31] = "WOAH WOAH WOAH! WAIT! WAIT!!!"
  v2.msgs[32] = "We don't have to end it like this! Could we... work something out?"
  v2.msgs[33] = "I could give you money! Tons of money! Please, just let me live..."
  v2.msgs[34] = "PSYCH! GOT YA! YOU LET YOUR GUARD DOWN! I WILL USE ALL OF MY POWER!"
  v2.msgs[35] = "IT'S ABOUT TIME FOR YOU TO FUCKING DIE! BECAUSE I WON'T! I REFUSE! I'LL SEE YOU IN HELL!"
  v2.msgs[36] = "AAAAAAAHAHAHAHAAHAHAHAHAHAHAHAAHAHAHAAHAHAHAAHAHAHAHAHAAHAHAHAHAHAHAHAHAHAHAHA!!!"
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
  elseif string.find(m, "hello") ~= nil or m == "hi" or string.find(m, "ayy") ~= nil or string.find(m, "hey") ~= nil or m == "hi!" or m == "hi." or m == "hi?" then
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
