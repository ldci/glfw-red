Red/System [
	Title:		"GLFW Binding: events"
	Author:		"François Jouen"
	Rights:		"Copyright (c) 2013-2014 François Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]




;========================================================================
;
; This test hooks every available callback and outputs their arguments
;
; Log messages go to stdout, error messages to stderr
;
; Every event also gets a (sequential) number to aid discussion of logs
; original program Copyright (c) Camilla Berglund <elmindreda@elmindreda.org>
;========================================================================

#include %../glfw.reds
#include %../Tools/user.reds

;These must match the input mode defaults
closeable: GL_TRUE

;Event index
counter: 0


width: 640
height: 480
&width: :width; pointer! 
&height: :height ;pointer!


get_key_name: func [key [integer!] return: [c-string!]][
    switch key [
         GLFW_KEY_A             [return "A" ]
         GLFW_KEY_B             [return "B"]
         GLFW_KEY_C             [return "C"]
         GLFW_KEY_D             [return "D"]
         GLFW_KEY_E             [return "E"]
         GLFW_KEY_F             [return "F"]
         GLFW_KEY_G             [return "G"]
         GLFW_KEY_H             [return "H"]
         GLFW_KEY_I             [return "I"]
         GLFW_KEY_J             [return "J"]
         GLFW_KEY_K             [return "K"]
         GLFW_KEY_L             [return "L"]
         GLFW_KEY_M             [return "M"]
         GLFW_KEY_N             [return "N"]
         GLFW_KEY_O             [return "O"]
         GLFW_KEY_P             [return "P"]
         GLFW_KEY_Q             [return "Q"]
         GLFW_KEY_R             [return "R"]
         GLFW_KEY_S             [return "S"]
         GLFW_KEY_T             [return "T"]
         GLFW_KEY_U             [return "U"]
         GLFW_KEY_V             [return "V"]
         GLFW_KEY_W             [return "W"]
         GLFW_KEY_X             [return "X"]
         GLFW_KEY_Y             [return "Y"]
         GLFW_KEY_Z             [return "Z"]
         GLFW_KEY_1             [return "1"]
         GLFW_KEY_2             [return "2"]
         GLFW_KEY_3             [return "3"]
         GLFW_KEY_4             [return "4"]
         GLFW_KEY_5             [return "5"]
         GLFW_KEY_6             [return "6"]
         GLFW_KEY_7             [return "7"]
         GLFW_KEY_8             [return "8"]
         GLFW_KEY_9             [return "9"]
         GLFW_KEY_0             [return "0"]
         GLFW_KEY_SPACE         [return "SPACE"]
         GLFW_KEY_MINUS         [return "MINUS"]
         GLFW_KEY_EQUAL         [return "EQUAL"]
         GLFW_KEY_LEFT_BRACKET  [return "LEFT BRACKET"]
         GLFW_KEY_RIGHT_BRACKET [return "RIGHT BRACKET"]
         GLFW_KEY_BACKSLASH     [return "BACKSLASH"]
         GLFW_KEY_SEMICOLON     [return "SEMICOLON"]
         GLFW_KEY_APOSTROPHE    [return "APOSTROPHE"]
         GLFW_KEY_GRAVE_ACCENT  [return "GRAVE ACCENT"]
         GLFW_KEY_COMMA         [return "COMMA"]
         GLFW_KEY_PERIOD        [return "PERIOD"]
         GLFW_KEY_SLASH         [return "SLASH"]
         GLFW_KEY_WORLD_1       [return "WORLD 1"]
         GLFW_KEY_WORLD_2       [return "WORLD 2"]
         
         ; Function keys
         GLFW_KEY_ESCAPE        [return "ESCAPE"]
         GLFW_KEY_F1            [return "F1"]
         GLFW_KEY_F2            [return "F2"]
         GLFW_KEY_F3            [return "F3"]
         GLFW_KEY_F4            [return "F4"]
         GLFW_KEY_F5            [return "F5"]
         GLFW_KEY_F6            [return "F6"]
         GLFW_KEY_F7            [return "F7"]
         GLFW_KEY_F8            [return "F8"]
         GLFW_KEY_F9            [return "F9"]
         GLFW_KEY_F10           [return "F10"]
         GLFW_KEY_F11           [return "F11"]
         GLFW_KEY_F12           [return "F12"]
         GLFW_KEY_F13           [return "F13"]
         GLFW_KEY_F14           [return "F14"]
         GLFW_KEY_F15           [return "F15"]
         GLFW_KEY_F16           [return "F16"]
         GLFW_KEY_F17           [return "F17"]
         GLFW_KEY_F18           [return "F18"]
         GLFW_KEY_F19           [return "F19"]
         GLFW_KEY_F20           [return "F20"]
         GLFW_KEY_F21           [return "F21"]
         GLFW_KEY_F22           [return "F22"]
         GLFW_KEY_F23           [return "F23"]
         GLFW_KEY_F24           [return "F24"]
         GLFW_KEY_F25           [return "F25"]
         GLFW_KEY_UP            [return "UP"]
         GLFW_KEY_DOWN          [return "DOWN"]
         GLFW_KEY_LEFT          [return "LEFT"]
         GLFW_KEY_RIGHT         [return "RIGHT"]
         GLFW_KEY_LEFT_SHIFT    [return "LEFT SHIFT"]
         GLFW_KEY_RIGHT_SHIFT   [return "RIGHT SHIFT"]
         GLFW_KEY_LEFT_CONTROL  [return "LEFT CONTROL"]
         GLFW_KEY_RIGHT_CONTROL [return "RIGHT CONTROL"]
         GLFW_KEY_LEFT_ALT      [return "LEFT ALT"]
         GLFW_KEY_RIGHT_ALT     [return "RIGHT ALT"]
         GLFW_KEY_TAB           [return "TAB"]
         GLFW_KEY_ENTER         [return "ENTER"]
         GLFW_KEY_BACKSPACE     [return "BACKSPACE"]
         GLFW_KEY_INSERT        [return "INSERT"]
         GLFW_KEY_DELETE        [return "DELETE"]
         GLFW_KEY_PAGE_UP       [return "PAGE UP"]
         GLFW_KEY_PAGE_DOWN     [return "PAGE DOWN"]
         GLFW_KEY_HOME          [return "HOME"]
         GLFW_KEY_END           [return "END"]
         GLFW_KEY_KP_0          [return "KEYPAD 0"]
         GLFW_KEY_KP_1          [return "KEYPAD 1"]
         GLFW_KEY_KP_2          [return "KEYPAD 2"]
         GLFW_KEY_KP_3          [return "KEYPAD 3"]
         GLFW_KEY_KP_4          [return "KEYPAD 4"]
         GLFW_KEY_KP_5          [return "KEYPAD 5"]
         GLFW_KEY_KP_6          [return "KEYPAD 6"]
         GLFW_KEY_KP_7          [return "KEYPAD 7"]
         GLFW_KEY_KP_8          [return "KEYPAD 8"]
         GLFW_KEY_KP_9          [return "KEYPAD 9"]
         GLFW_KEY_KP_DIVIDE     [return "KEYPAD DIVIDE"]
         GLFW_KEY_KP_MULTIPLY   [return "KEYPAD MULTPLY"]
         GLFW_KEY_KP_SUBTRACT   [return "KEYPAD SUBTRACT"]
         GLFW_KEY_KP_ADD        [return "KEYPAD ADD"]
         GLFW_KEY_KP_DECIMAL    [return "KEYPAD DECIMAL"]
         GLFW_KEY_KP_EQUAL      [return "KEYPAD EQUAL"]
         GLFW_KEY_KP_ENTER      [return "KEYPAD ENTER"]
         GLFW_KEY_PRINT_SCREEN  [return "PRINT SCREEN"]
         GLFW_KEY_NUM_LOCK      [return "NUM LOCK"]
         GLFW_KEY_CAPS_LOCK     [return "CAPS LOCK"]
         GLFW_KEY_SCROLL_LOCK   [return "SCROLL LOCK"]
         GLFW_KEY_PAUSE         [return "PAUSE"]
         GLFW_KEY_LEFT_SUPER    [return "LEFT SUPER"]
         GLFW_KEY_RIGHT_SUPER   [return "RIGHT SUPER"]
         GLFW_KEY_MENU          [return "MENU"]
         GLFW_KEY_UNKNOWN       [return "UNKNOWN"]
         default                [return null]  
    ]  
]

get_action_name: func [action [integer!] return: [c-string!]][
    switch action [
        GLFW_PRESS      [return "pressed"]
        GLFW_RELEASE    [return "released"]
        GLFW_REPEAT     [return "repeated"]
    ]
    "caused unknown action"
]

get_button_name: func [button [integer!] return: [c-string!]][
    switch button [
        GLFW_MOUSE_BUTTON_LEFT         [return "left"]
        GLFW_MOUSE_BUTTON_RIGHT        [return "right"]
        GLFW_MOUSE_BUTTON_MIDDLE       [return "middle"]
    ]
    null
]


 
get_mods_name: func [mods [integer!] return: [c-string!] /local name [c-string!]][
    name: " "
    if (mods) AND (GLFW_MOD_SHIFT) =    1  [name: " shift"]
    if (mods) AND (GLFW_MOD_CONTROL) =  2  [name: " control"]
    if (mods) AND (GLFW_MOD_CONTROL) =  4  [name: " alt"]
    if (mods) AND (GLFW_MOD_SUPER)   =  8  [name: " super"]
    name
]


; ////revoir
get_character_string: func [character [integer!] return: [c-string!]][
    ;// This assumes UTF-8, which is stupid
    result: ""
    length: 0
    ;length: wctomb result character ; in c-lib TBD
    if length = -1  [length: 0]
    return result
]

;//// Fin

error_callback: func [[calling] error [integer!] description [c-string!]] [
        print [ description " " stderr]
]


window_pos_callback: func [[calling] window [GLFWwindow] x [integer!] y [integer!]] [
    counter: counter + 1
    print [ counter " at " glfwGetTime " : Window position: " x " " y newline]
]

window_size_callback: func [[calling] window [GLFWwindow] width [integer!] height [integer!]] [
    counter: counter + 1
    print [ counter " at " glfwGetTime " : Window size: " width " " height  newline]
]

framebuffer_size_callback: func [[calling] window [GLFWwindow] width [integer!] height [integer!]] [
    counter: counter + 1
    print [ counter " at " glfwGetTime " : Framebuffer size: " width " " height  newline]
]

window_close_callback: func [[calling] window [GLFWwindow]] [
    counter: counter + 1
    print [ counter " at " glfwGetTime " : Window close"  newline]
]

window_refresh_callback: func [[calling] window [GLFWwindow]] [
    counter: counter + 1
    print [ counter " at " glfwGetTime " : Window refresh"  newline]
    if glfwGetCurrentContext <> NULL
    [
        glClear GL_COLOR_BUFFER_BIT
        glfwSwapBuffers window
    ]
]


window_focus_callback: func [[calling] window [GLFWwindow] focused [integer!] /local str] [
    counter: counter + 1
    either focused = 1 [str: "focused" ] [str: "defocused"]
    print [ counter " at " glfwGetTime " : Window was " str newline]
]




window_iconify_callback: func [[calling] window [GLFWwindow] iconified [integer!] /local str] [
    counter: counter + 1
    either iconified = 1 [str: "iconified" ] [str: "restored"]
    print [ counter " at " glfwGetTime " : Window was " str newline]
]




mouse_button_callback: func [[calling] window [GLFWwindow] button [integer!] action [integer!] mods [integer!]/local name] [
    counter: counter + 1
    name: get_button_name button
    print [ counter " at " glfwGetTime " : Mousse button " button " " ]
    if name <> null [print [name]]
    if mods <> 0 [print ["with " get_mods_name mods]]
    print [ " was " get_action_name action newline]
]

cursor_position_callback: func [[calling] window [GLFWwindow] x [float!] y [float!]] [
    counter: counter + 1
    print [ counter " at " glfwGetTime " : Cursor position: " x " "  y newline]
]

cursor_enter_callback: func [[calling] window [GLFWwindow] entered [integer!] /local str] [
    counter: counter + 1
    either entered = 1 [str: "entered" ] [str: "left"]
    print [ counter " at " glfwGetTime " : Cursor " str  " window" newline]
]

scroll_callback: func [[calling] window [GLFWwindow] x [float!] y [float!]] [
    counter: counter + 1
    print [ counter " at " glfwGetTime " : Scroll: " x " "  y newline]
]


key_callback: func [
        [calling]
        window [GLFWwindow]
        key [integer!]
        scancode [integer!]
        action [integer!]
        mods [integer!]] [
    str: ""
    counter: counter + 1
    name: get_key_name key
    print [ counter " at " glfwGetTime " : scancode: " key " "  scancode " "]
    if name <> null [print [name]]
    if mods <> 0 [print ["with " get_mods_name mods]]
    print [ " was " get_action_name action newline]
    
    ;if (action <> GLFW_PRESS) [exit];
    
    if (key = GLFW_KEY_C) [
        closeable:  not closeable   
        either closeable = 1 [str: "enabled" ] [str: "disabled" ]
        print ["closing " str newline]
    ]
]


char_callback: func [[calling] window [GLFWwindow] character [integer!] /local str] [
    counter: counter + 1
    str: get_character_string character
    print [ counter " at " glfwGetTime " : Character: " character " "  str " input"  newline]
]


monitor_callback: func [[calling] monitor [GLFWmonitor] event [integer!] /local mode widthMM heightMM &w &h x y &x &y] [
    widthMM: 0
    heightMM: 0
    &w: :widthMM; pointer! 
    &h: :widthMM ;pointer!
    x: 0
    y: 0
    &x: :x ; pointer! 
    &y: :y ; pointer! 
    counter: counter + 1
    either (event = GLFW_CONNECTED) [
        mode: glfwGetVideoMode monitor
        glfwGetMonitorPos monitor &x &y
        glfwGetMonitorPhysicalSize monitor &w &h
        print [ counter " at " glfwGetTime " : Monitor : " glfwGetMonitorName monitor " " ]
        print [mode/width "x" mode/height "at " x " " y "[" &w " " &h " mm was connected"  newline]
        
    ]
    [ print [counter " at " glfwGetTime " : Monitor : " glfwGetMonitorName monitor " was disconnected" newline ]]


]


;monitor_callback(GLFWmonitor* monitor, int event)

    ;Main
    
    glfwSetErrorCallback :error_callback
    if glfwInit = 0 [glfwTerminate] ; exit
    print ["Library initialized" newline]
    window: glfwCreateWindow width height "Event Linter" NULL NULL
    
    
    ;glfwSetMonitorCallback :monitor_callback
    glfwSetWindowPosCallback window :window_pos_callback
    glfwSetWindowSizeCallback window :window_size_callback
    glfwSetFramebufferSizeCallback window  :framebuffer_size_callback
    glfwSetWindowCloseCallback window  :window_close_callback
    glfwSetWindowRefreshCallback window  :window_refresh_callback
    glfwSetWindowFocusCallback window  :window_focus_callback
    glfwSetWindowIconifyCallback window  :window_iconify_callback
    glfwSetMouseButtonCallback window  :mouse_button_callback
    glfwSetCursorPosCallback window  :cursor_position_callback
    glfwSetCursorEnterCallback window  :cursor_enter_callback
    glfwSetScrollCallback window  :scroll_callback
    glfwSetKeyCallback window  :key_callback
    glfwSetCharCallback window :char_callback
    
    
    glfwMakeContextCurrent window
    glfwSwapInterval 1
    glfwGetWindowSize window &width &height
    print ["Window size should be " width " x " height newline]
    print ["Main loop starting" newline]
    while [(glfwWindowShouldClose window) = GL_FALSE] [glfwWaitEvents]

    glfwDestroyWindow window    
    glfwTerminate






