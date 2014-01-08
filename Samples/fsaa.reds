Red/System [
	Title:		"GLFW Binding: fsaa"
	Author:		"François Jouen"
	Rights:		"Copyright (c) 2013 François Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]

;========================================================================
;
; This test renders two high contrast, slowly rotating quads, one aliased
; and one (hopefully) anti-aliased, thus allowing for visual verification
; of whether FSAA is indeed enabled
; original program Copyright (c) Camilla Berglund <elmindreda@elmindreda.org>
;========================================================================

#include %../glfw.reds
#include %../Tools/user.reds

time: 0.0

error_callback: func [[calling] error [integer!] description [c-string!]] [
        print [ description " " stderr]
]

framebuffer_size_callback: func [[calling] window [GLFWwindow] width [integer!] height [integer!]] [
     glViewport 0 0 width height
]

key_callback: func [
        [calling]
        window [GLFWwindow]
        key [integer!]
        scancode [integer!]
        action [integer!]
        mods [integer!]] [
    
    if (action <> GLFW_PRESS) [exit];
    if (key = GLFW_KEY_SPACE) [glfwSetTime 0.0 exit]
    if (key = GLFW_KEY_ESCAPE) [glfwSetWindowShouldClose window GL_TRUE ]
]

; main
    samples: 4
    &samples: :samples
    glfwSetErrorCallback :error_callback
    if glfwInit = 0 [glfwTerminate] ; exit
    either samples <> 0 [print ["Requesting FSAA with " samples " samples" newline]]
                        [print ["Requesting that FSAA not be available" newline]]
    glfwWindowHint GLFW_SAMPLES samples
    window: glfwCreateWindow 800 400 "Aliasing Detector" NULL NULL
    glfwSetKeyCallback window  :key_callback
    glfwSetFramebufferSizeCallback window  :framebuffer_size_callback
    
    glfwMakeContextCurrent window
    glfwSwapInterval 1
    
    if (glfwExtensionSupported "GL_ARB_multisample") = 0 [glfwTerminate]
    ; GL_SAMPLES_ARB = 32937
    glGetIntegerv 32937  &samples
     either samples <> 0 [print ["Context reports FSAA is available with " samples " samples" newline]]
                        [print ["Context reports FSAA is unavailable" newline]]
    glMatrixMode GL_PROJECTION
    glOrtho 0.0 1.0 -1.0 1.0 1.0 -1.0
    
    glMatrixMode GL_MODELVIEW
    while [(glfwWindowShouldClose window) = GL_FALSE] [
        time: glfwGetTime
        glClear GL_COLOR_BUFFER_BIT
        glLoadIdentity
        glTranslatef 0.25 0.25 0.0
        glRotatef as float32! time as float32! 0.0 as float32! 0.0 as float32! 1.0
        glDisable 32925; GL_MULTISAMPLE_ARB
        glRectf -0.15 -0.15 0.15 0.15
        
        glLoadIdentity
        glTranslatef 0.75 0.25 0.0
        glRotatef as float32! time as float32! 0.0 as float32! 0.0 as float32! 1.0
        glEnable 32925; GL_MULTISAMPLE_ARB
        glRectf -0.15 -0.15 0.15 0.15
        glfwSwapBuffers window
        glfwPollEvents
    ]
    glfwDestroyWindow window    
    glfwTerminate 
