Red/System [
	Title:		"GLFW Binding: Animated triangle"
	Author:		"François Jouen"
	Rights:		"Copyright (c) 2013 François Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]

    ;Simple GLFW example
    ; Origimal program Copyright (c) Camilla Berglund <elmindreda@elmindreda.org>

    #include %../glfw.reds
    #include %../Tools/user.reds
    
    ratio: 0.0
    width: 0
    height: 0
    angle: 0.0
    
    &width: :width; pointer! 
    &height: :height ;pointer!
    
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
    
    
    
    if glfwInit = 0 [glfwTerminate] ; exit
    
    window: glfwCreateWindow 640 480 "Animated OpenGL Triangle with Red [ESC to Quit]" NULL NULL
    if window = null [glfwTerminate]
    glfwMakeContextCurrent window
    glfwSetErrorCallback :error_callback
    glfwSetKeyCallback window :key_callback
    
    while [(glfwWindowShouldClose window) = GL_FALSE] [
        glfwGetFramebufferSize window &width &height
        ratio:  (int-to-float width) /  (int-to-float height)
        glViewport 0 0 width height
        glClearColor 0.0 0.0 0.0 0.0
        glClear GL_COLOR_BUFFER_BIT
        glMatrixMode GL_PROJECTION
        glLoadIdentity
        glOrtho 0.0 - ratio ratio -1.0 1.0 1.0 -1.0
        glMatrixMode GL_MODELVIEW
        glLoadIdentity
        
        angle: glfwGetTime * 50.00
        glRotatef as float32! angle 0.0 0.0 1.0
        
        glBegin GL_TRIANGLES
            glColor3f 1.0 0.0 0.0    glVertex3f -0.6 -0.4 0.0  ;first point of triangle is red
            glColor3f 0.0 1.0 0.0    glVertex3f 0.6 -0.4 0.0   ;second point of triangle is green
            glColor3f 0.0 0.0 1.0    glVertex3f 0.0 0.6 0.0    ;third point of triangle is blue
        glEnd
        
        
        glfwSwapBuffers window
        glfwPollEvents  
    
    ]
    glfwDestroyWindow window    
    glfwTerminate
    
    
    
    