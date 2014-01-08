Red/System [
	Title:		"GLFW Binding: Splitview"
	Author:		"Françcois Jouen"
	Rights:		"Copyright (c) 2013 François Jouen. All rights reserved."
	License:        "BSD-3 - https:;github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]

;========================================================================
; This program is used to test sharing of objects between contextsed
; Orginal program by Camilla Berglund <elmindreda@elmindreda.org>
;========================================================================


#include %../glfw.reds
#include %../Tools/user.reds
#include %../Tools/C-library.reds

    #define WIDTH  400
    #define HEIGHT 400
    #define OFFSET 50
    
    x: 0 y: 0 w: WIDTH
    &x: :x
    &y: :y
    &width: :w 
    
    
    ; An array to 2 windows
    windows: declare struct! [
        w1  [pointer! [integer!]]
        w2  [pointer! [integer!]]
    ]
    
    ;  reserved  memory
    windows/w1: null
    windows/w2: null
    
    window: declare pointer! [integer!]     ; a pointer to an element of the array
    
    error_callback: func [[calling] error [integer!] description [c-string!]] [
        print ["Error: " error " " description newline]
        throw error
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
    
    open_window: func [title [c-string!] share [GLFWwindow] posx [integer!] posY [integer!]
        return: [int-ptr!] /local w p][
        p: declare pointer! [integer!]
        glfwWindowHint GLFW_VISIBLE GL_FALSE
        window: glfwCreateWindow WIDTH HEIGHT title NULL share
        w: as integer! window
        if w = 0 [p: null return p]
        glfwMakeContextCurrent window
        glfwSwapInterval 1
        glfwSetWindowPos window posX posY
        glfwShowWindow window
        glfwSetKeyCallback window :key_callback
        return window
    ]
    
    
    create_texture: func [return: [integer!] /local size pixels ct x y texture ][
        ;char pixels[256 * 256]
        pixels: allocate (256 * 256)
        texture: 0
        &texture: :texture
        glGenTextures 1 &texture
        glBindTexture GL_TEXTURE_2D texture
        
        y: 0 
        until [
            x: 0
            until [
                ct: y * 256 + x
                pixels/ct: as byte! (random % 256)
                x: x + 1
            x >= 255
            ]
            y: y + 1
        y >= 255    
        ]
        
        glTexImage2D GL_TEXTURE_2D 0 GL_LUMINANCE 256 256 0 GL_LUMINANCE GL_UNSIGNED_BYTE pixels
        glTexParameteri GL_TEXTURE_2D GL_TEXTURE_MIN_FILTER GL_LINEAR
        glTexParameteri GL_TEXTURE_2D GL_TEXTURE_MAG_FILTER GL_LINEAR
        return texture
    ]
    
   
    
    draw_quad: func [texture [integer!] /local w h ] [
        w: 0 h: 0
        &w: :w
        &h: :h
        glfwGetFramebufferSize glfwGetCurrentContext &w &h
        glViewport 0 0 w h
        glMatrixMode GL_PROJECTION
        glLoadIdentity
        gluOrtho2D 0.0 1.0 0.0 1.0
        glEnable GL_TEXTURE_2D
        glBindTexture GL_TEXTURE_2D texture
        glTexEnvi GL_TEXTURE_ENV GL_TEXTURE_ENV_MODE GL_MODULATE
        glBegin GL_QUADS
            glTexCoord2f 0.0 0.0
            glVertex2f 0.0 0.0

            glTexCoord2f 1.0 0.0
            glVertex2f 1.0 0.0

            glTexCoord2f 1.0 1.0
            glVertex2f 1.0 1.0

            glTexCoord2f 0.0 1.0
            glVertex2f 0.0 1.0
        glEnd 
    ]
    
    
    ;main
    
    
    if glfwInit = 0 [glfwTerminate]
    
    windows/w1: open_window "First" NULL OFFSET OFFSET
    
    ; This is the one and only time we create a texture
    ; It is created inside the first context, created above
    ; It will then be shared with the second context, created below
    
    texture: create_texture
    
     
    glfwGetWindowPos windows/w1 &x &y
    glfwGetWindowSize windows/w1 &width NULL
    
    windows/w2: open_window "Second" windows/w1  x + w + OFFSET y
    
    glfwMakeContextCurrent windows/w1
    glColor3f 0.6 0.0 0.6
    glfwMakeContextCurrent windows/w2
    glColor3f 0.6 0.6 0.0

    glfwMakeContextCurrent windows/w1
    while [((glfwWindowShouldClose windows/w1) = GL_FALSE) AND ((glfwWindowShouldClose windows/w2) = GL_FALSE)]  [
        glfwMakeContextCurrent windows/w1
        draw_quad texture
        glfwMakeContextCurrent windows/w2
        draw_quad texture
        glfwSwapBuffers windows/w1
        glfwSwapBuffers windows/w2
        glfwWaitEvents
    ]
    
    glfwTerminate
    
    
    
    