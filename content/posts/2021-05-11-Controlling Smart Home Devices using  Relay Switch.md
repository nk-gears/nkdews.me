---
title: Controlling Smart Home Devices using  Relay Switch
date: '2021-05-11'
draft: false
tags: &1
- iot
- relay
categories: *1
slug: controlling-smart-home-devices-using-relay-switch
---

<b>
</b>


<hr/>In this post i would like to share how i created Smart Socket using a OLD Socket Buster.


<b>Prerequisites</b> 
- Any socket spike buster 
- Raspberry PI (running raspbian) 
- 4 Channel Relay Switch 
- 3 Metres Pair Wires.
<b>Connection Flow</b>


Relay Switch : 
Every relay switch comes with 2 modes NC and NO 
NO : Normally Open : Flow of current is Open : OFF State 
NC : Normally Closed : Flow of Current is Closed : ON State
                                            
                                                




                                                
                                                    
R1 : [ P ] [ O ] [ C ]
                                                
                                                    
R2 : [ P ] [ O ] [ C ]
                                                
                                                    
R3 : [ P ] [ O ] [ C ]
                                                
                                                    
R4 : [ P ] [ O ] [ C ]
                                            
                                                
                                        
                                            
<b>Voltage Wires for Relay Switch</b>


Ground 
vcc+ 
vcc-
<b>Raspberry Pi Pins :</b>


Signal Pins : 
Power Pins : 
<b>Controlling the GPIO using NodeRed</b>


Use the GPIO Node to Control the Signal ON and 
OFF. You can also use the IR MQTT to Control these Switches Using any Remote Controller Device. Please see my other Post on how to Setup remote (any remote)
<b>Spike Buster Connections</b> 
The objective is to connect the Spike Buster to the Electric Socket and use the 4 Ports using the Relay Switch and 2 Ports with th regular Power Supply.
                                            
                                                




                                                
                                                    
[R1]
                                                
                                                    
=
                                                
                                                    
|  ----------------NEGATIVE------------------> PoleNegative
                                                
                                                    
=  |=|  |=|  |=|  |=|
                                                
                                                    
[P1 N1] [P2, N2] [P3, N3] [P4,N4]
                                                
                                                    
                                                
                                                    
Here P1 will receive the current only when the R1 isin ON state.
                                            
                                                
                                        
                                            
When a GPIO Signal HIGH or LOW is activated in the Raspberry PI, it will send a signal to relay to switch ON or OFF respectively.




  	 K
