Red [
	Title:		"GLFW Binding: Triangle"
	Author:		"Francois Jouen"
	Rights:		"Copyright (c) 2014 Francois Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]

; how to use Red/System code inside Red
; use #system [library] to make import
; functions are replaced by routines because we are using Red/S code inside the function
; lastly red strings must be converted in c-strings red/System (Thanks to Jocko for as c-string! string/rs-head txt)

#system [
	#include %../../lib/glfw3.reds ; this lib also includes opgl.reds	
	; for error callback code pointer
	error_callback: func [[calling] error [integer!] description [c-string!]] [
	print [ description " " stderr]
	]
	window: declare pointer! [integer!]
]


initgl: routine [txt [string!] return: [integer!]] [
	if glfwInit = 0 [glfwTerminate return 0]
	window: glfwCreateWindow 800 600 as c-string! string/rs-head txt NULL NULL
	glfwMakeContextCurrent window
	glfwSetErrorCallback :error_callback
	return 1
]

closegl: routine [] [
	glfwDestroyWindow window    
	glfwTerminate
]

render: routine [return: [integer!] ] [
		glClear GL_COLOR_BUFFER_BIT
		glBegin GL_TRIANGLES
			glColor3ub 255 0 0    glVertex2d -0.75 -0.75
			glColor3ub 0 255 0    glVertex2d 0.0 0.75 
			glColor3ub 0 0 255    glVertex2d 0.75 -0.75
		glEnd
		glFlush
		glfwSwapBuffers window
		glfwPollEvents  
		glfwWindowShouldClose window	; 1 for window close request
]


;Main program


initgl "A Simple OpenGL Triangle with Red and GLFW"
rep: 0
	until [
		rep: render	
	rep = 1
	]
closegl
quit

