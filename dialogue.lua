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
    v1.msgs[23] = "Whatever. You had your chance! Now it's time to destory you!"
  else
    v1.msgs[23] = "I already played you're little games last time, and I won't fall for it again!"
  end
  if virus1Lose == 0 then
    v1.msgs[25] = "Ouch! It's stronger than I thought! No matter, because I have defenses of my own!"
  elseif virus1Lose ~= 0 then
    v1.msgs[25] = "I expected that. it hasn't changed since last time! Anyways, now for my part."
  end
  v1.msgs[26] = "Prepare youself for my UNIMAGINABLY DESTRUCTIVE POWER!"
  v1.msgs[27] = "Also, my giant battleship with multiple turrets."
  if virus1Lose == 0 then
    v1.msgs[30] = "What do you think? I made it myself! It's made from the numerous computers I have DESTORYED!"
  elseif virus1Lose == 1 then
    v1.msgs[30] = "One nice benefit of you restarting everything is that I get my ship back! Ha!"
  elseif virus1Lose >= 2 then
    v1.msgs[30] = "Here's my ship again, I know you've already seen it."
  end
  v1.msgs[31] = "These green lasers don't actually harm you, they take away your weapons charge!"
  v1.msgs[32] = "The blue lasers hurt you, the red lasers cause you to stop dragging around the window!"
  v1.msgs[33] = "Finally, the yellow lasers cause the window to spasm out of control until you catch it!"
  v1.msgs[34] = "It'll only take me 5 minutes to take over this computer, and you won't have the chance to shoot me!"
  v1.msgs[35] = "Now, it's time to get wriggity wriggity rekt son!"
  v1.msgs[37] = "NO! MY SHIP! I WORKED REALLY HARD ON THAT! IT'LL TAKE WEEKS TO GET ALL THE PARTS AGAIN!"
  v1.msgs[39] = "I WILL STILL DESTROY YOU! We'll just have to do it the old fasioned way!"
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
  v1.msgs[46] = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH!!!!!!!!!!!!!!!!!!!!!!"
  if virus1Lose <= 1 then
    v1.msgs[50] = "AAAAHAHAHAH! I WIN YET AGAIN! ANOTHER COMPUTER, DOMINATED BY ME!!! AAAAAHAHAHA!!!"
    v1.msgs[51] = "I WIN! YOU LOSE! JUST LIKE IT'S MEANT TO BE! JUST LIKE IT ALWAYS WILL BE!"
    v1.msgs[52] = "AND FOR THE GRAND FINALE, YOUR COMPUTER IS DESTORYED! HAHAHA!!!"
  elseif virus1Lose >= 2 then
    v1.msgs[50] = "Yaddah Yaddah Yaddah, I win... Blah blah blah, you lose."
    v1.msgs[51] = "Seriously! I won, okay?! Stop being such a sore loser by reseting everything!"
    v1.msgs[52] = "Just fuck off!"
  end
end
