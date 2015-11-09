---
layout: default
modal-id: 11
date: 2015-10-21
img: song_logger.jpg
alt: image-alt
project-date: Spring 2013
title: Song Logger
caption: Song Logger
category: project
---
#Song Logger

#### *An autonomous audio recorder and weather station.*

This device was built for a USGS study on migrating birds in the boreal-arctic transistion zone in northern Alaska, an area projected to experience more pronounced climate related changes than most other regions. Populations of these migrating birds act as an indicator to monitor changes in climate and habitat.

This data logger records an audio survey of bird songs and weather data during the 3 month field season for later analysis, recording different populations of bird species as they arrive and leave the area.

<img src="img/portfolio/Ecotone.jpg" class="img-responsive">


Arctic and boreal ecosystems provide important breeding habitat for more than half of North America’s migratory birds as well as many resident species. Northern landscapes are projected to experience more pronounced climate-related changes in habitat than most other regions. These changes include increases in shrub growth, conversion of tundra to forest, alteration of wetlands, shifts in species’ composition, and changes in the frequency and scale of fires and insect outbreaks. Changing habitat conditions, in turn, may have significant effects on the distribution and abundance of wildlife in these critical northern ecosystems. - [source](https://alaska.usgs.gov/science/interdisciplinary_science/cae/boreal_arctic.php)

The USGS is developing a community-level understanding of ecosystem changes, and with its focus on the Boreal-Arctic transition zone, the work will elucidate wildlife-ecosystem relationships that could help forecast responses in regions farther north and farther south, as factors such as climate warming progress. The initial emphasis is on landbirds and shorebirds. These birds are useful indicators because they are widely distributed, samples are collected by similar methods, and they occupy a wide variety of habitats including wetlands, forests, and shrublands. Using this broad approach will help us understand the “what” and focus attention on the various “why” factors central to the Changing Arctic Ecosystem initiative. Projects in the Boreal-Arctic transition zone are (1) assessing existing population changes, (2) evaluating ecological drivers of population change, and (3) developing scenarios of future abundance and distribution within the boreal and Arctic coastal plain systems. - [source](https://alaska.usgs.gov/science/interdisciplinary_science/cae/index.php)

### Background

My friend and UAF Masters student, Molly McDermott, worked with one a USGS crew who were handling part of this study. An aspect of their data collection included setting up autonomous audio recording devices to record birdsongs of different species as they moved through the area. The audio was analyzed later in the lab and the data of different bird species, location, and time was inputed into a database.

### The Study Area

The study is taking place on the Seward Peninsula within a couple hundred miles of Nome.

{% gallery folder="/project/songlogger" %}
    P6210484 ""
    P6300506 ""
    P6170477 ""
    P7170544 ""
    OC_warbler ""
{% endgallery %}


### What I built

What I built was a redesign of the large and expensive data loggers the scientists currently use. It was solar powered, weighed less than 2 pounds (not including a mounting system), and the costs were less than $200. It was made with a customized digital voice recorder, a lavalier mic, and an array of sensors. This version had barometric pressure, humidity, temperature, and was capable of detecting wind speed and wind direction as well. All scheduling and weather data logging was done with an Arduino microcontroller.

{% gallery folder="/project/songlogger" %}
    IMG_20140420_155839 ""
    IMG_20140420_140736 ""
    IMG_20140420_134659 ""
    IMG_20140419_210131 ""
    IMG_20140419_204219 ""
{% endgallery %}



**Hardware**:
*- Arduino
- BMP180 Sensor
- EEPROM
- Digital Compass*  
**Fabrication**:
*- 3d printer
- Roland Modela
- Manual Lathe*  
**Software**:
*- Embedded C
- EagleCAD*