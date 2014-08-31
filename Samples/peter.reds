Red/System [
	Title:		"GLFW Binding: peter"
	Author:		"F. Jouen"
	Rights:		"Copyright (c) 2013-2014 F. Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]

;========================================================================
;
; This test came about as the result of bugs #1262764, #1726540 and
; #1726592, all reported by the user peterpp, hence the name
;
; The utility of this test outside of these bugs is uncertain
; original program Copyright (c) Camilla Berglund <elmindreda@elmindreda.org>
;========================================================================

#include %../glfw.reds

rreopen: GL_FALSE
cursor_x: 0.0
cursor_y: 0.0
&cursor_x: declare pointer! [float!] &cursor_x/value: cursor_x
&cursor_y: declare pointer! [float!] &cursor_y/value: cursor_y


toggle_cursor: func [window [GLFWwindow]][
    either (glfwGetInputMode window GLFW_CURSOR) = GLFW_CURSOR_DISABLED [
        print["Released cursor" newline]
        glfwSetInputMode window GLFW_CURSOR GLFW_CURSOR_NORMAL]
    [print["Captured cursor" newline]
        glfwSetInputMode window GLFW_CURSOR GLFW_CURSOR_DISABLED
    ]
]

error_callback: func [[calling] error [integer!] description [c-string!]] [
        print ["Error: " error " " description newline]
        throw error
]

cursor_position_callback: func [[calling] window [GLFWwindow] x [float!] y [float!]] [
    print ["Cursor moved to: " x " " y " " x - cursor_x  " " y - cursor_y newline]
    cursor_x: x
    cursor_y: y
]

key_callback: func [
        [calling]
        window [GLFWwindow]
        key [integer!]
        scancode [integer!]
        action [integer!]
        mods [integer!]] [
        switch key [
            GLFW_KEY_SPACE  [if (action = GLFW_PRESS) [toggle_cursor window]]
            GLFW_KEY_R      [if (action = GLFW_PRESS) [rreopen: GL_TRUE]]
            GLFW_KEY_ESCAPE [if (action = GLFW_PRESS) [glfwSetWindowShouldClose window GL_TRUE ]]
        ]
]

framebuffer_size_callback: func [ [calling] window [GLFWwindow] width [integer!] height [integer!]][
    glViewport 0 0 width height
]


open_window: func [return: [GLFWwindow]][
    window: glfwCreateWindow 640 480 "Peter Detector" NULL NULL
    if (window = NULL) [return NULL]
    
    glfwMakeContextCurrent window
    glfwSwapInterval 1

    glfwGetCursorPos window &cursor_x &cursor_y
    print ["Cursor position: "  cursor_x " " cursor_y newline]

    glfwSetFramebufferSizeCallback window :framebuffer_size_callback
    glfwSetCursorPosCallback window :cursor_position_callback
    glfwSetKeyCallback window :key_callback
    
    window
]

if glfwInit = 0 [glfwTerminate] ; exit
glfwSetErrorCallback :error_callback
window: open_window
if (window = NULL) [glfwTerminate]
glClearColor 0.0 0.0 0.0 0.0
while [(glfwWindowShouldClose window) = GL_FALSE] [
    glClear GL_COLOR_BUFFER_BIT
    glfwSwapBuffers window
    glfwWaitEvents
    if (rreopen = GL_TRUE) [
        glfwDestroyWindow window
        window: open_window
        if (window = NULL) [glfwTerminate]
        rreopen: GL_FALSE
    ]
]


glfwTerminate 

