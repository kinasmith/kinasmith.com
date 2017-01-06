---
layout: page
date: 2015-11-08
title: How to build a quad gated oscillator NAND synthesizer
name: quadnand
category: tutorial
---
![][1]{: class="img-responsive img-centered"}


# Hello

Today we are going to be building a simple synthesizer using a 4093 quand NAND gate integrated circuit as the sound source. This tutorial is related closely to the more complicated workshop I taught making an 8 step sequencer using the same chips as the sound source which is [here]({{ site.url }}/itp/sequencer-workshop). So lets get started. If you are unfamiliar with navigating a breadboard or don’t know the pin numbers and orientation of an IC package go read the following before continuing. 

- [https://learn.sparkfun.com/tutorials/how-to-read-a-schematic](https://learn.sparkfun.com/tutorials/how-to-read-a-schematic)
- [https://learn.sparkfun.com/tutorials/integrated-circuits](https://learn.sparkfun.com/tutorials/integrated-circuits)
- [https://learn.sparkfun.com/tutorials/how-to-use-a-breadboard](https://learn.sparkfun.com/tutorials/how-to-use-a-breadboard)
- [https://www.nicolascollins.com](https://www.nicolascollins.com/)

## Parts List:
*   30 row breadboard: [digiKey](https://www.digikey.com/product-detail/en/TW-E40-510/438-1109-ND/2618532)
*   tactile switches, 4x: [digiKey](https://www.digikey.com/product-detail/en/1825910-6/450-1650-ND/1632536)
*   resistors 10k ohm, x5: --any electronics supplier
*   capacitors 1uF,  x8: --any electronics supplier
*   LDR, x4: [digikey](https://www.digikey.com/product-detail/en/PDV-P8103/PDV-P8103-ND/480610)
*   4903 quad NAND gate: [digiKey](https://www.digikey.com/product-detail/en/CD4093BE/296-2068-5-ND/67329)
*   1/8" audio jack: [digiKey](https://www.digikey.com/product-search/en?WT.z_header=search_go&amp;lang=en&amp;site=us&amp;keywords=CP1-3553NG-ND&amp;x=0&amp;y=0&amp;formaction=on) (this one specifically works really well in a breadboard)    

## Let's Begin!
You'll start with a bare breadboard below. I usually work with the lowest row numbers on the left, laid out like so.

![][2]{: class="img-responsive"}

You'll have a pile of parts, It is very helpful if they are put out in an organized manner like so. Stay organized and be intentional about what and why you do things. It helps especially as things get more complicated. 

![][3]{: class="img-responsive"}

Start by pairing the power and ground busses. 

![][6]{: class="img-responsive"}

And then we will set up some wiring for the audio jack. We're using a coloring convention that I am a fan of here. We're making our audio signals yellow, our control signals white, and power and ground red and black respectively. Again, staying organized, it makes everything easier. We're working with an mono signal so we are going to pair the two channels of the stereo jack (yellow wire from row 1 to 5), we're also making row 6 (on to the top AND bottom of the board) our audio bus. 

![][9]{: class="img-responsive"}

Next plug in the audio jack, the center pin going to ground (row 3), and the other two pins plugging into row 1 and 5. 

![][10]{: class="img-responsive"}

Then we add the 4093. Pin 1 goes into row 7 and is laid out like below. Also attach the power and ground. Power to pin 14, ground to pin 7, just like most of our CMOS logic chips. 

![][12]{: class="img-responsive"}

Next we add our four switches, starting on row 30 and working our way back with one row separating each switch (like the picture). These switches are connected internally so that the two left pins are connected together and the two right pins are connected together. This bridges the rows across the center channel, which makes some things easier in the future. 

![][16]{: class="img-responsive"}

We connect the right pins of the switches to power, and the left pins to ground through a 10k-OHM resistor. 

![][20]{: class="img-responsive"}

These switches will be connected to the gate inputs of the 4093. Pins 1, 6, 9, and 12. 

![][44]{: class="img-responsive"}

Connect the left side of the switches (the side that is connected to the 10k resistor to ground). Make these connections with white wire, signifying that these are control signals. Switch 1 (farthest left) to pin 1 on the 4093, and switch 2 to pin 6. 

![][22]{: class="img-responsive"}

Then connect switch 3 to pin 9, and switch 4 to pin 12 like shown below. 

![][25]{: class="img-responsive"}

Now we will begin connecting the oscillators. There is a schematic showing how each individual one is put together. This synth is simply four of these with their outputs connected together. 

![][43]{: class="img-responsive"}

Add the capacitors. We're using 1uF cap in this example, but if you increase the capacitance the frequency of the individual oscillator will drop. Experiment. The capacitors are attached between pins 2, 5, 8, and 13 and ground, respectively. 

![][29]{: class="img-responsive"}

Now we add the variable resistors, which will give use pitch modulation. They are LDR's or Light Dependent Resistors. Their name describes what they do. They are connected between pins 2 and 3, 5 and 4, 8 and 10, 13, and 11. 

![][34]{: class="img-responsive"}

![][35]{: class="img-responsive"}

Now all of our oscillators are connected and operational, but we need add a DC blocking filter to each oscillator bring the pulsating DC signal that they are producing to a workable audio signal. This begins with a 10k resistor connected between our audio bus (row 6) and ground. 

![][36]{: class="img-responsive"}
Then we add a 1uF cap between each audio output (rows 3, 4, 10, and 11) and the audio bus. 

![][41]{: class="img-responsive"}

Connect the battery (making sure the polarity is right) and press the button. You won't hear anything unless you've connected headphones or a speaker to the headphone jack. Be careful, it's loud. (+- 4.5 volts) 

![][42]{: class="img-responsive"}

If you're having trouble getting this to work, double check all your connections. If that doesn't work. Tear it all out and start over again. 

{% vimeo 100243753 %}

[1]: /img/tutorial/quadnand/gif.gif
[2]: /img/tutorial/quadnand/synth-1-e1404851585756.jpg
[3]: /img/tutorial/quadnand/synth-2.jpg
[4]: /img/tutorial/quadnand/synth-3.jpg
[5]: /img/tutorial/quadnand/synth-4.jpg
[6]: /img/tutorial/quadnand/synth-5.jpg
[7]: /img/tutorial/quadnand/synth-6.jpg
[8]: /img/tutorial/quadnand/synth-7.jpg
[9]: /img/tutorial/quadnand/synth-8.jpg
[10]: /img/tutorial/quadnand/synth-9.jpg
[11]: /img/tutorial/quadnand/synth-10.jpg
[12]: /img/tutorial/quadnand/synth-11.jpg
[13]: /img/tutorial/quadnand/synth-12.jpg
[14]: /img/tutorial/quadnand/synth-13.jpg
[15]: /img/tutorial/quadnand/synth-14.jpg
[16]: /img/tutorial/quadnand/synth-15.jpg
[17]: /img/tutorial/quadnand/synth-16.jpg
[18]: /img/tutorial/quadnand/synth-17.jpg
[19]: /img/tutorial/quadnand/synth-18.jpg
[20]: /img/tutorial/quadnand/synth-19.jpg
[21]: /img/tutorial/quadnand/synth-21.jpg
[22]: /img/tutorial/quadnand/synth-22.jpg
[23]: /img/tutorial/quadnand/synth-23.jpg
[24]: /img/tutorial/quadnand/synth-24.jpg
[25]: /img/tutorial/quadnand/synth-25.jpg
[26]: /img/tutorial/quadnand/synth-26.jpg
[27]: /img/tutorial/quadnand/synth-27.jpg
[28]: /img/tutorial/quadnand/synth-28.jpg
[29]: /img/tutorial/quadnand/synth-29.jpg
[30]: /img/tutorial/quadnand/synth-30.jpg
[31]: /img/tutorial/quadnand/synth-30.jpg
[32]: /img/tutorial/quadnand/synth-31.jpg
[33]: /img/tutorial/quadnand/synth-32.jpg
[34]: /img/tutorial/quadnand/synth-33.jpg
[35]: /img/tutorial/quadnand/synth-34.jpg
[36]: /img/tutorial/quadnand/synth-35.jpg
[37]: /img/tutorial/quadnand/synth-36.jpg
[38]: /img/tutorial/quadnand/synth-37.jpg
[39]: /img/tutorial/quadnand/synth-38.jpg
[40]: /img/tutorial/quadnand/synth-39.jpg
[41]: /img/tutorial/quadnand/synth-40.jpg
[42]: /img/tutorial/quadnand/synth-41.jpg
[43]: /img/tutorial/quadnand/synth-42.jpg
[44]: /img/tutorial/quadnand/synth-43.jpg