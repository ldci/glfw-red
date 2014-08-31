Red/System [
	Title:		"GLFW Binding: Title"
	Author:		"F. Jouen"
	Rights:		"Copyright (c) 2013 F. Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]


#include %../glfw.reds

    glfwInit
    ;Create a windowed mode window and its OpenGL context
    window: glfwCreateWindow 640 480 "Français English 日本語 русский язык 官話" NULL NULL
    
    ;Make the window's context current
    glfwMakeContextCurrent window
    glBegin 0
    glViewport 0 0 640 480 ; cool opengl est accessible mais pas utile ici
    ;Loop until the user closes the window
    while [(glfwWindowShouldClose window) = GL_FALSE] [
        ;Render here 
        ;Swap front and back buffers ;
        glfwSwapBuffers window
        ;Poll for and process events 
        glfwPollEvents  
    ]
    
    glfwTerminate