---
title: Home Music Setup
date: '2021-05-11'
author: Nirmal
template: post
draft: false
tags: &1
- music
- home
categories: *1
slug: home-music-setup
---

In this Post i would like to share my Music Setup in my Home which is controlled through a Raspberry PI.


### Music Sources :

- 16GB Pen Drive (mp3 files) attached to Raspberry PI
- Managed using forked-daapd


### Music Outputs 

- Sublime Bluetooth Speaker (AUX)
- Google Home Mini (BTH)
- Alexa Echo Dot
- Logitech Speakers


### Network Stream/Connectivity Mode 

- Airplay (from iOS Devices) (Airplay running on Raspberry PI using Shairplay)
- Chromecast (from Apps - Mostly Android)
- Direct Cast Audio (from Android)
- Bluetooth Mode
- Direct Connection via Stereo Pin


### Apps 

- Daap Client for iOS  (recently it was broken and not working anymore)
- iTunes Remote iOS App (remote control only)
- MacOS iTunes App Daap Library Access (Memory Exhaustive on Cataline. Stopped Using)
- Music Pump for Android ( Play and Download as Playlist) : Works Great
- ReTunes - Similar to iOS Remote App for Android



Earlier i was using the PogoPlug V4 to power my Music Library usig a 1 TB Harddisk. But the recent versions of forked-daapd failed to work with Debian. So switched to Raspberry PI raspbian to setup my Basic Music Collection with the 16 GB PenDrive.


The Airplay Server on raspberry PI sends the Output via a ExternalUSB Sound Card (cheaper basic one). It works well with good amplication. This mean i can easily play any audio from iPhone or IPad.


Thanks for reading.




