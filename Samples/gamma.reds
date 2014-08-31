Red/System [
	Title:		"GLFW Binding: gamma"
	Author:		"François Jouen"
	Rights:		"Copyright (c) 2013-2014 François Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]


;========================================================================
;
; This program is used to test the gamma correction functionality for
; both fullscreen and windowed mode windows
; original program Copyright (c) Camilla Berglund <elmindreda@elmindreda.org>
;========================================================================


#include %../glfw.reds
#include %../Tools/user.reds


STEP_SIZE: 0.1
width: 200
height: 200
&width: :width; pointer! 
&height: :height ;pointer!

set_gamma: func [window [GLFWwindow] value [float!] /local monitor] [
    monitor: glfwGetWindowMonitor window
    if (monitor = null) [monitor: glfwGetPrimaryMonitor]
    gamma_value: value
    print ["Gamma : " gamma_value newline]
    glfwSetGamma monitor as float32! gamma_value
]

error_callback: func [[calling] error [integer!] description [c-string!]] [
        print [ description " " stderr]
]

key_callback: func [
        [calling]
        window [GLFWwindow]
        key [integer!]
        scancode [integer!]
        action [integer!]
        mods [integer!]] [
        if (key = GLFW_KEY_ESCAPE) and (action = GLFW_PRESS) [glfwSetWindowShouldClose window GL_TRUE ]
        if (key = GLFW_KEY_UP) and (action = GLFW_PRESS) [set_gamma window gamma_value + STEP_SIZE]
        if (key = GLFW_KEY_DOWN) and (action = GLFW_PRESS) [
                            if (gamma_value - STEP_SIZE > 0.0) [set_gamma window gamma_value - STEP_SIZE]
                           ]
]

framebuffer_size_callback: func [[calling] window [GLFWwindow] width [integer!] height [integer!]]
[
    glViewport 0 0 width height
    
]


    ; Main Program
    
    isMonitor: false  ; true for the whole monitor false for a window
    glfwSetErrorCallback :error_callback
    if glfwInit = 0 [glfwTerminate] ; exit
    monitor: glfwGetPrimaryMonitor
    mode: glfwGetVideoMode monitor
    either isMonitor [width: mode/width height: mode/height] [width: 400 height: 400]
    window: glfwCreateWindow width height "Gamma Test [ Up and Down for gamma ESC to Quit]" NULL NULL
    set_gamma window 1.0
    glfwMakeContextCurrent window
    glfwSwapInterval 1
    glfwSetKeyCallback window :key_callback
    glfwSetFramebufferSizeCallback window :framebuffer_size_callback
    glMatrixMode GL_PROJECTION 
    glOrtho -1.0 1.0 -1.0 1.0 -1.0 1.0
    glMatrixMode GL_MODELVIEW
    glClearColor 0.5 0.5 0.5 0.0

    while [(glfwWindowShouldClose window) = GL_FALSE] [
        glClear GL_COLOR_BUFFER_BIT
        glColor3f 0.8 0.2 0.4
        glRectf -0.5 -0.5 0.5 0.5
        glfwSwapBuffers window
        glfwWaitEvents
    ]

    glfwDestroyWindow window    
    glfwTerminate
