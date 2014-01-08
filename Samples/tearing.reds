Red/System [
	Title:		"GLFW Binding: Splitview"
	Author:		"François Jouen"
	Rights:		"Copyright (c) 2013 François Jouen. All rights reserved."
	License:        "BSD-3 - https:;github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]

;========================================================================
;
; This test renders a high contrast, horizontally moving bar, allowing for
; visual verification of whether the set swap interval is indeed obeyed
; Orginal program by Camilla Berglund <elmindreda@elmindreda.org>
;========================================================================

#include %../glfw.reds
#include %../Tools/user.reds
#include %../Tools/math.reds
#include %../Tools/C-library.reds

swap_interval: 0
frame_rate: 0.0
last_time: 0.0
current_time: 0.0
position: 0.0
frame_count: 0.0



update_window_title: func [window [GLFWwindow] /local title] [
    title: as c-string! allocate 256
    format-any [title "Tearing detector (interval %i, %0.1f Hz)" swap_interval frame_rate]
    glfwSetWindowTitle window title
]

set_swap_interval: func [window [GLFWwindow] interval [integer!]] [
    swap_interval: interval
    glfwSwapInterval swap_interval
    update_window_title window
]

error_callback: func [[cdecl] error [integer!] description [c-string!]] [
        print ["Error: " error " " description newline]
        throw error ; stderr
]

framebuffer_size_callback: func [ [cdecl] window [GLFWwindow] width [integer!] height [integer!]][
    glViewport 0 0 width height
]

key_callback: func [
        [cdecl]
        window [GLFWwindow]
        key [integer!]
        scancode [integer!]
        action [integer!]
        mods [integer!]] [
        if (key = GLFW_KEY_SPACE) and (action = GLFW_PRESS) [
        set_swap_interval window 1 - swap_interval]
]
    
;main

    glfwSetErrorCallback :error_callback
    if glfwInit = 0 [glfwTerminate] ; exit
    window: glfwCreateWindow 640 480 "Version" NULL NULL
    glfwMakeContextCurrent window
    set_swap_interval window 0
    last_time: glfwGetTime
    frame_rate: 0.0
    glfwSetFramebufferSizeCallback window :framebuffer_size_callback
    glfwSetKeyCallback window :key_callback
    glMatrixMode GL_PROJECTION
    glOrtho -1.0 1.0 -1.0 1.0 1.0 -1.0
    glMatrixMode GL_MODELVIEW
    
    while [(glfwWindowShouldClose window) = GL_FALSE] [
        glClear GL_COLOR_BUFFER_BIT
        position: cosine-radians (glfwGetTime * 4.0) * 0.75
        glRectd position - 0.25 -1.0 position + 0.25 1.0
        glfwSwapBuffers window
        glfwPollEvents
        frame_count: frame_count + 1.0
        current_time: glfwGetTime
        if (current_time - last_time > 1.0)
        [
            frame_rate: frame_count / (current_time - last_time)
            frame_count: 0.0
            last_time: current_time
            update_window_title window
        ]
    ]
    glfwTerminate
