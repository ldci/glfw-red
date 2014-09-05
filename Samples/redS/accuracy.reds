Red/System [
	Title:		"GLFW Binding: Accuracy"
	Author:		"François Jouen"
	Rights:		"Copyright (c) 2013-2014 François Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]

    
    ;========================================================================
    ;
    ; This test came about as the result of bug #1867804
    ;
    ; No sign of said bug has so far been detected
    ; original program Copyright (c) Camilla Berglund <elmindreda@elmindreda.org>
    ;========================================================================
    
    #include %../../glfw.reds
    #include %../../Tools/user.reds
    #include %../../Tools/C-library.reds
    
    cursor_x:  0.0
    cursor_y:  0.0
    window_width: 640
    window_height: 480
    width: 0
    height: 0
    &width: :width; pointer! 
    &height: :height ;pointer!
    swap_interval: 1
    title: ""
    w: 0.0
    h: 0.0
    l: 0
    
    set_swap_interval: func [window [GLFWwindow] interval [integer!] /local title][
        title: as c-string! allocate 256
        swap_interval: interval
        glfwSwapInterval swap_interval
        format-any [title "Cursor Inaccuracy Detector (interval %i)" swap_interval]
        glfwSetWindowTitle window title
    ]
    
    
    
    error_callback: func [[calling] error [integer!] description [c-string!]] [
        print-error description
    ]
    
    framebuffer_size_callback: func [
        [calling]
        window [GLFWwindow] width [integer!] height [integer!]][
        window_width: width
        window_height: height
        glViewport 0 0 window_width window_height
        glMatrixMode GL_PROJECTION
        glLoadIdentity
        ;glOrtho 0.0 int-to-float window_width 0.0 int-to-float window_height  0.0 1.0
        gluOrtho2D 0.0 int-to-float window_width 0.0  int-to-float window_height ; for clipping
    ]
    
    cursor_position_callback: func [
        [calling]
        window [GLFWwindow] x [float!] y [float!]][
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
        if (key = GLFW_KEY_SPACE) and (action = GLFW_PRESS) [set_swap_interval window 1 - swap_interval]
    ]
    
    glfwSetErrorCallback :error_callback
    if glfwInit = 0 [glfwTerminate]
    window: glfwCreateWindow window_width window_height "" NULL NULL
    glfwSetCursorPosCallback window :cursor_position_callback
    glfwSetFramebufferSizeCallback window :framebuffer_size_callback
    glfwSetKeyCallback window :key_callback
    glfwMakeContextCurrent window
    glfwGetFramebufferSize window &width &height
    framebuffer_size_callback window width height
    set_swap_interval window swap_interval
    
     while [(glfwWindowShouldClose window) = GL_FALSE] [
        glClear GL_COLOR_BUFFER_BIT
        glBegin GL_LINES
            h:  int-to-float window_height
            w:  int-to-float window_width
            glVertex2f 0.0 as float32! h - cursor_y
            glVertex2f as float32! w as float32! h - cursor_y
            glVertex2f as float32! cursor_x 0.0
            glVertex2f as float32! cursor_x as float32! h  
        glEnd
        
        glfwSwapBuffers window
        glfwPollEvents 
     ]
     
     glfwDestroyWindow window    
    glfwTerminate