---
title: Google Cast and Apple Airplay - Behind the Scene
date: '2021-05-17'
author: Nirmal
template: post
draft: false
tags: &1
- cast
- airplay
categories: *1
slug: google-cast-and-apple-airplay-behind-the-scene
---



<img  src='/thumbnails/airplay-google-cast.jpg' style='--en-naturalWidth:851; --en-naturalHeight:315;' type='image/jpeg'/>


Casting Audio and Video from Smart Phones/Tablets are no more  a feature but it has become a necessity as users have multiple receiving clients (Smart TV, Wifi Speakers etc). In this post would like to share my thoughts on the most popular casting functionality on Android and iOS, the Google Cast and Airplay from Google and Apple respectively.

Miracast is also one of the popular technology mostly for Mirroring Video/Displays. But it has gained less traction on the Smart Phone users. I am not going into the details of the components but a high level view of these 2 technologies and how they dominate my usage on a daily basis.


Why not Bluetooth,, Bluetooth uses a limited range and its works well for the Audio and Small File ransfer. It's not the right choice for streaming Video Content. Moreover with 10m constraint, your bluetooth speaker stutter when you moving around your home with your source device.


### Behind the Curtain 

### Google Cast

- Needs to be in the same network
- Your device needs to handshake with the Chromecast Enabled Devices
- Once the Handshake is done, the receiving client starts pulling the media to play
- Chromecast Enabled Apps helps to Cast Content even when the Source Device goes offline.

We need to understand that Google Chromecast is a consumer product from google which uses the Google Cast Technology. This can be integrated by developers via SDK.

This means the Android App needs to integrate with the Cast SDK. The app communicates with the Cloud via the SDK and provides the Signed Secret Media Url. This Url will be received by the Cast Receivers and starts Playing the media Content. This is the reason once you cast the Media from a Cast Enabled Apps, the media will continue to play even after the Source Device is disconnected from the Wifi Network or It's powered down.


### Airplay

-  Works in the same Network
-  Your Device needs to take the burden and Push the Audio/Video Stream to the AirPlay Receivers
-  The Receivers needs to be always connected to the Source Device. This means when you device Powered Off due to battery drain, then the Airplay stops working.


### Chromecast Built In Devices

Google uses Proprietary technology for the casting through Chromecast. This means it's hard to reverse engineer these Software and Integrate in any of the devices. They need to Partner with Google to add support for this. That's the reason some companies promote their products with "Google Chromecast Built-in".


I have a Google Home Mini and Mi Android TV which i predominately use them to cast Audio/Video Content.  In the Google Home we have a feature called  "Cast Audio". This is similar to the Apple's AirPlay. This feature will Cast everything from your Source Device/SmartPhone to the Target Speakers. You can also Cast your Phone Display using this Technique. But you  will get  a message that the "This device is not optimized for Casting". Basically your device should be capable enough in performance for better Audio/Video experience. Otherwise there will be a Lag /latency while playing these contents.




### AirPlay Supported Devices

When Apple introduced Airplay in iOS Devices, it was supposed work only on the Apple TV and the Airplay Enabled Speakers (Audio Only). For Video, Apple TV is the only device supported and Apple wants everyone to Buy AppleTV to use AirPlay for Video Content. 		


I don't have an AirPlay enabled speakers. But the community had identified a way to crack the algorithm for the AirPlay and built a library called ShairPort-Sync. This can acts as a AirPlay Receiver which can be connected to a regular Speaker. This works great from all the Apple Devices (iOS, MacOS). The quality is also good and there is no much lag or latency.


I like AirPlay for quickly Streaming my Audio when i am using iOS Devices on the move inside the home. It's a pleasure to control the  Audio/Volume from any room using the iOS Remote App. I rarely mirror displays to Cast Devices as i noticed this heats up the source device due to heavy lifting and also video quality suffers. 


### Conclusion


Both these 2 Technologies works great and would love to see a unified casting technology which works across all platform seamlessly with support for multiple devices.  Until then Airplay and Chromecast going to rule the casting market and lot of utility Apps has emerged in the market using this technology.


