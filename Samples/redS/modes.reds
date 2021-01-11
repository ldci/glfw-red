Red/System [
	Title:		"GLFW Binding: modes"
	Author:		"François Jouen"
	Rights:		"Copyright (c) 2013 François Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]

;========================================================================
;
; This test enumerates or verifies video modes
; original program Copyright (c) Camilla Berglund <elmindreda@elmindreda.org>
;========================================================================


#include %../../lib/glfw3.reds


listModes: function [monitor [GLFWmonitor]
    /local c xpos ypos width height depth count modes pmodes nmodes p currentMode
    	dpi gamma] [
    xpos: declare pointer! [integer!]
    ypos: declare pointer! [integer!]
    width: declare pointer! [integer!]
    height: declare pointer! [integer!]
    count: declare pointer! [integer!]
    c: 1
    depth: 0
    p: glfwGetPrimaryMonitor
    
    
    print ["Name: " glfwGetMonitorName monitor]
    either (as c-string! p/value) = (glfwGetMonitorName monitor) [print " (Primary)"] [print " (Secondary)"]
    print [newline]
    glfwGetMonitorPos monitor xpos ypos
    glfwGetMonitorPhysicalSize monitor width height
    currentMode: glfwGetVideoMode monitor
    print ["Virtual position: " xpos/value " " ypos/value newline]
    dpi:  currentMode/width /  (width/value * 10 /  254 ) ; 2.54 cm for an inch
    print ["Physical size: "width/value " x " height/value " mm (" dpi " dpi)" newline]
    modes: glfwGetVideoModes monitor count          ; modes are in the array of count size
    pmodes: as [pointer![integer!]] modes           ; make a pointer to the array
    nmodes: count/value                             ; number of modes
    print [count/value " possible modes" newline]
    until [
        ; get the values
        depth: pmodes/3 * 3
         print [ c " : " pmodes/1 " x " pmodes/2 " x " depth " (" pmodes/3 " " pmodes/4 " " pmodes/5 ") " pmodes/6 " Hz"newline]
        ; increase pointer address to the element in the array  
        pmodes: pmodes + 6 ; 6 integer values
        c: c + 1
    c >  nmodes  
    ]
    print ["First Mode : " modes/width " " modes/height " " modes/redBits " " modes/greenBits " " modes/blueBits " " modes/refreshRate " Hz"newline]
    currentMode: glfwGetVideoMode monitor
    print ["Current Mode: " currentMode/width " " currentMode/height " " currentMode/redBits " " currentMode/greenBits " " currentMode/blueBits " " currentMode/refreshRate newline]
    gamma: glfwGetGammaRamp monitor
    print ["Current Gamma: " gamma/red/value " " gamma/green/value " " gamma/blue/value " "gamma/size newline]
    print [newline]
]


; main program


print newline

Print ["Red is talking to GLFW and OpenGL" newline]

t: glfwInit
if t = 1 [print "GLFW Library successfully initialized" newline]
print newline
print ["Time elapsed since GLFW Library initialization : " glfwGetTime newline]
print ["Version: " glfwGetVersionString newline]
nbMon: declare pointer! [integer!]  
cmonitors: glfwGetMonitors nbMon
; get the number of connected monitors (here 2) and  the array return by glfwGetMonitors

print ["Number of connected monitors: " nbMon/value newline]

print [cmonitors " " cmonitors + 4 newline]



print newline
i: 1
m: declare pointer![integer!]
until [
    m: as [pointer![integer!]] cmonitors/i
    
    listModes  m
    i: i + 1
i > nbMon/value     
]

glfwWaitEvents
print ["Time elapsed since GLFW Library initialization : " glfwGetTime newline]
glfwTerminate


