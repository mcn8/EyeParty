EyeParty
========

Control the colors of your entire computer using 3-dimensions (leapmotion) and music (microphone) on Mac OS X


EyeParty changes the colors on your screen by manipulating the gamma values of your display.

It works in two ways:

- It takes in input from your microphone and then uses that to change the colors of the screen subtly
- It takes in input from a LeapMotion controller in order to change the colors of the screen as intensely as you want
  You become the color conductor. Make a lightshow to go along to whatever music you're listening to. Or have no music and just play around however you want
  
Here's how it works:

The microphone brings in input using the EZAudio framework (https://github.com/syedhali/EZAudio) and the louder it is, the bigger the increase in sound.

The LeapMotion uses the difference between your hand's position in the current frame and the frame before it. The X direction changes the red value, the Y direction the green and the Z direction the blue.
