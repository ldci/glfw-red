Red/System [
	Title:		"GLFW Binding"
	Author:		"Francois Jouen"
	Rights:		"Copyright (c) 2013 F. Jouen. All rights reserved."
	License:    "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]

; *************** some pointers we need with Red/System *************************
; * pointers 

;int-ptr! is defined by red                                 ; equivalent to C's byte *
;byte-ptr is defined by                                     ; equivalent to C's int *
#define float32-ptr!        [pointer! [float32!]]           ; equivalent to C's float *
#define float-ptr!          [pointer! [Float!]]             ; equivalent to C's double *

;** pointers
#define double-byte-ptr!    [struct! [ptr [byte-ptr!]]]     ; equivalent to C's byte **
#define double-int-ptr!     [struct! [ptr [int-ptr!]]]      ; equivalent to C's int **
#define double-float-ptr!   [struct! [ptr [float-ptr!]]]    ; equivalent to C's double **
#define p-buffer!           [struct! [buffer [c-string!]]]  ; equivalent to C's char **

; *************** ************************************* *************************
