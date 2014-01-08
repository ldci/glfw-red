Red/System [
	Title:		"GLFW Binding: Simple multi-window test"
	Author:		"François Jouen"
	Rights:		"Copyright (c) 2013 François Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]

    ;========================================================================    
    ;
    ; This test creates four windows and clears each in a different color  
    ; Orginal program by Camilla Berglund <elmindreda@elmindreda.org>
    ;========================================================================

    #include %../glfw.reds
    #include %../Tools/user.reds
    
    i: 1
    c1: 0.0
    c2: 0.0
    c3: 0.0
    
    
    running: GL_TRUE
    

    ; An array for 4 windows title    
    titles: declare struct! [
        t1  [c-string!]
        t2  [c-string!]
        t3  [c-string!]
        t4  [c-string!]
    ]
    titles/t1: "Foo"
    titles/t2: "Bar"
    titles/t3: "Baz"
    titles/t4: "Quux"
    
    ptitles: as int-ptr! titles             ; a pointer to the array
    
    ; An array to 4 windows
    windows: declare struct! [
        w1  [pointer! [integer!]]
        w2  [pointer! [integer!]]
        w3  [pointer! [integer!]]
        w4  [pointer! [integer!]]
    ]
    
    ; just reserved  memory
    windows/w1: null
    windows/w2: null
    windows/w3: null
    windows/w4: null
    
    pwindows: as int-ptr! windows           ; a pointer to the array
    window: declare pointer! [integer!]     ; a pointer to an element of the array
   
    
    
    error_callback: func [[calling] error [integer!] description [c-string!]] [
        print ["Error: " error " " description newline]
        throw error ; stderr
    ]
    
    ; main
    glfwSetErrorCallback :error_callback
    if glfwInit = 0 [glfwTerminate] ; exit
    
    until [
        pwindows/i: as integer! glfwCreateWindow 200 200 as c-string! ptitles/i NULL NULL
        window: as int-ptr! pwindows/i
        glfwMakeContextCurrent window
        c1: int-to-float ((i - 1)  and 1)
        c2: int-to-float ((i - 1) >> 1)
        either i - 1 = 0 [c3: 1.0 ] [c3: 0.0]
        glClearColor as float32! c1 as float32! c2  as float32! c3 1.0
        glfwSetWindowPos window 100 + ((i - 1 AND 1) * 300) 100 + ((i - 1 >> 1) * 300)
        glfwShowWindow window
        i: i + 1
    i > 4
    ]
    
    while [running = 1][
        i: 1 
        until [
            window: as int-ptr! pwindows/i
            glfwMakeContextCurrent window
            glClear GL_COLOR_BUFFER_BIT
            glfwSwapBuffers window
            if (glfwWindowShouldClose window) = GL_TRUE  [running: GL_FALSE]    
            i: i + 1    
        i > 4
        ]
        glfwPollEvents
    ]
   
    glfwTerminate