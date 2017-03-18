Red/System [
	Title:		"OpenGL Binding"
	Author:		"François Jouen"
	Rights:		"Copyright (c) 2013-2014 François Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]


; please update paths according to your OS
#switch OS [
        MacOSX		[#define glulib "/System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGLU.dylib"
                        #define calling cdecl]  
        Windows		[#define glulib "glu32.dll" #define calling stdcall]                               
        Linux           [#define glulib "/usr/lib/libGLU.so.1" #define calling cdecl]                                        
	#default	[#define glulib "/System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGLU.dylib"
                        #define calling cdecl]
]


;***********************************************************

#include %opgl.reds 

; Extensions 
#define GLU_EXT_object_space_tess            1
#define GLU_EXT_nurbs_tessellator            1

; Boolean 
#define GLU_FALSE                            0
#define GLU_TRUE                             1

; Version 
#define GLU_VERSION_1_1                      1
#define GLU_VERSION_1_2                      1
#define GLU_VERSION_1_3                      1

; StringName 
#define GLU_VERSION                          100800
#define GLU_EXTENSIONS                       100801

; ErrorCode 
#define GLU_INVALID_ENUM                     100900
#define GLU_INVALID_VALUE                    100901
#define GLU_OUT_OF_MEMORY                    100902
#define GLU_INCOMPATIBLE_GL_VERSION          100903
#define GLU_INVALID_OPERATION                100904


; NurbsDisplay 
;      GLU_FILL 
#define GLU_OUTLINE_POLYGON                  100240
#define GLU_OUTLINE_PATCH                    100241

; NurbsCallback 
#define GLU_NURBS_ERROR                      100103
#define GLU_ERROR                            100103
#define GLU_NURBS_BEGIN                      100164
#define GLU_NURBS_BEGIN_EXT                  100164
#define GLU_NURBS_VERTEX                     100165
#define GLU_NURBS_VERTEX_EXT                 100165
#define GLU_NURBS_NORMAL                     100166
#define GLU_NURBS_NORMAL_EXT                 100166
#define GLU_NURBS_COLOR                      100167
#define GLU_NURBS_COLOR_EXT                  100167
#define GLU_NURBS_TEXTURE_COORD              100168
#define GLU_NURBS_TEX_COORD_EXT              100168
#define GLU_NURBS_END                        100169
#define GLU_NURBS_END_EXT                    100169
#define GLU_NURBS_BEGIN_DATA                 100170
#define GLU_NURBS_BEGIN_DATA_EXT             100170
#define GLU_NURBS_VERTEX_DATA                100171
#define GLU_NURBS_VERTEX_DATA_EXT            100171
#define GLU_NURBS_NORMAL_DATA                100172
#define GLU_NURBS_NORMAL_DATA_EXT            100172
#define GLU_NURBS_COLOR_DATA                 100173
#define GLU_NURBS_COLOR_DATA_EXT             100173
#define GLU_NURBS_TEXTURE_COORD_DATA         100174
#define GLU_NURBS_TEX_COORD_DATA_EXT         100174
#define GLU_NURBS_END_DATA                   100175
#define GLU_NURBS_END_DATA_EXT               100175

; NurbsError 
#define GLU_NURBS_ERROR1                     100251   ; spline order un-supported 
#define GLU_NURBS_ERROR2                     100252   ; too few knots 
#define GLU_NURBS_ERROR3                     100253   ; valid knot range is empty 
#define GLU_NURBS_ERROR4                     100254   ; decreasing knot sequence 
#define GLU_NURBS_ERROR5                     100255   ; knot multiplicity > spline order 
#define GLU_NURBS_ERROR6                     100256   ; endcurve() must follow bgncurve() 
#define GLU_NURBS_ERROR7                     100257   ; bgncurve() must precede endcurve() 
#define GLU_NURBS_ERROR8                     100258   ; ctrlarray or knot vector is NULL 
#define GLU_NURBS_ERROR9                     100259   ; can't draw pwlcurves 
#define GLU_NURBS_ERROR10                    100260   ; missing gluNurbsCurve() 
#define GLU_NURBS_ERROR11                    100261   ; missing gluNurbsSurface() 
#define GLU_NURBS_ERROR12                    100262   ; endtrim() must precede endsurface() 
#define GLU_NURBS_ERROR13                    100263   ; bgnsurface() must precede endsurface() 
#define GLU_NURBS_ERROR14                    100264   ; curve of improper type passed as trim curve 
#define GLU_NURBS_ERROR15                    100265   ; bgnsurface() must precede bgntrim() 
#define GLU_NURBS_ERROR16                    100266   ; endtrim() must follow bgntrim() 
#define GLU_NURBS_ERROR17                    100267   ; bgntrim() must precede endtrim()
#define GLU_NURBS_ERROR18                    100268   ; invalid or missing trim curve
#define GLU_NURBS_ERROR19                    100269   ; bgntrim() must precede pwlcurve() 
#define GLU_NURBS_ERROR20                    100270   ; pwlcurve referenced twice
#define GLU_NURBS_ERROR21                    100271   ; pwlcurve and nurbscurve mixed 
#define GLU_NURBS_ERROR22                    100272   ; improper usage of trim data type 
#define GLU_NURBS_ERROR23                    100273   ; nurbscurve referenced twice 
#define GLU_NURBS_ERROR24                    100274   ; nurbscurve and pwlcurve mixed 
#define GLU_NURBS_ERROR25                    100275   ; nurbssurface referenced twice 
#define GLU_NURBS_ERROR26                    100276   ; invalid property 
#define GLU_NURBS_ERROR27                    100277   ; endsurface() must follow bgnsurface() 
#define GLU_NURBS_ERROR28                    100278   ; intersecting or misoriented trim curves 
#define GLU_NURBS_ERROR29                    100279   ; intersecting trim curves 
#define GLU_NURBS_ERROR30                    100280   ; UNUSED 
#define GLU_NURBS_ERROR31                    100281   ; unconnected trim curves 
#define GLU_NURBS_ERROR32                    100282   ; unknown knot error 
#define GLU_NURBS_ERROR33                    100283   ; negative vertex count encountered 
#define GLU_NURBS_ERROR34                    100284   ; negative byte-stride 
#define GLU_NURBS_ERROR35                    100285   ; unknown type descriptor 
#define GLU_NURBS_ERROR36                    100286   ; null control point reference 
#define GLU_NURBS_ERROR37                    100287   ; duplicate point on pwlcurve 

; NurbsProperty 
#define GLU_AUTO_LOAD_MATRIX                 100200
#define GLU_CULLING                          100201
#define GLU_SAMPLING_TOLERANCE               100203
#define GLU_DISPLAY_MODE                     100204
#define GLU_PARAMETRIC_TOLERANCE             100202
#define GLU_SAMPLING_METHOD                  100205
#define GLU_U_STEP                           100206
#define GLU_V_STEP                           100207
#define GLU_NURBS_MODE                       100160
#define GLU_NURBS_MODE_EXT                   100160
#define GLU_NURBS_TESSELLATOR                100161
#define GLU_NURBS_TESSELLATOR_EXT            100161
#define GLU_NURBS_RENDERER                   100162
#define GLU_NURBS_RENDERER_EXT               100162

; NurbsSampling 
#define GLU_OBJECT_PARAMETRIC_ERROR          100208
#define GLU_OBJECT_PARAMETRIC_ERROR_EXT      100208
#define GLU_OBJECT_PATH_LENGTH               100209
#define GLU_OBJECT_PATH_LENGTH_EXT           100209
#define GLU_PATH_LENGTH                      100215
#define GLU_PARAMETRIC_ERROR                 100216
#define GLU_DOMAIN_DISTANCE                  100217

; NurbsTrim 
#define GLU_MAP1_TRIM_2                      100210
#define GLU_MAP1_TRIM_3                      100211

; QuadricDrawStyle  
#define GLU_POINT                            100010
#define GLU_LINE                             100011
#define GLU_FILL                             100012
#define GLU_SILHOUETTE                       100013
  
; QuadricCallback 
;      GLU_ERROR 

; QuadricNormal 
#define GLU_SMOOTH                           100000
#define GLU_FLAT                             100001
#define GLU_NONE                             100002
 
; QuadricOrientation 
#define GLU_OUTSIDE                          100020
#define GLU_INSIDE                           100021

; TessCallback 
#define GLU_TESS_BEGIN                       100100
#define GLU_BEGIN                            100100
#define GLU_TESS_VERTEX                      100101
#define GLU_VERTEX                           100101
#define GLU_TESS_END                         100102
#define GLU_END                              100102
#define GLU_TESS_ERROR                       100103
#define GLU_TESS_EDGE_FLAG                   100104
#define GLU_EDGE_FLAG                        100104
#define GLU_TESS_COMBINE                     100105
#define GLU_TESS_BEGIN_DATA                  100106
#define GLU_TESS_VERTEX_DATA                 100107
#define GLU_TESS_END_DATA                    100108
#define GLU_TESS_ERROR_DATA                  100109
#define GLU_TESS_EDGE_FLAG_DATA              100110
#define GLU_TESS_COMBINE_DATA                100111

; TessContour 
#define GLU_CW                               100120
#define GLU_CCW                              100121
#define GLU_INTERIOR                         100122
#define GLU_EXTERIOR                         100123
#define GLU_UNKNOWN                          100124

; TessProperty 
#define GLU_TESS_WINDING_RULE                100140
#define GLU_TESS_BOUNDARY_ONLY               100141
#define GLU_TESS_TOLERANCE                   100142

; TessError 
#define GLU_TESS_ERROR1                      100151
#define GLU_TESS_ERROR2                      100152
#define GLU_TESS_ERROR3                      100153
#define GLU_TESS_ERROR4                      100154
#define GLU_TESS_ERROR5                      100155
#define GLU_TESS_ERROR6                      100156
#define GLU_TESS_ERROR7                      100157
#define GLU_TESS_ERROR8                      100158
#define GLU_TESS_MISSING_BEGIN_POLYGON       100151
#define GLU_TESS_MISSING_BEGIN_CONTOUR       100152
#define GLU_TESS_MISSING_END_POLYGON         100153
#define GLU_TESS_MISSING_END_CONTOUR         100154
#define GLU_TESS_COORD_TOO_LARGE             100155
#define GLU_TESS_NEED_COMBINE_CALLBACK       100156

; TessWinding 
#define GLU_TESS_WINDING_ODD                 100130
#define GLU_TESS_WINDING_NONZERO             100131
#define GLU_TESS_WINDING_POSITIVE            100132
#define GLU_TESS_WINDING_NEGATIVE            100133
#define GLU_TESS_WINDING_ABS_GEQ_TWO         100134

;***********************************************************

#import [
    glulib calling [
        gluBeginCurve: "gluBeginCurve" [
            nurb	[int-ptr!] ;GLUnurbs*
        ]
        
        gluBeginPolygon: "gluBeginPolygon" [
            tess	[int-ptr!] ;GLUtesselator*
        ]
        
        gluBeginSurface: "gluBeginSurface" [
            nurb	[int-ptr!] ;GLUnurbs*
        ]
        
        gluBeginTrim: "gluBeginTrim" [
            nurb	[int-ptr!] ;GLUnurbs*
        ]
        
        gluBuild1DMipmapLevels: "gluBuild1DMipmapLevels" [
            target	        [GLenum]
            internalFormat	[GLint]
            width	        [GLsizei]
            format	        [GLenum]
            type	        [GLenum]
            level	        [GLint]
            base	        [GLint]
            max	                [GLint]
            data                [int-ptr!] ;void*
            return:	        [GLint]
        ]
        
        gluBuild1DMipmaps: "gluBuild1DMipmaps" [
            target	        [GLenum]
            internalFormat	[GLint]
            width	        [GLsizei]
            format	        [GLenum]
            type	        [GLenum]
            data	        [int-ptr!] ;void*
            return:	        [GLint]
        ]
        
        gluBuild2DMipmapLevels: "gluBuild2DMipmapLevels" [
            target	        [GLenum]
            internalFormat	[GLint]
            width	        [GLsizei]
            height	        [GLsizei]
            format	        [GLenum]
            type	        [GLenum]
            level	        [GLint]
            base	        [GLint]
            max	                [GLint]
            data	        [int-ptr!] ;void*
            return:	        [GLint]
        ]
        
        gluBuild2DMipmaps: "gluBuild2DMipmaps" [
            target	        [GLenum]
            internalFormat	[GLint]
            width	        [GLsizei]
            height	        [GLsizei]
            format	        [GLenum]
            type	        [GLenum]
            data	        [int-ptr!] ;void*
            return:	        [GLint]
        ]

        gluBuild3DMipmapLevels: "gluBuild3DMipmapLevels" [
            target	        [GLenum]
            internalFormat	[GLint]
            width	        [GLsizei]
            height	        [GLsizei]
            depth	        [GLsizei]
            format	        [GLenum]
            type	        [GLenum]
            level	        [GLint]
            base	        [GLint]
            max	                [GLint]
            data	        [int-ptr!] ;void*
            return:	        [GLint]
        ]

        gluBuild3DMipmaps: "gluBuild3DMipmaps" [
            target	        [GLenum]
            internalFormat	[GLint]
            width	        [GLsizei]
            height	        [GLsizei]
            depth	        [GLsizei]
            format	        [GLenum]
            type	        [GLenum]
            data	        [int-ptr!] ;void*
            return:	        [GLint]
        ]
        
        gluCheckExtension: "gluCheckExtension" [
            extName             [GLubyte]
            extString	        [GLubyte]
            return:	        [GLboolean]
        ]
        
        gluCylinder: "gluCylinder" [
            quad	        [int-ptr!];GLUquadric*
            base	        [GLdouble]
            top	                [GLdouble]
            height	        [GLdouble]
            slices	        [GLint]
            stacks	        [GLint]
        ]
        
        gluDeleteNurbsRenderer: "gluDeleteNurbsRenderer" [
            nurb	        [int-ptr!] ;GLUnurbs*
        ]
        
        gluDeleteQuadric: "gluDeleteQuadric" [
            quad	        [int-ptr!];GLUquadric*
        ]
        
        
        gluDeleteTess: "gluDeleteTess" [
            tess	        [int-ptr!] ;GLUtesselator*
        ]
        
        gluDisk: "gluDisk" [
            quad	        [int-ptr!];GLUquadric*
            inner	        [GLdouble]
            outer	        [GLdouble]
            slices	        [GLint]
            loops	        [GLint]
        ]
        
        gluEndCurve: "gluEndCurve" [
            nurb	[int-ptr!] ; GLUnurbs*
        ]

        gluEndPolygon: "gluEndPolygon" [
            tess	[int-ptr!] ; GLUtesselator*
        ]

        gluEndSurface: "gluEndSurface" [
        	nurb	[int-ptr!] ; GLUnurbs*
        ]

        gluEndTrim: "gluEndTrim" [
            nurb	[int-ptr!] ; GLUnurbs*
        ]
        
        gluErrorString: "gluErrorString" [
            error	[GLenum]
            return:	[int-ptr!] ;GLubyte*
        ]
        
        gluGetNurbsProperty: "gluGetNurbsProperty" [
            nurb	[int-ptr!] ; GLUnurbs*
            property	[GLenum]
            data	[float-ptr!] ;GLfloat*
        ]
        
        gluGetString: "gluGetString" [
            name	[GLenum]
            return:	[int-ptr!] ;GLubyte * 
        ]
        
        gluGetTessProperty: "gluGetTessProperty" [
            tess	[int-ptr!] ; GLUtesselator*
            which	[GLenum]
            data	[Float-ptr!];GLdouble*
        ]
        
        gluLoadSamplingMatrices: "gluLoadSamplingMatrices" [
            nurb	        [int-ptr!]      ; GLUnurbs*
            GLfloat	        [float-ptr!]    ; GLfloat*
            perspective	[float-ptr!]    ; GLfloat*
            view	        [int-ptr!]      ; GLint*
        ]
        
        gluLookAt: "gluLookAt" [
            eyeX	[GLdouble]
            eyeY	[GLdouble]
            eyeZ	[GLdouble]
            centerX	[GLdouble]
            centerY	[GLdouble]
            centerZ	[GLdouble]
            upX	        [GLdouble]
            upY	        [GLdouble]
            upZ	        [GLdouble]
        ]
        
        gluNewNurbsRenderer: "gluNewNurbsRenderer" [
            return:	[int-ptr!] ; GLUnurbs*
        ]
        
        gluNewQuadric: "gluNewQuadric" [
            return:	[int-ptr!];GLUquadric*
        ]
        
        
        gluNewTess: "gluNewTess" [
            return:	[int-ptr!] ; GLUtesselator*
        ]
        
        gluNextContour: "gluNextContour" [
            tess	[int-ptr!] ; GLUtesselator*
            type	[GLenum]
        ]
        
        gluNurbsCallback: "gluNurbsCallback" [
            nurb	        [int-ptr!] ; GLUnurbs*
            which	        [GLenum]
            CallBackFunc	[int-ptr!] ;pointer to ccallback
        ]
        
        gluNurbsCallbackData: "gluNurbsCallbackData" [
            nurb	        [int-ptr!] ; GLUnurbs*
            userData	        [int-ptr!];GLdata*
        ]
        
        gluNurbsCallbackDataEXT: "gluNurbsCallbackDataEXT" [
            nurb	        [int-ptr!] ; GLUnurbs*
            userData	        [int-ptr!];GLdata*
        ]
        
        gluNurbsCurve: "gluNurbsCurve" [
            nurb	        [int-ptr!] ; GLUnurbs*
            knotCount	        [GLint]
            *knots	        [float32-ptr!];GLfloat
            stride	        [GLint]
            *control	        [float32-ptr!];GLfloat
            order	        [GLint]
            type	        [GLenum]
        ]
        
        gluNurbsProperty: "gluNurbsProperty" [
            nurb	        [int-ptr!] ; GLUnurbs*
            property	        [GLenum]
            value	        [GLfloat]
        ]
        
        gluNurbsSurface: "gluNurbsSurface" [
            nurb	        [int-ptr!] ; GLUnurbs*
            sKnotCount	        [GLint]
            sKnots	        [float32-ptr!];GLfloat
            tKnotCount	        [GLint]
            tKnots	        [float32-ptr!];GLfloat
            sStride	        [GLint]
            tStride	        [GLint]
            control	        [float32-ptr!];GLfloat
            sOrder	        [GLint]
            tOrder	        [GLint]
            type	        [GLenum]
        ]

        
        gluOrtho2D: "gluOrtho2D" [
            left	        [GLdouble]
            right	        [GLdouble]
            bottom	        [GLdouble]
            top	                [GLdouble]
        ]
        
        gluPartialDisk: "gluPartialDisk" [
            quad	        [int-ptr!];GLUquadric*
            inner	        [GLdouble]
            outer	        [GLdouble]
            slices	        [GLint]
            loops	        [GLint]
            start	        [GLdouble]
            sweep	        [GLdouble]
        ]
        
         gluPerspective: "gluPerspective" [
            fovy	[GLdouble]
            aspect	[GLdouble]
            zNear	[GLdouble]
            zFar	[GLdouble]
        ]
        
        gluPickMatrix: "gluPickMatrix" [
            x	        [GLdouble]
            y	        [GLdouble]
            delX	[GLdouble]
            delY	[GLdouble]
            *viewport	[int-ptr!]
        ]
        
        gluProject: "gluProject" [
            objX	        [GLdouble]
            objY	        [GLdouble]
            objZ	        [GLdouble]
            *model  	        [float-ptr!]
            *proj	        [float-ptr!]
            *view	        [int-ptr!]
            winX    	        [float-ptr!]
            winY	        [float-ptr!]
            winZ	        [float-ptr!]
            none	        [float-ptr!]
            return:	        [GLint]
        ]
        
        gluPwlCurve: "gluPwlCurve" [
            nurb	[int-ptr!] ; GLUnurbs*
            count	[GLint]
            data        [float-ptr!];[GLfloat*]
            stride	[GLint]
            type	[GLenum]
        ]
        
       
        gluQuadricCallback: "gluQuadricCallback" [
            quad	        [int-ptr!];[GLUquadric*]
            which	        [GLenum]
            *CallBackFunc	[byte-ptr!]
        ]
        
        gluQuadricDrawStyle: "gluQuadricDrawStyle" [
            quad	[int-ptr!];[GLUquadric*]
            draw	[GLenum]
        ]
        
        gluQuadricNormals: "gluQuadricNormals" [
            quad	[int-ptr!];[GLUquadric*]
            normal	[GLenum]
        ]
        
        gluQuadricOrientation: "gluQuadricOrientation" [
            quad	[int-ptr!];[GLUquadric*]
            orientation	[GLenum]
        ]

        gluQuadricTexture: "gluQuadricTexture" [
            quad	[int-ptr!];[GLUquadric*]
            texture	[GLboolean]
        ]
        ;GLint gluScaleImage (GLenum format, GLsizei wIn, GLsizei hIn, GLenum typeIn,
        ;const void *dataIn, GLsizei wOut, GLsizei hOut, GLenum typeOut, GLvoid* dataOut)
        
        gluScaleImage: "gluScaleImage" [
            format	[GLenum]
            wIn	        [GLsizei]
            hIn	        [GLsizei]
            typeIn	[GLenum]
            *dataIn	[int-ptr!]
            wOut	[GLsizei]
            hOut	[GLsizei]
            typeOut     [GLenum]
            dataOut     [byte-ptr!] ;*void
            return:	[GLint]
        ]
        
        gluSphere: "gluSphere" [
            quad	[int-ptr!];[GLUquadric*]
            radius	[GLdouble]
            slices	[GLint]
            stacks	[GLint]
        ]
        
        gluTessBeginContour: "gluTessBeginContour" [
            tess	[int-ptr!] ; GLUtesselator*
        ]
        
        gluTessBeginPolygon: "gluTessBeginPolygon" [
            tess	[int-ptr!] ; GLUtesselator*
            data	[byte-ptr!] ;[GLdata*]
        ]
        
        gluTessCallback: "gluTessCallback" [
            tess	    [int-ptr!] ; GLUtesselator*
            which	    [GLenum]
            CallBackFunc    [byte-ptr!];[GLdata]
        ]
        
        gluTessEndContour: "gluTessEndContour" [
            tess	[int-ptr!] ; GLUtesselator*
        ]

        gluTessEndPolygon: "gluTessEndPolygon" [
            tess	[int-ptr!] ; GLUtesselator*
        ]
        
        gluTessNormal: "gluTessNormal" [
            tess	[int-ptr!] ; GLUtesselator*
            valueX	[GLdouble]
            valueY	[GLdouble]
            valueZ	[GLdouble]
        ]
        
        gluTessProperty: "gluTessProperty" [
            tess	[int-ptr!] ; GLUtesselator*
            which	[GLenum]
            data	[GLdouble]
        ]
        
        gluTessVertex: "gluTessVertex" [
            tess	[int-ptr!] ; GLUtesselator*
            *location	[float-ptr!];[GLdouble]
            data	[int-ptr!];[GLdata*]
        ]
        
        gluUnProject: "gluUnProject" [
            winX	[GLdouble]
            winY	[GLdouble]
            winZ	[GLdouble]
	    *model	[float-ptr!]
            *proj	[float-ptr!]
            *view	[int-ptr!]
            objX        [float-ptr!]
            objY        [float-ptr!]
            objZ        [float-ptr!]
            return:	[GLint]
        ]
        
        
        gluUnProject4: "gluUnProject4" [
            winX	[GLdouble]
            winY	[GLdouble]
            winZ	[GLdouble]
            clipW	[GLdouble]
            *model	[float-ptr!]
            *proj	[float-ptr!]
            *view	[int-ptr!]
            nearPlane   [GLdouble]
            farPlane    [GLdouble]
            objX        [float-ptr!]
            objY        [float-ptr!]
            objZ        [float-ptr!]
            return:	[GLint]
        ]

    ]
]



