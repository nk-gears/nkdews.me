---
title: Sheduled Power On and Power Off Socket Plug
date: '2021-05-11'
draft: false
tags: &1
- iot
- tuya
categories: *1
slug: sheduled-power-on-and-power-off-socket-plug
---



<img hash='f493a3a62136f113f03945eac1c7a093' src='/note/a76c16b1-057d-4d47-a90e-c181b1a0c4ef/img/f493a3a62136f113f03945eac1c7a093/smart-plug.jpg' style='--en-naturalWidth:851; --en-naturalHeight:315;' type='image/jpeg'/>

I was looking for a way to automate the process of Switching on the Main Switch for my Study Room. Initially i was looking for an Analog based solution. But later i realized these analog adapters are not that much flexible enough to modify or update them. Then i bought a Wifi Plug from Aliexpress which is based on the popular cloud based IOT Market Leader Tuya.


The major challenge with Tuya, they expose there APi's only to the Partners and Vendors who create Products using their Tuya Hardware Modules/SDks. For end-users there is no way to control the IOT Smart devices using a simple MQTT or HTTP Protocol. This means you need to always rely upon their IOS or Android App. But they do have an Integration with Alexa and Google assistant. So we can also control them using the Voice assistant devices or App. The one feature which is so powerful is the Schedule feature in the Tuya Smart Life App.


Before we go into details of the schedule feature i would like to share my current workflow in my Home of the Power Usage. I was more concerned about the Power usage and try to save as much as Possible. My Router, Plug Board, LED Study light all shares the Power from a Single 12v Adapter. I usually switch off the Internet and all connected peripherals at 10 PM. In the Morning i switch on around 6:30 AM. I thought i need to automate this schedule via the Wifi Plug and also would like to monitor the Power usage (units) which has been connected to the Study Room Mains.


Now the question is how do i switch on a Wifi Plug when there is no Wifi (Router is switched off till 6:30 AM). Even i have an assumption that these Wifi Plugs needs Wifi to schedule and i was thinking to create a Automatic Hotspot frommy Phone in the morning with the same SSID similar to the router. But later i realized, the Tuya Smart Life App schedule feature works even without a Wifi.


I used the schedule feature to power off at 10 PM and power on the mains switch at 6:30 AM and it worked flawlessly.


Usually these cloud based devices uses the MQTT protocol to listen for a message on a specific topic and triggers an event. But these Tuya devices seems have a integrated timer which auto invokes the functionality to switch on or off. There is one caveat with this feature. Since the wifi is not there at the time of switching on, the cloud status reports as OFF even though the switch is in ON state. This may be confusing but you can open the Tuya app and refresh to the see original state of the device.


Now the Auomated Schedue works well and i am also happy that i can able to measure all my power usage using this one main switch.


























