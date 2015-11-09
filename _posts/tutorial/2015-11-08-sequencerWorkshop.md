---
layout: tutorial
date: 2015-10-21
title: Sequencer Workshop
category: tutorial
---

# Hello!

This is a tutorial that retroactively follows the workshop I taught in April 2014 at ITP on building an 8 step sequencer/oscillator. It is designed to fit on a 64 row breadboard with very little room to spare. There are many ways that it can be built, but organization and careful attention is required either way. This tutorial is a mixture of schematics, pictures of how I like to breadboard this circuit, and videos of the tests I performed.

## If you are unfamiliar...
...with navigating a breadboard or don't know the pin numbers and orientation of an IC package go read the following before continuing.

- [https://learn.sparkfun.com/tutorials/how-to-read-a-schematic](https://learn.sparkfun.com/tutorials/how-to-read-a-schematic)
- [https://learn.sparkfun.com/tutorials/integrated-circuits](https://learn.sparkfun.com/tutorials/integrated-circuits)
- [https://learn.sparkfun.com/tutorials/how-to-use-a-breadboard](https://learn.sparkfun.com/tutorials/how-to-use-a-breadboard)
- [https://www.nicolascollins.com](https://www.nicolascollins.com)

## Parts list:

- 555 timer :: x1
- 4017 decade counter :: x1
- 4093 quad NAND :: x2
- 10k potentiometers :: x9
- Light Dependent Resistor :: x8
- LED :: x8
- NPN Transistor (2n3904) :: x8
- 1uF Capacitor :: x16
- 10uF Capacitor :: x1
- 0.1uF Capacitor :: x1
- 10k Resistor :: x2
- 1k Resistor :: x2
- Audio Jack
- 64 Row Breadboard
- 9V battery and connector
- Red, Black, Yellow, Blue, and White hookup Wire

## Suggested Tools:

- Wire Strippers
- Wire Cutters
- Tweezers

I am not going to number arbitrary steps, but do not be fooled, this is a sequential process.

### Check your parts. Organize everything and get ready.

This is the breadboard, we are going to fill it.

![][1]{: class="img-responsive"}

bridge the power busses first so we have power and ground on both sides.

![][2]{: class="img-responsive"}

Install the 555 timer with Pin 1 in Row 2.

![][3]{: class="img-responsive"}

This is the Schematic of this portion of the circuit:

![][4]{: class="img-responsive"}

The 1k resistor is going from Pin 6 on the 555 to Row 1, and the middle pin of the potentiometer is connected to Row 1 and the other pin is connected to Row 3 (Pin 7). The rest should be self explanitory from the schematic and the image.
Once that it put together attach a 1k resistor and an LED to Pin 3 of the 555 (the output) to test and make sure it is working. The LED should blink fast and almost look solid when the pot is turned all the way up, and slow down when the pot is turned the other direction.

{% vimeo 93304106 %}

Next install the 4017 as close as possible to the 555. There shouldn't be any open rows between them. On the 4017, Pin 16 goes to VCC (power) and pin 8 goes to Ground which is not reflected in the schematic

![][5]{: class="img-responsive"}

Step number 8 (pin 9) is connected to the reset (pin 15). When pin 9 goes HIGH the chip resets to Step 1. It is possible to make the sequence shorter by setting a different step to the reset pin, or make it longer by chaining multiple 4017's together.

![][6]{: class="img-responsive"}

The output of the 555 (Pin 3), which is our master clock is connected to pin 14 of the 4017 (the clock input). 13 is connected to ground and the rest of the pins are either not used or our step outputs.
At this point we should be able to attach LED's to the step output of the 4017 and have them turn on and off in a sequence.

{% vimeo 93304117 %}

After we have tested that and made sure everything is working lets install the 4093 IC's.

![][7]{: class="img-responsive"}

They should also be as close as possible to the rest of the components. There will be a 1 row gap between the two. From now on I will refer to 4093 #1 as the one that is closest to the 4017 and 4093 #2 as the one that is further away. This is important for getting our oscillators and controls synced correctly.
Inside each 4093 are 4 NAND gates (hence the name Quad NAND Gate). We are using as a gatable oscillator. Each NAND gate will be the audio in one step of our sequencer.

![][8]{: class="img-responsive"}

On each NAND gate, 1 is the Gate. When it is pulled HIGH the osciallator turns on. When it is pulled LOW it will turn off. 2 is conneceted to ground through a 1uF capacitor. 3 is our audio output. A resistor (in our application it is a Light Dependant Resistor (it will be refered to as an LDR from now on)) bridges 2 and 3 and will control the pitch of our oscillator in this circuit.
The 4 NAND gates inside each 4093 are laid out like this:

![][9]{: class="img-responsive"}

Pins 1, 6, 9, and 12 are our gate inputs, which will connect to the outputs on the 4017. The pin connections are pretty self explanatory if you ponder it. The pin outputs of the 4017 in order from step 1 to step 8 are as follows: 3,2,4,7  10,1,5,6  ::  those will get connected to the gates of the two 4093's. On the 4017 Pins 3,2,4,7 get connected to 4093 #1 Pins 1,6,9,12 respectively and (on the 4017) Pins 10,1,5,6 get connected to 4093 #2 Pins 1,6,9,12.
This should look like this:

![][10]{: class="img-responsive"}

4093 #1 is done

![][11]{: class="img-responsive"}

4093 #2 is done

Next we attach 1uF capacitors between Pins 2, 5, 8, 13 and ground on each of the 4093's. It should look like this:

![][12]{: class="img-responsive"}

At this point we should be able to test to make sure the oscillators are making sound and gating on and off. Temporarily plug an LDR into Pins 2 and 3 on 4093 #2 and connect Pin 3 to an audio output and listen the result. It should beep at you and if you turn the pot connected to the 555 the rate of those beeps should change.

{% vimeo 93304134 %}

After that successful test, unplug that LDR and set it aside. We'll use it later. Next we're doing to preparation layout for the next steps.
on the top half of the breadboard starting from row 63, connect every 4th row to power down to row 34 AND starting on row 60, connect every 4th row to itself in a daisy chain down row 35. Connect Row 35 to Row 30, which should be connected to 10k Resistor connected to Ground. An additional step, which is useful but not pictured, is to connected Row 30 to Row 31 via a little tiny jumper wire. It will give us a little more room to work with later on.

![][13]{: class="img-responsive"}

What we are going to do next will make sense later on, but we must do it now. We are taking a wire and connecting Pins 2,5,8,13 of each 4093 (the ones with capacitors attached to them) and connecting them in order to to Rows 32 and then sequentially 4 Rows up for each oscillator. We will number our oscillators in the same way the Pins of the IC's are numbered (counter clockwise around the chip starting at the lower left). Oscillator #1 is the lower left of 4093 #1, Oscillator #2 is the lower right, Osc. #3 is upper Right, Osc. #4 is upper Left. Osc #5 is 4093#2 lower left, and so-on.

![][14]{: class="img-responsive"}

Once those wires are placed we will take Pins 3,4,10,11 of each 4093 and run wires to the empty row directly down (in number) from the yellow wires we just placed. We should do this in sequence as well, with Oscillator #8 being the furthest Right, and oscillator #1 being on the left.  We should use a different color here, because these are our Audio Outputs. I chose White. Effectively we are breaking out our LDR pitch control to be in a more useful place (directly across from the big expanse of open board that we are about to fill). We will be placing our LDR's shortly, but first we need to put in some capacitors for our DC blocking filter.

![][15]{: class="img-responsive"}

This is what we are building here. This is the schematic for each step of our sequencer. There is the NAND gate we've seen before. On the audio output is a capacitor which we are about to put in attached to a 10k resistor, which is already in place (on Row 30). This is a High Pass Filter. Here is why we need it. We are working with logic chips. They operate in the DC world. 0v is OFF, and in our case 9v is ON. They are binary operators, there is nothing else for them. We get square waves from them pulsating between 0 and 9v. Audio is a bipolar signal, which means it oscillates across the 0v in and out of the negative and positive. When each oscillator turns on, it briefly creates a tone and then the signal is pulled high to 9v. If we just connected all these outputs together without a filter, the output of every other oscillator would interfere with every other oscillator. The filter effectively isolates each oscillator and allows them to act as individual units.

![][16]{: class="img-responsive"}

We put the filtering capacitors between the White wire we put down and the Blue daisy chain we laid earlier. (the two Rows should be adjacent all the way down to row 31, directly next to the 10k resistor going to ground, creating the other half of our filter)

![][17]{: class="img-responsive"}

Now we can put in the 8 LDR's and test our oscillators again. The LDR's are connected to the adjacent White and Yellow wire connected to the 4093's.

![][18]{: class="img-responsive"}



![][19]{: class="img-responsive"}


To test the audio this time, plug your audio jack into row 30 or 31 (they should be connected by that tiny jumper we put in earlier). You should get results similar to the video below.
{% vimeo 93304139 %}
We have now completed the noise making portion of the circuit. Now is a good time to go take a break. Stretch, drink some water, look at something at least 20 ft away for at least 20 seconds. Next we are going to tackle the control portion of it, building dimming LED's using transistors and cute little blue pots.

![][20]{: class="img-responsive"}

We are going to place the transistors next. There are 8 of them and they are also placed every 4 Rows starting on the right side of the board. The first one goes in like this and the rest are the same, offset by 4 Rows. Emitter: Bottom Row 64, Base: Bottom Row 63, Collector: Top Row 63 (there should be a connection to VCC (power) on the same row). Place all 8 in this same configuration and then double check to make sure that they are right and follow the schematic above. Again, the Collector should be connected to Power at the top of the board.
Once you're sure those are right, put in the pots, starting on row 63. Put them as close as you can together, leaving one empty row between each (which should be filled by the emitter of the Transistor). The left pin of the pot should be connected to the Base of the Transistor.

![][21]{: class="img-responsive"}



![][22]{: class="img-responsive"}

Next take 8 pieces of black wire and connect the right pin of each pot to ground.
![][23]{: class="img-responsive"}


Then take those outputs from the 4017. (Remember the order. If you don't, it counts in order: 3-2-4-7-10-1-5-6) Connect the wiper (center pin) of each pot to each respective step output of the 4017 (furthest left pot is step #1, furthest right is step #8. This is correlate with the placement of your LDR's).

![][24]{: class="img-responsive"}

At this point neatness and organization is key to understand where everything is going and where it is coming from. Notice we used BLUE to connect to the Pot's. Now we are able to easily differentiate between the two different wires going from the same row at the 4017 to two different places. Also note how we wired and tested the 4093's before we buried them in wire going other places.
Next step. Connect the LED's. Look at the schematic. They will connect to the emitter of the Transistor (step #8 is Row 64) and ground (conveniently located at the pin of the Pot that is connected to ground). Note that the LED's are polarized. The long leg is positive and should be connected to the transistor. The short leg is ground. You know where that goes.

![][25]{: class="img-responsive"}



You'll get something that looks like this. PLEASE CHECK YOUR CONNECTIONS AGAIN! Make sure the LED's are connected correctly! Add power and test. It should look like this:

{% vimeo 93304147 %}

If you turn the pots all the way down the step will turn off. If you turn them up the LED will light and the step will turn on. The further up you turn the pot, the brighter the LED will get. Now you may have noticed that we have these LED's that blink in sequence, which we can adjust the brightness of. We also have these oscillators that have these light sensors which control pitch directly across from the aforementioned LED's. It doesn't take a very far leap to think, "Oh, if we pointed one at the other we might be able to do something interesting".
Lets try it.

{% vimeo 93304130 %}

I should iterate and re-iterate this too: YOUR AUDIO OUTPUT IS ON UPPER ROW 30. where the 10k resistor is going to ground. That is where your audio comes out. Connect that to a jack somewhere and you'll be golden.
If all this has worked you should feel like the coolest person in the world and you should buy me a beer. If this doesn't work, or you're having trouble with the instructions, or you got frustrated with my typo's or you have other complaints, please contact me and let me know I forgot to include something in my insanity.


[1]: /img/tutorial/seqworkshop/DSC05566-1024x509.jpg
[2]: /img/tutorial/seqworkshop/DSC05567-998x1024.jpg
[3]: /img/tutorial/seqworkshop/DSC05568-1024x682.jpg
[4]: /img/tutorial/seqworkshop/DSC05601-1024x887.jpg
[5]: /img/tutorial/seqworkshop/DSC05598-e1398814125651-719x1024.jpg
[6]: /img/tutorial/seqworkshop/DSC05572-1024x682.jpg
[7]: /img/tutorial/seqworkshop/DSC05575-1024x682.jpg
[8]: /img/tutorial/seqworkshop/DSC05600-e1398814150242-840x1024.jpg
[9]: /img/tutorial/seqworkshop/DSC05599-1024x961.jpg
[10]: /img/tutorial/seqworkshop/DSC05576-1024x682.jpg
[11]: /img/tutorial/seqworkshop/DSC05577-1024x682.jpg
[12]: /img/tutorial/seqworkshop/DSC05578-1024x682.jpg
[13]: /img/tutorial/seqworkshop/DSC05580-1024x682.jpg
[14]: /img/tutorial/seqworkshop/DSC05581-1024x682.jpg
[15]: /img/tutorial/seqworkshop/DSC05582-1024x682.jpg
[16]: /img/tutorial/seqworkshop/DSC05602-1024x1001.jpg
[17]: /img/tutorial/seqworkshop/DSC05583-1024x682.jpg
[18]: /img/tutorial/seqworkshop/DSC05585-1024x682.jpg
[19]: /img/tutorial/seqworkshop/DSC05586-1024x682.jpg
[20]: /img/tutorial/seqworkshop/DSC05589-1024x682.jpg
[21]: /img/tutorial/seqworkshop/DSC05591-1024x682.jpg
[22]: /img/tutorial/seqworkshop/DSC05593-1024x682.jpg
[23]: /img/tutorial/seqworkshop/DSC05594-1024x682.jpg
[24]: /img/tutorial/seqworkshop/DSC05595-1024x682.jpg
[25]: /img/tutorial/seqworkshop/DSC05597-1024x682.jpg