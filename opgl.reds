Red/System [
	Title:		"OpenGL Binding"
	Author:		"François Jouen"
	Rights:		"Copyright (c) 2013 François Jouen. All rights reserved."
	License:        "BSD-3 - https://github.com/dockimbel/Red/blob/master/BSD-3-License.txt"
]


; please update paths accoeding to your OS
#switch OS [
        MacOSX		[#define gllib "/System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGL.dylib"]  
        Windows		[#define gllib "c:\.."]                               
        Linux           [#define gllib "/usr/lib/libGL.so"]                                        
	#default	[#define gllib "/System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGL.dylib"]
]

;But you can also use Kaj de Vos's wrapping for opengl (http://red.esperconsultancy.nl/Red-OpenGL/timeline)

; for red pointers

#define float32-ptr!        [pointer! [float32!]]
#define float-ptr!          [pointer! [float!]]

; gltypes.h


#define GLenum			integer!
#define GLboolean 		byte!
#define GLbitfield		integer!
#define GLbyte                  byte!
#define GLshort                 integer!
#define GLint                   integer!
#define GLsizei                 integer!
#define GLubyte                 integer!
#define GLushort                integer!
#define GLuint                  integer!
#define GLfloat                 float32! ; 32-bit float
#define GLclampf                float32!
#define GLvoid                  byte-ptr!

#define GLdouble                float!  ; 64-bit float
#define GLclampd                float!

;GL_VERSION_1_5
;GL types for handling large vertex buffer objects */
#define GLintptr                 integer!; may be pointer
#define GLsizeiptr               integer!;

;GL_VERSION_2_0
;GL type for program/shader text 
#define GLchar                  c-string!

; defined GL_ARB_sync || defined GL_VERSION_3_0
#define GLint64                 integer!
#define GLuint64                integer!
#define __GLsync                byte-ptr! ; an page structure

;defined GL_ARB_ES2_compatibility || defined GL_VERSION_4_1
#define GLfixed                 integer!

;GL_ARB_half_float_pixel
#define GLhalfARB               integer!

;GL_ARB_shader_objects
#define GLcharARB               byte! ; char
#define GLhandleARB             byte-ptr; void*

;GL_ARB_vertex_buffer_object
#define GLintptrARB             integer!
#define GLsizeiptrARB           integer!


;GL_EXT_timer_query
#define GLint64EXT              integer!
#define GLuint64EXT             integer!

;switches to providing function pointers (uncomment next line)
;#define GL_GLEXT_FUNCTION_POINTERS 1




;gl.h
;For compatibility with OpenGL v1.0 
#define GL_LOGIC_OP GL_INDEX_LOGIC_OP
#define GL_TEXTURE_COMPONENTS GL_TEXTURE_INTERNAL_FORMAT

; * Version *

#define GL_VERSION_1_1                    1
#define GL_VERSION_1_2                    1
#define GL_VERSION_1_3                    1
#define GL_VERSION_1_4                    1
#define GL_VERSION_1_5                    1
#define GL_VERSION_2_0                    1
#define GL_VERSION_2_1                    1

;* AccumOp *
#define GL_ACCUM                          00000100h
#define GL_LOAD                           00000101h
#define GL_RETURN                         00000102h
#define GL_MULT                           00000103h
#define GL_ADD                            00000104h

;AlphaFunction 
#define GL_NEVER                          00000200h
#define GL_LESS                           00000201h
#define GL_EQUAL                          00000202h
#define GL_LEQUAL                         00000203h
#define GL_GREATER                        00000204h
#define GL_NOTEQUAL                       00000205h
#define GL_GEQUAL                         00000206h
#define GL_ALWAYS                         00000207h

;* AttribMask */
#define GL_CURRENT_BIT                    00000001h
#define GL_POINT_BIT                      00000002h
#define GL_LINE_BIT                       00000004h
#define GL_POLYGON_BIT                    00000008h
#define GL_POLYGON_STIPPLE_BIT            00000010h
#define GL_PIXEL_MODE_BIT                 00000020h
#define GL_LIGHTING_BIT                   00000040h
#define GL_FOG_BIT                        00000080h
#define GL_DEPTH_BUFFER_BIT               00000100h
#define GL_ACCUM_BUFFER_BIT               00000200h
#define GL_STENCIL_BUFFER_BIT             00000400h
#define GL_VIEWPORT_BIT                   00000800h
#define GL_TRANSFORM_BIT                  00001000h
#define GL_ENABLE_BIT                     00002000h
#define GL_COLOR_BUFFER_BIT               00004000h
#define GL_HINT_BIT                       00008000h
#define GL_EVAL_BIT                       00010000h
#define GL_LIST_BIT                       00020000h
#define GL_TEXTURE_BIT                    00040000h
#define GL_SCISSOR_BIT                    00080000h
#define GL_ALL_ATTRIB_BITS                000FFFFFh

; * BeginMode 
#define GL_POINTS                         00000000h
#define GL_LINES                          00000001h
#define GL_LINE_LOOP                      00000002h
#define GL_LINE_STRIP                     00000003h
#define GL_TRIANGLES                      00000004h
#define GL_TRIANGLE_STRIP                 00000005h
#define GL_TRIANGLE_FAN                   00000006h
#define GL_QUADS                          00000007h
#define GL_QUAD_STRIP                     00000008h
#define GL_POLYGON                        00000009h

;* BlendEquationMode 
;GL_LOGIC_OP 
;GL_FUNC_ADD 
;GL_MIN 
;GL_MAX
;GL_FUNC_SUBTRACT
;GL_FUNC_REVERSE_SUBTRACT

;BlendingFactorDest */
#define GL_ZERO                           0
#define GL_ONE                            1
#define GL_SRC_COLOR                      00000300h
#define GL_ONE_MINUS_SRC_COLOR            00000301h
#define GL_SRC_ALPHA                      00000302h
#define GL_ONE_MINUS_SRC_ALPHA            00000303h
#define GL_DST_ALPHA                      00000304h
#define GL_ONE_MINUS_DST_ALPHA            00000305h
;GL_CONSTANT_COLOR
;GL_ONE_MINUS_CONSTANT_COLOR
;GL_CONSTANT_ALPHA
;GL_ONE_MINUS_CONSTANT_ALPHA

;BlendingFactorSrc
;GL_ZERO
;GL_ONE 
#define GL_DST_COLOR                      00000306h
#define GL_ONE_MINUS_DST_COLOR            00000307h
#define GL_SRC_ALPHA_SATURATE             00000308h
;GL_SRC_ALPHA 
;GL_ONE_MINUS_SRC_ALPHA 
;GL_DST_ALPHA 
;GL_ONE_MINUS_DST_ALPHA 
;GL_CONSTANT_COLOR 
;GL_ONE_MINUS_CONSTANT_COLOR 
;GL_CONSTANT_ALPHA 
;GL_ONE_MINUS_CONSTANT_ALPHA

;Boolean
#define GL_TRUE                           1
#define GL_FALSE                          0

;ClearBufferMask 
; GL_COLOR_BUFFER_BIT 
; GL_ACCUM_BUFFER_BIT 
; GL_STENCIL_BUFFER_BIT 
; GL_DEPTH_BUFFER_BIT

;ClientArrayType 
; GL_VERTEX_ARRAY 
; GL_NORMAL_ARRAY 
; GL_COLOR_ARRAY 
; GL_INDEX_ARRAY 
; GL_TEXTURE_COORD_ARRAY 
; GL_EDGE_FLAG_ARRAY

;ClipPlaneName
#define GL_CLIP_PLANE0                    00003000h
#define GL_CLIP_PLANE1                    00003001h
#define GL_CLIP_PLANE2                    00003002h
#define GL_CLIP_PLANE3                    00003003h
#define GL_CLIP_PLANE4                    00003004h
#define GL_CLIP_PLANE5                    00003005h

;ColorMaterialFace 
;GL_FRONT 
;GL_BACK 
;GL_FRONT_AND_BACK 

;ColorMaterialParameter 
;GL_AMBIENT 
;GL_DIFFUSE 
;GL_SPECULAR 
;GL_EMISSION 
;GL_AMBIENT_AND_DIFFUSE 

;ColorPointerType 
;GL_BYTE 
;GL_UNSIGNED_BYTE 
;GL_SHORT 
;GL_UNSIGNED_SHORT 
;GL_INT 
;GL_UNSIGNED_INT 
;GL_FLOAT 
;GL_DOUBLE 

;ColorTableParameterPName 
;GL_COLOR_TABLE_SCALE 
;GL_COLOR_TABLE_BIAS 

;ColorTableTarget 
;GL_COLOR_TABLE 
;GL_POST_CONVOLUTION_COLOR_TABLE 
;GL_POST_COLOR_MATRIX_COLOR_TABLE 
;GL_PROXY_COLOR_TABLE 
;GL_PROXY_POST_CONVOLUTION_COLOR_TABLE 
;GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE 

;ConvolutionBorderMode 
;GL_REDUCE 
;GL_IGNORE_BORDER 
;GL_CONSTANT_BORDER 

;ConvolutionParameter 
;GL_CONVOLUTION_BORDER_MODE 
;GL_CONVOLUTION_FILTER_SCALE 
;GL_CONVOLUTION_FILTER_BIAS 

;ConvolutionTarget 
;GL_CONVOLUTION_1D 
;GL_CONVOLUTION_2D 

;CullFaceMode 
;GL_FRONT 
;GL_BACK 
;GL_FRONT_AND_BACK

;DataType
#define GL_BYTE                           00001400h
#define GL_UNSIGNED_BYTE                  00001401h
#define GL_SHORT                          00001402h
#define GL_UNSIGNED_SHORT                 00001403h
#define GL_INT                            00001404h
#define GL_UNSIGNED_INT                   00001405h
#define GL_FLOAT                          00001406h
#define GL_2_BYTES                        00001407h
#define GL_3_BYTES                        00001408h
#define GL_4_BYTES                        00001409h
#define GL_DOUBLE                         0000140Ah

;DepthFunction 
;GL_NEVER 
;GL_LESS 
;GL_EQUAL 
;GL_LEQUAL 
;GL_GREATER 
;GL_NOTEQUAL 
;GL_GEQUAL 
;GL_ALWAYS 

;DrawBufferMode
#define GL_NONE                           0
#define GL_FRONT_LEFT                     00000400h
#define GL_FRONT_RIGHT                    00000401h
#define GL_BACK_LEFT                      00000402h
#define GL_BACK_RIGHT                     00000403h
#define GL_FRONT                          00000404h
#define GL_BACK                           00000405h
#define GL_LEFT                           00000406h
#define GL_RIGHT                          00000407h
#define GL_FRONT_AND_BACK                 00000408h
#define GL_AUX0                           00000409h
#define GL_AUX1                           0000040Ah
#define GL_AUX2                           0000040Bh
#define GL_AUX3                           0000040Ch

;Enable 
;GL_FOG 
;GL_LIGHTING 
;GL_TEXTURE_1D 
;GL_TEXTURE_2D 
;GL_LINE_STIPPLE 
;GL_POLYGON_STIPPLE 
;GL_CULL_FACE 
;GL_ALPHA_TEST 
;GL_BLEND 
;GL_INDEX_LOGIC_OP 
;GL_COLOR_LOGIC_OP 
;GL_DITHER 
;GL_STENCIL_TEST 
;GL_DEPTH_TEST 
;GL_CLIP_PLANE0 
;GL_CLIP_PLANE1 
;GL_CLIP_PLANE2 
;GL_CLIP_PLANE3 
;GL_CLIP_PLANE4 
;GL_CLIP_PLANE5 
;GL_LIGHT0 
;GL_LIGHT1 
;GL_LIGHT2 
;GL_LIGHT3 
;GL_LIGHT4 
;GL_LIGHT5 
;GL_LIGHT6 
;GL_LIGHT7 
;GL_TEXTURE_GEN_S 
;GL_TEXTURE_GEN_T 
;GL_TEXTURE_GEN_R 
;GL_TEXTURE_GEN_Q 
;GL_MAP1_VERTEX_3 
;GL_MAP1_VERTEX_4 
;GL_MAP1_COLOR_4 
;GL_MAP1_INDEX 
;GL_MAP1_NORMAL 
;GL_MAP1_TEXTURE_COORD_1 
;GL_MAP1_TEXTURE_COORD_2 
;GL_MAP1_TEXTURE_COORD_3 
;GL_MAP1_TEXTURE_COORD_4 
;GL_MAP2_VERTEX_3 
;GL_MAP2_VERTEX_4 
;GL_MAP2_COLOR_4 
;GL_MAP2_INDEX 
;GL_MAP2_NORMAL 
;GL_MAP2_TEXTURE_COORD_1 
;GL_MAP2_TEXTURE_COORD_2 
;GL_MAP2_TEXTURE_COORD_3 
;GL_MAP2_TEXTURE_COORD_4 
;GL_POINT_SMOOTH 
;GL_LINE_SMOOTH 
;GL_POLYGON_SMOOTH 
;GL_SCISSOR_TEST 
;GL_COLOR_MATERIAL 
;GL_NORMALIZE 
;GL_AUTO_NORMAL 
;GL_VERTEX_ARRAY 
;GL_NORMAL_ARRAY 
;GL_COLOR_ARRAY 
;GL_INDEX_ARRAY 
;GL_TEXTURE_COORD_ARRAY 
;GL_EDGE_FLAG_ARRAY 
;GL_POLYGON_OFFSET_POINT 
;GL_POLYGON_OFFSET_LINE 
;GL_POLYGON_OFFSET_FILL 
;GL_COLOR_TABLE 
;GL_POST_CONVOLUTION_COLOR_TABLE 
;GL_POST_COLOR_MATRIX_COLOR_TABLE 
;GL_CONVOLUTION_1D 
;GL_CONVOLUTION_2D 
;GL_SEPARABLE_2D 
;GL_HISTOGRAM 
;GL_MINMAX 
;GL_RESCALE_NORMAL 
;GL_TEXTURE_3D

;ErrorCode
#define GL_NO_ERROR                       0
#define GL_INVALID_ENUM                   00000500h
#define GL_INVALID_VALUE                  00000501h
#define GL_INVALID_OPERATION              00000502h
#define GL_STACK_OVERFLOW                 00000503h
#define GL_STACK_UNDERFLOW                00000504h
#define GL_OUT_OF_MEMORY                  00000505h
;GL_TABLE_TOO_LARGE

;FeedBackMode
#define GL_2D                             00000600h
#define GL_3D                             00000601h
#define GL_3D_COLOR                       00000602h
#define GL_3D_COLOR_TEXTURE               00000603h
#define GL_4D_COLOR_TEXTURE               00000604h

;FeedBackToken
#define GL_PASS_THROUGH_TOKEN             00000700h
#define GL_POINT_TOKEN                    00000701h
#define GL_LINE_TOKEN                     00000702h
#define GL_POLYGON_TOKEN                  00000703h
#define GL_BITMAP_TOKEN                   00000704h
#define GL_DRAW_PIXEL_TOKEN               00000705h
#define GL_COPY_PIXEL_TOKEN               00000706h
#define GL_LINE_RESET_TOKEN               00000707h

;FogMode
;GL_LINEAR
#define GL_EXP                            00000800h
#define GL_EXP2                           00000801h

;FogParameter 
;GL_FOG_COLOR 
;GL_FOG_DENSITY 
;GL_FOG_END 
;GL_FOG_INDEX 
;GL_FOG_MODE 
;GL_FOG_START

;FrontFaceDirection
#define GL_CW                             00000900h
#define GL_CCW                            00000901h

;GetColorTableParameterPName 
;GL_COLOR_TABLE_SCALE 
;GL_COLOR_TABLE_BIAS 
;GL_COLOR_TABLE_FORMAT 
;GL_COLOR_TABLE_WIDTH 
;GL_COLOR_TABLE_RED_SIZE 
;GL_COLOR_TABLE_GREEN_SIZE 
;GL_COLOR_TABLE_BLUE_SIZE 
;GL_COLOR_TABLE_ALPHA_SIZE 
;GL_COLOR_TABLE_LUMINANCE_SIZE 
;GL_COLOR_TABLE_INTENSITY_SIZE 

;GetConvolutionParameterPName 
;GL_CONVOLUTION_BORDER_COLOR 
;GL_CONVOLUTION_BORDER_MODE 
;GL_CONVOLUTION_FILTER_SCALE 
;GL_CONVOLUTION_FILTER_BIAS 
;GL_CONVOLUTION_FORMAT 
;GL_CONVOLUTION_WIDTH 
;GL_CONVOLUTION_HEIGHT 
;GL_MAX_CONVOLUTION_WIDTH 
;GL_MAX_CONVOLUTION_HEIGHT 

;GetHistogramParameterPName 
;GL_HISTOGRAM_WIDTH 
;GL_HISTOGRAM_FORMAT 
;GL_HISTOGRAM_RED_SIZE 
;GL_HISTOGRAM_GREEN_SIZE 
;GL_HISTOGRAM_BLUE_SIZE 
;GL_HISTOGRAM_ALPHA_SIZE 
;GL_HISTOGRAM_LUMINANCE_SIZE 
;GL_HISTOGRAM_SINK

;GetMapTarget
#define GL_COEFF                          00000A00h
#define GL_ORDER                          00000A01h
#define GL_DOMAIN                         00000A02h

;GetMinmaxParameterPName 
;GL_MINMAX_FORMAT 
;GL_MINMAX_SINK 

; GetPixelMap 
;GL_PIXEL_MAP_I_TO_I 
;GL_PIXEL_MAP_S_TO_S 
;GL_PIXEL_MAP_I_TO_R 
;GL_PIXEL_MAP_I_TO_G 
;GL_PIXEL_MAP_I_TO_B 
;GL_PIXEL_MAP_I_TO_A 
;GL_PIXEL_MAP_R_TO_R 
;GL_PIXEL_MAP_G_TO_G 
;GL_PIXEL_MAP_B_TO_B 
;GL_PIXEL_MAP_A_TO_A 

;GetPointerTarget 
;GL_VERTEX_ARRAY_POINTER 
;GL_NORMAL_ARRAY_POINTER 
;GL_COLOR_ARRAY_POINTER 
;GL_INDEX_ARRAY_POINTER 
;GL_TEXTURE_COORD_ARRAY_POINTER 
;GL_EDGE_FLAG_ARRAY_POINTER

;GetTarget
#define GL_CURRENT_COLOR                  00000B00h
#define GL_CURRENT_INDEX                  00000B01h
#define GL_CURRENT_NORMAL                 00000B02h
#define GL_CURRENT_TEXTURE_COORDS         00000B03h
#define GL_CURRENT_RASTER_COLOR           00000B04h
#define GL_CURRENT_RASTER_INDEX           00000B05h
#define GL_CURRENT_RASTER_TEXTURE_COORDS  00000B06h
#define GL_CURRENT_RASTER_POSITION        00000B07h
#define GL_CURRENT_RASTER_POSITION_VALID  00000B08h
#define GL_CURRENT_RASTER_DISTANCE        00000B09h
#define GL_POINT_SMOOTH                   00000B10h
#define GL_POINT_SIZE                     00000B11h
#define GL_POINT_SIZE_RANGE               00000B12h
#define GL_POINT_SIZE_GRANULARITY         00000B13h
#define GL_LINE_SMOOTH                    00000B20h
#define GL_LINE_WIDTH                     00000B21h
#define GL_LINE_WIDTH_RANGE               00000B22h
#define GL_LINE_WIDTH_GRANULARITY         00000B23h
#define GL_LINE_STIPPLE                   00000B24h
#define GL_LINE_STIPPLE_PATTERN           00000B25h
#define GL_LINE_STIPPLE_REPEAT            00000B26h
;GL_SMOOTH_POINT_SIZE_RANGE 
;GL_SMOOTH_POINT_SIZE_GRANULARITY 
;GL_SMOOTH_LINE_WIDTH_RANGE 
;GL_SMOOTH_LINE_WIDTH_GRANULARITY 
;GL_ALIASED_POINT_SIZE_RANGE 
;GL_ALIASED_LINE_WIDTH_RANGE
#define GL_LIST_MODE                      00000B30h
#define GL_MAX_LIST_NESTING               00000B31h
#define GL_LIST_BASE                      00000B32h
#define GL_LIST_INDEX                     00000B33h
#define GL_POLYGON_MODE                   00000B40h
#define GL_POLYGON_SMOOTH                 00000B41h
#define GL_POLYGON_STIPPLE                00000B42h
#define GL_EDGE_FLAG                      00000B43h
#define GL_CULL_FACE                      00000B44h
#define GL_CULL_FACE_MODE                 00000B45h
#define GL_FRONT_FACE                     00000B46h
#define GL_LIGHTING                       00000B50h
#define GL_LIGHT_MODEL_LOCAL_VIEWER       00000B51h
#define GL_LIGHT_MODEL_TWO_SIDE           00000B52h
#define GL_LIGHT_MODEL_AMBIENT            00000B53h
#define GL_SHADE_MODEL                    00000B54h
#define GL_COLOR_MATERIAL_FACE            00000B55h
#define GL_COLOR_MATERIAL_PARAMETER       00000B56h
#define GL_COLOR_MATERIAL                 00000B57h
#define GL_FOG                            00000B60h
#define GL_FOG_INDEX                      00000B61h
#define GL_FOG_DENSITY                    00000B62h
#define GL_FOG_START                      00000B63h
#define GL_FOG_END                        00000B64h
#define GL_FOG_MODE                       00000B65h
#define GL_FOG_COLOR                      00000B66h
#define GL_DEPTH_RANGE                    00000B70h
#define GL_DEPTH_TEST                     00000B71h
#define GL_DEPTH_WRITEMASK                00000B72h
#define GL_DEPTH_CLEAR_VALUE              00000B73h
#define GL_DEPTH_FUNC                     00000B74h
#define GL_ACCUM_CLEAR_VALUE              00000B80h
#define GL_STENCIL_TEST                   00000B90h
#define GL_STENCIL_CLEAR_VALUE            00000B91h
#define GL_STENCIL_FUNC                   00000B92h
#define GL_STENCIL_VALUE_MASK             00000B93h
#define GL_STENCIL_FAIL                   00000B94h
#define GL_STENCIL_PASS_DEPTH_FAIL        00000B95h
#define GL_STENCIL_PASS_DEPTH_PASS        00000B96h
#define GL_STENCIL_REF                    00000B97h
#define GL_STENCIL_WRITEMASK              00000B98h
#define GL_MATRIX_MODE                    00000BA0h
#define GL_NORMALIZE                      00000BA1h
#define GL_VIEWPORT                       00000BA2h
#define GL_MODELVIEW_STACK_DEPTH          00000BA3h
#define GL_PROJECTION_STACK_DEPTH         00000BA4h
#define GL_TEXTURE_STACK_DEPTH            00000BA5h
#define GL_MODELVIEW_MATRIX               00000BA6h
#define GL_PROJECTION_MATRIX              00000BA7h
#define GL_TEXTURE_MATRIX                 00000BA8h
#define GL_ATTRIB_STACK_DEPTH             00000BB0h
#define GL_CLIENT_ATTRIB_STACK_DEPTH      00000BB1h
#define GL_ALPHA_TEST                     00000BC0h
#define GL_ALPHA_TEST_FUNC                00000BC1h
#define GL_ALPHA_TEST_REF                 00000BC2h
#define GL_DITHER                         00000BD0h
#define GL_BLEND_DST                      00000BE0h
#define GL_BLEND_SRC                      00000BE1h
#define GL_BLEND                          00000BE2h
#define GL_LOGIC_OP_MODE                  00000BF0h
#define GL_INDEX_LOGIC_OP                 00000BF1h
#define GL_COLOR_LOGIC_OP                 00000BF2h
#define GL_AUX_BUFFERS                    00000C00h
#define GL_DRAW_BUFFER                    00000C01h
#define GL_READ_BUFFER                    00000C02h
#define GL_SCISSOR_BOX                    00000C10h
#define GL_SCISSOR_TEST                   00000C11h
#define GL_INDEX_CLEAR_VALUE              00000C20h
#define GL_INDEX_WRITEMASK                00000C21h
#define GL_COLOR_CLEAR_VALUE              00000C22h
#define GL_COLOR_WRITEMASK                00000C23h
#define GL_INDEX_MODE                     00000C30h
#define GL_RGBA_MODE                      00000C31h
#define GL_DOUBLEBUFFER                   00000C32h
#define GL_STEREO                         00000C33h
#define GL_RENDER_MODE                    00000C40h
#define GL_PERSPECTIVE_CORRECTION_HINT    00000C50h
#define GL_POINT_SMOOTH_HINT              00000C51h
#define GL_LINE_SMOOTH_HINT               00000C52h
#define GL_POLYGON_SMOOTH_HINT            00000C53h
#define GL_FOG_HINT                       00000C54h
#define GL_TEXTURE_GEN_S                  00000C60h
#define GL_TEXTURE_GEN_T                  00000C61h
#define GL_TEXTURE_GEN_R                  00000C62h
#define GL_TEXTURE_GEN_Q                  00000C63h
#define GL_PIXEL_MAP_I_TO_I               00000C70h
#define GL_PIXEL_MAP_S_TO_S               00000C71h
#define GL_PIXEL_MAP_I_TO_R               00000C72h
#define GL_PIXEL_MAP_I_TO_G               00000C73h
#define GL_PIXEL_MAP_I_TO_B               00000C74h
#define GL_PIXEL_MAP_I_TO_A               00000C75h
#define GL_PIXEL_MAP_R_TO_R               00000C76h
#define GL_PIXEL_MAP_G_TO_G               00000C77h
#define GL_PIXEL_MAP_B_TO_B               00000C78h
#define GL_PIXEL_MAP_A_TO_A               00000C79h
#define GL_PIXEL_MAP_I_TO_I_SIZE          00000CB0h
#define GL_PIXEL_MAP_S_TO_S_SIZE          00000CB1h
#define GL_PIXEL_MAP_I_TO_R_SIZE          00000CB2h
#define GL_PIXEL_MAP_I_TO_G_SIZE          00000CB3h
#define GL_PIXEL_MAP_I_TO_B_SIZE          00000CB4h
#define GL_PIXEL_MAP_I_TO_A_SIZE          00000CB5h
#define GL_PIXEL_MAP_R_TO_R_SIZE          00000CB6h
#define GL_PIXEL_MAP_G_TO_G_SIZE          00000CB7h
#define GL_PIXEL_MAP_B_TO_B_SIZE          00000CB8h
#define GL_PIXEL_MAP_A_TO_A_SIZE          00000CB9h
#define GL_UNPACK_SWAP_BYTES              00000CF0h
#define GL_UNPACK_LSB_FIRST               00000CF1h
#define GL_UNPACK_ROW_LENGTH              00000CF2h
#define GL_UNPACK_SKIP_ROWS               00000CF3h
#define GL_UNPACK_SKIP_PIXELS             00000CF4h
#define GL_UNPACK_ALIGNMENT               00000CF5h
#define GL_PACK_SWAP_BYTES                00000D00h
#define GL_PACK_LSB_FIRST                 00000D01h
#define GL_PACK_ROW_LENGTH                00000D02h
#define GL_PACK_SKIP_ROWS                 00000D03h
#define GL_PACK_SKIP_PIXELS               00000D04h
#define GL_PACK_ALIGNMENT                 00000D05h
#define GL_MAP_COLOR                      00000D10h
#define GL_MAP_STENCIL                    00000D11h
#define GL_INDEX_SHIFT                    00000D12h
#define GL_INDEX_OFFSET                   00000D13h
#define GL_RED_SCALE                      00000D14h
#define GL_RED_BIAS                       00000D15h
#define GL_ZOOM_X                         00000D16h
#define GL_ZOOM_Y                         00000D17h
#define GL_GREEN_SCALE                    00000D18h
#define GL_GREEN_BIAS                     00000D19h
#define GL_BLUE_SCALE                     00000D1Ah
#define GL_BLUE_BIAS                      00000D1Bh
#define GL_ALPHA_SCALE                    00000D1Ch
#define GL_ALPHA_BIAS                     00000D1Dh
#define GL_DEPTH_SCALE                    00000D1Eh
#define GL_DEPTH_BIAS                     00000D1Fh
#define GL_MAX_EVAL_ORDER                 00000D30h
#define GL_MAX_LIGHTS                     00000D31h
#define GL_MAX_CLIP_PLANES                00000D32h
#define GL_MAX_TEXTURE_SIZE               00000D33h
#define GL_MAX_PIXEL_MAP_TABLE            00000D34h
#define GL_MAX_ATTRIB_STACK_DEPTH         00000D35h
#define GL_MAX_MODELVIEW_STACK_DEPTH      00000D36h
#define GL_MAX_NAME_STACK_DEPTH           00000D37h
#define GL_MAX_PROJECTION_STACK_DEPTH     00000D38h
#define GL_MAX_TEXTURE_STACK_DEPTH        00000D39h
#define GL_MAX_VIEWPORT_DIMS              00000D3Ah
#define GL_MAX_CLIENT_ATTRIB_STACK_DEPTH  00000D3Bh
#define GL_SUBPIXEL_BITS                  00000D50h
#define GL_INDEX_BITS                     00000D51h
#define GL_RED_BITS                       00000D52h
#define GL_GREEN_BITS                     00000D53h
#define GL_BLUE_BITS                      00000D54h
#define GL_ALPHA_BITS                     00000D55h
#define GL_DEPTH_BITS                     00000D56h
#define GL_STENCIL_BITS                   00000D57h
#define GL_ACCUM_RED_BITS                 00000D58h
#define GL_ACCUM_GREEN_BITS               00000D59h
#define GL_ACCUM_BLUE_BITS                00000D5Ah
#define GL_ACCUM_ALPHA_BITS               00000D5Bh
#define GL_NAME_STACK_DEPTH               00000D70h
#define GL_AUTO_NORMAL                    00000D80h
#define GL_MAP1_COLOR_4                   00000D90h
#define GL_MAP1_INDEX                     00000D91h
#define GL_MAP1_NORMAL                    00000D92h
#define GL_MAP1_TEXTURE_COORD_1           00000D93h
#define GL_MAP1_TEXTURE_COORD_2           00000D94h
#define GL_MAP1_TEXTURE_COORD_3           00000D95h
#define GL_MAP1_TEXTURE_COORD_4           00000D96h
#define GL_MAP1_VERTEX_3                  00000D97h
#define GL_MAP1_VERTEX_4                  00000D98h
#define GL_MAP2_COLOR_4                   00000DB0h
#define GL_MAP2_INDEX                     00000DB1h
#define GL_MAP2_NORMAL                    00000DB2h
#define GL_MAP2_TEXTURE_COORD_1           00000DB3h
#define GL_MAP2_TEXTURE_COORD_2           00000DB4h
#define GL_MAP2_TEXTURE_COORD_3           00000DB5h
#define GL_MAP2_TEXTURE_COORD_4           00000DB6h
#define GL_MAP2_VERTEX_3                  00000DB7h
#define GL_MAP2_VERTEX_4                  00000DB8h
#define GL_MAP1_GRID_DOMAIN               00000DD0h
#define GL_MAP1_GRID_SEGMENTS             00000DD1h
#define GL_MAP2_GRID_DOMAIN               00000DD2h
#define GL_MAP2_GRID_SEGMENTS             00000DD3h
#define GL_TEXTURE_1D                     00000DE0h
#define GL_TEXTURE_2D                     00000DE1h
#define GL_FEEDBACK_BUFFER_POINTER        00000DF0h
#define GL_FEEDBACK_BUFFER_SIZE           00000DF1h
#define GL_FEEDBACK_BUFFER_TYPE           00000DF2h
#define GL_SELECTION_BUFFER_POINTER       00000DF3h
#define GL_SELECTION_BUFFER_SIZE          00000DF4h
;GL_TEXTURE_BINDING_1D 
;GL_TEXTURE_BINDING_2D 
;GL_TEXTURE_BINDING_3D 
;GL_VERTEX_ARRAY 
;GL_NORMAL_ARRAY 
;GL_COLOR_ARRAY 
;GL_INDEX_ARRAY 
;GL_TEXTURE_COORD_ARRAY 
;GL_EDGE_FLAG_ARRAY 
;GL_VERTEX_ARRAY_SIZE 
;GL_VERTEX_ARRAY_TYPE 
;GL_VERTEX_ARRAY_STRIDE 
;GL_NORMAL_ARRAY_TYPE 
;GL_NORMAL_ARRAY_STRIDE 
;GL_COLOR_ARRAY_SIZE 
;GL_COLOR_ARRAY_TYPE 
;GL_COLOR_ARRAY_STRIDE 
;GL_INDEX_ARRAY_TYPE 
;GL_INDEX_ARRAY_STRIDE 
;GL_TEXTURE_COORD_ARRAY_SIZE 
;GL_TEXTURE_COORD_ARRAY_TYPE 
;GL_TEXTURE_COORD_ARRAY_STRIDE 
;GL_EDGE_FLAG_ARRAY_STRIDE 
;GL_POLYGON_OFFSET_FACTOR 
;GL_POLYGON_OFFSET_UNITS 
;GL_COLOR_TABLE 
;GL_POST_CONVOLUTION_COLOR_TABLE 
;GL_POST_COLOR_MATRIX_COLOR_TABLE 
;GL_CONVOLUTION_1D 
;GL_CONVOLUTION_2D 
;GL_SEPARABLE_2D 
;GL_POST_CONVOLUTION_RED_SCALE 
;GL_POST_CONVOLUTION_GREEN_SCALE 
;GL_POST_CONVOLUTION_BLUE_SCALE 
;GL_POST_CONVOLUTION_ALPHA_SCALE 
;GL_POST_CONVOLUTION_RED_BIAS 
;GL_POST_CONVOLUTION_GREEN_BIAS 
;GL_POST_CONVOLUTION_BLUE_BIAS 
;GL_POST_CONVOLUTION_ALPHA_BIAS 
;GL_COLOR_MATRIX 
;GL_COLOR_MATRIX_STACK_DEPTH 
;GL_MAX_COLOR_MATRIX_STACK_DEPTH 
;GL_POST_COLOR_MATRIX_RED_SCALE 
;GL_POST_COLOR_MATRIX_GREEN_SCALE 
;GL_POST_COLOR_MATRIX_BLUE_SCALE 
;GL_POST_COLOR_MATRIX_ALPHA_SCALE 
;GL_POST_COLOR_MATRIX_RED_BIAS 
;GL_POST_COLOR_MATRIX_GREEN_BIAS 
;GL_POST_COLOR_MATRIX_BLUE_BIAS 
;GL_POST_COLOR_MATRIX_ALPHA_BIAS 
;GL_HISTOGRAM 
;GL_MINMAX 
;GL_MAX_ELEMENTS_VERTICES 
;GL_MAX_ELEMENTS_INDICES 
;GL_RESCALE_NORMAL 
;GL_LIGHT_MODEL_COLOR_CONTROL 
;GL_PACK_SKIP_IMAGES 
;GL_PACK_IMAGE_HEIGHT 
;GL_UNPACK_SKIP_IMAGES 
;GL_UNPACK_IMAGE_HEIGHT 
;GL_TEXTURE_3D 
;GL_MAX_3D_TEXTURE_SIZE 
;GL_BLEND_COLOR 
;GL_BLEND_EQUATION

;GetTextureParameter 
;GL_TEXTURE_MAG_FILTER 
;GL_TEXTURE_MIN_FILTER 
;GL_TEXTURE_WRAP_S 
;GL_TEXTURE_WRAP_T
#define GL_TEXTURE_WIDTH                  00001000h
#define GL_TEXTURE_HEIGHT                 00001001h
#define GL_TEXTURE_INTERNAL_FORMAT        00001003h
#define GL_TEXTURE_BORDER_COLOR           00001004h
#define GL_TEXTURE_BORDER                 00001005h
;GL_TEXTURE_RED_SIZE 
;GL_TEXTURE_GREEN_SIZE 
;GL_TEXTURE_BLUE_SIZE 
;GL_TEXTURE_ALPHA_SIZE 
;GL_TEXTURE_LUMINANCE_SIZE 
;GL_TEXTURE_INTENSITY_SIZE 
;GL_TEXTURE_PRIORITY 
;GL_TEXTURE_RESIDENT 
;GL_TEXTURE_DEPTH 
;GL_TEXTURE_WRAP_R 
;GL_TEXTURE_MIN_LOD 
;GL_TEXTURE_MAX_LOD 
;GL_TEXTURE_BASE_LEVEL 
;GL_TEXTURE_MAX_LEVEL

;HintMode
#define GL_DONT_CARE                      00001100h
#define GL_FASTEST                        00001101h
#define GL_NICEST                         00001102h

;HintTarget 
;GL_PERSPECTIVE_CORRECTION_HINT 
;GL_POINT_SMOOTH_HINT 
;GL_LINE_SMOOTH_HINT 
;GL_POLYGON_SMOOTH_HINT 
;GL_FOG_HINT 

;HistogramTarget 
;GL_HISTOGRAM 
;GL_PROXY_HISTOGRAM 

;IndexPointerType 
;GL_SHORT 
;GL_INT 
;GL_FLOAT 
;GL_DOUBLE 

;LightModelColorControl 
;GL_SINGLE_COLOR 
;GL_SEPARATE_SPECULAR_COLOR 

;LightModelParameter 
;GL_LIGHT_MODEL_AMBIENT 
;GL_LIGHT_MODEL_LOCAL_VIEWER 
;GL_LIGHT_MODEL_TWO_SIDE 
;GL_LIGHT_MODEL_COLOR_CONTROL

;LightName
#define GL_LIGHT0                         00004000h
#define GL_LIGHT1                         00004001h
#define GL_LIGHT2                         00004002h
#define GL_LIGHT3                         00004003h
#define GL_LIGHT4                         00004004h
#define GL_LIGHT5                         00004005h
#define GL_LIGHT6                         00004006h
#define GL_LIGHT7                         00004007h

;LightParameter
#define GL_AMBIENT                        00001200h
#define GL_DIFFUSE                        00001201h
#define GL_SPECULAR                       00001202h
#define GL_POSITION                       00001203h
#define GL_SPOT_DIRECTION                 00001204h
#define GL_SPOT_EXPONENT                  00001205h
#define GL_SPOT_CUTOFF                    00001206h
#define GL_CONSTANT_ATTENUATION           00001207h
#define GL_LINEAR_ATTENUATION             00001208h
#define GL_QUADRATIC_ATTENUATION          00001209h

;InterleavedArrays 
;GL_V2F 
;GL_V3F 
;GL_C4UB_V2F 
;GL_C4UB_V3F 
;GL_C3F_V3F 
;GL_N3F_V3F 
;GL_C4F_N3F_V3F 
;GL_T2F_V3F 
;GL_T4F_V4F 
;GL_T2F_C4UB_V3F 
;GL_T2F_C3F_V3F 
;GL_T2F_N3F_V3F 
;GL_T2F_C4F_N3F_V3F 
;GL_T4F_C4F_N3F_V4F

;ListMode */
#define GL_COMPILE                        00001300h
#define GL_COMPILE_AND_EXECUTE            00001301h

;ListNameType 
;GL_BYTE 
;GL_UNSIGNED_BYTE 
;GL_SHORT 
;GL_UNSIGNED_SHORT 
;GL_INT 
;GL_UNSIGNED_INT 
;GL_FLOAT 
;GL_2_BYTES 
;GL_3_BYTES 
;GL_4_BYTES

;LogicOp 
#define GL_CLEAR                          00001500h
#define GL_AND                            00001501h
#define GL_AND_REVERSE                    00001502h
#define GL_COPY                           00001503h
#define GL_AND_INVERTED                   00001504h
#define GL_NOOP                           00001505h
#define GL_XOR                            00001506h
#define GL_OR                             00001507h
#define GL_NOR                            00001508h
#define GL_EQUIV                          00001509h
#define GL_INVERT                         0000150Ah
#define GL_OR_REVERSE                     0000150Bh
#define GL_COPY_INVERTED                  0000150Ch
#define GL_OR_INVERTED                    0000150Dh
#define GL_NAND                           0000150Eh
#define GL_SET                            0000150Fh

;MapTarget 
;GL_MAP1_COLOR_4 
;GL_MAP1_INDEX 
;GL_MAP1_NORMAL 
;GL_MAP1_TEXTURE_COORD_1 
;GL_MAP1_TEXTURE_COORD_2 
;GL_MAP1_TEXTURE_COORD_3 
;GL_MAP1_TEXTURE_COORD_4 
;GL_MAP1_VERTEX_3 
;GL_MAP1_VERTEX_4 
;GL_MAP2_COLOR_4 
;GL_MAP2_INDEX 
;GL_MAP2_NORMAL 
;GL_MAP2_TEXTURE_COORD_1 
;GL_MAP2_TEXTURE_COORD_2 
;GL_MAP2_TEXTURE_COORD_3 
;GL_MAP2_TEXTURE_COORD_4 
;GL_MAP2_VERTEX_3 
;GL_MAP2_VERTEX_4

;MaterialFace 
;GL_FRONT 
;GL_BACK 
;GL_FRONT_AND_BACK 

;MaterialParameter 
#define GL_EMISSION                       00001600h
#define GL_SHININESS                      00001601h
#define GL_AMBIENT_AND_DIFFUSE            00001602h
#define GL_COLOR_INDEXES                  00001603h
;GL_AMBIENT
;GL_DIFFUSE
;GL_SPECULAR

;MatrixMode
#define GL_MODELVIEW                      00001700h
#define GL_PROJECTION                     00001701h
#define GL_TEXTURE                        00001702h

;MeshMode1 
;GL_POINT 
;GL_LINE 

;MeshMode2 
;GL_POINT 
;GL_LINE 
;GL_FILL 

;MinmaxTarget 
;GL_MINMAX 

;NormalPointerType 
;GL_BYTE 
;GL_SHORT 
;GL_INT 
;GL_FLOAT 
;GL_DOUBLE

;PixelCopyType
#define GL_COLOR                          00001800h
#define GL_DEPTH                          00001801h
#define GL_STENCIL                        00001802h

;PixelFormat 
#define GL_COLOR_INDEX                    00001900h
#define GL_STENCIL_INDEX                  00001901h
#define GL_DEPTH_COMPONENT                00001902h
#define GL_RED                            00001903h
#define GL_GREEN                          00001904h
#define GL_BLUE                           00001905h
#define GL_ALPHA                          00001906h
#define GL_RGB                            00001907h
#define GL_RGBA                           00001908h
#define GL_LUMINANCE                      00001909h
#define GL_LUMINANCE_ALPHA                0000190Ah
;GL_ABGR

;PixelInternalFormat 
;GL_ALPHA4 
;GL_ALPHA8 
;GL_ALPHA12 
;GL_ALPHA16 
;GL_LUMINANCE4 
;GL_LUMINANCE8 
;GL_LUMINANCE12 
;GL_LUMINANCE16 
;GL_LUMINANCE4_ALPHA4 
;GL_LUMINANCE6_ALPHA2 
;GL_LUMINANCE8_ALPHA8 
;GL_LUMINANCE12_ALPHA4 
;GL_LUMINANCE12_ALPHA12 
;GL_LUMINANCE16_ALPHA16 
;GL_INTENSITY 
;GL_INTENSITY4 
;GL_INTENSITY8 
;GL_INTENSITY12 
;GL_INTENSITY16 
;GL_R3_G3_B2 
;GL_RGB4 
;GL_RGB5 
;GL_RGB8 
;GL_RGB10 
;GL_RGB12 
;GL_RGB16 
;GL_RGBA2 
;GL_RGBA4 
;GL_RGB5_A1 
;GL_RGBA8 
;GL_RGB10_A2 
;GL_RGBA12 
;GL_RGBA16 

;PixelMap 
;GL_PIXEL_MAP_I_TO_I 
;GL_PIXEL_MAP_S_TO_S 
;GL_PIXEL_MAP_I_TO_R 
;GL_PIXEL_MAP_I_TO_G 
;GL_PIXEL_MAP_I_TO_B 
;GL_PIXEL_MAP_I_TO_A 
;GL_PIXEL_MAP_R_TO_R 
;GL_PIXEL_MAP_G_TO_G 
;GL_PIXEL_MAP_B_TO_B 
;GL_PIXEL_MAP_A_TO_A 

;PixelStore 
;GL_UNPACK_SWAP_BYTES 
;GL_UNPACK_LSB_FIRST 
;GL_UNPACK_ROW_LENGTH 
;GL_UNPACK_SKIP_ROWS 
;GL_UNPACK_SKIP_PIXELS 
;GL_UNPACK_ALIGNMENT 
;GL_PACK_SWAP_BYTES 
;GL_PACK_LSB_FIRST 
;GL_PACK_ROW_LENGTH 
;GL_PACK_SKIP_ROWS 
;GL_PACK_SKIP_PIXELS 
;GL_PACK_ALIGNMENT 
;GL_PACK_SKIP_IMAGES 
;GL_PACK_IMAGE_HEIGHT 
;GL_UNPACK_SKIP_IMAGES 
;GL_UNPACK_IMAGE_HEIGHT 

; PixelTransfer 
;GL_MAP_COLOR 
;GL_MAP_STENCIL 
;GL_INDEX_SHIFT 
;GL_INDEX_OFFSET 
;GL_RED_SCALE 
;GL_RED_BIAS 
;GL_GREEN_SCALE 
;GL_GREEN_BIAS 
;GL_BLUE_SCALE 
;GL_BLUE_BIAS 
;GL_ALPHA_SCALE 
;GL_ALPHA_BIAS 
;GL_DEPTH_SCALE 
;GL_DEPTH_BIAS 
;GL_POST_CONVOLUTION_RED_SCALE 
;GL_POST_CONVOLUTION_GREEN_SCALE 
;GL_POST_CONVOLUTION_BLUE_SCALE 
;GL_POST_CONVOLUTION_ALPHA_SCALE 
;GL_POST_CONVOLUTION_RED_BIAS 
;GL_POST_CONVOLUTION_GREEN_BIAS 
;GL_POST_CONVOLUTION_BLUE_BIAS 
;GL_POST_CONVOLUTION_ALPHA_BIAS 
;GL_POST_COLOR_MATRIX_RED_SCALE 
;GL_POST_COLOR_MATRIX_GREEN_SCALE 
;GL_POST_COLOR_MATRIX_BLUE_SCALE 
;GL_POST_COLOR_MATRIX_ALPHA_SCALE 
;GL_POST_COLOR_MATRIX_RED_BIAS 
;GL_POST_COLOR_MATRIX_GREEN_BIAS 
;GL_POST_COLOR_MATRIX_BLUE_BIAS 
;GL_POST_COLOR_MATRIX_ALPHA_BIAS

;PixelType;
#define GL_BITMAP                         00001A00h

;GL_BYTE 
;GL_UNSIGNED_BYTE 
;GL_SHORT 
;GL_UNSIGNED_SHORT 
;GL_INT 
;GL_UNSIGNED_INT 
;GL_FLOAT 
;GL_BGR 
;GL_BGRA 
;GL_UNSIGNED_BYTE_3_3_2 
;GL_UNSIGNED_SHORT_4_4_4_4 
;GL_UNSIGNED_SHORT_5_5_5_1 
;GL_UNSIGNED_INT_8_8_8_8 
;GL_UNSIGNED_INT_10_10_10_2 
;GL_UNSIGNED_SHORT_5_6_5 
;GL_UNSIGNED_BYTE_2_3_3_REV 
;GL_UNSIGNED_SHORT_5_6_5_REV 
;GL_UNSIGNED_SHORT_4_4_4_4_REV 
;GL_UNSIGNED_SHORT_1_5_5_5_REV 
;GL_UNSIGNED_INT_8_8_8_8_REV 
;GL_UNSIGNED_INT_2_10_10_10_REV

;PolygonMode
#define GL_POINT                          00001B00h
#define GL_LINE                           00001B01h
#define GL_FILL                           00001B02h

;ReadBufferMode 
;GL_FRONT_LEFT 
;GL_FRONT_RIGHT 
;GL_BACK_LEFT 
;GL_BACK_RIGHT 
;GL_FRONT 
;GL_BACK 
;GL_LEFT 
;GL_RIGHT 
;GL_AUX0 
;GL_AUX1 
;GL_AUX2 
;GL_AUX3

;RenderingMode 
#define GL_RENDER                         00001C00h
#define GL_FEEDBACK                       00001C01h
#define GL_SELECT                         00001C02h

;SeparableTarget */
;GL_SEPARABLE_2D

;ShadingModel 
#define GL_FLAT                           00001D00h
#define GL_SMOOTH                         00001D01h

;StencilFunction 
;GL_NEVER 
;GL_LESS 
;GL_EQUAL 
;GL_LEQUAL 
;GL_GREATER 
;GL_NOTEQUAL 
;GL_GEQUAL 
;GL_ALWAYS

;;StencilOp 
;GL_ZERO 
#define GL_KEEP                           00001E00h
#define GL_REPLACE                        00001E01h
#define GL_INCR                           00001E02h
#define GL_DECR                           00001E03h
;GL_INVERT

;StringName
#define GL_VENDOR                         00001F00h
#define GL_RENDERER                       00001F01h
#define GL_VERSION                        00001F02h
#define GL_EXTENSIONS                     00001F03h

;TextureCoordName 
#define GL_S                              00002000h
#define GL_T                              00002001h
#define GL_R                              00002002h
#define GL_Q                              00002003h

;TexCoordPointerType 
;GL_SHORT 
;GL_INT 
;GL_FLOAT 
;GL_DOUBLE

;TextureEnvMode */
#define GL_MODULATE                       00002100h
#define GL_DECAL                          00002101h
;GL_BLEND 
;GL_REPLACE

;TextureEnvParameter 
#define GL_TEXTURE_ENV_MODE               00002200h
#define GL_TEXTURE_ENV_COLOR              00002201h

;TextureEnvTarget 
#define GL_TEXTURE_ENV                    00002300h

;TextureGenMode 
#define GL_EYE_LINEAR                     00002400h
#define GL_OBJECT_LINEAR                  00002401h
#define GL_SPHERE_MAP                     00002402h

;TextureGenParameter 
#define GL_TEXTURE_GEN_MODE               00002500h
#define GL_OBJECT_PLANE                   00002501h
#define GL_EYE_PLANE                      00002502h

;TextureMagFilter 
#define GL_NEAREST                        00002600h
#define GL_LINEAR                         00002601h

;TextureMinFilter 
;GL_NEAREST 
;GL_LINEAR 
#define GL_NEAREST_MIPMAP_NEAREST         00002700h
#define GL_LINEAR_MIPMAP_NEAREST          00002701h
#define GL_NEAREST_MIPMAP_LINEAR          00002702h
#define GL_LINEAR_MIPMAP_LINEAR           00002703h

;TextureParameterName 
#define GL_TEXTURE_MAG_FILTER             00002800h
#define GL_TEXTURE_MIN_FILTER             00002801h
#define GL_TEXTURE_WRAP_S                 00002802h
#define GL_TEXTURE_WRAP_T                 00002803h
;GL_TEXTURE_BORDER_COLOR 
;GL_TEXTURE_PRIORITY 
;GL_TEXTURE_WRAP_R 
;GL_TEXTURE_MIN_LOD 
;GL_TEXTURE_MAX_LOD 
;GL_TEXTURE_BASE_LEVEL 
;GL_TEXTURE_MAX_LEVEL 

;TextureTarget 
;GL_TEXTURE_1D 
;GL_TEXTURE_2D 
;GL_PROXY_TEXTURE_1D 
;GL_PROXY_TEXTURE_2D 
;GL_TEXTURE_3D 
;GL_PROXY_TEXTURE_3D

;TextureWrapMode 
#define GL_CLAMP                          00002900h
#define GL_REPEAT                         00002901h
;GL_CLAMP_TO_EDGE 

;VertexPointerType 
;GL_SHORT 
;GL_INT 
;GL_FLOAT 
;GL_DOUBLE

;clientAttribMask 
#define GL_CLIENT_PIXEL_STORE_BIT         00000001h
#define GL_CLIENT_VERTEX_ARRAY_BIT        00000002h
#define GL_CLIENT_ALL_ATTRIB_BITS         FFFFFFFFh

;polygon_offset
#define GL_POLYGON_OFFSET_FACTOR          00008038h
#define GL_POLYGON_OFFSET_UNITS           00002A00h
#define GL_POLYGON_OFFSET_POINT           00002A01h
#define GL_POLYGON_OFFSET_LINE            00002A02h
#define GL_POLYGON_OFFSET_FILL            00008037h

;texture 
#define GL_ALPHA4                         0000803Bh
#define GL_ALPHA8                         0000803Ch
#define GL_ALPHA12                        0000803Dh
#define GL_ALPHA16                        0000803Eh
#define GL_LUMINANCE4                     0000803Fh
#define GL_LUMINANCE8                     00008040h
#define GL_LUMINANCE12                    00008041h
#define GL_LUMINANCE16                    00008042h
#define GL_LUMINANCE4_ALPHA4              00008043h
#define GL_LUMINANCE6_ALPHA2              00008044h
#define GL_LUMINANCE8_ALPHA8              00008045h
#define GL_LUMINANCE12_ALPHA4             00008046h
#define GL_LUMINANCE12_ALPHA12            00008047h
#define GL_LUMINANCE16_ALPHA16            00008048h
#define GL_INTENSITY                      00008049h
#define GL_INTENSITY4                     0000804Ah
#define GL_INTENSITY8                     0000804Bh
#define GL_INTENSITY12                    0000804Ch
#define GL_INTENSITY16                    0000804Dh
#define GL_R3_G3_B2                       00002A10h
#define GL_RGB4                           0000804Fh
#define GL_RGB5                           00008050h
#define GL_RGB8                           00008051h
#define GL_RGB10                          00008052h
#define GL_RGB12                          00008053h
#define GL_RGB16                          00008054h
#define GL_RGBA2                          00008055h
#define GL_RGBA4                          00008056h
#define GL_RGB5_A1                        00008057h
#define GL_RGBA8                          00008058h
#define GL_RGB10_A2                       00008059h
#define GL_RGBA12                         0000805Ah
#define GL_RGBA16                         0000805Bh
#define GL_TEXTURE_RED_SIZE               0000805Ch
#define GL_TEXTURE_GREEN_SIZE             0000805Dh
#define GL_TEXTURE_BLUE_SIZE              0000805Eh
#define GL_TEXTURE_ALPHA_SIZE             0000805Fh
#define GL_TEXTURE_LUMINANCE_SIZE         00008060h
#define GL_TEXTURE_INTENSITY_SIZE         00008061h
#define GL_PROXY_TEXTURE_1D               00008063h
#define GL_PROXY_TEXTURE_2D               00008064h

;texture_object */
#define GL_TEXTURE_PRIORITY               00008066h
#define GL_TEXTURE_RESIDENT               00008067h
#define GL_TEXTURE_BINDING_1D             00008068h
#define GL_TEXTURE_BINDING_2D             00008069h
#define GL_TEXTURE_BINDING_3D             0000806Ah

;vertex_array */
#define GL_VERTEX_ARRAY                   00008074h
#define GL_NORMAL_ARRAY                   00008075h
#define GL_COLOR_ARRAY                    00008076h
#define GL_INDEX_ARRAY                    00008077h
#define GL_TEXTURE_COORD_ARRAY            00008078h
#define GL_EDGE_FLAG_ARRAY                00008079h
#define GL_VERTEX_ARRAY_SIZE              0000807Ah
#define GL_VERTEX_ARRAY_TYPE              0000807Bh
#define GL_VERTEX_ARRAY_STRIDE            0000807Ch
#define GL_NORMAL_ARRAY_TYPE              0000807Eh
#define GL_NORMAL_ARRAY_STRIDE            0000807Fh
#define GL_COLOR_ARRAY_SIZE               00008081h
#define GL_COLOR_ARRAY_TYPE               00008082h
#define GL_COLOR_ARRAY_STRIDE             00008083h
#define GL_INDEX_ARRAY_TYPE               00008085h
#define GL_INDEX_ARRAY_STRIDE             00008086h
#define GL_TEXTURE_COORD_ARRAY_SIZE       00008088h
#define GL_TEXTURE_COORD_ARRAY_TYPE       00008089h
#define GL_TEXTURE_COORD_ARRAY_STRIDE     0000808Ah
#define GL_EDGE_FLAG_ARRAY_STRIDE         0000808Ch
#define GL_VERTEX_ARRAY_POINTER           0000808Eh
#define GL_NORMAL_ARRAY_POINTER           0000808Fh
#define GL_COLOR_ARRAY_POINTER            00008090h
#define GL_INDEX_ARRAY_POINTER            00008091h
#define GL_TEXTURE_COORD_ARRAY_POINTER    00008092h
#define GL_EDGE_FLAG_ARRAY_POINTER        00008093h
#define GL_V2F                            00002A20h
#define GL_V3F                            00002A21h
#define GL_C4UB_V2F                       00002A22h
#define GL_C4UB_V3F                       00002A23h
#define GL_C3F_V3F                        00002A24h
#define GL_N3F_V3F                        00002A25h
#define GL_C4F_N3F_V3F                    00002A26h
#define GL_T2F_V3F                        00002A27h
#define GL_T4F_V4F                        00002A28h
#define GL_T2F_C4UB_V3F                   00002A29h
#define GL_T2F_C3F_V3F                    00002A2Ah
#define GL_T2F_N3F_V3F                    00002A2Bh
#define GL_T2F_C4F_N3F_V3F                00002A2Ch
#define GL_T4F_C4F_N3F_V4F                00002A2Dh

;bgra */
#define GL_BGR                            000080E0h
#define GL_BGRA                           000080E1h

;blend_color
#define GL_CONSTANT_COLOR                 00008001h
#define GL_ONE_MINUS_CONSTANT_COLOR       00008002h
#define GL_CONSTANT_ALPHA                 00008003h
#define GL_ONE_MINUS_CONSTANT_ALPHA       00008004h
#define GL_BLEND_COLOR                    00008005h

;blend_minmax 
#define GL_FUNC_ADD                       00008006h
#define GL_MIN                            00008007h
#define GL_MAX                            00008008h
#define GL_BLEND_EQUATION                 00008009h

;blend_equation_separate 
#define GL_BLEND_EQUATION_RGB             00008009h
#define GL_BLEND_EQUATION_ALPHA           0000883Dh

;blend_subtract 
#define GL_FUNC_SUBTRACT                  0000800Ah
#define GL_FUNC_REVERSE_SUBTRACT          0000800Bh

;color_matrix 
#define GL_COLOR_MATRIX                   000080B1h
#define GL_COLOR_MATRIX_STACK_DEPTH       000080B2h
#define GL_MAX_COLOR_MATRIX_STACK_DEPTH   000080B3h
#define GL_POST_COLOR_MATRIX_RED_SCALE    000080B4h
#define GL_POST_COLOR_MATRIX_GREEN_SCALE  000080B5h
#define GL_POST_COLOR_MATRIX_BLUE_SCALE   000080B6h
#define GL_POST_COLOR_MATRIX_ALPHA_SCALE  000080B7h
#define GL_POST_COLOR_MATRIX_RED_BIAS     000080B8h
#define GL_POST_COLOR_MATRIX_GREEN_BIAS   000080B9h
#define GL_POST_COLOR_MATRIX_BLUE_BIAS    000080BAh
#define GL_POST_COLOR_MATRIX_ALPHA_BIAS   000080BBh

;color_table
#define GL_COLOR_TABLE                    000080D0h
#define GL_POST_CONVOLUTION_COLOR_TABLE   000080D1h
#define GL_POST_COLOR_MATRIX_COLOR_TABLE  000080D2h
#define GL_PROXY_COLOR_TABLE              000080D3h
#define GL_PROXY_POST_CONVOLUTION_COLOR_TABLE 000080D4h
#define GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE 000080D5h
#define GL_COLOR_TABLE_SCALE              000080D6h
#define GL_COLOR_TABLE_BIAS               000080D7h
#define GL_COLOR_TABLE_FORMAT             000080D8h
#define GL_COLOR_TABLE_WIDTH              000080D9h
#define GL_COLOR_TABLE_RED_SIZE           000080DAh
#define GL_COLOR_TABLE_GREEN_SIZE         000080DBh
#define GL_COLOR_TABLE_BLUE_SIZE          000080DCh
#define GL_COLOR_TABLE_ALPHA_SIZE         000080DDh
#define GL_COLOR_TABLE_LUMINANCE_SIZE     000080DEh
#define GL_COLOR_TABLE_INTENSITY_SIZE     000080DFh

;convolution 
#define GL_CONVOLUTION_1D                 00008010h
#define GL_CONVOLUTION_2D                 00008011h
#define GL_SEPARABLE_2D                   00008012h
#define GL_CONVOLUTION_BORDER_MODE        00008013h
#define GL_CONVOLUTION_FILTER_SCALE       00008014h
#define GL_CONVOLUTION_FILTER_BIAS        00008015h
#define GL_REDUCE                         00008016h
#define GL_CONVOLUTION_FORMAT             00008017h
#define GL_CONVOLUTION_WIDTH              00008018h
#define GL_CONVOLUTION_HEIGHT             00008019h
#define GL_MAX_CONVOLUTION_WIDTH          0000801Ah
#define GL_MAX_CONVOLUTION_HEIGHT         0000801Bh
#define GL_POST_CONVOLUTION_RED_SCALE     0000801Ch
#define GL_POST_CONVOLUTION_GREEN_SCALE   0000801Dh
#define GL_POST_CONVOLUTION_BLUE_SCALE    0000801Eh
#define GL_POST_CONVOLUTION_ALPHA_SCALE   0000801Fh
#define GL_POST_CONVOLUTION_RED_BIAS      00008020h
#define GL_POST_CONVOLUTION_GREEN_BIAS    00008021h
#define GL_POST_CONVOLUTION_BLUE_BIAS     00008022h
#define GL_POST_CONVOLUTION_ALPHA_BIAS    00008023h
#define GL_CONSTANT_BORDER                00008151h
#define GL_REPLICATE_BORDER               00008153h
#define GL_CONVOLUTION_BORDER_COLOR       00008154h

;* draw_range_elements 
#define GL_MAX_ELEMENTS_VERTICES          000080E8h
#define GL_MAX_ELEMENTS_INDICES           000080E9h

;histogram 
#define GL_HISTOGRAM                      00008024h
#define GL_PROXY_HISTOGRAM                00008025h
#define GL_HISTOGRAM_WIDTH                00008026h
#define GL_HISTOGRAM_FORMAT               00008027h
#define GL_HISTOGRAM_RED_SIZE             00008028h
#define GL_HISTOGRAM_GREEN_SIZE           00008029h
#define GL_HISTOGRAM_BLUE_SIZE            0000802Ah
#define GL_HISTOGRAM_ALPHA_SIZE           0000802Bh
#define GL_HISTOGRAM_LUMINANCE_SIZE       0000802Ch
#define GL_HISTOGRAM_SINK                 0000802Dh
#define GL_MINMAX                         0000802Eh
#define GL_MINMAX_FORMAT                  0000802Fh
#define GL_MINMAX_SINK                    00008030h
#define GL_TABLE_TOO_LARGE                00008031h

;packed_pixels 
#define GL_UNSIGNED_BYTE_3_3_2            00008032h
#define GL_UNSIGNED_SHORT_4_4_4_4         00008033h
#define GL_UNSIGNED_SHORT_5_5_5_1         00008034h
#define GL_UNSIGNED_INT_8_8_8_8           00008035h
#define GL_UNSIGNED_INT_10_10_10_2        00008036h
#define GL_UNSIGNED_BYTE_2_3_3_REV        00008362h
#define GL_UNSIGNED_SHORT_5_6_5           00008363h
#define GL_UNSIGNED_SHORT_5_6_5_REV       00008364h
#define GL_UNSIGNED_SHORT_4_4_4_4_REV     00008365h
#define GL_UNSIGNED_SHORT_1_5_5_5_REV     00008366h
#define GL_UNSIGNED_INT_8_8_8_8_REV       00008367h
#define GL_UNSIGNED_INT_2_10_10_10_REV    00008368h

;rescale_normal 
#define GL_RESCALE_NORMAL                 0000803Ah

;separate_specular_color 
#define GL_LIGHT_MODEL_COLOR_CONTROL      000081F8h
#define GL_SINGLE_COLOR                   000081F9h
#define GL_SEPARATE_SPECULAR_COLOR        000081FAh

;texture3D 
#define GL_PACK_SKIP_IMAGES               0000806Bh
#define GL_PACK_IMAGE_HEIGHT              0000806Ch
#define GL_UNPACK_SKIP_IMAGES             0000806Dh
#define GL_UNPACK_IMAGE_HEIGHT            0000806Eh
#define GL_TEXTURE_3D                     0000806Fh
#define GL_PROXY_TEXTURE_3D               00008070h
#define GL_TEXTURE_DEPTH                  00008071h
#define GL_TEXTURE_WRAP_R                 00008072h
#define GL_MAX_3D_TEXTURE_SIZE            00008073h

;texture_edge_clamp 
#define GL_CLAMP_TO_EDGE                  0000812Fh
#define GL_CLAMP_TO_BORDER                0000812Dh

;texture_lod 
#define GL_TEXTURE_MIN_LOD                0000813Ah
#define GL_TEXTURE_MAX_LOD                0000813Bh
#define GL_TEXTURE_BASE_LEVEL             0000813Ch
#define GL_TEXTURE_MAX_LEVEL              0000813Dh

;GetTarget1_2 
#define GL_SMOOTH_POINT_SIZE_RANGE        00000B12h
#define GL_SMOOTH_POINT_SIZE_GRANULARITY  00000B13h
#define GL_SMOOTH_LINE_WIDTH_RANGE        00000B22h
#define GL_SMOOTH_LINE_WIDTH_GRANULARITY  00000B23h
#define GL_ALIASED_POINT_SIZE_RANGE       0000846Dh
#define GL_ALIASED_LINE_WIDTH_RANGE       0000846Eh

#define GL_TEXTURE0                       000084C0h
#define GL_TEXTURE1                       000084C1h
#define GL_TEXTURE2                       000084C2h
#define GL_TEXTURE3                       000084C3h
#define GL_TEXTURE4                       000084C4h
#define GL_TEXTURE5                       000084C5h
#define GL_TEXTURE6                       000084C6h
#define GL_TEXTURE7                       000084C7h
#define GL_TEXTURE8                       000084C8h
#define GL_TEXTURE9                       000084C9h
#define GL_TEXTURE10                      000084CAh
#define GL_TEXTURE11                      000084CBh
#define GL_TEXTURE12                      000084CCh
#define GL_TEXTURE13                      000084CDh
#define GL_TEXTURE14                      000084CEh
#define GL_TEXTURE15                      000084CFh
#define GL_TEXTURE16                      000084D0h
#define GL_TEXTURE17                      000084D1h
#define GL_TEXTURE18                      000084D2h
#define GL_TEXTURE19                      000084D3h
#define GL_TEXTURE20                      000084D4h
#define GL_TEXTURE21                      000084D5h
#define GL_TEXTURE22                      000084D6h
#define GL_TEXTURE23                      000084D7h
#define GL_TEXTURE24                      000084D8h
#define GL_TEXTURE25                      000084D9h
#define GL_TEXTURE26                      000084DAh
#define GL_TEXTURE27                      000084DBh
#define GL_TEXTURE28                      000084DCh
#define GL_TEXTURE29                      000084DDh
#define GL_TEXTURE30                      000084DEh
#define GL_TEXTURE31                      000084DFh
#define GL_ACTIVE_TEXTURE                 000084E0h
#define GL_CLIENT_ACTIVE_TEXTURE          000084E1h
#define GL_MAX_TEXTURE_UNITS              000084E2h

#define GL_COMBINE                        00008570h
#define GL_COMBINE_RGB                    00008571h
#define GL_COMBINE_ALPHA                  00008572h
#define GL_RGB_SCALE                      00008573h
#define GL_ADD_SIGNED                     00008574h
#define GL_INTERPOLATE                    00008575h
#define GL_CONSTANT                       00008576h
#define GL_PRIMARY_COLOR                  00008577h
#define GL_PREVIOUS                       00008578h
#define GL_SUBTRACT                       000084E7h

#define GL_SRC0_RGB                       00008580h
#define GL_SRC1_RGB                       00008581h
#define GL_SRC2_RGB                       00008582h
#define GL_SRC0_ALPHA                     00008588h
#define GL_SRC1_ALPHA                     00008589h
#define GL_SRC2_ALPHA                     0000858Ah

;Obsolete 
#define GL_FOG_COORDINATE_SOURCE          00008450h
#define GL_FOG_COORDINATE                 00008451h
#define GL_CURRENT_FOG_COORDINATE         00008453h
#define GL_FOG_COORDINATE_ARRAY_TYPE      00008454h
#define GL_FOG_COORDINATE_ARRAY_STRIDE    00008455h
#define GL_FOG_COORDINATE_ARRAY_POINTER   00008456h
#define GL_FOG_COORDINATE_ARRAY           00008457h

#define GL_COLOR_SUM                      00008458h
#define GL_CURRENT_SECONDARY_COLOR        00008459h
#define GL_SECONDARY_COLOR_ARRAY_SIZE     0000845Ah
#define GL_SECONDARY_COLOR_ARRAY_TYPE     0000845Bh
#define GL_SECONDARY_COLOR_ARRAY_STRIDE   0000845Ch
#define GL_SECONDARY_COLOR_ARRAY_POINTER  0000845Dh
#define GL_SECONDARY_COLOR_ARRAY          0000845Eh

#define GL_POINT_SIZE_MIN                 00008126h
#define GL_POINT_SIZE_MAX                 00008127h
#define GL_POINT_FADE_THRESHOLD_SIZE      00008128h
#define GL_POINT_DISTANCE_ATTENUATION     00008129h

#define GL_BLEND_DST_RGB                  000080C8h
#define GL_BLEND_SRC_RGB                  000080C9h
#define GL_BLEND_DST_ALPHA                000080CAh
#define GL_BLEND_SRC_ALPHA                000080CBh

#define GL_GENERATE_MIPMAP                00008191h
#define GL_GENERATE_MIPMAP_HINT           00008192h

#define GL_INCR_WRAP                      00008507h
#define GL_DECR_WRAP                      00008508h

#define GL_MIRRORED_REPEAT                00008370h

#define GL_MAX_TEXTURE_LOD_BIAS           000084FDh
#define GL_TEXTURE_FILTER_CONTROL         00008500h
#define GL_TEXTURE_LOD_BIAS               00008501h

;vertex_buffer_object 
#define GL_ARRAY_BUFFER                                00008892h
#define GL_ELEMENT_ARRAY_BUFFER                        00008893h
#define GL_ARRAY_BUFFER_BINDING                        00008894h
#define GL_ELEMENT_ARRAY_BUFFER_BINDING                00008895h
#define GL_VERTEX_ARRAY_BUFFER_BINDING                 00008896h
#define GL_NORMAL_ARRAY_BUFFER_BINDING                 00008897h
#define GL_COLOR_ARRAY_BUFFER_BINDING                  00008898h
#define GL_INDEX_ARRAY_BUFFER_BINDING                  00008899h
#define GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING          0000889Ah
#define GL_EDGE_FLAG_ARRAY_BUFFER_BINDING              0000889Bh
#define GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING        0000889Ch
#define GL_FOG_COORD_ARRAY_BUFFER_BINDING              0000889Dh
#define GL_WEIGHT_ARRAY_BUFFER_BINDING                 0000889Eh
#define GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING          0000889Fh
#define GL_STREAM_DRAW                                 000088E0h
#define GL_STREAM_READ                                 000088E1h
#define GL_STREAM_COPY                                 000088E2h
#define GL_STATIC_DRAW                                 000088E4h
#define GL_STATIC_READ                                 000088E5h
#define GL_STATIC_COPY                                 000088E6h
#define GL_DYNAMIC_DRAW                                000088E8h
#define GL_DYNAMIC_READ                                000088E9h
#define GL_DYNAMIC_COPY                                000088EAh
#define GL_READ_ONLY                                   000088B8h
#define GL_WRITE_ONLY                                  000088B9h
#define GL_READ_WRITE                                  000088BAh
#define GL_BUFFER_SIZE                                 00008764h
#define GL_BUFFER_USAGE                                00008765h
#define GL_BUFFER_ACCESS                               000088BBh
#define GL_BUFFER_MAPPED                               000088BCh
#define GL_BUFFER_MAP_POINTER                          000088BDh
;Obsolete 
#define GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING         0000889Dh

;OpenGL 2.0 
#define GL_CURRENT_PROGRAM                00008B8Dh
#define GL_SHADER_TYPE                    00008B4Fh
#define GL_DELETE_STATUS                  00008B80h
#define GL_COMPILE_STATUS                 00008B81h
#define GL_LINK_STATUS                    00008B82h
#define GL_VALIDATE_STATUS                00008B83h
#define GL_INFO_LOG_LENGTH                00008B84h
#define GL_ATTACHED_SHADERS               00008B85h
#define GL_ACTIVE_UNIFORMS                00008B86h
#define GL_ACTIVE_UNIFORM_MAX_LENGTH      00008B87h
#define GL_SHADER_SOURCE_LENGTH           00008B88h
#define GL_FLOAT_VEC2                     00008B50h
#define GL_FLOAT_VEC3                     00008B51h
#define GL_FLOAT_VEC4                     00008B52h
#define GL_INT_VEC2                       00008B53h
#define GL_INT_VEC3                       00008B54h
#define GL_INT_VEC4                       00008B55h
#define GL_BOOL                           00008B56h
#define GL_BOOL_VEC2                      00008B57h
#define GL_BOOL_VEC3                      00008B58h
#define GL_BOOL_VEC4                      00008B59h
#define GL_FLOAT_MAT2                     00008B5Ah
#define GL_FLOAT_MAT3                     00008B5Bh
#define GL_FLOAT_MAT4                     00008B5Ch
#define GL_SAMPLER_1D                     00008B5Dh
#define GL_SAMPLER_2D                     00008B5Eh
#define GL_SAMPLER_3D                     00008B5Fh
#define GL_SAMPLER_CUBE                   00008B60h
#define GL_SAMPLER_1D_SHADOW              00008B61h
#define GL_SAMPLER_2D_SHADOW              00008B62h
#define GL_SHADING_LANGUAGE_VERSION       00008B8Ch
#define GL_VERTEX_SHADER                  00008B31h
#define GL_MAX_VERTEX_UNIFORM_COMPONENTS  00008B4Ah
#define GL_MAX_VARYING_FLOATS             00008B4Bh
#define GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS 00008B4Ch
#define GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS 00008B4Dh
#define GL_ACTIVE_ATTRIBUTES              00008B89h
#define GL_ACTIVE_ATTRIBUTE_MAX_LENGTH    00008B8Ah
#define GL_FRAGMENT_SHADER                00008B30h
#define GL_MAX_FRAGMENT_UNIFORM_COMPONENTS 00008B49h
#define GL_FRAGMENT_SHADER_DERIVATIVE_HINT 00008B8Bh
#define GL_MAX_VERTEX_ATTRIBS             00008869h
#define GL_VERTEX_ATTRIB_ARRAY_ENABLED    00008622h
#define GL_VERTEX_ATTRIB_ARRAY_SIZE       00008623h
#define GL_VERTEX_ATTRIB_ARRAY_STRIDE     00008624h
#define GL_VERTEX_ATTRIB_ARRAY_TYPE       00008625h
#define GL_VERTEX_ATTRIB_ARRAY_NORMALIZED 0000886Ah
#define GL_CURRENT_VERTEX_ATTRIB          00008626h
#define GL_VERTEX_ATTRIB_ARRAY_POINTER    00008645h
#define GL_VERTEX_PROGRAM_POINT_SIZE      00008642h
#define GL_VERTEX_PROGRAM_TWO_SIDE        00008643h
#define GL_MAX_TEXTURE_COORDS             00008871h
#define GL_MAX_TEXTURE_IMAGE_UNITS        00008872h
#define GL_MAX_DRAW_BUFFERS               00008824h
#define GL_DRAW_BUFFER0                   00008825h
#define GL_DRAW_BUFFER1                   00008826h
#define GL_DRAW_BUFFER2                   00008827h
#define GL_DRAW_BUFFER3                   00008828h
#define GL_DRAW_BUFFER4                   00008829h
#define GL_DRAW_BUFFER5                   0000882Ah
#define GL_DRAW_BUFFER6                   0000882Bh
#define GL_DRAW_BUFFER7                   0000882Ch
#define GL_DRAW_BUFFER8                   0000882Dh
#define GL_DRAW_BUFFER9                   0000882Eh
#define GL_DRAW_BUFFER10                  0000882Fh
#define GL_DRAW_BUFFER11                  00008830h
#define GL_DRAW_BUFFER12                  00008831h
#define GL_DRAW_BUFFER13                  00008832h
#define GL_DRAW_BUFFER14                  00008833h
#define GL_DRAW_BUFFER15                  00008834h
#define GL_POINT_SPRITE                   00008861h
#define GL_COORD_REPLACE                  00008862h
#define GL_POINT_SPRITE_COORD_ORIGIN      00008CA0h
#define GL_LOWER_LEFT                     00008CA1h
#define GL_UPPER_LEFT                     00008CA2h
#define GL_STENCIL_BACK_FUNC              00008800h
#define GL_STENCIL_BACK_VALUE_MASK        00008CA4h
#define GL_STENCIL_BACK_REF               00008CA3h
#define GL_STENCIL_BACK_FAIL              00008801h
#define GL_STENCIL_BACK_PASS_DEPTH_FAIL   00008802h
#define GL_STENCIL_BACK_PASS_DEPTH_PASS   00008803h
#define GL_STENCIL_BACK_WRITEMASK         00008CA5h

;OpenGL 2.1 
#define GL_CURRENT_RASTER_SECONDARY_COLOR 0000845Fh
#define GL_PIXEL_PACK_BUFFER              000088EBh
#define GL_PIXEL_UNPACK_BUFFER            000088ECh
#define GL_PIXEL_PACK_BUFFER_BINDING      000088EDh
#define GL_PIXEL_UNPACK_BUFFER_BINDING    000088EFh
#define GL_FLOAT_MAT2x3                   00008B65h
#define GL_FLOAT_MAT2x4                   00008B66h
#define GL_FLOAT_MAT3x2                   00008B67h
#define GL_FLOAT_MAT3x4                   00008B68h
#define GL_FLOAT_MAT4x2                   00008B69h
#define GL_FLOAT_MAT4x3                   00008B6Ah
#define GL_SRGB                           00008C40h
#define GL_SRGB8                          00008C41h
#define GL_SRGB_ALPHA                     00008C42h
#define GL_SRGB8_ALPHA8                   00008C43h
#define GL_SLUMINANCE_ALPHA               00008C44h
#define GL_SLUMINANCE8_ALPHA8             00008C45h
#define GL_SLUMINANCE                     00008C46h
#define GL_SLUMINANCE8                    00008C47h
#define GL_COMPRESSED_SRGB                00008C48h
#define GL_COMPRESSED_SRGB_ALPHA          00008C49h
#define GL_COMPRESSED_SLUMINANCE          00008C4Ah
#define GL_COMPRESSED_SLUMINANCE_ALPHA    00008C4Bh

;*************************************************************
;#ifdef GL_GLEXT_FUNCTION_POINTERS
; to be done
;#else /* GL_GLEXT_FUNCTION_POINTERS */

#import [
    gllib cdecl [
        glAccum: "glAccum" [
            op          [GLenum]
            value       [float!]
        ]
        
        glAlphaFunc: "glAlphaFunc" [
            func        [GLenum]
            ref         [GLclampf]
        ]
        glAreTexturesResident: "glAreTexturesResident" [
            n           [GLsizei]
            *textures   [int-ptr!]    ; const
            *residences [byte-ptr!]
            return:     [GLboolean]
        ]
        
        glArrayElement: "glArrayElement" [
            i           [GLint]
        ]
        
        glBegin: "glBegin" [
            mode        [GLenum]            
        ]
        
        glBindTexture: "glBindTexture" [
            target      [GLenum]
            texture     [GLuint]
        ]
        
        glBitmap: "glBitmap" [
            width       [GLsizei]
            height      [GLsizei]
            xorig       [GLfloat]
            yorig       [GLfloat]
            xmove       [GLfloat]
            ymove       [GLfloat]
            *bitmap     [byte-ptr!]       ;const 
        ]
        
        glBlendColor: "glBlendColor" [
            red         [GLclampf]
            green       [GLclampf]
            blue        [GLclampf]
            alpha       [GLclampf]
        ]
        
        glBlendEquation: "glBlendEquation" [
            mode        [GLenum]   
        ]
        
        glBlendEquationSeparate: "glBlendEquationSeparate" [
            modeRGB     [GLenum] 
            modeAlpha   [GLenum] 
        ]
        
        glBlendFunc: "glBlendFunc" [
            sfactor     [GLenum]
            dfactor     [GLenum]
        ]
        
        glCallList: "glCallList" [
            list        [GLuint]
        ]
        
        glCallLists: "glCallLists" [
            n           [GLsizei]
            type        [GLenum]
            *lists      [byte-ptr!] 
        ]
        
        glClear: "glClear" [
            mask        [GLbitfield]
        ]
        
        glClearAccum: "glClearAccum" [
            red         [GLfloat]
            green       [GLfloat]
            blue        [GLfloat]
            alpha       [GLfloat]
        ]
        
        glClearColor: "glClearColor" [
            red         [GLclampf]
            green       [GLclampf]
            blue        [GLclampf]
            alpha       [GLclampf]
        ]
        
        glClearDepth: "glClearDepth" [
            depth       [GLclampd]
        ]
        
        glClearIndex: "glClearIndex" [
            c           [GLfloat]
        ]
        
        glClearStencil: "glClearStencil" [
            s           [GLint]
        ]
        
        glClipPlane: "glClipPlane" [
            plane       [GLenum] 
            *equation   [pointer![float!]]
        ]
        
        glColor3b: "glColor3b" [
            red         [GLbyte] 
            green       [GLbyte] 
            blue        [GLbyte] 
        ]
        
        glColor3bv: "glColor3bv" [
            *v          [byte-ptr!]
        ]
        
        glColor3d: "glColor3d" [
            red         [GLdouble] 
            green       [GLdouble]
            blue        [GLdouble]
        ]
        
        glColor3dv: "glColor3dv" [
            *v          [pointer![float!]] 
        ]
        
        glColor3f: "glColor3f" [
            red         [GLfloat] 
            green       [GLfloat]
            blue        [GLfloat]
        ]
        
        glColor3fv: "glColor3fv" [
            *v          [float32-ptr!]
        ]
        
        glColor3i: "glColor3i" [
            red         [GLint] 
            green       [GLint]
            blue        [GLint]
        ]
        
        glColor3iv: "glColor3iv" [
            *v          [int-ptr!]
        ]
        
        glColor3s: "glColor3s" [
            red         [GLshort] 
            green       [GLshort]
            blue        [GLshort]
        ]
        
        glColor3sv: "glColor3sv" [
            *v          [int-ptr!]
        ]
        
        glColor3ub: "glColor3ub" [
            red         [GLubyte] 
            green       [GLubyte]
            blue        [GLubyte]
        ]
        
        glColor3ubv: "glColor3ubv" [
            *v	        [byte-ptr!]
        ]
        
        glColor3ui: "glColor3ui" [
            red	        [GLuint]
            green	[GLuint]
            blue	[GLuint]
        ]
        
        glColor3uiv: "glColor3uiv" [
            *v	        [int-ptr!]
        ]
        
        glColor3us: "glColor3us" [
            red	        [GLushort]
            green	[GLushort]
            blue	[GLushort]
        ]

    glColor3usv: "glColor3usv" [
            *v	    [int-ptr!]
    ]
    
    glColor4b: "glColor4b" [
	red	    [GLbyte]
	green	    [GLbyte]
	blue	    [GLbyte]
	alpha	    [GLbyte]
    ]

    glColor4bv: "glColor4bv" [
            *v	    [int-ptr!]
    ]

    glColor4d: "glColor4d" [
	red	    [GLdouble]
	green	    [GLdouble]
	blue	    [GLdouble]
	alpha	    [GLdouble]
    ]

    glColor4dv: "glColor4dv" [
	*v	    [pointer![float!]]
    ]

    glColor4f: "glColor4f" [
	red	    [GLfloat]
	green	    [GLfloat]
	blue	    [GLfloat]
	alpha	    [GLfloat]
    ]
    ;
    glColor4fv: "glColor4fv" [
	*v	 [float32-ptr!]
    ]

    glColor4i: "glColor4i" [
	red	[GLint]
	green	[GLint]
	blue	[GLint]
	alpha	[GLint]
    ]

    glColor4iv: "glColor4iv" [
	*v	[int-ptr!]
    ]

    glColor4s: "glColor4s" [
	red	[GLshort]
	green	[GLshort]
	blue	[GLshort]
	alpha	[GLshort]
    ]

    glColor4sv: "glColor4sv" [
	*v	[int-ptr!]
    ]

    glColor4ub: "glColor4ub" [
	red	[GLubyte]
	green	[GLubyte]
	blue	[GLubyte]
	alpha	[GLubyte]
    ]

    glColor4ubv: "glColor4ubv" [
	*v	[byte-ptr!]
    ]

    glColor4ui: "glColor4ui" [
	red	[GLuint]
	green	[GLuint]
	blue	[GLuint]
	alpha	[GLuint]
    ]

    glColor4uiv: "glColor4uiv" [
	*v	[int-ptr!]
    ]

    glColor4us: "glColor4us" [
	red	[GLushort]
	green	[GLushort]
	blue	[GLushort]
	alpha	[GLushort]
    ]

    glColor4usv: "glColor4usv" [
	*v	[int-ptr!]
    ]
    
    glColorMask: "glColorMask" [
	red	[GLboolean]
	green	[GLboolean]
	blue	[GLboolean]
	alpha	[GLboolean]
    ]

    glColorMaterial: "glColorMaterial" [
	face	[GLenum]
	mode	[GLenum]
    ]

    glColorPointer: "glColorPointer" [
	size	        [GLint]
	type	        [GLenum]
	stride	        [GLsizei]
	*pointer	[GLvoid]
    ]
    
    glColorSubTable: "glColorSubTable" [
	target	[GLenum]
	start	[GLsizei]
	count	[GLsizei]
	format	[GLenum]
	type	[GLenum]
	*data	[GLvoid]
    ]

    glColorTable: "glColorTable" [
	target	[GLenum]
	internalformat	[GLenum]
	width	[GLsizei]
	format	[GLenum]
	type	[GLenum]
	*table	[GLvoid]
    ]

    glColorTableParameterfv: "glColorTableParameterfv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glColorTableParameteriv: "glColorTableParameteriv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
    ]
    
    glConvolutionFilter1D: "glConvolutionFilter1D" [
	target	        [GLenum]
	internalformat	[GLenum]
	width	        [GLsizei]
	format	        [GLenum]
	type	        [GLenum]
	*image	        [GLvoid]
    ]

    glConvolutionFilter2D: "glConvolutionFilter2D" [
	target	        [GLenum]
	internalformat	[GLenum]
	width	        [GLsizei]
	height	        [GLsizei]
	format	        [GLenum]
	type	        [GLenum]
	*image	        [GLvoid]
    ]

    glConvolutionParameterf: "glConvolutionParameterf" [
	target	[GLenum]
	pname	[GLenum]
	params	[GLfloat]
    ]

    glConvolutionParameterfv: "glConvolutionParameterfv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glConvolutionParameteri: "glConvolutionParameteri" [
	target	[GLenum]
	pname	[GLenum]
	params	[GLint]
    ]

    glConvolutionParameteriv: "glConvolutionParameteriv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
    ]
    
    glCopyColorSubTable: "glCopyColorSubTable" [
	target	[GLenum]
	start	[GLsizei]
	x	[GLint]
	y	[GLint]
	width	[GLsizei]
    ]

    glCopyColorTable: "glCopyColorTable" [
	target	[GLenum]
	internalformat	[GLenum]
	x	[GLint]
	y	[GLint]
	width	[GLsizei]
    ]
    
    glCopyConvolutionFilter1D: "glCopyConvolutionFilter1D" [
	target	[GLenum]
	internalformat	[GLenum]
	x	[GLint]
	y	[GLint]
	width	[GLsizei]
    ]

    glCopyConvolutionFilter2D: "glCopyConvolutionFilter2D" [
	target	[GLenum]
	internalformat	[GLenum]
	x	[GLint]
	y	[GLint]
	width	[GLsizei]
	height	[GLsizei]
    ]
    
    glCopyPixels: "glCopyPixels" [
	x	[GLint]
	y	[GLint]
	width	[GLsizei]
	height	[GLsizei]
	type	[GLenum]
    ]

    glCopyTexImage1D: "glCopyTexImage1D" [
	target	[GLenum]
	level	[GLint]
	internalformat	[GLenum]
	x	[GLint]
	y	[GLint]
	width	[GLsizei]
	border	[GLint]
    ]

    glCopyTexImage2D: "glCopyTexImage2D" [
	target	[GLenum]
	level	[GLint]
	internalformat	[GLenum]
	x	[GLint]
	y	[GLint]
	width	[GLsizei]
	height	[GLsizei]
	border	[GLint]
    ]

    glCopyTexSubImage1D: "glCopyTexSubImage1D" [
	target	[GLenum]
	level	[GLint]
	xoffset	[GLint]
	x	[GLint]
	y	[GLint]
	width	[GLsizei]
    ]

    glCopyTexSubImage2D: "glCopyTexSubImage2D" [
	target	[GLenum]
	level	[GLint]
	xoffset	[GLint]
	yoffset	[GLint]
	x	[GLint]
	y	[GLint]
	width	[GLsizei]
	height	[GLsizei]
    ]

    glCopyTexSubImage3D: "glCopyTexSubImage3D" [
	target	[GLenum]
	level	[GLint]
	xoffset	[GLint]
	yoffset	[GLint]
	zoffset	[GLint]
	x	[GLint]
	y	[GLint]
	width	[GLsizei]
	height	[GLsizei]
    ]
    
    glCullFace: "glCullFace" [
	mode	[GLenum]
    ]

    glDeleteLists: "glDeleteLists" [
	list	[GLuint]
	range	[GLsizei]
    ]

    glDeleteTextures: "glDeleteTextures" [
	n	        [GLsizei]
	*textures	[int-ptr!]
    ]

    glDepthFunc: "glDepthFunc" [
	func	[GLenum]
    ]

    glDepthMask: "glDepthMask" [
	flag	[GLboolean]
    ]

    glDepthRange: "glDepthRange" [
	zNear	[GLclampd]
	zFar	[GLclampd]
    ]

    glDisable: "glDisable" [
	cap	[GLenum]
    ]

    glDisableClientState: "glDisableClientState" [
	array	[GLenum]
    ]
    
    glDrawArrays: "glDrawArrays" [
	mode	[GLenum]
	first	[GLint]
	count	[GLsizei]
    ]

    glDrawBuffer: "glDrawBuffer" [
	mode	[GLenum]
    ]

    glDrawElements: "glDrawElements" [
	mode	[GLenum]
	count	[GLsizei]
	type	[GLenum]
	*indices	[GLvoid]
    ]

    glDrawPixels: "glDrawPixels" [
	width	[GLsizei]
	height	[GLsizei]
	format	[GLenum]
	type	[GLenum]
	*pixels	[GLvoid]
    ]

    glDrawRangeElements: "glDrawRangeElements" [
	mode	[GLenum]
	start	[GLuint]
	end	[GLuint]
	count	[GLsizei]
	type	[GLenum]
	*indices	[GLvoid]
    ]
    
    glEdgeFlag: "glEdgeFlag" [
	flag	[GLboolean]
    ]

    glEdgeFlagPointer: "glEdgeFlagPointer" [
	stride	[GLsizei]
	*pointer	[GLvoid]
    ]

    glEdgeFlagv: "glEdgeFlagv" [
	*flag	[int-ptr!]
    ]
    
    glEnable: "glEnable" [
	cap	[GLenum]
    ]
    
    glEnableClientState: "glEnableClientState" [
	array	[GLenum]
    ]

    glEnd: "glEnd" [
    ]

    glEndList: "glEndList" [
    ]

    glEvalCoord1d: "glEvalCoord1d" [
	u	[GLdouble]
    ]

    glEvalCoord1dv: "glEvalCoord1dv" [
	*u	[pointer![float!]]
    ]

    glEvalCoord1f: "glEvalCoord1f" [
	u	[GLfloat]
    ]

    glEvalCoord1fv: "glEvalCoord1fv" [
	*u	[float32-ptr!]
    ]

    glEvalCoord2d: "glEvalCoord2d" [
	u	[GLdouble]
	v	[GLdouble]
    ]

    glEvalCoord2dv: "glEvalCoord2dv" [
	*u	[float-ptr!]
    ]

    glEvalCoord2f: "glEvalCoord2f" [
	u	[GLfloat]
	v	[GLfloat]
    ]
    
    glEvalCoord2fv: "glEvalCoord2fv" [
	*u	[float32-ptr!]
    ]

    glEvalMesh1: "glEvalMesh1" [
	mode	[GLenum]
	i1	[GLint]
	i2	[GLint]
    ]

    glEvalMesh2: "glEvalMesh2" [
	mode	[GLenum]
	i1	[GLint]
	i2	[GLint]
	j1	[GLint]
	j2	[GLint]
    ]

    glEvalPoint1: "glEvalPoint1" [
	i	[GLint]
    ]

    glEvalPoint2: "glEvalPoint2" [
	i	[GLint]
	j	[GLint]
    ]
    
    glFeedbackBuffer: "glFeedbackBuffer" [
	size	[GLsizei]
	type	[GLenum]
	*buffer	[float32-ptr!]
    ]

    glFinish: "glFinish" [
    ]

    glFlush: "glFlush" [
    ]

    glFogf: "glFogf" [
	pname	[GLenum]
	param	[GLfloat]
    ]

    glFogfv: "glFogfv" [
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glFogi: "glFogi" [
	pname	[GLenum]
	param	[GLint]
    ]

    glFogiv: "glFogiv" [
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glFrontFace: "glFrontFace" [
	mode	[GLenum]
    ]

    glFrustum: "glFrustum" [
	left	[GLdouble]
	right	[GLdouble]
	bottom	[GLdouble]
	top	[GLdouble]
	zNear	[GLdouble]
	zFar	[GLdouble]
    ]

    glGenLists: "glGenLists" [
	range	[GLsizei]
	return:	[GLuint]
    ]

        glGenTextures: "glGenTextures" [
            n	        [GLsizei]
            *textures	[int-ptr!]
        ]

    glGetBooleanv: "glGetBooleanv" [
	pname	        [GLenum]
	*params	        [byte-ptr!]
    ]

    glGetClipPlane: "glGetClipPlane" [
	plane	        [GLenum]
	*equation	[float32-ptr!]
    ]
    
    lGetColorTable: "glGetColorTable" [
	target	        [GLenum]
	format	        [GLenum]
	type	        [GLenum]
	*table	        [GLvoid]
    ]

    glGetColorTableParameterfv: "glGetColorTableParameterfv" [
	target	        [GLenum]
	pname	        [GLenum]
	*params	        [float32-ptr!]
    ]

    glGetColorTableParameteriv: "glGetColorTableParameteriv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glGetConvolutionFilter: "glGetConvolutionFilter" [
	target	[GLenum]
	format	[GLenum]
	type	[GLenum]
	*image	[GLvoid]
    ]

    glGetConvolutionParameterfv: "glGetConvolutionParameterfv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glGetConvolutionParameteriv: "glGetConvolutionParameteriv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glGetDoublev: "glGetDoublev" [
	pname	    [GLenum]
	*params	    [float32-ptr!]
    ]
    
    glGetError: "glGetError" [	
	return:	[GLenum]
    ]
    
    glGetFloatv: "glGetFloatv" [
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glGetHistogram: "glGetHistogram" [
	target	[GLenum]
	reset	[GLboolean]
	format	[GLenum]
	type	[GLenum]
	*values	[GLvoid]
    ]

    glGetHistogramParameterfv: "glGetHistogramParameterfv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glGetHistogramParameteriv: "glGetHistogramParameteriv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glGetIntegerv: "glGetIntegerv" [
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glGetLightfv: "glGetLightfv" [
	light	[GLenum]
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glGetLightiv: "glGetLightiv" [
	light	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glGetMapdv: "glGetMapdv" [
	target	[GLenum]
	query	[GLenum]
	*v	[float-ptr!]
    ]

    glGetMapfv: "glGetMapfv" [
	target	[GLenum]
	query	[GLenum]
	*v	[float32-ptr!]
    ]

    glGetMapiv: "glGetMapiv" [
	target	[GLenum]
	query	[GLenum]
	*v	[int-ptr!]
    ]
    
    glGetMaterialfv: "glGetMaterialfv" [
	face	[GLenum]
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glGetMaterialiv: "glGetMaterialiv" [
	face	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glGetMinmax: "glGetMinmax" [
	target	[GLenum]
	reset	[GLboolean]
	format	[GLenum]
	type	[GLenum]
	*values	[GLvoid]
    ]

    glGetMinmaxParameterfv: "glGetMinmaxParameterfv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glGetMinmaxParameteriv: "glGetMinmaxParameteriv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glGetPixelMapfv: "glGetPixelMapfv" [
	map	[GLenum]
	*values	[float32-ptr!]
    ]

    glGetPixelMapuiv: "glGetPixelMapuiv" [
	map	[GLenum]
	*values	[int-ptr!]
    ]

    glGetPixelMapusv: "glGetPixelMapusv" [
	map	[GLenum]
	*values	[int-ptr!]
    ]

    glGetPointerv: "glGetPointerv" [
	pname	        [GLenum]
	**params	[GLvoid]
    ]

    glGetPolygonStipple: "glGetPolygonStipple" [
	*mask	        [byte-ptr!]
    ]

    glGetSeparableFilter: "glGetSeparableFilter" [
	target	[GLenum]
	format	[GLenum]
	type	[GLenum]
	*row	[GLvoid]
	*column	[GLvoid]
	*span	[GLvoid]
    ]

    glGetString: "glGetString" [
	name	[GLenum]
	return:	[byte-ptr!] ; GLubytepointeur 
    ]
    
    glGetTexEnvfv: "glGetTexEnvfv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glGetTexEnviv: "glGetTexEnviv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glGetTexGendv: "glGetTexGendv" [
	coord	[GLenum]
	pname	[GLenum]
	*params	[float-ptr!]
    ]

    glGetTexGenfv: "glGetTexGenfv" [
	coord	[GLenum]
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glGetTexGeniv: "glGetTexGeniv" [
	coord	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glGetTexImage: "glGetTexImage" [
	target	[GLenum]
	level	[GLint]
	format	[GLenum]
	type	[GLenum]
	*pixels	[GLvoid]
    ]

    glGetTexLevelParameterfv: "glGetTexLevelParameterfv" [
	target	[GLenum]
	level	[GLint]
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glGetTexLevelParameteriv: "glGetTexLevelParameteriv" [
	target	[GLenum]
	level	[GLint]
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glGetTexParameterfv: "glGetTexParameterfv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glGetTexParameteriv: "glGetTexParameteriv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glHint: "glHint" [
	target	[GLenum]
	mode	[GLenum]
    ]

    glHistogram: "glHistogram" [
	target	[GLenum]
	width	[GLsizei]
	internalformat	[GLenum]
	sink	[GLboolean]
    ]
    
    glIndexMask: "glIndexMask" [
	mask	[GLuint]
    ]

    glIndexPointer: "glIndexPointer" [
	type	        [GLenum]
	stride	        [GLsizei]
	*pointer	[GLvoid]
    ]

    glIndexd: "glIndexd" [
	c	[GLdouble]
    ]

    glIndexdv: "glIndexdv" [
	*c	[float-ptr!]
    ]

    glIndexf: "glIndexf" [
	c	[GLfloat]
    ]

    glIndexfv: "glIndexfv" [
	*c	[float32-ptr!]
    ]

    glIndexi: "glIndexi" [
	c	[GLint]
    ]

    glIndexiv: "glIndexiv" [
	*c	[int-ptr!]
    ]

    glIndexs: "glIndexs" [
	c	[GLshort]
    ]

    glIndexsv: "glIndexsv" [
	*c	[GLshort]
    ]

    glIndexub: "glIndexub" [
	c	[GLubyte]
    ]

    glIndexubv: "glIndexubv" [
	*c	[int-ptr!]
    ]

    glInitNames: "glInitNames" [
	
    ]

    glInterleavedArrays: "glInterleavedArrays" [
	format	        [GLenum]
	stride	        [GLsizei]
	*pointer	[GLvoid]
    ]

    glIsEnabled: "glIsEnabled" [
	cap	[GLenum]
	return:	[GLboolean]
    ]

    glIsList: "glIsList" [
	list	[GLuint]
	return:	[GLboolean]
    ]

    glIsTexture: "glIsTexture" [
	texture	[GLuint]
	return:	[GLboolean]
    ]
    
    glLightModelf: "glLightModelf" [
	pname	[GLenum]
	param	[GLfloat]
    ]

    glLightModelfv: "glLightModelfv" [
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glLightModeli: "glLightModeli" [
	pname	[GLenum]
	param	[GLint]
    ]

    glLightModeliv: "glLightModeliv" [
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glLightf: "glLightf" [
	light	[GLenum]
	pname	[GLenum]
	param	[GLfloat]
    ]

    glLightfv: "glLightfv" [
	light	[GLenum]
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glLighti: "glLighti" [
	light	[GLenum]
	pname	[GLenum]
	param	[GLint]
    ]

    glLightiv: "glLightiv" [
	light	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glLineStipple: "glLineStipple" [
	factor	[GLint]
	pattern	[GLushort]
    ]

    glLineWidth: "glLineWidth" [
	width	[GLfloat]
    ]

    glListBase: "glListBase" [
	base	[GLuint]
    ]

    glLoadIdentity: "glLoadIdentity" [
    ]

    glLoadMatrixd: "glLoadMatrixd" [
	*m	[float-ptr!]
    ]

    glLoadMatrixf: "glLoadMatrixf" [
	*m	[float32-ptr!]
    ]

    glLoadName: "glLoadName" [
	name	[GLuint]
    ]

    glLogicOp: "glLogicOp" [
	opcode	[GLenum]
    ]
    
    glMap1d: "glMap1d" [
	target	[GLenum]
	u1	[GLdouble]
	u2	[GLdouble]
	stride	[GLint]
	order	[GLint]
	*points	[float-ptr!]
    ]

    glMap1f: "glMap1f" [
	target	[GLenum]
	u1	[GLfloat]
	u2	[GLfloat]
	stride	[GLint]
	order	[GLint]
	*points	[float32-ptr!]
    ]

    glMap2d: "glMap2d" [
	target	[GLenum]
	u1	[GLdouble]
	u2	[GLdouble]
	ustride	[GLint]
	uorder	[GLint]
	v1	[GLdouble]
	v2	[GLdouble]
	vstride	[GLint]
	vorder	[GLint]
	*points	[float-ptr!]
    ]

    glMap2f: "glMap2f" [
	target	[GLenum]
	u1	[GLfloat]
	u2	[GLfloat]
	ustride	[GLint]
	uorder	[GLint]
	v1	[GLfloat]
	v2	[GLfloat]
	vstride	[GLint]
	vorder	[GLint]
	*points	[float32-ptr!]
    ]

    glMapGrid1d: "glMapGrid1d" [
	un	[GLint]
	u1	[GLdouble]
	u2	[GLdouble]
    ]

    glMapGrid1f: "glMapGrid1f" [
	un	[GLint]
	u1	[GLfloat]
	u2	[GLfloat]
    ]

    glMapGrid2d: "glMapGrid2d" [
	un	[GLint]
	u1	[GLdouble]
	u2	[GLdouble]
	vn	[GLint]
	v1	[GLdouble]
	v2	[GLdouble]
    ]

    glMapGrid2f: "glMapGrid2f" [
	un	[GLint]
	u1	[GLfloat]
	u2	[GLfloat]
	vn	[GLint]
	v1	[GLfloat]
	v2	[GLfloat]
    ]

    glMaterialf: "glMaterialf" [
	face	[GLenum]
	pname	[GLenum]
	param	[GLfloat]
    ]

    glMaterialfv: "glMaterialfv" [
	face	[GLenum]
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glMateriali: "glMateriali" [
	face	[GLenum]
	pname	[GLenum]
	param	[GLint]
    ]

    glMaterialiv: "glMaterialiv" [
    	face	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glMatrixMode: "glMatrixMode" [
	mode	[GLenum]
    ]

    glMinmax: "glMinmax" [
	target	[GLenum]
	internalformat	[GLenum]
	sink	[GLboolean]
    ]

    glMultMatrixd: "glMultMatrixd" [
	*m	[float-ptr!]
    ]

    glMultMatrixf: "glMultMatrixf" [
	*m	[float32-ptr!]
    ]
    
    glNewList: "glNewList" [
	list	[GLuint]
	mode	[GLenum]
    ]

    glNormal3b: "glNormal3b" [
	nx	[GLbyte]
	ny	[GLbyte]
	nz	[GLbyte]
    ]

    glNormal3bv: "glNormal3bv" [
	*v	[byte-ptr!]
    ]

    glNormal3d: "glNormal3d" [
	nx	[GLdouble]
	ny	[GLdouble]
	nz	[GLdouble]
    ]

    glNormal3dv: "glNormal3dv" [
	*v	[float-ptr!]
    ]

    glNormal3f: "glNormal3f" [
	nx	[GLfloat]
	ny	[GLfloat]
	nz	[GLfloat]
    ]

    glNormal3fv: "glNormal3fv" [
	*v	[float32-ptr!]
    ]

    glNormal3i: "glNormal3i" [
	nx	[GLint]
	ny	[GLint]
	nz	[GLint]
    ]

    glNormal3iv: "glNormal3iv" [
	*v	[int-ptr!]
    ]

    glNormal3s: "glNormal3s" [
	nx	[GLshort]
	ny	[GLshort]
	nz	[GLshort]
    ]

    glNormal3sv: "glNormal3sv" [
	*v	[int-ptr!]
    ]

    glNormalPointer: "glNormalPointer" [
	type	        [GLenum]
	stride	        [GLsizei]
	*pointer	[GLvoid]
    ]
    
    glOrtho: "glOrtho" [
	left	[GLdouble]
	right	[GLdouble]
	bottom	[GLdouble]
	top	[GLdouble]
	zNear	[GLdouble]
	zFar	[GLdouble]
    ]

    glPassThrough: "glPassThrough" [
	token	[GLfloat]
    ]

    glPixelMapfv: "glPixelMapfv" [
	map	[GLenum]
	mapsize	[GLint]
	*values	[float32-ptr!]
    ]

    glPixelMapuiv: "glPixelMapuiv" [
	map	[GLenum]
	mapsize	[GLint]
	*values	[int-ptr!]
    ]

    glPixelMapusv: "glPixelMapusv" [
	map	[GLenum]
	mapsize	[GLint]
	*values	[int-ptr!]
    ]

    glPixelStoref: "glPixelStoref" [
	pname	[GLenum]
	param	[GLfloat]
    ]

    glPixelStorei: "glPixelStorei" [
	pname	[GLenum]
	param	[GLint]
    ]

    glPixelTransferf: "glPixelTransferf" [
	pname	[GLenum]
	param	[GLfloat]
    ]

    glPixelTransferi: "glPixelTransferi" [
	pname	[GLenum]
	param	[GLint]
    ]

    glPixelZoom: "glPixelZoom" [
	xfactor	[GLfloat]
	yfactor	[GLfloat]
    ]

    glPointSize: "glPointSize" [
	size	[GLfloat]
    ]

    glPolygonMode: "glPolygonMode" [
	face	[GLenum]
	mode	[GLenum]
    ]

    glPolygonOffset: "glPolygonOffset" [
	factor	[GLfloat]
	units	[GLfloat]
    ]

    glPolygonStipple: "glPolygonStipple" [
	*mask	[byte-ptr!]
    ]

    glPopAttrib: "glPopAttrib" [
    ]

    glPopClientAttrib: "glPopClientAttrib" [	
    ]

    glPopMatrix: "glPopMatrix" [
    ]

    glPopName: "glPopName" [
    ]

    glPrioritizeTextures: "glPrioritizeTextures" [
	n	[GLsizei]
	*textures	[int-ptr!]
	*priorities	[float-ptr!]
    ]

    glPushAttrib: "glPushAttrib" [
	mask	[GLbitfield]
    ]

    glPushClientAttrib: "glPushClientAttrib" [
	mask	[GLbitfield]
    ]

    glPushMatrix: "glPushMatrix" [
	
    ]

    glPushName: "glPushName" [
	name	[GLuint]
    ]

    glRasterPos2d: "glRasterPos2d" [
	x	[GLdouble]
	y	[GLdouble]
    ]
    
    glRasterPos2dv: "glRasterPos2dv" [
	*v	[float-ptr!]
    ]

    glRasterPos2f: "glRasterPos2f" [
	x	[GLfloat]
	y	[GLfloat]
    ]

    glRasterPos2fv: "glRasterPos2fv" [
	*v	[float32-ptr!]
    ]

    glRasterPos2i: "glRasterPos2i" [
	x	[GLint]
	y	[GLint]
    ]

    glRasterPos2iv: "glRasterPos2iv" [
	*v	[int-ptr!]
    ]

    glRasterPos2s: "glRasterPos2s" [
	x	[GLshort]
	y	[GLshort]
    ]

    glRasterPos2sv: "glRasterPos2sv" [
	*v	[int-ptr!]
    ]

    glRasterPos3d: "glRasterPos3d" [
	x	[GLdouble]
	y	[GLdouble]
	z	[GLdouble]
    ]

    glRasterPos3dv: "glRasterPos3dv" [
	*v	[float-ptr!]
    ]

    glRasterPos3f: "glRasterPos3f" [
	x	[GLfloat]
	y	[GLfloat]
	z	[GLfloat]
    ]

    glRasterPos3fv: "glRasterPos3fv" [
	*v	[float32-ptr!]
    ]

    glRasterPos3i: "glRasterPos3i" [
	x	[GLint]
	y	[GLint]
	z	[GLint]
    ]
    
    glRasterPos3iv: "glRasterPos3iv" [
	*v	[int-ptr!]
    ]

    glRasterPos3s: "glRasterPos3s" [
	x	[GLshort]
	y	[GLshort]
	z	[GLshort]
    ]

    glRasterPos3sv: "glRasterPos3sv" [
	*v	[int-ptr!]
    ]

    glRasterPos4d: "glRasterPos4d" [
	x	[GLdouble]
	y	[GLdouble]
	z	[GLdouble]
	w	[GLdouble]
    ]

    glRasterPos4dv: "glRasterPos4dv" [
	*v	[float-ptr!]
    ]

    glRasterPos4f: "glRasterPos4f" [
	x	[GLfloat]
	y	[GLfloat]
	z	[GLfloat]
	w	[GLfloat]
    ]

    glRasterPos4fv: "glRasterPos4fv" [
	*v	[float32-ptr!]
    ]

    glRasterPos4i: "glRasterPos4i" [
	x	[GLint]
	y	[GLint]
	z	[GLint]
	w	[GLint]
    ]

    glRasterPos4iv: "glRasterPos4iv" [
	*v	[int-ptr!]
    ]

    glRasterPos4s: "glRasterPos4s" [
	x	[GLshort]
	y	[GLshort]
	z	[GLshort]
	w	[GLshort]
    ]

    glRasterPos4sv: "glRasterPos4sv" [
	*v	[int-ptr!]
    ]

    glReadBuffer: "glReadBuffer" [
	mode	[GLenum]
    ]

    glReadPixels: "glReadPixels" [
	x	[GLint]
	y	[GLint]
	width	[GLsizei]
	height	[GLsizei]
	format	[GLenum]
	type	[GLenum]
	*pixels	[GLvoid]
    ]

    glRectd: "glRectd" [
	x1	[GLdouble]
	y1	[GLdouble]
	x2	[GLdouble]
	y2	[GLdouble]
    ]

    glRectdv: "glRectdv" [
	*v1	[float-ptr!]
	*v2	[float-ptr!]
    ]

    glRectf: "glRectf" [
	x1	[GLfloat]
	y1	[GLfloat]
	x2	[GLfloat]
	y2	[GLfloat]
    ]

    glRectfv: "glRectfv" [
	*v1	[float32-ptr!]
	*v2	[float32-ptr!]
    ]

    glRecti: "glRecti" [
	x1	[GLint]
	y1	[GLint]
	x2	[GLint]
	y2	[GLint]
    ]

    glRectiv: "glRectiv" [
	*v1	[int-ptr!]
	*v2	[int-ptr!]
    ]

    glRects: "glRects" [
	x1	[GLshort]
	y1	[GLshort]
	x2	[GLshort]
	y2	[GLshort]
    ]

    glRectsv: "glRectsv" [
	*v1	[int-ptr!]
	*v2	[int-ptr!]
    ]

    glRenderMode: "glRenderMode" [
    	mode	[GLenum]
	return:	[GLint]
    ]

    glResetHistogram: "glResetHistogram" [
	target	[GLenum]
    ]

    glResetMinmax: "glResetMinmax" [
	target	[GLenum]
    ]

    glRotated: "glRotated" [
	angle	[GLdouble]
	x	[GLdouble]
	y	[GLdouble]
	z	[GLdouble]
    ]

    glRotatef: "glRotatef" [
	angle	[GLfloat]
	x	[GLfloat]
	y	[GLfloat]
	z	[GLfloat]
    ]
    lScaled: "glScaled" [
	x	[GLdouble]
	y	[GLdouble]
	z	[GLdouble]
    ]

    glScalef: "glScalef" [
	x	[GLfloat]
	y	[GLfloat]
	z	[GLfloat]
    ]

    glScissor: "glScissor" [
    	x	[GLint]
	y	[GLint]
	width	[GLsizei]
	height	[GLsizei]
    ]

    glSelectBuffer: "glSelectBuffer" [
    	size	[GLsizei]
	*buffer	[int-ptr!]
    ]

    glSeparableFilter2D: "glSeparableFilter2D" [
	target	[GLenum]
	internalformat	[GLenum]
	width	[GLsizei]
	height	[GLsizei]
	format	[GLenum]
	type	[GLenum]
	*row	[GLvoid]
	*column	[GLvoid]
    ]

    glShadeModel: "glShadeModel" [
	mode	[GLenum]
    ]

    glStencilFunc: "glStencilFunc" [
	func	[GLenum]
	ref	[GLint]
	mask	[GLuint]
    ]

    glStencilMask: "glStencilMask" [
	mask	[GLuint]
    ]

    glStencilOp: "glStencilOp" [
	fail	[GLenum]
	zfail	[GLenum]
	zpass	[GLenum]
    ]
    glTexCoord1d: "glTexCoord1d" [
	s	[GLdouble]
    ]

    glTexCoord1dv: "glTexCoord1dv" [
	*v	[float-ptr!]
    ]

    glTexCoord1f: "glTexCoord1f" [
	s	[GLfloat]
    ]

    glTexCoord1fv: "glTexCoord1fv" [
	*v	[float32-ptr!]
    ]

    glTexCoord1i: "glTexCoord1i" [
	s	[GLint]
    ]

    glTexCoord1iv: "glTexCoord1iv" [
	*v	[int-ptr!]
    ]

    glTexCoord1s: "glTexCoord1s" [
	s	[GLshort]
    ]

    glTexCoord1sv: "glTexCoord1sv" [
	*v	[int-ptr!]
    ]

    glTexCoord2d: "glTexCoord2d" [
	s	[GLdouble]
	t	[GLdouble]
    ]

    glTexCoord2dv: "glTexCoord2dv" [
	*v	[float-ptr!]
    ]

    glTexCoord2f: "glTexCoord2f" [
	s	[GLfloat]
	t	[GLfloat]
    ]

    glTexCoord2fv: "glTexCoord2fv" [
	*v	[float32-ptr!]
    ]

    glTexCoord2i: "glTexCoord2i" [
	s	[GLint]
	t	[GLint]
    ]

    glTexCoord2iv: "glTexCoord2iv" [
	*v	[int-ptr!]
    ]

    glTexCoord2s: "glTexCoord2s" [
	s	[GLshort]
	t	[GLshort]
    ]

    glTexCoord2sv: "glTexCoord2sv" [
	*v	[int-ptr!]
    ]

    glTexCoord3d: "glTexCoord3d" [
	s	[GLdouble]
	t	[GLdouble]
	r	[GLdouble]
    ]

    glTexCoord3dv: "glTexCoord3dv" [
	*v	[float-ptr!]
    ]

    glTexCoord3f: "glTexCoord3f" [
	s	[GLfloat]
	t	[GLfloat]
	r	[GLfloat]
    ]

    glTexCoord3fv: "glTexCoord3fv" [
	*v	[float32-ptr!]
    ]

    glTexCoord3i: "glTexCoord3i" [
	s	[GLint]
	t	[GLint]
	r	[GLint]
    ]

    glTexCoord3iv: "glTexCoord3iv" [
	*v	[int-ptr!]
    ]

    glTexCoord3s: "glTexCoord3s" [
	s	[GLshort]
	t	[GLshort]
	r	[GLshort]
    ]

    glTexCoord3sv: "glTexCoord3sv" [
	*v	[int-ptr!]
    ]

    glTexCoord4d: "glTexCoord4d" [
	s	[GLdouble]
	t	[GLdouble]
	r	[GLdouble]
	q	[GLdouble]
    ]

    glTexCoord4dv: "glTexCoord4dv" [
	*v	[float-ptr!]
    ]

    glTexCoord4f: "glTexCoord4f" [
	s	[GLfloat]
	t	[GLfloat]
	r	[GLfloat]
	q	[GLfloat]
    ]

    glTexCoord4fv: "glTexCoord4fv" [
	*v	[float32-ptr!]
    ]

    glTexCoord4i: "glTexCoord4i" [
	s	[GLint]
	t	[GLint]
	r	[GLint]
	q	[GLint]
    ]

    glTexCoord4iv: "glTexCoord4iv" [
	*v	[int-ptr!]
    ]

    glTexCoord4s: "glTexCoord4s" [
	s	[GLshort]
	t	[GLshort]
	r	[GLshort]
	q	[GLshort]
    ]

    glTexCoord4sv: "glTexCoord4sv" [
	*v	[int-ptr!]
    ]

    glTexCoordPointer: "glTexCoordPointer" [
	size	        [GLint]
	type	        [GLenum]
	stride	        [GLsizei]
	*pointer	[GLvoid]
    ]

    glTexEnvf: "glTexEnvf" [
	target	[GLenum]
	pname	[GLenum]
	param	[GLfloat]
    ]

    glTexEnvfv: "glTexEnvfv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glTexEnvi: "glTexEnvi" [
	target	[GLenum]
	pname	[GLenum]
	param	[GLint]
    ]

    glTexEnviv: "glTexEnviv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glTexGend: "glTexGend" [
	coord	[GLenum]
	pname	[GLenum]
	param	[GLdouble]
    ]

    glTexGendv: "glTexGendv" [
	coord	[GLenum]
	pname	[GLenum]
	*params	[float-ptr!]
    ]

    glTexGenf: "glTexGenf" [
	coord	[GLenum]
	pname	[GLenum]
	param	[GLfloat]
    ]

    glTexGenfv: "glTexGenfv" [
	coord	[GLenum]
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glTexGeni: "glTexGeni" [
	coord	[GLenum]
	pname	[GLenum]
	param	[GLint]
    ]

    glTexGeniv: "glTexGeniv" [
	coord	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
    ]
    
    glTexImage1D: "glTexImage1D" [
	target	[GLenum]
	level	[GLint]
	internalformat	[GLint]
	width	[GLsizei]
	border	[GLint]
	format	[GLenum]
	type	[GLenum]
	*pixels	[GLvoid]
    ]

    glTexImage2D: "glTexImage2D" [
	target	[GLenum]
	level	[GLint]
	internalformat	[GLint]
	width	[GLsizei]
	height	[GLsizei]
	border	[GLint]
	format	[GLenum]
	type	[GLenum]
	*pixels	[GLvoid]
    ]

    glTexImage3D: "glTexImage3D" [
	target	[GLenum]
	level	[GLint]
	internalformat	[GLint]
	width	[GLsizei]
	height	[GLsizei]
	depth	[GLsizei]
	border	[GLint]
	format	[GLenum]
	type	[GLenum]
	*pixels	[GLvoid]
    ]

    glTexParameterf: "glTexParameterf" [
	target	[GLenum]
	pname	[GLenum]
	param	[GLfloat]
    ]

    glTexParameterfv: "glTexParameterfv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[float32-ptr!]
    ]

    glTexParameteri: "glTexParameteri" [
	target	[GLenum]
	pname	[GLenum]
	param	[GLint]
    ]

    glTexParameteriv: "glTexParameteriv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glTexSubImage1D: "glTexSubImage1D" [
	target	[GLenum]
	level	[GLint]
	xoffset	[GLint]
	width	[GLsizei]
	format	[GLenum]
	type	[GLenum]
	*pixels	[GLvoid]
    ]

    glTexSubImage2D: "glTexSubImage2D" [
	target	[GLenum]
	level	[GLint]
	xoffset	[GLint]
	yoffset	[GLint]
	width	[GLsizei]
	height	[GLsizei]
	format	[GLenum]
	type	[GLenum]
	*pixels	[GLvoid]
    ]

    glTexSubImage3D: "glTexSubImage3D" [
	target	[GLenum]
	level	[GLint]
	xoffset	[GLint]
	yoffset	[GLint]
	zoffset	[GLint]
	width	[GLsizei]
	height	[GLsizei]
	depth	[GLsizei]
	format	[GLenum]
	type	[GLenum]
	*pixels	[GLvoid]
    ]
    glTranslated: "glTranslated" [
	x	[GLdouble]
	y	[GLdouble]
	z	[GLdouble]
    ]

    glTranslatef: "glTranslatef" [
	x	[GLfloat]
	y	[GLfloat]
	z	[GLfloat]
    ]
    glVertex2d: "glVertex2d" [
	x	[GLdouble]
	y	[GLdouble]
    ]

    glVertex2dv: "glVertex2dv" [
	*v	[float-ptr!]
    ]

    glVertex2f: "glVertex2f" [
	x	[GLfloat]
	y	[GLfloat]
    ]

    glVertex2fv: "glVertex2fv" [
	*v	[float32-ptr!]
    ]
    
    glVertex2i: "glVertex2i" [
	x	[GLint]
	y	[GLint]
    ]

    glVertex2iv: "glVertex2iv" [
	*v	[int-ptr!]
    ]

    glVertex2s: "glVertex2s" [
	x	[GLshort]
	y	[GLshort]
    ]

    glVertex2sv: "glVertex2sv" [
	*v	[int-ptr!]
    ]
    
    glVertex3d: "glVertex3d" [
	x	[GLdouble]
	y	[GLdouble]
	z	[GLdouble]
    ]

    glVertex3dv: "glVertex3dv" [
	*v	[float-ptr!]
    ]

    glVertex3f: "glVertex3f" [
    	x	[GLfloat]
	y	[GLfloat]
	z	[GLfloat]
    ]

    glVertex3fv: "glVertex3fv" [
	*v	[float32-ptr!]
    ]

    glVertex3i: "glVertex3i" [
	x	[GLint]
	y	[GLint]
	z	[GLint]
    ]

    glVertex3iv: "glVertex3iv" [
	*v	[int-ptr!]
    ]
    glVertex3s: "glVertex3s" [
	x	[GLshort]
	y	[GLshort]
	z	[GLshort]
    ]

    glVertex3sv: "glVertex3sv" [
	*v	[int-ptr!]
    ]

    glVertex4d: "glVertex4d" [
	x	[GLdouble]
	y	[GLdouble]
	z	[GLdouble]
	w	[GLdouble]
    ]

    glVertex4dv: "glVertex4dv" [
	*v	[float-ptr!]
    ]

    glVertex4f: "glVertex4f" [
	x	[GLfloat]
	y	[GLfloat]
	z	[GLfloat]
	w	[GLfloat]
    ]

    glVertex4fv: "glVertex4fv" [
	*v	[float32-ptr!]
    ]

    glVertex4i: "glVertex4i" [
	x	[GLint]
	y	[GLint]
	z	[GLint]
	w	[GLint]
    ]

    glVertex4iv: "glVertex4iv" [
	*v	[int-ptr!]
    ]

    glVertex4s: "glVertex4s" [
	x	[GLshort]
	y	[GLshort]
	z	[GLshort]
	w	[GLshort]
    ]

    glVertex4sv: "glVertex4sv" [
	*v	[int-ptr!]
    ]
    glVertexPointer: "glVertexPointer" [
	size	    [GLint]
	type	    [GLenum]
	stride	    [GLsizei]
	*pointer    [GLvoid]
    ]
    
    glViewport: "glViewport" [
	x	[GLint]
	y	[GLint]
	width	[GLsizei]
	height	[GLsizei]
    ]
    glSampleCoverage: "glSampleCoverage" [
	value	[GLclampf]
	invert	[GLboolean]
    ]

    glLoadTransposeMatrixf: "glLoadTransposeMatrixf" [
	*m	[float32-ptr!]
    ]

    glLoadTransposeMatrixd: "glLoadTransposeMatrixd" [
	*m	[float-ptr!]
    ]

    glMultTransposeMatrixf: "glMultTransposeMatrixf" [
	*m	[float32-ptr!]
    ]

    glMultTransposeMatrixd: "glMultTransposeMatrixd" [
	*m	[float-ptr!]
    ]
    
    glCompressedTexImage3D: "glCompressedTexImage3D" [
	target	        [GLenum]
	level	        [GLint]
	internalformat	[GLenum]
	width	        [GLsizei]
	height	        [GLsizei]
	depth	        [GLsizei]
	border	        [GLint]
	imageSize	[GLsizei]
	*data	        [GLvoid]
    ]

    glCompressedTexImage2D: "glCompressedTexImage2D" [
	target	        [GLenum]
	level	        [GLint]
	internalformat	[GLenum]
	width	        [GLsizei]
	height	        [GLsizei]
	border  	[GLint]
	imageSize	[GLsizei]
	*data	        [GLvoid]
    ]
    glCompressedTexImage1D: "glCompressedTexImage1D" [
	target	        [GLenum]
	level	        [GLint]
	internalformat	[GLenum]
	width	        [GLsizei]
	border	        [GLint]
	imageSize	[GLsizei]
	*data	        [GLvoid]
    ]

    glCompressedTexSubImage3D: "glCompressedTexSubImage3D" [
	target	        [GLenum]
	level	        [GLint]
	xoffset	        [GLint]
	yoffset	        [GLint]
	zoffset	        [GLint]
	width	        [GLsizei]
	height	        [GLsizei]
	depth	        [GLsizei]
	format	        [GLenum]
	imageSize	[GLsizei]
	*data	        [GLvoid]
    ]   

    glCompressedTexSubImage2D: "glCompressedTexSubImage2D" [
	target	        [GLenum]
	level	        [GLint]
	xoffset	        [GLint]
	yoffset	        [GLint]
	width	        [GLsizei]
	height	        [GLsizei]
	format	        [GLenum]
	imageSize	[GLsizei]
	*data	        [GLvoid]
    ]   

    glCompressedTexSubImage1D: "glCompressedTexSubImage1D" [
	target	        [GLenum]
	level	        [GLint]
	xoffset	        [GLint]
	width	        [GLsizei]
	format	        [GLenum]
	imageSize	[GLsizei]
	*data	        [GLvoid]
    ]

    glGetCompressedTexImage: "glGetCompressedTexImage" [
	target	        [GLenum]
	lod	        [GLint]
	*img	        [GLvoid]
    ]
    
    glActiveTexture: "glActiveTexture" [
	texture	[GLenum]
    ]

    glClientActiveTexture: "glClientActiveTexture" [
	texture	[GLenum]
    ]

    glMultiTexCoord1d: "glMultiTexCoord1d" [
	target	[GLenum]
	s	[GLdouble]
    ]

    glMultiTexCoord1dv: "glMultiTexCoord1dv" [
	target	[GLenum]
	*v	[float-ptr!]
    ]

    glMultiTexCoord1f: "glMultiTexCoord1f" [
	target	[GLenum]
	s	[GLfloat]
    ]

    glMultiTexCoord1fv: "glMultiTexCoord1fv" [
	target	[GLenum]
	*v	[float32-ptr!]
    ]

    glMultiTexCoord1i: "glMultiTexCoord1i" [
	target	[GLenum]
	s	[GLint]
    ]

    glMultiTexCoord1iv: "glMultiTexCoord1iv" [
	target	[GLenum]
	*v	[int-ptr!]
    ]

    glMultiTexCoord1s: "glMultiTexCoord1s" [
	target	[GLenum]
	s	[GLshort]
    ]

    glMultiTexCoord1sv: "glMultiTexCoord1sv" [
	target	[GLenum]
	*v	[int-ptr!]
    ]

    glMultiTexCoord2d: "glMultiTexCoord2d" [
	target	[GLenum]
	s	[GLdouble]
	t	[GLdouble]
    ]

    glMultiTexCoord2dv: "glMultiTexCoord2dv" [
	target	[GLenum]
	*v	[float-ptr!]
    ]

    glMultiTexCoord2f: "glMultiTexCoord2f" [
	target	[GLenum]
	s	[GLfloat]
	t	[GLfloat]
    ]

    glMultiTexCoord2fv: "glMultiTexCoord2fv" [
	target	[GLenum]
	*v	[float32-ptr!]
    ]

    glMultiTexCoord2i: "glMultiTexCoord2i" [
	target	[GLenum]
	s	[GLint]
	t	[GLint]
    ]

    glMultiTexCoord2iv: "glMultiTexCoord2iv" [
	target	[GLenum]
	*v	[int-ptr!]
    ]

    glMultiTexCoord2s: "glMultiTexCoord2s" [
	target	[GLenum]
	s	[GLshort]
	t	[GLshort]
    ]

    glMultiTexCoord2sv: "glMultiTexCoord2sv" [
	target	[GLenum]
	*v	[int-ptr!]
    ]

    glMultiTexCoord3d: "glMultiTexCoord3d" [
	target	[GLenum]
	s	[GLdouble]
	t	[GLdouble]
	r	[GLdouble]
    ]

    glMultiTexCoord3dv: "glMultiTexCoord3dv" [
	target	[GLenum]
	*v	[float-ptr!]
    ]

    glMultiTexCoord3f: "glMultiTexCoord3f" [
	target	[GLenum]
	s	[GLfloat]
	t	[GLfloat]
	r	[GLfloat]
    ]

    glMultiTexCoord3fv: "glMultiTexCoord3fv" [
	target	[GLenum]
	*v	[float32-ptr!]
    ]

    glMultiTexCoord3i: "glMultiTexCoord3i" [
	target	[GLenum]
	s	[GLint]
	t	[GLint]
	r	[GLint]
    ]

    glMultiTexCoord3iv: "glMultiTexCoord3iv" [
	target	[GLenum]
	*v	[int-ptr!]
    ]

    glMultiTexCoord3s: "glMultiTexCoord3s" [
	target	[GLenum]
	s	[GLshort]
	t	[GLshort]
	r	[GLshort]
    ]

    glMultiTexCoord3sv: "glMultiTexCoord3sv" [
	target	[GLenum]
	*v	[int-ptr!]
    ]

    glMultiTexCoord4d: "glMultiTexCoord4d" [
	target	[GLenum]
	s	[GLdouble]
	t	[GLdouble]
	r	[GLdouble]
	q	[GLdouble]
    ]

    glMultiTexCoord4dv: "glMultiTexCoord4dv" [
	target	[GLenum]
	*v	[float-ptr!]
    ]

    glMultiTexCoord4f: "glMultiTexCoord4f" [
	target	[GLenum]
	s	[GLfloat]
	t	[GLfloat]
	r	[GLfloat]
	q	[GLfloat]
    ]

    glMultiTexCoord4fv: "glMultiTexCoord4fv" [
	target	[GLenum]
	*v	[float32-ptr!]
    ]

    glMultiTexCoord4i: "glMultiTexCoord4i" [
	target	[GLenum]
	s	[GLint]
	t	[GLint]
	r	[GLint]
	q	[GLint]
    ]

    glMultiTexCoord4iv: "glMultiTexCoord4iv" [
	target	[GLenum]
	*v	[int-ptr!]
    ]

    glMultiTexCoord4s: "glMultiTexCoord4s" [
	target	[GLenum]
	s	[GLshort]
	t	[GLshort]
	r	[GLshort]
	q	[GLshort]
    ]

    glMultiTexCoord4sv: "glMultiTexCoord4sv" [
	target	[GLenum]
	*v	[int-ptr!]
    ]
    
    glFogCoordf: "glFogCoordf" [
	coord	[GLfloat]
    ]

    glFogCoordfv: "glFogCoordfv" [
	*coord	[float32-ptr!]
    ]

    glFogCoordd: "glFogCoordd" [
	coord	[GLdouble]
    ]

    glFogCoorddv: "glFogCoorddv" [
	*coord	[float-ptr!]
    ]

    glFogCoordPointer: "glFogCoordPointer" [
    	type	[GLenum]
	stride	[GLsizei]
	*pointer	[GLvoid]
    ]
    
    glSecondaryColor3b: "glSecondaryColor3b" [
	red	[GLbyte]
	green	[GLbyte]
	blue	[GLbyte]
]

glSecondaryColor3bv: "glSecondaryColor3bv" [
	*v	[byte-ptr!]
]

glSecondaryColor3d: "glSecondaryColor3d" [
	red	[GLdouble]
	green	[GLdouble]
	blue	[GLdouble]
]

glSecondaryColor3dv: "glSecondaryColor3dv" [
	*v	[float-ptr!]
]

glSecondaryColor3f: "glSecondaryColor3f" [
	red	[GLfloat]
	green	[GLfloat]
	blue	[GLfloat]
]

glSecondaryColor3fv: "glSecondaryColor3fv" [
	*v	[float32-ptr!]
]

glSecondaryColor3i: "glSecondaryColor3i" [
	red	[GLint]
	green	[GLint]
	blue	[GLint]
]

glSecondaryColor3iv: "glSecondaryColor3iv" [
	*v	[int-ptr!]
]

glSecondaryColor3s: "glSecondaryColor3s" [
	red	[GLshort]
	green	[GLshort]
	blue	[GLshort]
]

glSecondaryColor3sv: "glSecondaryColor3sv" [
	*v	[int-ptr!]
]

glSecondaryColor3ub: "glSecondaryColor3ub" [
	red	[GLubyte]
	green	[GLubyte]
	blue	[GLubyte]
]

glSecondaryColor3ubv: "glSecondaryColor3ubv" [
	*v	[byte-ptr!]
]

glSecondaryColor3ui: "glSecondaryColor3ui" [
	red	[GLuint]
	green	[GLuint]
	blue	[GLuint]
]

glSecondaryColor3uiv: "glSecondaryColor3uiv" [
	*v	[int-ptr!]
]

glSecondaryColor3us: "glSecondaryColor3us" [
	red	[GLushort]
	green	[GLushort]
	blue	[GLushort]
]

glSecondaryColor3usv: "glSecondaryColor3usv" [
	*v	[int-ptr!]
]

glSecondaryColorPointer: "glSecondaryColorPointer" [
	size	[GLint]
	type	[GLenum]
	stride	[GLsizei]
	*pointer	[GLvoid]
]

glPointParameterf: "glPointParameterf" [
	pname	[GLenum]
	param	[GLfloat]
]

glPointParameterfv: "glPointParameterfv" [
	pname	[GLenum]
	*params	[float32-ptr!]
]

glPointParameteri: "glPointParameteri" [
	pname	[GLenum]
	param	[GLint]
]

glPointParameteriv: "glPointParameteriv" [
	pname	[GLenum]
	*params	[int-ptr!]
]

    glBlendFuncSeparate: "glBlendFuncSeparate" [
	srcRGB	        [GLenum]
	dstRGB	        [GLenum]
	srcAlpha	[GLenum]
	dstAlpha	[GLenum]
    ]
    
    glMultiDrawArrays: "glMultiDrawArrays" [
	mode	        [GLenum]
	*first	        [int-ptr!]
	*count	        [int-ptr!]
	primcount	[GLsizei]
    ]
    
    glMultiDrawElements: "glMultiDrawElements" [
	mode	        [GLenum]
	*count	        [int-ptr!]
	type	        [GLenum]
	*indices	[GLvoid]
	primcount	[GLsizei]
    ]
    
    glWindowPos2d: "glWindowPos2d" [
	x	[GLdouble]
	y	[GLdouble]
]

glWindowPos2dv: "glWindowPos2dv" [
	*v	[float-ptr!]
]

glWindowPos2f: "glWindowPos2f" [
	x	[GLfloat]
	y	[GLfloat]
]

glWindowPos2fv: "glWindowPos2fv" [
	*v	[float32-ptr!]
]

glWindowPos2i: "glWindowPos2i" [
	x	[GLint]
	y	[GLint]
]

glWindowPos2iv: "glWindowPos2iv" [
	*v	[int-ptr!]
]

glWindowPos2s: "glWindowPos2s" [
	x	[GLshort]
	y	[GLshort]
]

glWindowPos2sv: "glWindowPos2sv" [
	*v	[int-ptr!]
]

glWindowPos3d: "glWindowPos3d" [
	x	[GLdouble]
	y	[GLdouble]
	z	[GLdouble]
]

glWindowPos3dv: "glWindowPos3dv" [
	*v	[float-ptr!]
]

glWindowPos3f: "glWindowPos3f" [
	x	[GLfloat]
	y	[GLfloat]
	z	[GLfloat]
]

glWindowPos3fv: "glWindowPos3fv" [
	*v	[float32-ptr!]
]

glWindowPos3i: "glWindowPos3i" [
	x	[GLint]
	y	[GLint]
	z	[GLint]
]

glWindowPos3iv: "glWindowPos3iv" [
	*v	[int-ptr!]
]

glWindowPos3s: "glWindowPos3s" [
	x	[GLshort]
	y	[GLshort]
	z	[GLshort]
]

glWindowPos3sv: "glWindowPos3sv" [
	*v	[int-ptr!]
]

glGenQueries: "glGenQueries" [
	n	[GLsizei]
	*ids	[int-ptr!]
]

glDeleteQueries: "glDeleteQueries" [
	n	[GLsizei]
	*ids	[int-ptr!]
]

glIsQuery: "glIsQuery" [
	id	[GLuint]
	return:	[GLboolean]
]

glBeginQuery: "glBeginQuery" [
	target	[GLenum]
	id	[GLuint]
]

glEndQuery: "glEndQuery" [
	target	[GLenum]
]

glGetQueryiv: "glGetQueryiv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
]

glGetQueryObjectiv: "glGetQueryObjectiv" [
	id	[GLuint]
	pname	[GLenum]
	*params	[int-ptr!]
]

glGetQueryObjectuiv: "glGetQueryObjectuiv" [
	id	[GLuint]
	pname	[GLenum]
	*params	[int-ptr!]
]

glBindBuffer: "glBindBuffer" [
	target	[GLenum]
	buffer	[GLuint]
]

glDeleteBuffers: "glDeleteBuffers" [
	n	        [GLsizei]
	*buffers	[int-ptr!]
]

glGenBuffers: "glGenBuffers" [
	n	        [GLsizei]
	*buffers	[int-ptr!]
]

glIsBuffer: "glIsBuffer" [
	buffer	[GLuint]
	return:	[GLboolean]
]

glBufferData: "glBufferData" [
	target	[GLenum]
	size	[GLsizeiptr] 
	*data	[GLvoid]
	usage	[GLenum]
]

glBufferSubData: "glBufferSubData" [
	target	[GLenum]
	offset	[GLintptr]  
	size	[GLsizeiptr] 
	*data	[GLvoid]
]

glGetBufferSubData: "glGetBufferSubData" [
	target	[GLenum]
	offset	[GLintptr] 
	size	[GLsizeiptr] 
	*data	[GLvoid]
]

glMapBuffer: "glMapBuffer" [
	target	[GLenum]
	access	[GLenum]
	return:	[GLvoid] ; pointer
]

glUnmapBuffer: "glUnmapBuffer" [
	target	[GLenum]
	return:	[GLboolean]
]

glGetBufferParameteriv: "glGetBufferParameteriv" [
	target	[GLenum]
	pname	[GLenum]
	*params	[int-ptr!]
]

glGetBufferPointerv: "glGetBufferPointerv" [
	target	[GLenum]
	pname	[GLenum]
	**params	[GLvoid]
]

glDrawBuffers: "glDrawBuffers" [
	n	[GLsizei]
	*bufs	[GLenum]
]

glVertexAttrib1d: "glVertexAttrib1d" [
	index	[GLuint]
	x	[GLdouble]
]

glVertexAttrib1dv: "glVertexAttrib1dv" [
	index	[GLuint]
	*v	[float-ptr!]
]

glVertexAttrib1f: "glVertexAttrib1f" [
	index	[GLuint]
	x	[GLfloat]
]

glVertexAttrib1fv: "glVertexAttrib1fv" [
	index	[GLuint]
	*v	[float32-ptr!]
]

glVertexAttrib1s: "glVertexAttrib1s" [
	index	[GLuint]
	x	[GLshort]
]

glVertexAttrib1sv: "glVertexAttrib1sv" [
	index	[GLuint]
	*v	[int-ptr!]
]

glVertexAttrib2d: "glVertexAttrib2d" [
	index	[GLuint]
	x	[GLdouble]
	y	[GLdouble]
]

glVertexAttrib2dv: "glVertexAttrib2dv" [
	index	[GLuint]
	*v	[float-ptr!]
]

glVertexAttrib2f: "glVertexAttrib2f" [
	index	[GLuint]
	x	[GLfloat]
	y	[GLfloat]
]

glVertexAttrib2fv: "glVertexAttrib2fv" [
	index	[GLuint]
	*v	[float32-ptr!]
]

glVertexAttrib2s: "glVertexAttrib2s" [
	index	[GLuint]
	x	[GLshort]
	y	[GLshort]
]

glVertexAttrib2sv: "glVertexAttrib2sv" [
	index	[GLuint]
	*v	[int-ptr!]
]

glVertexAttrib3d: "glVertexAttrib3d" [
	index	[GLuint]
	x	[GLdouble]
	y	[GLdouble]
	z	[GLdouble]
]

glVertexAttrib3dv: "glVertexAttrib3dv" [
	index	[GLuint]
	*v	[float-ptr!]
]

glVertexAttrib3f: "glVertexAttrib3f" [
	index	[GLuint]
	x	[GLfloat]
	y	[GLfloat]
	z	[GLfloat]
]

glVertexAttrib3fv: "glVertexAttrib3fv" [
	index	[GLuint]
	*v	[float32-ptr!]
]

glVertexAttrib3s: "glVertexAttrib3s" [
	index	[GLuint]
	x	[GLshort]
	y	[GLshort]
	z	[GLshort]
]

glVertexAttrib3sv: "glVertexAttrib3sv" [
	index	[GLuint]
	*v	[int-ptr!]
]

glVertexAttrib4Nbv: "glVertexAttrib4Nbv" [
	index	[GLuint]
	*v	[byte-ptr!]
]

glVertexAttrib4Niv: "glVertexAttrib4Niv" [
	index	[GLuint]
	*v	[int-ptr!]
]

glVertexAttrib4Nsv: "glVertexAttrib4Nsv" [
	index	[GLuint]
	*v	[int-ptr!]
]

glVertexAttrib4Nub: "glVertexAttrib4Nub" [
	index	[GLuint]
	x	[GLubyte]
	y	[GLubyte]
	z	[GLubyte]
	w	[GLubyte]
]

glVertexAttrib4Nubv: "glVertexAttrib4Nubv" [
	index	[GLuint]
	*v	[int-ptr!]
]

glVertexAttrib4Nuiv: "glVertexAttrib4Nuiv" [
	index	[GLuint]
	*v	[int-ptr!]
]

glVertexAttrib4Nusv: "glVertexAttrib4Nusv" [
	index	[GLuint]
	*v	[int-ptr!]
]

glVertexAttrib4bv: "glVertexAttrib4bv" [
	index	[GLuint]
	*v	[byte-ptr!]
]

glVertexAttrib4d: "glVertexAttrib4d" [
	index	[GLuint]
	x	[GLdouble]
	y	[GLdouble]
	z	[GLdouble]
	w	[GLdouble]
]

glVertexAttrib4dv: "glVertexAttrib4dv" [
	index	[GLuint]
	*v	[float-ptr!]
]

glVertexAttrib4f: "glVertexAttrib4f" [
	index	[GLuint]
	x	[GLfloat]
	y	[GLfloat]
	z	[GLfloat]
	w	[GLfloat]
]

glVertexAttrib4fv: "glVertexAttrib4fv" [
	index	[GLuint]
	*v	[float32-ptr!]
]

glVertexAttrib4iv: "glVertexAttrib4iv" [
	index	[GLuint]
	*v	[int-ptr!]
]

glVertexAttrib4s: "glVertexAttrib4s" [
	index	[GLuint]
	x	[GLshort]
	y	[GLshort]
	z	[GLshort]
	w	[GLshort]
]

glVertexAttrib4sv: "glVertexAttrib4sv" [
	index	[GLuint]
	*v	[int-ptr!]
]

glVertexAttrib4ubv: "glVertexAttrib4ubv" [
	index	[GLuint]
	*v	[byte-ptr!]
]

glVertexAttrib4uiv: "glVertexAttrib4uiv" [
	index	[GLuint]
	*v	[int-ptr!]
]

glVertexAttrib4usv: "glVertexAttrib4usv" [
	index	[GLuint]
	*v	[int-ptr!]
]

glVertexAttribPointer: "glVertexAttribPointer" [
	index	        [GLuint]
	size	        [GLint]
	type	        [GLenum]
	normalized	[GLboolean]
	stride	        [GLsizei]
	*pointer	[GLvoid]
]

glEnableVertexAttribArray: "glEnableVertexAttribArray" [
	index	[GLuint]
]

glDisableVertexAttribArray: "glDisableVertexAttribArray" [
	index	[GLuint]
]

glGetVertexAttribdv: "glGetVertexAttribdv" [
	index	[GLuint]
	pname	[GLenum]
	*params	[float-ptr!]
]

glGetVertexAttribfv: "glGetVertexAttribfv" [
	index	[GLuint]
	pname	[GLenum]
	*params	[float32-ptr!]
]

glGetVertexAttribiv: "glGetVertexAttribiv" [
	index	[GLuint]
	pname	[GLenum]
	*params	[int-ptr!]
]

glGetVertexAttribPointerv: "glGetVertexAttribPointerv" [
	index	        [GLuint]
	pname	        [GLenum]
	**pointer	[GLvoid]
]

glDeleteShader: "glDeleteShader" [
	shader	[GLuint]
]

glDetachShader: "glDetachShader" [
	program	[GLuint]
	shader	[GLuint]
]

glCreateShader: "glCreateShader" [
	type	[GLenum]
	return:	[GLuint]
]

glShaderSource: "glShaderSource" [
	shader	    [GLuint]
	count	    [GLsizei]
	*string	    [GLchar] ; c-string
	*length	    [int-ptr!]
]

glCompileShader: "glCompileShader" [
	shader	[GLuint]
]

glCreateProgram: "glCreateProgram" [
	
	return:	[GLuint]
]

glAttachShader: "glAttachShader" [
	program	[GLuint]
	shader	[GLuint]
]

glLinkProgram: "glLinkProgram" [
	program	[GLuint]
]

glUseProgram: "glUseProgram" [
	program	[GLuint]
]

glDeleteProgram: "glDeleteProgram" [
	program	[GLuint]
]

glValidateProgram: "glValidateProgram" [
	program	[GLuint]
]

glUniform1f: "glUniform1f" [
	location	[GLint]
	v0	[GLfloat]
]

glUniform2f: "glUniform2f" [
	location	[GLint]
	v0	[GLfloat]
	v1	[GLfloat]
]

glUniform3f: "glUniform3f" [
	location	[GLint]
	v0	[GLfloat]
	v1	[GLfloat]
	v2	[GLfloat]
]

glUniform4f: "glUniform4f" [
	location	[GLint]
	v0	[GLfloat]
	v1	[GLfloat]
	v2	[GLfloat]
	v3	[GLfloat]
]

glUniform1i: "glUniform1i" [
	location	[GLint]
	v0	[GLint]
]

glUniform2i: "glUniform2i" [
	location	[GLint]
	v0	[GLint]
	v1	[GLint]
]

glUniform3i: "glUniform3i" [
	location	[GLint]
	v0	[GLint]
	v1	[GLint]
	v2	[GLint]
]

glUniform4i: "glUniform4i" [
	location	[GLint]
	v0	[GLint]
	v1	[GLint]
	v2	[GLint]
	v3	[GLint]
]

glUniform1fv: "glUniform1fv" [
	location	[GLint]
	count	[GLsizei]
	*value	[float32-ptr!]
]

glUniform2fv: "glUniform2fv" [
	location	[GLint]
	count	[GLsizei]
	*value	[float32-ptr!]
]

glUniform3fv: "glUniform3fv" [
	location	[GLint]
	count	[GLsizei]
	*value	[float32-ptr!]
]

glUniform4fv: "glUniform4fv" [
	location	[GLint]
	count	        [GLsizei]
	*value	        [float32-ptr!]
]

glUniform1iv: "glUniform1iv" [
	location	[GLint]
	count	        [GLsizei]
	*value	        [int-ptr!]
]

glUniform2iv: "glUniform2iv" [
	location	[GLint]
	count	        [GLsizei]
	*value	        [int-ptr!]
]

glUniform3iv: "glUniform3iv" [
	location	[GLint]
	count	        [GLsizei]
	*value	        [int-ptr!]
]

glUniform4iv: "glUniform4iv" [
	location	[GLint]
	count	        [GLsizei]
	*value	        [int-ptr!]
]

    glUniformMatrix2fv: "glUniformMatrix2fv" [
	location	[GLint]
	count	        [GLsizei]
	transpose	[GLboolean]
	*value	        [float32-ptr!]
    ]

    glUniformMatrix3fv: "glUniformMatrix3fv" [
	location	[GLint]
	count	        [GLsizei]
	transpose	[GLboolean]
	*value	        [float32-ptr!]
    ]

glUniformMatrix4fv: "glUniformMatrix4fv" [
	location	[GLint]
	count	        [GLsizei]
	transpose	[GLboolean]
	*value	        [float32-ptr!]
]

glIsShader: "glIsShader" [
	shader	        [GLuint]
	return:	    [GLboolean]
]

glIsProgram: "glIsProgram" [
	program	[GLuint]
	return:	[GLboolean]
]

    glGetShaderiv: "glGetShaderiv" [
	shader	[GLuint]
	pname	[GLenum]
	*params	[int-ptr!]
    ]

    glGetProgramiv: "glGetProgramiv" [
	program	[GLuint]
	pname	[GLenum]
	*params	[int-ptr!]
    ]

glGetAttachedShaders: "glGetAttachedShaders" [
	program	[GLuint]
	maxCount	[GLsizei]
	*count	        [int-ptr!]
	*shaders	[int-ptr!]
]

glGetShaderInfoLog: "glGetShaderInfoLog" [
	shader	    [GLuint]
	bufSize	    [GLsizei]
	*length	    [int-ptr!]
	*infoLog    [GLchar] ; c-string
]
glGetProgramInfoLog: "glGetProgramInfoLog" [
	program	        [GLuint]
	bufSize	        [GLsizei]
	*length	        [int-ptr!]
	*infoLog	[GLchar]
]

glGetActiveUniform: "glGetActiveUniform" [
	program	[GLuint]
	index	[GLuint]
	bufSize	[GLsizei]
	*length	[int-ptr!]
	*size	[int-ptr!]
	*type	[GLenum]
	*name	[GLchar]
]

glGetUniformfv: "glGetUniformfv" [
	program	        [GLuint]
	location	[GLint]
	*params	        [float32-ptr!]
]

    glGetUniformiv: "glGetUniformiv" [
	program	        [GLuint]
	location	[GLint]
	*params	        [int-ptr!]
    ]

glGetShaderSource: "glGetShaderSource" [
	shader	    [GLuint]
	bufSize	    [GLsizei]
	*length	    [int-ptr!]
	*source	    [GLchar]
]

glBindAttribLocation: "glBindAttribLocation" [
	program	[GLuint]
	index	[GLuint]
	*name	[GLchar]
]

glGetActiveAttrib: "glGetActiveAttrib" [
	program	[GLuint]
	index	[GLuint]
	bufSize	[GLsizei]
	*length	[int-ptr!]
	*size	[int-ptr!]
	*type	[GLenum]
	*name	[GLchar]
]

glGetAttribLocation: "glGetAttribLocation" [
	program	[GLuint]
	*name	[GLchar]
	return:	[GLint]
]

glStencilFuncSeparate: "glStencilFuncSeparate" [
	face	[GLenum]
	func	[GLenum]
	ref	[GLint]
	mask	[GLuint]
]

glStencilOpSeparate: "glStencilOpSeparate" [
	face	[GLenum]
	fail	[GLenum]
	zfail	[GLenum]
	zpass	[GLenum]
]

glStencilMaskSeparate: "glStencilMaskSeparate" [
	face	[GLenum]
	mask	[GLuint]
]

glUniformMatrix2x3fv: "glUniformMatrix2x3fv" [
	location	[GLint]
	count	        [GLsizei]
	transpose	[GLboolean]
	*value	        [float32-ptr!]
]

glUniformMatrix3x2fv: "glUniformMatrix3x2fv" [
	location	[GLint]
	count	        [GLsizei]
	transpose	[GLboolean]
	*value	        [float32-ptr!]
]

glUniformMatrix2x4fv: "glUniformMatrix2x4fv" [
	location	[GLint]
	count	        [GLsizei]
	transpose	[GLboolean]
	*value	        [float32-ptr!]
]

glUniformMatrix4x2fv: "glUniformMatrix4x2fv" [
	location	[GLint]
	count	        [GLsizei]
	transpose	[GLboolean]
	*value	        [float32-ptr!]
]

    glUniformMatrix3x4fv: "glUniformMatrix3x4fv" [
	location	[GLint]
	count	        [GLsizei]
	transpose	[GLboolean]
	*value	        [float-ptr!]
    ]

    glUniformMatrix4x3fv: "glUniformMatrix4x3fv" [
	location	[GLint]
	count	        [GLsizei]
	transpose	[GLboolean]
	*value	        [float-ptr!]
    ]

    
    ;***** fin imports
    ]
]


;glEnable GL_DEPTH_TEST
;as integer! 