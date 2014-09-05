Red/System [
	Title:		"GLFW Binding: glwinfo"
	Author:		"François Jouen"
	Rights:		"Copyright (c) 2013-2014 François Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]

;========================================================================
;
; This test is a pale imitation of glxinfo(1), except not really
;
; It dumps GLFW and OpenGL version information
; original program Copyright (c) Camilla Berglund <elmindreda@elmindreda.org>
;========================================================================

#include %../../glfw.reds

;in gl3.h
#define GL_CONTEXT_CORE_PROFILE_BIT             00000001h
#define GL_CONTEXT_COMPATIBILITY_PROFILE_BIT    00000002h
#define GL_CONTEXT_FLAGS                        0000821Eh
#define GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT  00000001h
#define GL_CONTEXT_PROFILE_MASK                 00009126h

; in glxx.h

#define GL_LOSE_CONTEXT_ON_RESET_ARB            00008252h
#define GL_RESET_NOTIFICATION_STRATEGY_ARB      00008256h
#define GL_NO_RESET_NOTIFICATION_ARB            00008261h
#define GL_CONTEXT_FLAG_DEBUG_BIT               00000002h
#define GL_CONTEXT_FLAG_ROBUST_ACCESS_BIT_ARB   00000004h

#define GL_NUM_EXTENSIONS 0000821Dh

#define API_OPENGL          "gl"
#define API_OPENGL_ES       "es"

#define PROFILE_NAME_CORE   "core"
#define PROFILE_NAME_COMPAT "compat"

#define STRATEGY_NAME_NONE "none"
#define STRATEGY_NAME_LOSE "lose"

error_callback: func [[calling] error [integer!] description [c-string!]] [
        ;write-form [stderr "Error: %s\n" description]
        print ["Error: " error " " description newline]
        throw error
]

get_client_api_name: func [api [integer!] return: [c-string!]] [
    either (api = GLFW_OPENGL_API) [return "OpenGL"] ["OpenGL ES"]
    "Unknown API"
    
]

get_profile_name_gl: func [mask [GLint] return: [c-string!]] [
    if (mask AND GL_CONTEXT_COMPATIBILITY_PROFILE_BIT) <> 0 [return PROFILE_NAME_COMPAT]
    if (mask AND GL_CONTEXT_CORE_PROFILE_BIT) <> 0 [return PROFILE_NAME_CORE]
    "unknown"
]


get_profile_name_glfw: func [profile [integer!] return: [c-string!]] [
    if profile = GLFW_OPENGL_COMPAT_PROFILE [return PROFILE_NAME_COMPAT]
    if profile = GLFW_OPENGL_CORE_PROFILE [return PROFILE_NAME_CORE]
    "unknown"
]

get_strategy_name_gl: func [strategy [GLint] return: [c-string!]] [
    if strategy = GL_LOSE_CONTEXT_ON_RESET_ARB [return STRATEGY_NAME_LOSE]
    if strategy = GL_NO_RESET_NOTIFICATION_ARB [return STRATEGY_NAME_NONE]
     return "unknown"
]


get_strategy_name_glfw: func [strategy [integer!] return: [c-string!]] [
    if strategy = GLFW_LOSE_CONTEXT_ON_RESET [return STRATEGY_NAME_LOSE]
    if strategy = GLFW_NO_RESET_NOTIFICATION [return STRATEGY_NAME_NONE]
    return "unknown"
]

list_extensions: func [api [integer!] major [integer!] minor [integer!] /local i c count glGetStringi extensions length ][
    print [get_client_api_name api " context supported extensions: "  newline]
    count: 0 &count: :count
    i: 0
    either (api = GLFW_OPENGL_API) AND (major > 2) [
        glGetStringi: glfwGetProcAddress "glGetStringi"
        if glGetStringi = null [glfwTerminate]
        glGetIntegerv GL_NUM_EXTENSIONS &count
        until [
            print [glGetStringi GL_EXTENSIONS i]
            i: i + 1
        i < count    
        ]
        print [newline]
    ]
    [
        extensions: glGetString GL_EXTENSIONS ; contrôler glGetString dans opengl!
        length: length? as c-string! extensions
        ; parse string is necessary
        i: 1
        until [
            c: extensions/i
            either c = #" " [print [newline]] [print [c]] ; find " "
            i: i + 1
        i = length     
        ]
    ]  
]

valid_version: func [ return: [logic! ]/local major minor revision] [
    major: 0 &major: :major
    minor: 0 &minor: :minor
    revision: 0 &revision: :revision
    glfwGetVersion &major &minor &revision
    print ["GLFW header version: " GLFW_VERSION_MAJOR "." GLFW_VERSION_MINOR "." GLFW_VERSION_REVISION newline]
    print["GLFW library version: " major "." minor "." revision newline ]
    
    if ( major <>  GLFW_VERSION_MAJOR) [
        print ["*** ERROR: GLFW major version mismatch! ***" newline]
        return as logic! GL_FALSE
    ]
    
    if (minor <> GLFW_VERSION_MINOR)  OR (revision <> GLFW_VERSION_REVISION) [
        print ["*** WARNING: GLFW version mismatch! " newline]
    ]
    print ["GLFW library version string: " glfwGetVersionString newline]
    true
    
]


; main 
    ; flag tests
    api: 0 profile: 0 strategy: 0 major: 1 minor: 0 revision: 0
    debug: GL_TRUE forward: GL_TRUE list: GL_TRUE
    ; pointers
    flags: 0 &flags: :flags  mask: 0 &mask: :mask
    strategy: 0 &strategy: :strategy
    ; we dont use argument list on command-line (ch = getopt(argc, argv, "a:dfhlm:n:p:r:")
    ; please use test flags 
    
    robustness: 0
    
    print [newline]
    if (valid_version = false) [glfwTerminate]
    
    ;Initialize GLFW and create window

    glfwSetErrorCallback :error_callback
    if glfwInit = 0 [glfwTerminate] ; exit
    
    if (major <> 1) OR (minor <> 0)
    [
        glfwWindowHint GLFW_CONTEXT_VERSION_MAJOR major
        glfwWindowHint GLFW_CONTEXT_VERSION_MINOR minor
    ]
    
    ; test: api = GLFW_OPENGL_API or GLFW_OPENGL_ES_API
    if (api <> 0) [glfwWindowHint GLFW_CLIENT_API api]
    
    ; test: debug true or false 
    if (debug =  GL_TRUE) [glfwWindowHint GLFW_OPENGL_DEBUG_CONTEXT GL_TRUE]
    ; test: debug true or false
    if (forward =  GL_TRUE) [glfwWindowHint GLFW_OPENGL_FORWARD_COMPAT GL_TRUE]
    
    ; test: 0 or !0
    if (profile <> 0) [glfwWindowHint GLFW_OPENGL_PROFILE profile]
    
    ; test: 0 or !0
    if (strategy <> 0) [glfwWindowHint GLFW_CONTEXT_ROBUSTNESS strategy]
    
    glfwWindowHint GLFW_VISIBLE GL_FALSE
    window: glfwCreateWindow 200 200 "Version" NULL NULL
    glfwMakeContextCurrent window
    
    ;// Report client API version

    api: glfwGetWindowAttrib window GLFW_CLIENT_API
    major: glfwGetWindowAttrib window GLFW_CONTEXT_VERSION_MAJOR
    minor: glfwGetWindowAttrib window GLFW_CONTEXT_VERSION_MINOR
    revision: glfwGetWindowAttrib window GLFW_CONTEXT_REVISION

    print[get_client_api_name api " context version string: " as c-string! glGetString GL_VERSION newline ]
    print[get_client_api_name api " context version parsed by GLFW: " major "." minor "." revision newline]
    
    if (api = GLFW_OPENGL_API) [
        if (major >= 3) [
            glGetIntegerv GL_CONTEXT_FLAGS &flags
            print[get_client_api_name api " context flags (0x%08x):" flags]
            if (flags AND GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT) <> 0 [print [" forward-compatible"]]
            if (flags AND GL_CONTEXT_FLAG_DEBUG_BIT) <> 0 [print [" debug"]]
            if (flags AND GL_CONTEXT_FLAG_ROBUST_ACCESS_BIT_ARB) <> 0 [print [" robustness"]]
            print [newline]
            print [ get_client_api_name api " context flags parsed by GLFW:" newline]
            if (glfwGetWindowAttrib window GLFW_OPENGL_FORWARD_COMPAT) <> 0 [print [" forward-compatible"]]
            if (glfwGetWindowAttrib window GLFW_OPENGL_DEBUG_CONTEXT) <> 0 [print [" debug"]]
            if (glfwGetWindowAttrib window GLFW_CONTEXT_ROBUSTNESS) <> GLFW_NO_ROBUSTNESS [print [" robustness"]]
            print [newline]   
        ]
        if (major > 3)  OR ((major = 3) AND (minor >= 2)) [
            profile: glfwGetWindowAttrib window GLFW_OPENGL_PROFILE
            glGetIntegerv GL_CONTEXT_PROFILE_MASK &mask
            print [get_client_api_name api " profile mask (0x%08x): " mask " " get_profile_name_gl mask newline]
            print [get_client_api_name api " profile mask parsed by GLFW: " get_profile_name_glfw profile newline]
        ]
        if (glfwExtensionSupported "GL_ARB_robustness") <> 0 [
            glGetIntegerv GL_RESET_NOTIFICATION_STRATEGY_ARB &strategy
            print[get_client_api_name api " robustness strategy (0x%08x): " strategy get_strategy_name_gl strategy newline]
            robustness: glfwGetWindowAttrib window GLFW_CONTEXT_ROBUSTNESS
            print [get_client_api_name api " robustness strategy parsed by GLFW: " get_strategy_name_glfw robustness newline]
        ]
    ]
    print [get_client_api_name api " context renderer string: " as c-string! glGetString GL_RENDERER newline]
    print [get_client_api_name api " context vendor string: " as c-string! glGetString GL_VENDOR newline]
        
    if (major > 1) [
        print [get_client_api_name api " context shading language version: " as c-string! glGetString GL_SHADING_LANGUAGE_VERSION newline]
    ]
    
    ;; Report client API extensions
    if (list = GL_TRUE) [list_extensions api major minor]

    glfwTerminate
        
        
    
    
    
    
    
    









