Red/System [
	Title:		"GLFW Binding: Triangle"
	Author:		"François Jouen"
	Rights:		"Copyright (c) 2013-2014 François Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]

    ; just as simple demo to draw triangle
    #include %../glfw.reds
    
    error_callback: func [[calling] error [integer!] description [c-string!]] [
    print [ description " " stderr]
    ]
    
    initgl: func [return: [integer!]] [
	if glfwInit = 0 [glfwTerminate]
	window: glfwCreateWindow 800 600 "A Simple OpenGL Triangle with Red" NULL NULL
	glfwMakeContextCurrent window
	glfwSetErrorCallback :error_callback
	return 1
    ]
    
    closegl: func [] [
	glfwDestroyWindow window    
	glfwTerminate
    ]
    
    render: func [ /local rep [integer!]] [
	rep: 0
	until [
		;glClearColor 0.0 0.0 0.0 0.0
		glClear GL_COLOR_BUFFER_BIT
		glBegin GL_TRIANGLES
			glColor3ub 255 0 0    glVertex2d -0.75 -0.75
			glColor3ub 0 255 0    glVertex2d 0.0 0.75 
			glColor3ub 0 0 255    glVertex2d 0.75 -0.75
		glEnd
		glFlush
		glfwSwapBuffers window
		glfwPollEvents  
		rep: glfwWindowShouldClose window
	rep = 1
	]
    ]
    
    ; main program
    initgl
    render 
    closegl


