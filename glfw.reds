Red/System [
	Title:		"GLFW Binding"
	Author:		"F. Jouen"
	Rights:		"Copyright (c) 2013-2014 F. Jouen. All rights reserved."
	License:    "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]



;GLFW (http://www.glfw.org) is a free, Open Source, portable library for OpenGL and OpenGL ES
;application development.  It provides a simple, platform-independent API for
;creating windows and contexts, reading input, handling events, etc.


; please update paths according to your OS
#switch OS [
        MacOSX		[#define glfwlib "/usr/local/lib/libglfw.dylib" #define calling cdecl]  
        Windows		[#define glfwlib "c:\glfw\bin\glfw.dlll" #define calling stdcall]                               
        Linux           [#define glfwlib "/usr/lib/libglfw.so" #define calling cdecl]                                        
	#default	[#define glfwlib "/usr/local/lib/libglfw.dylib" #define calling cdecl]
]


#include %rpointers.reds
;glfwlib requires OpenGL  
#include %opgl.reds
#include %glu.reds

; GLFW API tokens

#define GLFW_VERSION_MAJOR          3
#define GLFW_VERSION_MINOR          0
#define GLFW_VERSION_REVISION       4
#define GLFW_RELEASE                0
#define GLFW_PRESS                  1
#define GLFW_REPEAT                 2

; The unknown key 
#define GLFW_KEY_UNKNOWN            -1

; Printable keys 
#define GLFW_KEY_SPACE              32
#define GLFW_KEY_APOSTROPHE         39  ; ' 
#define GLFW_KEY_COMMA              44  ; , 
#define GLFW_KEY_MINUS              45  ; - 
#define GLFW_KEY_PERIOD             46  ; . 
#define GLFW_KEY_SLASH              47  ; / 
#define GLFW_KEY_0                  48
#define GLFW_KEY_1                  49
#define GLFW_KEY_2                  50
#define GLFW_KEY_3                  51
#define GLFW_KEY_4                  52
#define GLFW_KEY_5                  53
#define GLFW_KEY_6                  54
#define GLFW_KEY_7                  55
#define GLFW_KEY_8                  56
#define GLFW_KEY_9                  57
#define GLFW_KEY_SEMICOLON          59  ; ; 
#define GLFW_KEY_EQUAL              61  ; = 
#define GLFW_KEY_A                  65
#define GLFW_KEY_B                  66
#define GLFW_KEY_C                  67
#define GLFW_KEY_D                  68
#define GLFW_KEY_E                  69
#define GLFW_KEY_F                  70
#define GLFW_KEY_G                  71
#define GLFW_KEY_H                  72
#define GLFW_KEY_I                  73
#define GLFW_KEY_J                  74
#define GLFW_KEY_K                  75
#define GLFW_KEY_L                  76
#define GLFW_KEY_M                  77
#define GLFW_KEY_N                  78
#define GLFW_KEY_O                  79
#define GLFW_KEY_P                  80
#define GLFW_KEY_Q                  81
#define GLFW_KEY_R                  82
#define GLFW_KEY_S                  83
#define GLFW_KEY_T                  84
#define GLFW_KEY_U                  85
#define GLFW_KEY_V                  86
#define GLFW_KEY_W                  87
#define GLFW_KEY_X                  88
#define GLFW_KEY_Y                  89
#define GLFW_KEY_Z                  90
#define GLFW_KEY_LEFT_BRACKET       91  ; [ 
#define GLFW_KEY_BACKSLASH          92  ; \ 
#define GLFW_KEY_RIGHT_BRACKET      93  ; ] 
#define GLFW_KEY_GRAVE_ACCENT       96  ; ` 
#define GLFW_KEY_WORLD_1            161 ; non-US #1 
#define GLFW_KEY_WORLD_2            162 ; non-US #2

;Function keys
#define GLFW_KEY_ESCAPE             256
#define GLFW_KEY_ENTER              257
#define GLFW_KEY_TAB                258
#define GLFW_KEY_BACKSPACE          259
#define GLFW_KEY_INSERT             260
#define GLFW_KEY_DELETE             261
#define GLFW_KEY_RIGHT              262
#define GLFW_KEY_LEFT               263
#define GLFW_KEY_DOWN               264
#define GLFW_KEY_UP                 265
#define GLFW_KEY_PAGE_UP            266
#define GLFW_KEY_PAGE_DOWN          267
#define GLFW_KEY_HOME               268
#define GLFW_KEY_END                269
#define GLFW_KEY_CAPS_LOCK          280
#define GLFW_KEY_SCROLL_LOCK        281
#define GLFW_KEY_NUM_LOCK           282
#define GLFW_KEY_PRINT_SCREEN       283
#define GLFW_KEY_PAUSE              284
#define GLFW_KEY_F1                 290
#define GLFW_KEY_F2                 291
#define GLFW_KEY_F3                 292
#define GLFW_KEY_F4                 293
#define GLFW_KEY_F5                 294
#define GLFW_KEY_F6                 295
#define GLFW_KEY_F7                 296
#define GLFW_KEY_F8                 297
#define GLFW_KEY_F9                 298
#define GLFW_KEY_F10                299
#define GLFW_KEY_F11                300
#define GLFW_KEY_F12                301
#define GLFW_KEY_F13                302
#define GLFW_KEY_F14                303
#define GLFW_KEY_F15                304
#define GLFW_KEY_F16                305
#define GLFW_KEY_F17                306
#define GLFW_KEY_F18                307
#define GLFW_KEY_F19                308
#define GLFW_KEY_F20                309
#define GLFW_KEY_F21                310
#define GLFW_KEY_F22                311
#define GLFW_KEY_F23                312
#define GLFW_KEY_F24                313
#define GLFW_KEY_F25                314
#define GLFW_KEY_KP_0               320
#define GLFW_KEY_KP_1               321
#define GLFW_KEY_KP_2               322
#define GLFW_KEY_KP_3               323
#define GLFW_KEY_KP_4               324
#define GLFW_KEY_KP_5               325
#define GLFW_KEY_KP_6               326
#define GLFW_KEY_KP_7               327
#define GLFW_KEY_KP_8               328
#define GLFW_KEY_KP_9               329
#define GLFW_KEY_KP_DECIMAL         330
#define GLFW_KEY_KP_DIVIDE          331
#define GLFW_KEY_KP_MULTIPLY        332
#define GLFW_KEY_KP_SUBTRACT        333
#define GLFW_KEY_KP_ADD             334
#define GLFW_KEY_KP_ENTER           335
#define GLFW_KEY_KP_EQUAL           336
#define GLFW_KEY_LEFT_SHIFT         340
#define GLFW_KEY_LEFT_CONTROL       341
#define GLFW_KEY_LEFT_ALT           342
#define GLFW_KEY_LEFT_SUPER         343
#define GLFW_KEY_RIGHT_SHIFT        344
#define GLFW_KEY_RIGHT_CONTROL      345
#define GLFW_KEY_RIGHT_ALT          346
#define GLFW_KEY_RIGHT_SUPER        347
#define GLFW_KEY_MENU               348
#define GLFW_KEY_LAST               GLFW_KEY_MENU
#define GLFW_MOD_SHIFT           00000001h             ; shift key
#define GLFW_MOD_CONTROL         00000002h             ; control key
#define GLFW_MOD_ALT             00000004h             ; alt key
#define GLFW_MOD_SUPER           00000008h             ; super key

;mouse buttons
#define GLFW_MOUSE_BUTTON_1         0
#define GLFW_MOUSE_BUTTON_2         1
#define GLFW_MOUSE_BUTTON_3         2
#define GLFW_MOUSE_BUTTON_4         3
#define GLFW_MOUSE_BUTTON_5         4
#define GLFW_MOUSE_BUTTON_6         5
#define GLFW_MOUSE_BUTTON_7         6
#define GLFW_MOUSE_BUTTON_8         7
#define GLFW_MOUSE_BUTTON_LAST      GLFW_MOUSE_BUTTON_8
#define GLFW_MOUSE_BUTTON_LEFT      GLFW_MOUSE_BUTTON_1
#define GLFW_MOUSE_BUTTON_RIGHT     GLFW_MOUSE_BUTTON_2
#define GLFW_MOUSE_BUTTON_MIDDLE    GLFW_MOUSE_BUTTON_3

;joystick buttons
#define GLFW_JOYSTICK_1             0
#define GLFW_JOYSTICK_2             1
#define GLFW_JOYSTICK_3             2
#define GLFW_JOYSTICK_4             3
#define GLFW_JOYSTICK_5             4
#define GLFW_JOYSTICK_6             5
#define GLFW_JOYSTICK_7             6
#define GLFW_JOYSTICK_8             7
#define GLFW_JOYSTICK_9             8
#define GLFW_JOYSTICK_10            9
#define GLFW_JOYSTICK_11            10
#define GLFW_JOYSTICK_12            11
#define GLFW_JOYSTICK_13            12
#define GLFW_JOYSTICK_14            13
#define GLFW_JOYSTICK_15            14
#define GLFW_JOYSTICK_16            15
#define GLFW_JOYSTICK_LAST          GLFW_JOYSTICK_16

; errors
#define GLFW_NOT_INITIALIZED        00010001h      ;GLFW has not been initialized.
#define GLFW_NO_CURRENT_CONTEXT     00010002h      ;No context is current for this thread.
#define GLFW_INVALID_ENUM           00010003h      ;One of the enum parameters for the function was given an invalid enum.
#define GLFW_INVALID_VALUE          00010004h      ;One of the parameters for the function was given an invalid value.
#define GLFW_OUT_OF_MEMORY          00010005h      ;A memory allocation failed.
#define GLFW_API_UNAVAILABLE        00010006h      ;GLFW could not find support for the requested client API on the system.
#define GLFW_VERSION_UNAVAILABLE    00010007h      ;The requested client API version is not available.
#define GLFW_PLATFORM_ERROR         00010008h      ;A platform-specific error occurred that does not match any of the more specific categories.
#define GLFW_FORMAT_UNAVAILABLE     00010009h      ;the clipboard did not contain data in the requested format.

#define GLFW_FOCUSED                00020001h
#define GLFW_ICONIFIED              00020002h
#define GLFW_RESIZABLE              00020003h
#define GLFW_VISIBLE                00020004h
#define GLFW_DECORATED              00020005h

#define GLFW_RED_BITS               00021001h
#define GLFW_GREEN_BITS             00021002h
#define GLFW_BLUE_BITS              00021003h
#define GLFW_ALPHA_BITS             00021004h
#define GLFW_DEPTH_BITS             00021005h
#define GLFW_STENCIL_BITS           00021006h
#define GLFW_ACCUM_RED_BITS         00021007h
#define GLFW_ACCUM_GREEN_BITS       00021008h
#define GLFW_ACCUM_BLUE_BITS        00021009h
#define GLFW_ACCUM_ALPHA_BITS       0002100Ah
#define GLFW_AUX_BUFFERS            0002100Bh
#define GLFW_STEREO                 0002100Ch
#define GLFW_SAMPLES                0002100Dh
#define GLFW_SRGB_CAPABLE           0002100Eh
#define GLFW_REFRESH_RATE           0002100Fh

#define GLFW_CLIENT_API             00022001h
#define GLFW_CONTEXT_VERSION_MAJOR  00022002h
#define GLFW_CONTEXT_VERSION_MINOR  00022003h
#define GLFW_CONTEXT_REVISION       00022004h
#define GLFW_CONTEXT_ROBUSTNESS     00022005h
#define GLFW_OPENGL_FORWARD_COMPAT  00022006h
#define GLFW_OPENGL_DEBUG_CONTEXT   00022007h
#define GLFW_OPENGL_PROFILE         00022008h

#define GLFW_OPENGL_API             00030001h
#define GLFW_OPENGL_ES_API          00030002h

#define GLFW_NO_ROBUSTNESS          0
#define GLFW_NO_RESET_NOTIFICATION  00031001h
#define GLFW_LOSE_CONTEXT_ON_RESET  00031002h

#define GLFW_OPENGL_ANY_PROFILE     0
#define GLFW_OPENGL_CORE_PROFILE    00032001h
#define GLFW_OPENGL_COMPAT_PROFILE  00032002h

#define GLFW_CURSOR                 00033001h
#define GLFW_STICKY_KEYS            00033002h
#define GLFW_STICKY_MOUSE_BUTTONS   00033003h

#define GLFW_CURSOR_NORMAL          00034001h
#define GLFW_CURSOR_HIDDEN          00034002h
#define GLFW_CURSOR_DISABLED        00034003h

#define GLFW_CONNECTED              00040001h
#define GLFW_DISCONNECTED           00040002h

; GLFW API types
;opaques structures
#define GLFWmonitor int-ptr!
#define GLFWwindow int-ptr!
;red/system aliases to functions / by convention use ! suffix
GLFWglproc!: alias function! []
GLFWerrorfun!: alias function! [ n[integer!] s [c-string!]]
GLFWwindowposfun!: alias function! [w [GLFWwindow] n1 [integer!] n2 [integer!]]
GLFWwindowsizefun!: alias function! [w [GLFWwindow] n1 [integer!] n2 [integer!]]
GLFWwindowclosefun!: alias function! [w [GLFWwindow]]
GLFWwindowrefreshfun!: alias function! [w [GLFWwindow]]
GLFWwindowfocusfun!: alias function! [w [GLFWwindow] n[integer!]]
GLFWwindowiconifyfun!: alias function! [w [GLFWwindow] n[integer!]]
GLFWframebuffersizefun!: alias function! [w [GLFWwindow] n1 [integer!] n2 [integer!]]
GLFWmousebuttonfun!: alias function! [w [GLFWwindow] n1 [integer!] n2 [integer!] n3 [integer!]]
GLFWcursorposfun!: alias function! [w [GLFWwindow] n1 [float!] n2 [float!]]
GLFWcursorenterfun!: alias function! [w [GLFWwindow] n1 [integer!]]
GLFWscrollfun!: alias function! [w [GLFWwindow] n1 [float!] n2 [float!]]
GLFWkeyfun!: alias function! [w [GLFWwindow] n1 [integer!] n2 [integer!] n3 [integer!] n4 [integer!]]
GLFWcharfun!: alias function! [w [GLFWwindow] b [integer!] ]
GLFWmonitorfun!: alias function! [w [GLFWwindow] n [integer!] ]



GLFWvidmode: alias struct! [
    width           [integer!]
    height          [integer!]
    redBits         [integer!]
    greenBits       [integer!]
    blueBits        [integer!]
    refreshRate     [integer!]
]

GLFWgammaramp: alias struct! [
    red             [int-ptr!]
    green           [int-ptr!]
    blue            [int-ptr!]
    size            [integer!]
]

; old version not supported now
GLFWimage: alias struct! [
    width           [integer!]
    height          [integer!]
    BytesPerPixel   [integer!]
    *Data           [int-ptr!]
]



#import [
    glfwlib calling [
        glfwInit: "glfwInit" [
        "Initializes the GLFW library. return `GL_TRUE` if successful, or `GL_FALSE` if an error occurred."
            return:	    [integer!]    
        ]
        
        glfwTerminate: "glfwTerminate" [
        "Terminates the GLFW library."   
        ]
        
        glfwGetVersion: "glfwGetVersion" [
        "Retrieves the version of the GLFW library."
            major           [int-ptr!]
            minor           [int-ptr!]
            rev             [int-ptr!]
        ]
        glfwGetVersionString: "glfwGetVersionString" [
        "Returns a string describing the compile-time configuration."
            return:	    [c-string!] 
        ]
        
        glfwSetErrorCallback: "glfwSetErrorCallback" [
        "Sets the error callback."
            cbfun           [GLFWerrorfun!]
            return:         [GLFWerrorfun!]
        ]
        
        glfwGetMonitors: "glfwGetMonitors" [
        "Returns the currently connected monitors."
            count           [int-ptr!]
            return:	    [GLFWmonitor]
        ]
        glfwGetPrimaryMonitor: "glfwGetPrimaryMonitor" [
        "Returns the primary monitor."
            return:	    [GLFWmonitor]   
        ]
        
        glfwGetMonitorPos: "glfwGetMonitorPos" [
        "Returns the position of the monitor's viewport on the virtual screen."
            monitor         [GLFWmonitor]
            xpos            [int-ptr!]            
            ypos            [int-ptr!]
        ]
        glfwGetMonitorPhysicalSize: "glfwGetMonitorPhysicalSize" [
        "Returns the physical size of the monitor."
            monitor         [GLFWmonitor]
            width           [int-ptr!]            
            height          [int-ptr!]
        ]
        
        glfwGetMonitorName: "glfwGetMonitorName" [
        "Returns the name of the specified monitor."
            monitor         [GLFWmonitor]
            return:	    [c-string!]   
        ]
        
        glfwSetMonitorCallback: "glfwSetMonitorCallback" [
        "Sets the monitor configuration callback."
            cbfun           [GLFWmonitorfun!]
            return:         [GLFWmonitorfun!]
        ]
        
        glfwGetVideoModes: "glfwGetVideoModes" [
        "Returns the available video modes for the specified monitor."
            monitor         [GLFWmonitor]
            count           [int-ptr!]
            return:         [GLFWvidmode]
        ]
        
        glfwGetVideoMode: "glfwGetVideoMode" [
        "Returns the current mode of the specified monitor."
            monitor         [GLFWmonitor]
            return:         [GLFWvidmode]
        ]
        
        glfwSetGamma: "glfwSetGamma" [
        "Generates a gamma ramp and sets it for the specified monitor."
            monitor         [GLFWmonitor]
            gamma           [Float32!]
        ]
        
        glfwGetGammaRamp: "glfwGetGammaRamp" [
        "Retrieves the current gamma ramp for the specified monitor."
            monitor         [GLFWmonitor]
            return:         [GLFWgammaramp]
        ]
        
        glfwSetGammaRamp: "glfwSetGammaRamp" [
        "Sets the current gamma ramp for the specified monitor."
            monitor         [GLFWmonitor]
            ramp            [GLFWgammaramp]
        ]
        
        glfwDefaultWindowHints: "glfwDefaultWindowHints" [
        "Resets all window hints to their default values."    
        ]
        
        glfwWindowHint: "glfwWindowHint" [
        "Sets the specified window hint to the desired value."
            target          [integer!]
            hint            [integer!]
        ]
        
        glfwCreateWindow: "glfwCreateWindow" [
        "Creates a window and its associated context."
            width           [integer!]
            height          [integer!]
            title           [c-string!]
            monitor         [GLFWmonitor]
            share           [GLFWwindow]
            return:         [GLFWwindow]
        ]
        
        glfwDestroyWindow: "glfwDestroyWindow" [
        "Destroys the specified window and its context."
            window           [GLFWwindow]    
        ]
        
        glfwWindowShouldClose: "glfwWindowShouldClose" [
        "Checks the close flag of the specified window."
            window           [GLFWwindow]
            return:          [integer!]  
        ]
        
        glfwSetWindowShouldClose: "glfwSetWindowShouldClose" [
        "Sets the close flag of the specified window."
            window         [GLFWwindow]
            value          [integer!]     
        ]
        
        glfwSetWindowTitle: "glfwSetWindowTitle" [
        "Sets the title of the specified window."
            window         [GLFWwindow]
            title          [c-string!]
        ]
        
        glfwGetWindowPos: "glfwGetWindowPos" [
        "Retrieves the position of the client area of the specified window."
            window          [GLFWwindow]
            xpos            [int-ptr!]
            ypos            [int-ptr!]  
        ]
        
        glfwSetWindowPos: "glfwSetWindowPos" [
        "Sets the position of the client area of the specified window."
            window          [GLFWwindow]
            xpos            [integer!]
            ypos            [integer!]  
        ]
        
        glfwGetWindowSize: "glfwGetWindowSize" [
        "Retrieves the size of the client area of the specified window."
            window           [GLFWwindow]
            width            [int-ptr!]
            height           [int-ptr!]    
        ]
        
        glfwSetWindowSize: "glfwSetWindowSize" [
        "Sets the size of the client area of the specified window."
            window           [GLFWwindow]
            width            [integer!]
            height           [integer!]  
        ]
        
        glfwGetFramebufferSize: "glfwGetFramebufferSize" [
        "Retrieves the size of the framebuffer of the specified window."
            window           [GLFWwindow]
            width            [int-ptr!]
            height           [int-ptr!]
        ]
        
        glfwIconifyWindow: "glfwIconifyWindow" [
        "Iconifies the specified window."
            window           [GLFWwindow]  
        ]
        
        glfwRestoreWindow: "glfwRestoreWindow" [
        "Restores the specified window."
            window           [GLFWwindow]     
        ]
        
        glfwShowWindow: "glfwShowWindow" [
        "Makes the specified window visible."
            window           [GLFWwindow]
        ]
        
        glfwHideWindow: "glfwHideWindow" [
        "Hides the specified window."
            window           [GLFWwindow]    
        ]
        
        glfwGetWindowMonitor: "glfwGetWindowMonitor" [
        "Returns the monitor that the window uses for full screen mode."
            window           [GLFWwindow]
            return:          [GLFWmonitor]
        ]
        
        glfwGetWindowAttrib: "glfwGetWindowAttrib" [
        "Returns an attribute of the specified window."
            window           [GLFWwindow]
            attrib           [integer!]
            return:          [integer!]  
        ]
        
        glfwSetWindowUserPointer: "glfwSetWindowUserPointer" [
        "Sets the user pointer of the specified window."
            window           [GLFWwindow]
            pointer          [byte-ptr!] ;void* pointer  
        ]
        
         glfwGetWindowUserPointer: "glfwGetWindowUserPointer" [
        ;Returns the user pointer of the specified window.
            window           [GLFWwindow]    
        ]
        
        glfwSetWindowPosCallback: "glfwSetWindowPosCallback" [
        "Sets the position callback for the specified window."
            window          [GLFWwindow]
            cbfun           [GLFWwindowposfun!]
            return:         [GLFWwindowposfun!]
        ]
        
        glfwSetWindowSizeCallback: "glfwSetWindowSizeCallback" [
        "Sets the size callback for the specified window."
            window          [GLFWwindow]
            cbfun           [GLFWwindowsizefun!]
            return:         [GLFWwindowsizefun!]  
        ]
        
        glfwSetWindowCloseCallback: "glfwSetWindowCloseCallback" [
        "Sets the close callback for the specified window."
            window          [GLFWwindow]
            cbfun           [GLFWwindowclosefun!]
            return:         [GLFWwindowclosefun!]   
        ]
        
        
        glfwSetWindowFocusCallback: "glfwSetWindowFocusCallback" [
        "Sets the focus callback for the specified window."
            window          [GLFWwindow]
            cbfun           [GLFWwindowfocusfun!]
            return:         [GLFWwindowfocusfun!]     
        ]
        
        glfwSetWindowRefreshCallback: "glfwSetWindowRefreshCallback" [
        "Sets the refresh callback for the specified window"
            window          [GLFWwindow]
            cbfun           [GLFWwindowrefreshfun!]
            return:         [GLFWwindowrefreshfun!]
        ]
        
       
        
        glfwSetWindowIconifyCallback: "glfwSetWindowIconifyCallback" [
        "Sets the iconify callback for the specified window."
            window          [GLFWwindow]
            cbfun           [GLFWwindowiconifyfun!]
            return:         [GLFWwindowiconifyfun!]     
        ]
        
        glfwSetFramebufferSizeCallback: "glfwSetFramebufferSizeCallback" [
        "Sets the framebuffer resize callback for the specified window."
            window          [GLFWwindow]
            cbfun           [GLFWframebuffersizefun!]
            return:         [GLFWframebuffersizefun!]
        ]
        
        glfwPollEvents: "glfwPollEvents" [
        "Processes all pending events."    
        ]
        
        glfwWaitEvents: "glfwWaitEvents" [
        "Waits until events are pending and processes them."    
        ]
        
        glfwGetInputMode: "glfwGetInputMode" [
        "Returns the value of an input option for the specified window."
            window           [GLFWwindow]
            mode             [integer!]
            return:          [integer!]   
        ]
        
        glfwSetInputMode: "glfwSetInputMode" [
        "Sets an input option for the specified window."
            window           [GLFWwindow]
            mode             [integer!]
            value            [integer!] 
        ]
        
        glfwGetKey: "glfwGetKey" [
        "Returns the last reported state of a keyboard key for the specified window."
            window           [GLFWwindow]
            key              [integer!]
            return:          [integer!] 
        ]
        
        glfwGetMouseButton: "glfwGetMouseButton" [
        "Returns the last reported state of a mouse button for the specified window."
            window           [GLFWwindow]
            button           [integer!]
            return:          [integer!] 
        ]
        
        glfwGetCursorPos: "glfwGetCursorPos" [
        "Retrieves the last reported cursor position, relative to the client area of the window."
            window           [GLFWwindow]
            xpos             [float-ptr!] ;double*
            ypos             [float-ptr!] ;double*
        ]
        
        glfwSetCursorPos: "glfwSetCursorPos" [
        "Sets the position of the cursor, relative to the client area of the window."
            window           [GLFWwindow]
            xpos             [Float32!] 
            ypos             [Float32!]  
        ]
        
        glfwSetMouseButtonCallback: "glfwSetMouseButtonCallback" [
        "Sets the mouse button callback."
            window          [GLFWwindow]
            cbfun           [GLFWmousebuttonfun!]
            return:         [GLFWmousebuttonfun!]    
        ]
        
        glfwSetCursorPosCallback: "glfwSetCursorPosCallback" [
        "Sets the position of the cursor, relative to the client area of the window"
            window          [GLFWwindow]
            cbfun           [GLFWcursorposfun!]
            return:         [GLFWcursorposfun!]    
        ]
        
        glfwSetCursorEnterCallback: "glfwSetCursorEnterCallback" [
        "Sets the key callback."
            window          [GLFWwindow]
            cbfun           [GLFWcursorenterfun!]
            return:         [GLFWcursorenterfun!]  
        ]
        
        glfwSetScrollCallback: "glfwSetScrollCallback" [
        "Sets the scroll callback."
            window          [GLFWwindow]
            cbfun           [GLFWscrollfun!]
            return:         [GLFWscrollfun!]    
        ]
        
        glfwSetKeyCallback: "glfwSetKeyCallback" [
        "Sets the key callback."
            window          [GLFWwindow]
            cbfun           [GLFWkeyfun!]
            return:         [GLFWkeyfun!]
        ]
        
        glfwSetCharCallback: "glfwSetCharCallback" [
        "Sets the Unicode character callback."
            window          [GLFWwindow]
            cbfun           [GLFWcharfun!]
            return:         [GLFWcharfun!]    
        ]
        
        glfwJoystickPresent: "glfwJoystickPresent" [
        "Returns whether the specified joystick is present."
            joy             [integer!]
            return:         [integer!]
        ]
        
        glfwGetJoystickAxes: "glfwGetJoystickAxes" [
        "Returns the values of all axes of the specified joystick."
            joy             [integer!]
            count           [int-ptr!]
            return:         [float32-ptr!]
        ]
        
        glfwGetJoystickButtons: "glfwGetJoystickButtons" [
        "Returns the state of all buttons of the specified joystick"
            joy             [integer!]
            count           [int-ptr!]
            return:         [byte-ptr!]
        ]
        glfwGetJoystickName: "glfwGetJoystickName" [
        "This function returns the name, encoded as UTF-8, of the specified joystick."
            joy             [integer!]
            return:         [c-string!]   
        ]
        
        glfwSetClipboardString: "glfwSetClipboardString" [
        "ets the clipboard to the specified string."
            window           [GLFWwindow]
            string           [c-string!]  ; pointer          
        ]
        
        glfwGetClipboardString: "glfwGetClipboardString" [
        "Retrieves the contents of the clipboard as a string."
            window           [GLFWwindow]
            return:          [c-string!]        
        ]
        
        glfwGetTime: "glfwGetTime" [
        "Returns the value of the GLFW timer."
            return:          [Float!]    
        ]
        
        glfwSetTime: "glfwSetTime" [
        "Sets the GLFW timer."
            time            [Float!]    
        ]
        
        glfwMakeContextCurrent: "glfwMakeContextCurrent" [
        "Makes the context of the specified window current for the calling thread."
             window           [GLFWwindow]    
        ]
        
        glfwGetCurrentContext: "glfwGetCurrentContext" [
        "Returns the window whose context is current on the calling thread."
            return:           [GLFWwindow]        
        ]
        
         glfwSwapBuffers: "glfwSwapBuffers" [
        "Swaps the front and back buffers of the specified window."
            window           [GLFWwindow]     
        ]
        
        glfwSwapInterval: "glfwSwapInterval" [
        "Sets the swap interval for the current context.(vsync)"
            interval        [integer!]
        ]
        
        glfwExtensionSupported: "glfwExtensionSupported" [
        "Returns whether the specified extension is available."
            extension       [c-string!]
            return:         [integer!]
        ]
        
        glfwGetProcAddress: "glfwGetProcAddress" [
        "Returns the address of the specified function for the current context."
            procname       [c-string!]
            return:        [int-ptr!]
        ]
        
        ;*****************************************************
        ; glfw3native functions ; see glfw3native.h for detail
        ; be sure of what you 're doing
        ;*****************************************************
        
        
        ;#if defined(GLFW_EXPOSE_NATIVE_WIN32)
        glfwGetWin32Window: "glfwGetWin32Window" [
            window           [GLFWwindow]
            return:          [byte-ptr!] ;HWND
        ]
        
        ;#if defined(GLFW_EXPOSE_NATIVE_WGL)
        glfwGetWGLContext: "glfwGetWGLContext" [
            window           [GLFWwindow]
            return:          [byte-ptr!] ;HGLRC
        ]
        
        ;#if defined(GLFW_EXPOSE_NATIVE_COCOA)
        glfwGetCocoaWindow: "glfwGetCocoaWindow" [
            window           [GLFWwindow]
            return:          [byte-ptr!] ;id
        ]
        
        ;#if defined(GLFW_EXPOSE_NATIVE_NSGL)
        glfwGetNSGLContext: "glfwGetNSGLContext" [
            window           [GLFWwindow]
            return:          [byte-ptr!] ;id
        ]
        
        ;#if defined(GLFW_EXPOSE_NATIVE_X11)
        glfwGetX11Display: "glfwGetX11Display" [
            return:          [byte-ptr!] ;Display*
        ]
        
        glfwGetX11Window: "glfwGetX11Window" [
            window           [GLFWwindow]
            return:          [byte-ptr!] ;window
        ]
        
        ;#if defined(GLFW_EXPOSE_NATIVE_GLX)
        glfwGetGLXContext: "glfwGetGLXContext" [
            window           [GLFWwindow]
            return:          [byte-ptr!] ;GLXContext
        ]
        
        ;#if defined(GLFW_EXPOSE_NATIVE_EGL)
        glfwGetEGLDisplay: "glfwGetEGLDisplay" [
            return:          [byte-ptr!] ;EGLDisplay
        ]
        
        glfwGetEGLContext: "glfwGetEGLContext" [
            window           [GLFWwindow]
            return:          [byte-ptr!] ;EGLContext
        ]
        
        glfwGetEGLSurface: "glfwGetEGLSurface" [
            window           [GLFWwindow]
            return:          [byte-ptr!] ;EGLSurface
        ]
    ]
]


; for tests 
{print ["Library is : " glfwlib lf]
glfwInit
print ["Version: " glfwGetVersionString lf]
glfwTerminate}