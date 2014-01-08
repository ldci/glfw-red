Red/System [
	Title:		"GLFW Binding: Splitview"
	Author:		"François Jouen"
	Rights:		"Copyright (c) 2013 François Jouen. All rights reserved."
	License:    "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]

    
    ;========================================================================
    ;This is an example program for the GLFW library
    ; see splitview.c for orginal program
    ;========================================================================
    
    
    #include %../glfw.reds
    #include %../Tools/user.reds
    #include %../Tools/math.reds
    
    #define M_PI 3.14159265358979323846
    ;========================================================================
    ; Global variables
    ;========================================================================
    
    ;Mouse position
    xpos: 0.0 ypos: 0.0

    ; Window size
    width: 0
    height: 0

    ; Active view: 0: none 1: upper left 2: upper right 3: lower left 4: lower right
    active_view: 0
   

    ; Rotation around each axis
    rot_x: 0 rot_y: 0 rot_z: 0

    ; Do redraw?
    do_redraw: 1
    
    &width: :width; pointer! 
    &height: :height ;pointer!
    
    
    xt: 0.0
    yt: 0.0
    zt: 0.0
    xp: 0
    yp: 0
    a1: 0.0
    a2: 0.0
    a3: 0.0
    a4: 0.0
    
    
    ;========================================================================
    ; Draw a solid torus (use a display list for the model)     
    ;========================================================================
    #define TORUS_MAJOR     1.5 ; R
    #define TORUS_MINOR     0.5 ; r
    #define TORUS_MAJOR_RES 32
    #define TORUS_MINOR_RES 32 
    
    drawTorus: func [ /local torus_list i j k s t x y z nx ny nz scale twopi] [
        s: 0.0 t: 0.0 x: 0.0 y: 0.0
        nx: 0.0 ny: 0.0 nz: 0.0
        torus_list: 0
        either as logic! not torus_list [
            ;Start recording displaylist
            torus_list: glGenLists 1
            glNewList torus_list GL_COMPILE_AND_EXECUTE
            ;// Draw torus
            twopi: 2.0 * M_PI
            i: 0
            while [i <= TORUS_MINOR_RES] [
                j: 0
                glBegin GL_QUAD_STRIP
                while [j <= TORUS_MAJOR_RES] [
                    k: 1
                    until [
                        s: int-to-float (i + k) % TORUS_MINOR_RES + 0.5
                        t: int-to-float j % TORUS_MAJOR_RES
                       
                        ;Calculate point on surface
    
                        a1: cosine-radians s * twopi / int-to-float TORUS_MINOR_RES
                        a2: cosine-radians t * twopi / int-to-float TORUS_MAJOR_RES
                        a3: sine-radians s * twopi / int-to-float TORUS_MINOR_RES
                        a4: sine-radians t * twopi / int-to-float TORUS_MAJOR_RES
                        
                        ;The general equations for such a torus are
                        ;f(u, v) = [ (R + r*cos(v))*cos(u), (R + r*cos(v))*sin(u),r*sin(v) ]
                        
                        x: (TORUS_MAJOR + (TORUS_MINOR * a1)) * a2
                        y: TORUS_MINOR * a3
                        z: (TORUS_MAJOR + (TORUS_MINOR * a1)) * a4
                        
                        ;Calculate surface normal
                        nx: x - TORUS_MAJOR * a2
                        ny: y
                        nz: z - TORUS_MAJOR * a4
                        scale: 1.0 / square-root ((nx * nx) + (ny * ny) + (nz * nz))
                        nx:  nx * scale
                        ny:  ny * scale
                        nz:  nz * scale
                        glNormal3d nx ny nz
                        glVertex3d x  y  z
                        k: k - 1
                    k < 0    
                    ]
                    j: j + 1
                ]
                glEnd
                i: i + 1   
            ]
            ;Stop recording displaylist
            glEndList
        ] [
        ;Playback displaylist
        glCallList torus_list 
        ]
    ]
    
    drawScene: func [] [
        ; specific to Red use structure to create array
         model_diffuse: declare struct! [
            f1  [float32!]
            f2  [float32!]
            f3  [float32!]
            f4  [float32!]
        ]
        
        model_diffuse/f1: as float32! 1.0
        model_diffuse/f2: as float32! 0.8
        model_diffuse/f3: as float32! 0.8
        model_diffuse/f4: as float32! 1.0
        
        model_specular: declare struct! [
            f1  [float32!]
            f2  [float32!]
            f3  [float32!]
            f4  [float32!]
        ]
        
        model_specular/f1: as float32! 0.6
        model_specular/f2: as float32! 0.6
        model_specular/f3: as float32! 0.6
        model_specular/f4: as float32! 1.0
        
        model_shininess: as float32! 20.0

        glPushMatrix
        
        ;Rotate the object
        glRotated 0.5 * int-to-float rot_x 1.0 0.0 0.0
        glRotated 0.5 * int-to-float rot_y 0.0 1.0 0.0
        glRotated 0.5 * int-to-float rot_z 0.0 0.0 1.0
        
        ;Set model color (used for orthogonal views, lighting disabled)
        glColor4fv as float32-ptr! model_diffuse
        ;Set model material (used for perspective view, lighting enabled)
        glMaterialfv GL_FRONT GL_DIFFUSE as float32-ptr! model_diffuse
        glMaterialfv GL_FRONT GL_SPECULAR as float32-ptr! model_specular
        glMaterialf  GL_FRONT GL_SHININESS model_shininess
        
        ;Draw torus
        drawTorus
        
        glPopMatrix
        
    ]
    
    drawGrid: func [scale [float!] steps [integer!] /local f s i x y][
        glPushMatrix
        ;Set background to some dark bluish grey
        glClearColor 0.05 0.05 0.2 0.0
        glClear GL_COLOR_BUFFER_BIT
        ;Setup modelview matrix (flat XY view)
        glLoadIdentity
        gluLookAt 0.0 0.0 1.0 0.0 0.0 0.0 0.0 1.0 0.0 
        
        ;We don't want to update the Z-buffer
        glDepthMask as logic! GL_FALSE
        ;Set grid color
        glColor3f 0.0 0.5 0.5
        
        
        f: scale * 0.5
        s: int-to-float (steps - 1)
        
        glBegin GL_LINES
            ;Horizontal lines
            
            x: as float32! f * s
            y: as float32! 0.0 - (f * s)
            -x: as float32! (0.0 - x)
            i: 0
            until [
                glVertex3f -x y 0.0
                glVertex3f x y 0.0
                y: y + scale
                i: i + 1
            i = steps    
            ]
            
            ; vertical lines
            x: as float32! 0.0 - (f * s)
            y: as float32! f * s
            -y: as float32! (0.0 - y)
            i: 0
            until [
                
                glVertex3f x  -y 0.0
                glVertex3f x y 0.0
                x: x + scale
                i: i + 1
            i = steps     
            ]
            
        glEnd
        ;enable Z-buffer writing again
        glDepthMask as logic! GL_TRUE
        glPopMatrix
    ]
    
    ;Draw all views
    drawAllViews: func [] [
        ;specific to Red use structure to create array
        light_position: declare struct! [
            f1  [float32!]
            f2  [float32!]
            f3  [float32!]
            f4  [float32!]
        ]
        
        light_position/f1: as float32! 0.0
        light_position/f2: as float32! 8.0
        light_position/f3: as float32! 8.0
        light_position/f4: as float32! 1.0
        
        light_diffuse: declare struct! [
            f1  [float32!]
            f2  [float32!]
            f3  [float32!]
            f4  [float32!]
        ]
        
        light_diffuse/f1: as float32! 1.0
        light_diffuse/f2: as float32! 1.0
        light_diffuse/f3: as float32! 1.0
        light_diffuse/f4: as float32! 1.0
        
        light_specular: declare struct! [
            f1  [float32!]
            f2  [float32!]
            f3  [float32!]
            f4  [float32!]
        ]
        
        light_specular/f1: as float32! 1.0
        light_specular/f2: as float32! 1.0
        light_specular/f3: as float32! 1.0
        light_specular/f4: as float32! 1.0
        
        light_ambient: declare struct! [
            f1  [float32!]
            f2  [float32!]
            f3  [float32!]
            f4  [float32!]
        ]
        light_ambient/f1: as float32! 0.2
        light_ambient/f2: as float32! 0.2
        light_ambient/f3: as float32! 0.3
        light_ambient/f4: as float32! 1.0
        
        ;Calculate aspect of window
        aspect: 1.0
        either (height > 0) [aspect: int-to-float width / height] [aspect: 1.0]
        
        ;Clear screen
        glClearColor 0.0 0.0 0.0 0.0
        glClear GL_COLOR_BUFFER_BIT OR GL_DEPTH_BUFFER_BIT
        
        ;Enable scissor test
        glEnable GL_SCISSOR_TEST
        ;Enable depth test
        glEnable GL_DEPTH_TEST
        glDepthFunc GL_LEQUAL
        
        ;** ORTHOGONAL VIEWS **
        ;For orthogonal views, use wireframe rendering
        glPolygonMode GL_FRONT_AND_BACK GL_LINE
        
        ;Enable line anti-aliasing
        glEnable GL_LINE_SMOOTH
        glEnable GL_BLEND
        glBlendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    
        
        ;Setup orthogonal projection matrix
        glMatrixMode GL_PROJECTION
        glLoadIdentity
        glOrtho -3.0 * aspect 3.0 * aspect -3.0 3.0 1.0 50.0
        
        ;Upper left view (1: TOP VIEW)
        glViewport 0 height / 2 width / 2 height / 2
        glScissor 0 height / 2 width / 2 height / 2
        glMatrixMode GL_MODELVIEW
        glLoadIdentity
        gluLookAt 0.0 10.0 1E-3 0.0 0.0 0.0 0.0 1.0 0.0
        drawGrid 0.5 12
        drawScene
        
        ;Lower left view (3: FRONT VIEW)
        glViewport 0  0 width / 2 height / 2
        glScissor 0 0 width / 2 height / 2
        glMatrixMode GL_MODELVIEW
        glLoadIdentity
        gluLookAt 0.0 0.0 10.0 0.0 0.0 0.0 0.0 1.0 0.0
        drawGrid 0.5 12
        drawScene
        
        ;Lower right view (4: SIDE VIEW)
        glViewport width / 2 0  width / 2 height / 2
        glScissor width / 2 0 width / 2 height / 2
        glMatrixMode GL_MODELVIEW
        glLoadIdentity
        gluLookAt 10.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0
        drawGrid 0.5 12
        drawScene
        
        ;Disable line anti-aliasing
        glDisable GL_LINE_SMOOTH
        glDisable GL_BLEND
        
        ;PERSPECTIVE VIEW 2**
        ;For perspective view, use solid rendering
        glPolygonMode GL_FRONT_AND_BACK GL_FILL
        
        ;Enable face culling (faster rendering)
        glEnable GL_CULL_FACE
        glCullFace GL_BACK
        glFrontFace GL_CW
        
        ;Setup perspective projection matrix
        glMatrixMode GL_PROJECTION
        glLoadIdentity
        gluPerspective 65.0 aspect 1.0 50.0
        
        ;Upper right view (PERSPECTIVE VIEW)
        glViewport width / 2 height / 2  width / 2 height / 2
        glScissor width / 2 height / 2 width / 2 height / 2
        glMatrixMode GL_MODELVIEW
        glLoadIdentity
        gluLookAt 3.0 1.5 3.0 0.0 0.0 0.0 0.0 1.0 0.0
        
        ;Configure and enable light source 1
        glLightfv GL_LIGHT1 GL_POSITION as float32-ptr! light_position
        glLightfv GL_LIGHT1 GL_AMBIENT as float32-ptr! light_ambient
        glLightfv GL_LIGHT1 GL_DIFFUSE as float32-ptr! light_diffuse
        glLightfv GL_LIGHT1 GL_SPECULAR as float32-ptr! light_specular
        glEnable GL_LIGHT1
        glEnable GL_LIGHTING
        
        ;Draw scene
        drawScene
        
        ;Disable lighting
        glDisable(GL_LIGHTING);

        ;Disable face culling
        glDisable(GL_CULL_FACE);

        ;Disable depth test
        glDisable(GL_DEPTH_TEST);

        ;Disable scissor test
        glDisable(GL_SCISSOR_TEST)
        
        
        ;Draw a border around the active view
         if (active_view > 0) and (active_view <> 2) [
            glViewport 0 0 width height
            glMatrixMode GL_PROJECTION
            glLoadIdentity
            glOrtho 0.0 2.0 0.0 2.0 0.0 1.0
            glMatrixMode GL_MODELVIEW
            glLoadIdentity
            switch active_view[
                1 [xt: 0.0  yt: 1.0]
                3 [xt: 0.0  yt: 0.0]
                4 [xt: 1.0  yt: 0.0]   
            ]
            zt:  0.0
            glTranslatef as float32! xt as float32! yt as float32! zt
            glColor3f 1.0 1.0 0.6
            glBegin GL_LINE_STRIP
                glVertex2i 0 0
                glVertex2i 1 0
                glVertex2i 1 1
                glVertex2i 0 1
                glVertex2i 0 0
            glEnd
         ]
         
        
    ]
    
    
    ;========================================================================
    ;Framebuffer size callback function
   

    framebufferSizeFun: func [
        [calling]
        window [GLFWwindow] w [integer!] h [integer!]][
            width: w
            either h > 0 [height: h][height: 1]
            do_redraw: 1    
    ]
    
    ;Window refresh callback function
    windowRefreshFun: func [
        [calling]
        window [GLFWwindow]] [
        do_redraw: 1    
    ]
    
    ;Mouse position callback function
    cursorPosFun:  func [
        [calling]
        window [GLFWwindow] x [float!] y [float!]] [
        ;Depending on which view was selected, rotate around different axes
        xp: float-to-int (x - xpos)
        yp: float-to-int (y - ypos)
        switch active_view [
            1 [rot_x: rot_x + yp rot_z: rot_z + xp]
            3 [rot_x: rot_x + yp rot_y: rot_z + xp]
            4 [rot_y: rot_y + xp rot_z: rot_z + yp]
            default []
        ]
        do_redraw: 1
        ;Remember cursor position
        xpos: x
        ypos: y
    ]
    ;Mouse button callback function
    mouseButtonFun: func [
        [calling]
        window [GLFWwindow] button [integer!] action [integer!] mods [integer!] /local x y] [
        either button = (GLFW_MOUSE_BUTTON_LEFT) AND (action = GLFW_PRESS) [
            active_view: 1
            x: int-to-float width / 2
            y: int-to-float height / 2
            if xpos >= x [active_view: active_view  + 1]
            if ypos >= y [active_view: active_view  + 2]
            
        ]
        [if button = (GLFW_MOUSE_BUTTON_LEFT) [active_view: 0]]
        do_redraw: 1
    ]
    
    ; key callback function
    
    key_callback: func [
        [calling]
        window [GLFWwindow]
        key [integer!]
        scancode [integer!]
        action [integer!]
        mods [integer!]] [
        if (key = GLFW_KEY_ESCAPE) and (action = GLFW_PRESS) [glfwSetWindowShouldClose window GL_TRUE ]
    ]
    
    ; main
    if glfwInit = 0 [glfwTerminate]
    window: glfwCreateWindow 500 500 "Split view demo" NULL NULL
    
    ;Set callback functions
    glfwSetFramebufferSizeCallback window :framebufferSizeFun
    glfwSetWindowRefreshCallback window :windowRefreshFun
    glfwSetCursorPosCallback window :cursorPosFun
    glfwSetMouseButtonCallback window :mouseButtonFun
    glfwSetKeyCallback window :key_callback
    
    ;Enable vsync
    glfwMakeContextCurrent window
    glfwSwapInterval 1
    
    glfwGetFramebufferSize window &width &height
    framebufferSizeFun window width height    
    
    ; main loop
    while [(glfwWindowShouldClose window) = GL_FALSE] [
        ;Only redraw if we need to
        if do_redraw = 1 [
            ;Draw all views
            drawAllViews
            ;Swap buffers
            glfwSwapBuffers window
            do_redraw = 0  
        ]
     glfwWaitEvents
    ]
    ;Close OpenGL window and terminate GLFW
    glfwTerminate