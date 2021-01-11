# GLFW Binding for Red Language 
## [http://www.glfw.org/]()

## [http://www.red-lang.org/]()
 
This binding has been extensively tested with macOS Sierra, High Sierra, Mojave, and works fine under macOS. 
Please adapt path to libraries according your main OS.
This version can be used with glfw 3.2.0 library.
 
### This version requires red 0.6.4.

Have also a look here ([https://github.com/red/code/tree/master/Library/GLFW]()) for a similar lib developped by talented Red user.


## NEW VERSION JANUARY 2021
Compiled with Red 0.6.4 for macOS built 25-Dec-2020/0:08:25+01:00 commit #98f31b5

## Warning
You must use 32-bit version of dynamically linked libraries. 

### glfw3.reds 
The binding for Red/System.

### opgl.reds 

A  quick done binding to OpenGL to be used with Red since GLFW requires OpenGL.

### glu.reds 
Gives access to OpenGL Utility Toolkit.

## **
opgl.reds and glu.reds were done mainly for testing purpose and should be improved ASAP.
You can also use use Kaj de Vos's wrapping for opengl. 
(http://red.esperconsultancy.nl/Red-OpenGL/timeline)
## **

### Tools dir
Includes some useful libs
C-Library.reds  and math.reds  by Kaj de Vos (http://red.esperconsultancy.nl/Red-C-library/timeline).

###  Samples dir 
Includes some samples in Red and Red/System adapted from orignal codes in C.
