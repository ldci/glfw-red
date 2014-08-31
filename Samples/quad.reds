Red/System [
	Title:		"GLFW Binding: Quad"
	Author:		"F. Jouen"
	Rights:		"Copyright (c) 2013-2014 F. Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]

    ; just as simple demo to draw forms
    
    
    #include %../glfw.reds
    
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
    ]
    
    
    glfwInit
    
    window: glfwCreateWindow 800 600 "A Simple OpenGL Quad with Red [ESC to Quit]" NULL NULL
    glfwMakeContextCurrent window
    glfwSetErrorCallback :error_callback
    glfwSetKeyCallback window :key_callback
    
    while [(glfwWindowShouldClose window) = GL_FALSE] [   
        glClearColor 0.0 0.0 0.0 0.0
        glClear GL_COLOR_BUFFER_BIT
        glBegin GL_QUADS 
            glColor3ub 0 0 255
            glVertex2d -0.75 -0.75
            glVertex2d -0.75 0.75
            glColor3ub 255 0 0
            glVertex2d 0.75 0.75 
            glVertex2d 0.75 -0.75
        glEnd
        glFlush
        glfwSwapBuffers window
        glfwPollEvents  
    ]

    glfwDestroyWindow window    
    glfwTerminate