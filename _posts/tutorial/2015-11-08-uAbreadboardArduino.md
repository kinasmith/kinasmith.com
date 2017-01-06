---
layout: page
date: 2015-11-08
title: "µA Breadboard Arduino"
category: tutorial
---

## In which we put a ATmega328p on a breadboard and do fancy things to it

> In this tutorial we will be setting up an Atmel ATmega328p microcontroller in a breadboard, configuring it to run at 8mhz with the internal clock, and loading the Arduino Bootloader onto it. We will then talk briefly about Low Power operation and demonstrate an easy way to put the microcontroller to sleep at ~ 5 microamps of power consumption.

### The things you will need:

- Breadboard
- ATmega328p
- misc. jumper wire
- wire strippers/snippers
- AVR ISP programmer ([or an Arduino](http://arduino.cc/en/Tutorial/ArduinoISP){: target="_blank"})
- LED
- 10k resistor (optional)
- 0.1uF capacitor
- USB-Serial adapter (FTDI)

### Software you will need:

- Arduino IDE
- [This hardware config](http://arduino.cc/en/uploads/Tutorial/Breadboard.zip){: target="_blank"}
    + Create a hardware folder within your Arduino sketch folder (should be next to the libraries folder) 
    + Unzip this Breadboard.zip into the folder so that the structure looks like this:
    + /Arduino-sketch-folder/hardware/breadboard/
    + restart the Arduino IDE and you should see a new board definition.
    + This is just a super easy way to burn the correct fuses and burn the bootloader in one step.


### Collect your parts:

![](/img/tutorial/uabreadboardarduino/image-1_z.jpg){: class="img-responsive"}


#### Place your microcontroller

[![](http://www.pighixxx.com/test/wp-content/uploads/2014/11/atmega328.png){: class="img-responsive"}](http://www.pighixxx.com/test/wp-content/uploads/2014/11/atmega328.png){: target="_blank"}

- [The guy who made this illustration also has lots of great other ones](http://www.pighixxx.com/test/portfolio-items/atmega328/?portfolioID=337){: target="_blank"}
- [This is a great read about different IC packages](https://learn.sparkfun.com/tutorials/integrated-circuits/ic-packages){: target="_blank"}

![](/img/tutorial/uabreadboardarduino/image-3_z.jpg){: class="img-responsive"}


- Lets put the IC in the breadboard. Put pin 1 on row 10, that will give us a little room on either side to add things if we need to. 

![](/img/tutorial/uabreadboardarduino/image-4_z.jpg){: class="img-responsive"}


- Then lets add power and ground connections to the chip and bridge the power/ground of the breadboard.
    + As per the illustration above: 
    + pin 7 and 20 -> power, 
    + pin 8 and 22 -> gnd

![](/img/tutorial/uabreadboardarduino/image-5_z.jpg){: class="img-responsive"}


- Now that we have the chip connected, we can attach our programmer, the Arduino. 
    + this may look a little confusing at first, but it's pretty simple.
    + arduino pin 13 -> chip pin 19
    + arduino pin 12 -> chip pin 18
    + arduino pin 11 -> chip pin 17
    + arduino pin 10 -> chip pin 1 >>this is the reset pin
    + arduino 5v -> power bus
    + arduino gnd -> gnd bus
    + The nice thing about this setup is that the arduino will power the chip while it is being programmed.

![](/img/tutorial/uabreadboardarduino/screenShot_z.jpg){: class="img-responsive"}


jpg)

- Lets burn the fuses and upload the bootloader:
    + plug in the arduino
    + Open and upload the ArduinoISP firmware from the Example Sketches
    + Select the 'ATmega328 on breadboard' from tools -> Board:
    + Select 'Arduino as ISP' from tools -> programmer
    + make sure the correct Serial Port is selected and then from the tools menu, Burn Bootloader

![](/img/tutorial/uabreadboardarduino/image-6_z.jpg){: class="img-responsive"}


- Now that we have a bootloader on the chip, we can upload code to it over the Rx/Tx ports using an FTDI adapter.
    + Remove the ISP programmer (arduino UNO)
    + add a 0.1uF capacitor to pin 1 of the chip
    + add the following connections:
        * row 4 -> gnd
        * row 5 -> no connection
        * row 6 -> power
        * row 7 -> row 11 (this is pin 2, Rx of the chip)
        * row 8 -> row 12 (this is pin 3, Tx of the chip)
        * row 9 -> 0.1uF capacitor to row 10
    + Plug in the FTDI, a set of long headers helps with this
    + Plug an LED between pin 19 and ground, and it should be blinking.
- To upload code, it is just like a regular arduino now.
    + Select 'Arduino Pro Mini (3.3v 8mhz)' from the tools -> board
    + Select your FTDI serial port
- And you should be able to upload to the chip as a normal Arduino. Try the blink sketch to start.

![](/img/tutorial/uabreadboardarduino/image-8_z.jpg){: class="img-responsive"}


![](/img/tutorial/uabreadboardarduino/image-9_z.jpg){: class="img-responsive"}


### Low Power Operation

- Go download and install [the JeeLib libraries](https://github.com/jcw/jeelib){: target="_blank"}
- We can now replace the delay() function with the Sleepy function. Note the different syntax, and the single line of code at the top to engage the watchdog timer.

{% highlight c %}

#include <JeeLib.h>

int led = 13;
ISR(WDT_vect) { Sleepy::watchdogEvent(); } // Setup for low power waiting


void setup() {                
  pinMode(led, OUTPUT);     
}

void loop() {
  digitalWrite(led, HIGH); 
  Sleepy::loseSomeTime(2000);      // Instead of delay();
  //delay(2000);         
  digitalWrite(led, LOW);   
  Sleepy::loseSomeTime(5000);
//  delay(5000); 
}

{% endhighlight %}

If you test the current with a multi-meter, you will see a dramatic decrease in power consumption during the time that it's just waiting. 

![](/img/tutorial/uabreadboardarduino/image-10_z.jpg){: class="img-responsive"}




- delay power consumption, ~ 10mA

![](/img/tutorial/uabreadboardarduino/image-11_z.jpg){: class="img-responsive"}


- Sleepy power consumption, ~ 7 µA

### Further Reading:

- [Adventures in low lower land](https://www.sparkfun.com/tutorials/309){: target="_blank"}
- [Jeelabs](http://jeelabs.org/){: target="_blank"}
- [Low Power Library](http://www.rocketscream.com/blog/2011/07/04/lightweight-low-power-arduino-library/){: target="_blank"}
