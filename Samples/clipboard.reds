Red/System [
	Title:		"GLFW Binding: clipboard"
	Author:		"François Jouen"
	Rights:		"Copyright (c) 2013 François Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]

;========================================================================
;
; This program is used to test the clipboard functionality.
; original program Copyright (c) Camilla Berglund <elmindreda@elmindreda.org>
;========================================================================

#include %../glfw.reds
#include %../Tools/user.reds

error_callback: func [[cdecl] error [integer!] description [c-string!]] [
        print [ description " " stderr]
]

key_callback: func [
        [cdecl]
        window [GLFWwindow]
        key [integer!]
        scancode [integer!]
        action [integer!]
        mods [integer!] /local string l] [
    
    if (action <> GLFW_PRESS) [exit];
    
    switch key [
        GLFW_KEY_ESCAPE [glfwSetWindowShouldClose window GL_TRUE ]
        GLFW_KEY_V [
            if (mods = GLFW_MOD_CONTROL) [
                string: glfwGetClipboardString window
                l: length? string
                either l > 1 [print ["Clipboard contains " string newline]]
                [print ["Clipboard does not contain a string" newline]]
            ]
        ]
        GLFW_KEY_C [
            if (mods = GLFW_MOD_CONTROL) [
                string: "Hello GLFW World!"
                glfwSetClipboardString window string
                print ["Setting clipboard to " string newline]
            ]
        ]
        default [print ""]
    ]
]

framebuffer_size_callback: func [[cdecl] window [GLFWwindow] width [integer!] height [integer!]] [
     glViewport 0 0 width height
]

    ;main
    glfwSetErrorCallback :error_callback
    if glfwInit = 0 [glfwTerminate] ; exit
    window: glfwCreateWindow 400 400 "Clipboard Test [CTRL-C CTRL-V]" NULL NULL
    if window = null [glfwTerminate]
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
    
    