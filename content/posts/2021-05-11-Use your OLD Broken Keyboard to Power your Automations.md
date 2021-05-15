---
title: Use your OLD Broken Keyboard to Power your Automations
date: '2021-05-11'
draft: false
tags: &1
- iot
- keyboard
categories: *1
slug: use-your-old-broken-keyboard-to-power-your-automations
---

 Being used with the Scissor Keyboard on my Apple Macbook Pro for more than 7+ years i have become  a fan of these Keyboards. I have used the Wired and Wireless Magic Keyboards. All these keyboards last longer and more durable until you protect them with a proper cover. I lost some external keyboards as i failed to use a cover. These Apple keyboards are so costly and you can't repair them once something goes wrong. For sometime i was using the Karabiner Utility for MacOS to manage with the Broken Keys.
Later i decided to say Good Bye to these Apple Keyboard and went to Buy a DELL Keyboard which almost similar to the Chiclet Keys of Apple Keyboard. So now, what i do with these Apple Keyboard. I don't want to put in trash as most of the keys are working well. Earlier I was looking to build a one click Launch Pad to initiate/Trigger some of my Home Automations. Then i decided to use this Apple Keyboard (USB) connected to my Raspberry PI and control everything. Now i have 90+ buttons with various combinations to control the automations. 


All these key presses are captured through a python keyevent listener script which in turns detects the pressed key and runs appropriate script controlled through a NodeRed Flow.


Currently i have configured almost 10+ keys


0 => Shutdown Everything (Including PI)
1 => Switch on Work Laptop
2 => Switch on Bamboo Laptop
3 => Switch On Internet
4 => Switch on Study Light
M => Play my Favourite Music
E => Restart PI
Space bar => Play or Pause any Playing Music from Raspberry PI (Fored-Daapd)
N => Play my another Favourite Playist
K => Send my Daily thoughts to Kindle


```
PyKeyboard Listener Script
```


```
Key Action Script
```


Thanks for reading this Post




