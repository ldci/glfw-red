Red/System [
	Title:		"GLFW Binding: defaults"
	Author:		"François Jouen"
	Rights:		"Copyright (c) 2013-2014 François Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]

;========================================================================
;
; This test creates a windowed mode window with all window hints set to
; default values and then reports the actual attributes of the created
; window and context
; original program Copyright (c) Camilla Berglund <elmindreda@elmindreda.org>
;========================================================================

#include %../../lib/glfw3.reds


width: 640
height: 480
&width: :width; pointer! 
&height: :height ;pointer!
c: 1


AttribGL!: alias struct! [
    attrib      [integer!]
    ext         [c-string!]
    name        [c-string!] 
]

AttribGLFW!: alias struct! [
    attrib      [integer!]
    name        [c-string!] 
]

gl_attribs: declare struct! [
    gl1     [AttribGL!]
    gl2     [AttribGL!]
    gl3     [AttribGL!]
    gl4     [AttribGL!]
    gl5     [AttribGL!]
    gl6     [AttribGL!]
    gl7     [AttribGL!]
    gl8     [AttribGL!]
    gl9     [AttribGL!]
]


glfw_attribs: declare struct! [
    glw1    [AttribGLFW!]
    glw2    [AttribGLFW!]
    glw3    [AttribGLFW!]
    glw4    [AttribGLFW!]
    glw5    [AttribGLFW!]
    glw6    [AttribGLFW!]
]



gl_attribs/gl1: declare AttribGL!
gl_attribs/gl2: declare AttribGL!
gl_attribs/gl3: declare AttribGL!
gl_attribs/gl4: declare AttribGL!
gl_attribs/gl5: declare AttribGL!
gl_attribs/gl6: declare AttribGL!
gl_attribs/gl7: declare AttribGL!
gl_attribs/gl8: declare AttribGL!
gl_attribs/gl9: declare AttribGL!



gl_attribs/gl1/attrib: GL_RED_BITS
gl_attribs/gl1/ext: null
gl_attribs/gl1/name: "red bits"

gl_attribs/gl2/attrib: GL_GREEN_BITS
gl_attribs/gl2/ext: null
gl_attribs/gl2/name: "green bits"

gl_attribs/gl3/attrib: GL_BLUE_BITS
gl_attribs/gl3/ext: null
gl_attribs/gl3/name: "blue bits"

gl_attribs/gl4/attrib: GL_ALPHA_BITS
gl_attribs/gl4/ext: null
gl_attribs/gl4/name: "alpha bits"

gl_attribs/gl5/attrib: GL_DEPTH_BITS
gl_attribs/gl5/ext: null
gl_attribs/gl5/name: "depth bits"

gl_attribs/gl6/attrib: GL_STENCIL_BITS
gl_attribs/gl6/ext: null
gl_attribs/gl6/name: "stencil bits"

gl_attribs/gl7/attrib: GL_STEREO
gl_attribs/gl7/ext: null
gl_attribs/gl7/name: "stereo"

gl_attribs/gl8/attrib: 000080A9h;GL_SAMPLES_ARB
gl_attribs/gl8/ext: null
gl_attribs/gl8/name: "FSAA samples" "GL_ARB_multisample" 

gl_attribs/gl9/attrib: 0
gl_attribs/gl9/ext: null
gl_attribs/gl9/name: null


glfw_attribs/glw1: declare AttribGLFW!
glfw_attribs/glw2: declare AttribGLFW!
glfw_attribs/glw3: declare AttribGLFW!
glfw_attribs/glw4: declare AttribGLFW!
glfw_attribs/glw5: declare AttribGLFW!
glfw_attribs/glw6: declare AttribGLFW!


glfw_attribs/glw1/attrib: GLFW_CONTEXT_VERSION_MAJOR
glfw_attribs/glw1/name: "Context version major"

glfw_attribs/glw2/attrib: GLFW_CONTEXT_VERSION_MINOR 
glfw_attribs/glw2/name: "Context version minor"

glfw_attribs/glw3/attrib: GLFW_OPENGL_FORWARD_COMPAT 
glfw_attribs/glw3/name: "OpenGL forward compatible"

glfw_attribs/glw4/attrib: GLFW_OPENGL_DEBUG_CONTEXT  
glfw_attribs/glw4/name: "OpenGL debug context"

glfw_attribs/glw5/attrib: GLFW_OPENGL_PROFILE 
glfw_attribs/glw5/name: "OpenGL profile"  

glfw_attribs/glw6/attrib: 0
glfw_attribs/glw6/name: ""  

error_callback: func [[calling] error [integer!] description [c-string!]] [
        print [ description " " stderr]
]

    ; main program
    glfwSetErrorCallback :error_callback
    if glfwInit = 0 [glfwTerminate] ; exit
    glfwWindowHint GLFW_VISIBLE GL_FALSE
    window: glfwCreateWindow 640 480 "Defaults" NULL NULL
    glfwMakeContextCurrent window
    glfwGetWindowSize window &width &height
    print ["framebuffer size: " width " x " height newline]
    c: 1
    p: as int-ptr! glfw_attribs/glw1
    until [
        if c = 2 [p: as int-ptr! glfw_attribs/glw2] ;????? 
        print [as c-string! p/2 ": " glfwGetWindowAttrib window p/1 newline ]
        p: p + 2
        c: c + 1
    c = 6
    ]
    c: 1
    p: as int-ptr! gl_attribs/gl1
    value: 0 &value: :value ; pointer
    until [
        if p/2 <> 0 [if (glfwExtensionSupported as c-string! p/2) = GL_FALSE [print ""]]
        glGetIntegerv p/1 &value
        print [as c-string! p/3 ": " &value/value newline ]
        p: p + 3 ; incremente pointer
        c: c + 1
    c = 9     
    ]
    
    glfwDestroyWindow window
    window: null
    glfwTerminate










