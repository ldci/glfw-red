Red [
	Title:		"GLFW Binding: Animated triangle"
	Author:		"François Jouen"
	Rights:		"Copyright (c) 2013-2014 François Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]

; Simple GLFW example
; Origimal program Copyright (c) Camilla Berglund <elmindreda@elmindreda.org>

; how to use Red/System code inside Red

#system [
	#include %../../glfw.reds ; this lib also includes opgl.reds	
	; for error callback code pointer
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
]

initgl: routine [txt [string!] return: [integer!]] [
        ratio: 0.0
	angle: 0.0
	width: 640
	height: 480
	fwidth: 640.0
	fheight: 480.0

	if glfwInit = 0 [glfwTerminate]
	window: glfwCreateWindow width height as c-string! string/rs-head txt NULL NULL
	glfwMakeContextCurrent window
	glfwSetErrorCallback :error_callback
	glfwSetKeyCallback window :key_callback
	return 1
]

closegl: routine [] [
	glfwDestroyWindow window    
	glfwTerminate
]

render: routine [return: [integer!]] [
        &width: :width; pointer! 
	&height: :height ;pointer!
	glfwGetFramebufferSize window &width &height
	fwidth: 1.0 * &width/value
        fheight: 1.0 * &height/value
	ratio: fwidth / fheight
        glViewport 0 0 width height
        glClearColor 0.0 0.0 0.0 0.0
        glClear GL_COLOR_BUFFER_BIT
        glMatrixMode GL_PROJECTION
        glLoadIdentity
        glOrtho 0.0 - ratio ratio -1.0 1.0 1.0 -1.0
        glMatrixMode GL_MODELVIEW
        glLoadIdentity
        
        angle: glfwGetTime * 36.00
        glRotatef as float32! angle 0.0 0.0 1.0
        
        glBegin GL_TRIANGLES
            glColor3f 1.0 0.0 0.0    glVertex3f -0.6 -0.4 0.0  ;first point of triangle is red
            glColor3f 0.0 1.0 0.0    glVertex3f 0.6 -0.4 0.0   ;second point of triangle is green
            glColor3f 0.0 0.0 1.0    glVertex3f 0.0 0.6 0.0    ;third point of triangle is blue
        glEnd
        
        
        glfwSwapBuffers window
        glfwPollEvents
	glfwWindowShouldClose window	; 1 for window close request


]



;Main program

initgl "Animated OpenGL Triangle with Red [ESC to Quit]"
rep: 0
	until [
		rep: render	
	rep = 1
	]
closegl
quit