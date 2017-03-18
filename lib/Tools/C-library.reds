Red/System [
	Title:		"C Library Binding"
	Author:		"Kaj de Vos"
	Rights:		"Copyright (c) 2011,2012 Kaj de Vos. All rights reserved."
	License: {
		Redistribution and use in source and binary forms, with or without modification,
		are permitted provided that the following conditions are met:

		    * Redistributions of source code must retain the above copyright notice,
		      this list of conditions and the following disclaimer.
		    * Redistributions in binary form must reproduce the above copyright notice,
		      this list of conditions and the following disclaimer in the documentation
		      and/or other materials provided with the distribution.

		THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
		ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
		WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
		DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
		FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
		DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
		SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
		CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
		OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
		OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	}
	Needs:		"Red/System >= 0.2.5"
	Tabs:		4
]


; FPU configuration
; All exceptions need to be disabled when entering C functions

#if target = 'IA-32 [
	system/fpu/mask/overflow: on
	system/fpu/mask/underflow: on
	system/fpu/mask/zero-divide: on
	system/fpu/mask/invalid-op: on
	system/fpu/update
]


#define integer32!				integer!

; FIXME:
#define unsigned32!				integer!
#define integer16!				integer!
#define unsigned16!				integer!

#define variant!				integer!
handle!:					alias struct! [dummy [variant!]]
#define as-handle				[as handle! ]
#define binary!					[pointer! [byte!]]
#define as-binary				[as binary! ]

integer-reference!:				alias struct! [value [integer!]]
float-reference!:				alias struct! [value [float!]]
handle-reference!:				alias struct! [value [handle!]]
binary-reference!:				alias struct! [value [binary!]]
string-reference!:				alias struct! [value [c-string!]]


#define none					null
#define none?					[none = ]

#define free-any				[free as-binary ]


; C types

#define unsigned!				integer!
#define long!					integer!
#define unsigned-long!			        integer!
#define enum!					integer!
#define double!					float!

#define size!					integer!
size-reference!:				alias struct! [value [size!]]

file!: alias struct! [
	dummy					[variant!]
]

#define time!					long!
#define time-size				4
time-reference!:				alias struct! [value [time!]]

#define clock!					long!

date!: alias struct! [
	seconds						[integer!]  ; 0-61 (60?)
	minutes						[integer!]  ; 0-59
	hours						[integer!]  ; 0-23

	day							[integer!]  ; 1-31
	month						[integer!]  ; 0-11
	year						[integer!]  ; Since 1900

	week-day					[integer!]  ; 0-6 since Sunday
	year-day					[integer!]  ; 0-365
	daylight-saving-time?		[integer!]  ; Negative: unknown
]

#either OS = 'Windows [
	#define clocks-per-second	1000
][
	; CLOCKS_PER_SEC value for Syllable, Linux (XSI-conformant systems)
	; TODO: check for other systems
	#define clocks-per-second	1000'000
]

; Limits for GNU (Syllable, Linux)
; TODO: check for other systems

; 32 bits
#define min-long				-2147483648  ; LONG_MIN
#define max-long				7FFFFFFFh  ; 2147483647, LONG_MAX
#define max-unsigned-long		FFFFFFFFh  ; 4294967295, ULONG_MAX

; 64 bits
;#define min-long				-9223372036854775808  ; LONG_MIN
;#define max-long				9223372036854775807  ; 7FFFFFFFFFFFFFFFh, LONG_MAX
;#define max-unsigned-long		18446744073709551615  ; FFFFFFFFFFFFFFFFh, ULONG_MAX


; C library

; file-at (fseek) origin codes for Syllable, Linux
; TODO: check for other systems
#define seek-set				0
#define seek-current			1
#define seek-end				2

; file-buffer (setvbuf) modes for Syllable, Linux
; TODO: check for other systems
#define io-full-buffering		0
#define io-line-buffering		1
#define io-no-buffering			2

; random (rand) maximum value RAND_MAX for GNU (Syllable, Linux)
; TODO: check for other systems
#define max-random				2147483647  ; 32 bits signed

; on-signal/signal (signal/raise) codes for Syllable, Linux
; TODO: check for other systems

#define signal-error			-1
#define signal-default			0
#define signal-ignore			1
;#define signal-hold			2  ; Unix 98

#define signal-max				64
#define signal-hangup			1
#define signal-interrupt		2
#define signal-quit				3
#define signal-illegal			4
#define signal-trap				5
#define signal-abort			6
#define signal-bus-error		7
#define signal-float-error		8
#define signal-kill				9
#define signal-user-1			10
#define signal-seg-fault		11
#define signal-user-2			12
#define signal-broken-pipe		13
#define signal-alarm-clock		14
#define signal-terminate		15
#define signal-stack-fault		16
#define signal-child-status		17
#define signal-continue			18
#define signal-stop				19
#define signal-tty-stop			20
#define signal-tty-input		21
#define signal-tty-output		22
#define signal-urgent			23
#define signal-cpu-limit		24
#define signal-file-size		25
#define signal-virtual-alarm	26
#define signal-profiling		27
#define signal-window-size		28
#define signal-poll-event		29
#define signal-power			30
#define signal-system-call		31

;LIBC-file: "/usr/lib/libc.dylib" ;test mac osx 
;LIBC-file est déjà défini par Red/System dans %lib-names.reds

#import [LIBC-file cdecl [

	; Error handling

	form-error: "strerror" [  ; Return error description.
		error		[c-string!]
		return:		[c-string!]
	]
	print-error: "perror" [  ; Print error to stderr.
		string		[c-string!]
	]


	; Memory management

	make: "calloc" [  ; Allocate zero-filled memory.
		chunks		[size!]
		size		[size!]
		return:		[binary!]
	]
	resize: "realloc" [  ; Resize memory allocation.
		memory		[binary!]
		size		[size!]
		return:		[binary!]
	]


	; Memory block processing

	set-part: "memset" [  ; Initialise memory range.
		target		[binary!]
		filler		[byte!]  ; integer
		size		[size!]
		return:		[binary!]
	]
	_copy-part: "memcpy" [  ; Copy memory range.
		target		[binary!]
		source		[binary!]
		size		[size!]
		return:		[binary!]
	]
	_move-part: "memmove" [  ; Copy possibly overlapping memory range.
		target		[binary!]
		source		[binary!]
		size		[size!]
		return:		[binary!]
	]

	compare-part: "memcmp" [  ; Compare memory range.
		part-1		[binary!]
		part-2		[binary!]
		size		[size!]
		return:		[integer!]
	]
	find-byte: "memchr" [  ; Search for byte in memory range.
		memory		[binary!]
		byte		[byte!]  ; integer
		size		[size!]
		return:		[binary!]
	]


	; Array processing

	sort: "qsort" [  ; Sort array.
		array		[handle!]
		entries		[size!]
		size		[size!]
		comparator	[function! [entry-1 [handle!] entry-2 [handle!] return: [integer!]]]
	]

	find-sorted: "bsearch" [  ; Search for entry in sorted array.
		key		[handle!]
		array		[handle!]
		entries		[size!]
		size		[size!]
		comparator	[function! [key [handle!] entry [handle!] return: [integer!]]]
		return:		[handle!]
	]


	; Character processing

	is-control: "iscntrl" [  ; Test for control character.
		byte		[integer!]  ; byte! or EOF
		return:		[integer!]
	]
	is-printable: "isprint" [  ; Test character for printability.
		byte		[integer!]  ; byte! or EOF
		return:		[integer!]
	]
	is-graphical: "isgraph" [  ; Test character for displayability: printable and not whitespace.
		byte		[integer!]  ; byte! or EOF
		return:		[integer!]
	]
	is-punctuation: "ispunct" [  ; Test character for punctuation.
		byte		[integer!]  ; byte! or EOF
		return:		[integer!]
	]
	is-whitespace: "isspace" [  ; Test character for whitespace.
		byte		[integer!]  ; byte! or EOF
		return:		[integer!]
	]
	is-alphanumeric: "isalnum" [  ; Test character for alphanumeric.
		byte		[integer!]  ; byte! or EOF
		return:		[integer!]
	]
	is-alphabetic: "isalpha" [  ; Test character for alphabetic.
		byte		[integer!]  ; byte! or EOF
		return:		[integer!]
	]
	is-digit: "isdigit" [  ; Test character for digit.
		byte		[integer!]  ; byte! or EOF
		return:		[integer!]
	]
	is-hex: "isxdigit" [  ; Test character for hexadecimal digit.
		byte		[integer!]  ; byte! or EOF
		return:		[integer!]
	]
	is-uppercase: "isupper" [  ; Test character for uppercase.
		byte		[integer!]  ; byte! or EOF
		return:		[integer!]
	]
	is-lowercase: "islower" [  ; Test character for lowercase.
		byte		[integer!]  ; byte! or EOF
		return:		[integer!]
	]

	to-uppercase: "toupper" [  ; Convert character to uppercase.
		byte		[integer!]  ; byte
		return:		[integer!]  ; byte
	]
	to-lowercase: "tolower" [  ; Convert character to lowercase.
		byte		[integer!]  ; byte
		return:		[integer!]  ; byte
	]


	; String processing

	copy-string: "strcpy" [  ; Copy string.
		target		[c-string!]
		source		[c-string!]
		return:		[c-string!]
	]
	copy-string-part: "strncpy" [  ; Copy string range.
		target		[c-string!]
		source		[c-string!]
		size		[size!]
		return:		[c-string!]
	]
	append-string: "strcat" [  ; Append string.
		target		[c-string!]
		source		[c-string!]
		return:		[c-string!]
	]
	append-string-part: "strncat" [  ; Append string range.
		target		[c-string!]
		source		[c-string!]
		size		[size!]
		return:		[c-string!]
	]

	compare-string: "strcmp" [  ; Compare string.
		string-1	[c-string!]
		string-2	[c-string!]
		return:		[integer!]
	]
	compare-string-part: "strncmp" [  ; Compare string range.
		string-1	[c-string!]
		string-2	[c-string!]
		size		[size!]
		return:		[integer!]
	]

	find-char: "strchr" [  ; Search for byte in string.
		string		[c-string!]
		byte		[byte!]  ; integer
		return:		[c-string!]
	]
	find-last-char: "strrchr" [  ; Search for byte in string from tail.
		string		[c-string!]
		byte		[byte!]  ; integer
		return:		[c-string!]
	]
	find-string: "strstr" [  ; Search for sub-string.
		string		[c-string!]
		substring	[c-string!]
		return:		[c-string!]
	]

	format-any: "sprintf" [  ; Format arguments as string.
		[variadic]
		; string	[c-string!]  ; WARN: must be big enough!
		; format	[c-string!]
		;	value	[variant!]
		;	...
		return:		[integer!]  ; Result length or < 0
	]


	; Type conversions

	to-integer: "atoi" [  ; Parse string to integer.
		string		[c-string!]
		return:		[integer!]
	]
	to-float: "atof" [  ; Parse string to floating point.
		string		[c-string!]
		return:		[float!]
	]


	; Parsing

	delimiter-length: "strspn" [  ; Find out delimiter span.
		string		[c-string!]
		delimiters	[c-string!]
		return:		[size!]
	]
	value-length: "strcspn" [  ; Find out token span.
		string		[c-string!]
		delimiters	[c-string!]
		return:		[size!]
	]
	find-delimiter: "strpbrk" [  ; Search for delimiter.
		string		[c-string!]
		delimiters	[c-string!]
		return:		[c-string!]
	]
	split-next: "strtok" [  ; Parse next token from string.
		string		[c-string!]
		delimiters	[c-string!]
		return:		[c-string!]
	]

	next-integer: "strtoul" [  ; Parse next integer from string.
		string		[c-string!]
		next		[string-reference!]
		base		[integer!]  ; 2-36 or 0
		return:		[unsigned-long!]
	]
	next-signed: "strtol" [  ; Parse next (signed) integer from string.
		string		[c-string!]
		next		[string-reference!]
		base		[integer!]  ; 2-36 or 0
		return:		[long!]
	]
	next-float: "strtod" [  ; Parse next floating point number from string.
		string		[c-string!]
		next		[string-reference!]
		return:		[float!]
	]

	parse: "sscanf" [  ; Read arguments from string.
		[variadic]
		; string	[c-string!]
		; format	[c-string!]
		;	value	[handle!]
		;	...
		return:		[integer!]  ; Items parsed or EOF
	]


	; Input/output

	_print-char: "putchar" [  ; Print character to stdout.
		byte		[byte!]  ; integer
		return:		[integer!]  ; Char or EOF
	]
	input-char: "getchar" [  ; Read character from stdin.
		return:		[integer!]  ; Char or EOF
	]


	_print-string-line: "puts" [  ; Print line to stdout.
		line		[c-string!]
		return:		[integer!]  ; >= 0 or EOF
	]
	_input-line: "gets" [  ; Read line from stdin.
		line		[c-string!]  ; No size check!
		return:		[c-string!]
	]


	print-form: "printf" [  ; Print arguments to stdout.
		[variadic]
		; format	[c-string!]
		;	value	[variant!]
		;	...
		return:		[integer!]  ; Length printed or < 0
	]

	input: "scanf" [  ; Read arguments from stdin.
		[variadic]
		; format	[c-string!]
		;	value	[handle!]
		;	...
		return:		[integer!]  ; Items parsed or EOF
	]


	; File input/output

	open: "fopen" [  ; Open file.
		name		[c-string!]
		mode		[c-string!]
		return:		[file!]
	]
	_reopen: "freopen" [  ; Reopen file descriptor.
		name		[c-string!]
		mode		[c-string!]
		file		[file!]
		return:		[file!]
	]
	flush-file: "fflush" [  ; Flush file(s).
		file		[file!]  ; NULL for all streams
		return:		[integer!]  ; 0 or EOF
	]
	close-file: "fclose" [  ; Close file.
		file		[file!]
		return:		[integer!]  ; 0 or EOF
	]


	_temporary-name: "tmpnam" [  ; Create temporary file name.
		name		[c-string!]  ; Normally NULL
		return:		[c-string!]
	]
	temporary-file: "tmpfile" [  ; Create temporary binary file for updating.
		return:		[file!]
	]


	_file-buffer: "setvbuf" [  ; Configure buffering.
		file		[file!]
		buffer		[binary!]
		mode		[integer!]
		size		[size!]
		return:		[integer!]
	]


	file-tail: "feof" [  ; End-of-file status.
		file		[file!]
		return:		[integer!]
	]
	file-error: "ferror" [  ; File status.
		file		[file!]
		return:		[integer!]
	]
	clear-status: "clearerr" [  ; Clear file status.
		file		[file!]
	]


	file-index: "ftell" [  ; File position.
		file		[file!]
		return:		[long!]  ; 0-based index or -1
	]
	_file-at: "fseek" [  ; Seek to file index.
		file		[file!]
		offset		[long!]
		origin		[integer!]
		return:		[integer!]
	]
	file-at-head: "rewind" [  ; Rewind file index and clear status.
		file		[file!]
	]
	_file-back: "ungetc" [  ; Push byte back for rereading.
		byte		[byte!]  ; integer
		file		[file!]
		return:		[integer!]  ; Byte or EOF
	]


	_write-byte: "fputc" [  ; Write byte to file.
		byte		[byte!]  ; integer
		file		[file!]
		return:		[integer!]  ; Byte or EOF
	]
	read-byte: "fgetc" [  ; Read byte from file.
		file		[file!]
		return:		[integer!]  ; Byte or EOF
	]


	_write-line: "fputs" [  ; Write line to text file.
		line		[c-string!]
		file		[file!]
		return:		[integer!]  ; >= 0 or EOF
	]
	_read-line: "fgets" [  ; Read line from text file.
		line		[c-string!]
		size		[integer!]
		file		[file!]
		return:		[c-string!]
	]


	_write-array: "fwrite" [  ; Write binary array to file.
		array		[handle!]
		size		[size!]
		entries		[size!]
		file		[file!]
		return:		[size!]  ; Chunks written
	]
	read-array: "fread" [  ; Read binary array from file.
		array		[handle!]
		size		[size!]
		entries		[size!]
		file		[file!]
		return:		[size!]  ; Chunks read
	]


	write-form: "fprintf" [  ; Print arguments to file.
		[variadic]
		; file		[file!]
		; format	[c-string!]
		;	value	[variant!]
		;	...
		return:		[integer!]  ; Length printed or < 0
	]

	load: "fscanf" [  ; Read arguments from text file.
		[variadic]
		; file		[file!]
		; format	[c-string!]
		;	value	[handle!]
		;	...
		return:		[integer!]  ; Items parsed or EOF
	]


	_delete: "remove" [  ; Delete file.
		name		[c-string!]
		return:		[integer!]
	]
	_rename: "rename" [  ; Rename file.
		old-name	[c-string!]
		new-name	[c-string!]
		return:		[integer!]
	]


	; Number processing

	absolute: "abs" [
		value		[integer!]
		return:		[integer!]
	]
        
        ;added by F. Jouen
        ; is not a number? 
        isNaN: "isNaN" [
                value           [float!]
                return:		[logic!]   
        ]
        ;isinf - test for infinity
        isInf: "isInf" [
                value           [float!]
                return:		[integer!]
        ]
        ;// F. Jouen
	; Random numbers

	random-seed: "srand" [  ; Seed pseudo-random generator (initially 1).
		seed		[unsigned!]

	]
	random: "rand" [  ; Pseudo-random number from 0 - RAND_MAX (at least 32767).
		return:		[integer!]
	]


	; Dates and time

	now-time: "time" [  ; Current time.
		result		[time-reference!]
		return:		[time!]  ; -1: unknown
	]
	form-time: "ctime" [  ; Format internal time as string.
		time		[time-reference!]
		return:		[c-string!]
	]
	subtract-time: "difftime" [  ; time-1 - time-2.
		time-1		[time!]
		time-2		[time!]
		return:		[float!]  ; Seconds
	]

	form-date: "asctime" [  ; Format date as string.
		date		[date!]
		return:		[c-string!]
	]
	_format-date: "strftime" [  ; Format date as string.
		string		[c-string!]
		size		[size!]
		format		[c-string!]
		date		[date!]
		return:		[size!]  ; Result length or 0
	]

	to-date: "gmtime" [  ; Convert internal time to UTC date.
		time		[time-reference!]
		return:		[date!]
	]
	to-local-date: "localtime" [  ; Convert internal time to local date.
		time		[time-reference!]
		return:		[date!]
	]
	to-time: "mktime" [  ; Convert date to internal time.
		date		[date!]
		return:		[time!]  ; -1: unknown
	]

	process-time: "clock" [  ; CPU time used by process; wall-clock time on Windows!
		return:		[clock!]  ; -1: unknown
	]


	; System interfacing

	get-env: "getenv" [  ; Get system environment variable.
		name		[c-string!]
		return:		[c-string!]
	]

	call: "system" [  ; Execute system command.
		command		[c-string!]  ; NULL to check for command processor
		return:		[integer!]
	]

	quit-now: "abort" []  ; Abort program with signal SIGABRT.

	_signal: "raise" [  ; Send signal to self.
		signal		[integer!]
		return:		[integer!]
	]

	; Callback handlers

	#either OS = 'Syllable [
		_on-quit: "__cxa_atexit" [  ; Register handler for normal program termination.
;			handler			[function! []]  ; Callback
			handler			[integer!]
			handle			[handle!]
			library-handle	[handle!]
			return:			[integer!]
		]
	][
		_on-quit: "atexit" [  ; Register handler for normal program termination.
;			handler			[function! []]  ; Callback
			handler			[integer!]
			return:			[integer!]
		]
	]

	on-signal: "signal" [  ; Register handlers for receiving system signals.
		signal		[integer!]
		handler		[function! [signal [integer!]]]  ; Flag or callback
;		return:		[function! [signal [integer!]]]
		return:		[handle!]
	]
]]


; Higher level interface


; Memory block processing

copy-part: function [  ; Copy memory range.
	source		[binary!]
	target		[binary!]
	size		[size!]
	return:		[binary!]
][
	_copy-part target source size
]
move-part: function [  ; Copy possibly overlapping memory range.
	source		[binary!]
	target		[binary!]
	size		[size!]
	return:		[binary!]
][
	_move-part target source size
]


; Character processing

control?: function [  ; Test for control character.
	char		[byte!]
	return:		[logic!]
][
	as-logic is-control as-integer char
]
printable?: function [  ; Test character for printability.
	char		[byte!]
	return:		[logic!]
][
	as-logic is-printable as-integer char
]
graphical?: function [  ; Test character for displayability: printable and not whitespace.
	char		[byte!]
	return:		[logic!]
][
	as-logic is-graphical as-integer char
]
punctuation?: function [  ; Test character for punctuation.
	char		[byte!]
	return:		[logic!]
][
	as-logic is-punctuation as-integer char
]
whitespace?: function [  ; Test character for whitespace.
	char		[byte!]
	return:		[logic!]
][
	as-logic is-whitespace as-integer char
]
alphanumeric?: function [  ; Test character for alphanumeric.
	char		[byte!]
	return:		[logic!]
][
	as-logic is-alphanumeric as-integer char
]
alphabetic?: function [  ; Test character for alphabetic.
	char		[byte!]
	return:		[logic!]
][
	as-logic is-alphabetic as-integer char
]
digit?: function [  ; Test character for digit.
	char		[byte!]
	return:		[logic!]
][
	as-logic is-digit as-integer char
]
hex?: function [  ; Test character for hexadecimal digit.
	char		[byte!]
	return:		[logic!]
][
	as-logic is-hex as-integer char
]
uppercase?: function [  ; Test character for uppercase.
	char		[byte!]
	return:		[logic!]
][
	as-logic is-uppercase as-integer char
]
lowercase?: function [  ; Test character for lowercase.
	char		[byte!]
	return:		[logic!]
][
	as-logic is-lowercase as-integer char
]


; String processing

format: function [  ; Format argument as string.
	string		[c-string!]  ; WARN: must be big enough!
	format		[c-string!]
	value		[variant!]
	return:		[logic!]
][
	0 <= format-any [string format value]  ; WARN?: error possible?
]


; Type conversions

form-integer: function [  ; Format integer as string.
	value		[integer!]
	return:		[c-string!]
	/local		result
][
	result: make-c-string 11  ; Max 32 bits

	unless none? result [
		format-any [result "%u" value]  ; FIXME?: error possible?
	]
	result
]
form-signed: function [  ; Format signed integer as string.
	value		[integer!]
	return:		[c-string!]
	/local		result
][
	result: make-c-string 12  ; Max 32 bits "-2147483648"

	unless none? result [
		format-any [result "%i" value]  ; FIXME?: error possible?
	]
	result
]
form-hex: function [  ; Format integer as hexadecimal string.
	value		[integer!]
	return:		[c-string!]
	/local		result
][
	result: make-c-string 9  ; Max 32 bits "FFFFFFFF"

	unless none? result [
		format-any [result "%X" value]  ; FIXME?: error possible?
	]
	result
]
form-octal: function [  ; Format integer as octal string.
	value		[integer!]
	return:		[c-string!]
	/local		result
][
	result: make-c-string 12  ; Max 32 bits

	unless none? result [
		format-any [result "%o" value]  ; FIXME?: error possible?
	]
	result
]

form-float: function [  ; Format floating point as string.
	value		[float!]
	return:		[c-string!]
	/local		result
][
	result: make-c-string 18  ; Max 64 bits; FIXME?: enough?

	unless none? result [
		format-any [result "%g" value]  ; FIXME?: error possible?
	]
	result
]


; Parsing

parse-hex: function [  ; Parse hexadecimal string to integer.
	string		[c-string!]
	value		[integer-reference!]
	return:		[logic!]
][
	1 = parse [string "%x"  as handle! value]
]
parse-octal: function [  ; Parse octal string to integer.
	string		[c-string!]
	value		[integer-reference!]
	return:		[logic!]
][
	1 = parse [string "%o"  as handle! value]
]


; Input/output

print-char: function [  ; Print character to stdout.
	char		[byte!]
	return:		[logic!]
][
	0 <= _print-char char
]
print-newline: function [  ; Print newline to stdout.
	return:		[logic!]
][
	0 <= _print-char #"^/"
]


print-string-line: function [  ; Print line to stdout.
	line		[c-string!]
	return:		[logic!]
][
	0 <= _print-string-line line
]
input-line: function [  ; Read line from stdin.
	line		[c-string!]  ; No size check!
	return:		[logic!]
][
	as-logic _input-line line
]


print-string: function [  ; Print string to stdout.
	string		[c-string!]
	return:		[logic!]
][
	positive? print-form ["%s"  as variant! string]
]


print-integer: function [  ; Print integer to stdout.
	value		[integer!]
	return:		[logic!]
][
	positive? print-form ["%u" value]
]
print-signed: function [  ; Print signed integer to stdout.
	value		[integer!]
	return:		[logic!]
][
	positive? print-form ["%i" value]
]
print-hex: function [  ; Print hexadecimal integer to stdout.
	value		[integer!]
	return:		[logic!]
][
	positive? print-form ["%X" value]
]
print-octal: function [  ; Print octal integer to stdout.
	value		[integer!]
	return:		[logic!]
][
	positive? print-form ["%o" value]
]

input-decimal: function [  ; Parse integer from decimal string on stdin.
	value		[integer-reference!]
	return:		[logic!]
][
	1 = input ["%u"  as handle! value]
]
input-signed: function [  ; Parse integer from (signed) decimal string on stdin.
	value		[integer-reference!]
	return:		[logic!]
][
	1 = input ["%d"  as handle! value]
]
input-integer: function [  ; Parse integer from decimal, hexadecimal or octal string on stdin.
	value		[integer-reference!]
	return:		[logic!]
][
	1 = input ["%i"  as handle! value]
]
input-hex: function [  ; Parse integer from hexadecimal string on stdin.
	value		[integer-reference!]
	return:		[logic!]
][
	1 = input ["%x"  as handle! value]
]
input-octal: function [  ; Parse integer from octal string on stdin.
	value		[integer-reference!]
	return:		[logic!]
][
	1 = input ["%o"  as handle! value]
]


print-float: function [  ; Print floating point to stdout.
	value		[float!]
	return:		[logic!]
][
	positive? print-form ["%g" value]
]
input-float: function [  ; Parse floating point from string on stdin.
	value		[float-reference!]
	return:		[logic!]
][
	1 = input ["%lf"  as handle! value]
]


; File input/output

open-new: function [  ; Open file for (over)writing.
	name		[c-string!]
	return:		[file!]
][
	open name "w"
]
open-new-seek: function [  ; Open file for (over)writing.
	name		[c-string!]
	return:		[file!]
][
	open name "w+"
]
open-read: function [  ; Open file for reading.
	name		[c-string!]
	return:		[file!]
][
	open name "r"
]
open-update: function [  ; Open file for updating.
	name		[c-string!]
	return:		[file!]
][
	open name "r+"
]
open-append: function [  ; Open file for appending.
	name		[c-string!]
	return:		[file!]
][
	open name "a"
]
open-append-seek: function [  ; Open file for appending.
	name		[c-string!]
	return:		[file!]
][
	open name "a+"
]

reopen: function [  ; Reopen file descriptor.
	name		[c-string!]
	mode		[c-string!]
	file		[file!]
	return:		[logic!]
][
	as-logic _reopen name mode file
]
flush: function [  ; Flush file(s).
	file		[file!]  ; NONE for all streams
	return:		[logic!]
][
	not as-logic flush-file file
]
close: function [  ; Close file.
	file		[file!]
	return:		[logic!]
][
	not as-logic close-file file
]


temporary-name: function [  ; Create temporary file name.
	return:		[c-string!]
][
	_temporary-name none
]


file-buffer: function [  ; Configure buffering.
	file		[file!]
	buffer		[binary!]
	mode		[integer!]
	size		[size!]
	return:		[logic!]
][
	not as-logic _file-buffer file buffer mode size
]


file-tail?: function [  ; End-of-file status.
	file		[file!]
	return:		[logic!]
][
	as-logic file-tail file
]
file-error?: function [  ; File status.
	file		[file!]
	return:		[logic!]
][
	as-logic file-error file
]


file-at: function [  ; Seek to file index.
	file		[file!]
	offset		[long!]
	origin		[integer!]
	return:		[logic!]
][
	not as-logic _file-at file offset origin
]
file-back: function [  ; Push byte back for rereading.
	byte		[byte!]
	file		[file!]
	return:		[logic!]
][
	0 <= _file-back byte file
]


write-byte: function [  ; Write byte to file.
	byte		[byte!]
	file		[file!]
	return:		[logic!]
][
	0 <= _write-byte byte file
]


write-line: function [  ; Write line to text file.
	line		[c-string!]
	file		[file!]
	return:		[logic!]
][
	0 <= _write-line line file
]
read-line: function [  ; Read line from text file.
	line		[c-string!]
	size		[integer!]
	file		[file!]
	return:		[logic!]
][
	as-logic _read-line line size file
]


write-array: function [  ; Write binary array to file.
	array		[handle!]
	size		[size!]
	entries		[size!]
	file		[file!]
	return:		[logic!]
][
	entries = _write-array array size entries file
]


write-integer: function [  ; Print integer to file.
	file		[file!]
	value		[integer!]
	return:		[logic!]
][
	positive? write-form [file "%u" value]
]
write-signed: function [  ; Print signed integer to file.
	file		[file!]
	value		[integer!]
	return:		[logic!]
][
	positive? write-form [file "%i" value]
]
write-hex: function [  ; Print hexadecimal integer to file.
	file		[file!]
	value		[integer!]
	return:		[logic!]
][
	positive? write-form [file "%X" value]
]
write-octal: function [  ; Print octal integer to file.
	file		[file!]
	value		[integer!]
	return:		[logic!]
][
	positive? write-form [file "%o" value]
]

load-decimal: function [  ; Read integer from decimal string in text file.
	file		[file!]
	value		[integer-reference!]
	return:		[logic!]
][
	1 = load [file "%u"  as handle! value]
]
load-signed: function [  ; Read integer from (signed) decimal string in text file.
	file		[file!]
	value		[integer-reference!]
	return:		[logic!]
][
	1 = load [file "%d"  as handle! value]
]
load-integer: function [  ; Read integer from decimal, hexadecimal or octal string in text file.
	file		[file!]
	value		[integer-reference!]
	return:		[logic!]
][
	1 = load [file "%i"  as handle! value]
]
load-hex: function [  ; Read integer from hexadecimal string in text file.
	file		[file!]
	value		[integer-reference!]
	return:		[logic!]
][
	1 = load [file "%x"  as handle! value]
]
load-octal: function [  ; Read integer from octal string in text file.
	file		[file!]
	value		[integer-reference!]
	return:		[logic!]
][
	1 = load [file "%o"  as handle! value]
]


write-float: function [  ; Print floating point to text file.
	file		[file!]
	value		[float!]
	return:		[logic!]
][
	positive? write-form [file "%g" value]
]
load-float: function [  ; Read floating point from text file.
	file		[file!]
	value		[float-reference!]
	return:		[logic!]
][
	1 = load [file "%lf"  as handle! value]
]


delete: function [  ; Delete file.
	name		[c-string!]
	return:		[logic!]
][
	not as-logic _delete name
]
rename: function [  ; Rename file.
	old-name	[c-string!]
	new-name	[c-string!]
	return:		[logic!]
][
	not as-logic _rename old-name new-name
]


; Dates and time

now: function [  ; Current time.
	return:		[date!]
	/local time date
][
	time: as time-reference! allocate time-size  ; TODO: use stack
	now-time time  ; FIXME?: handle -1
	date: to-date time
	free-any time
	date
]
format-date: function [  ; Format date as string.
	string		[c-string!]
	size		[size!]
	format		[c-string!]
	date		[date!]
	return:		[logic!]
][
	positive? _format-date string size format date
]


; System interfacing

signal: function [  ; Send signal to self.
	signal		[integer!]
	return:		[logic!]
][
	not as-logic _signal signal
]

on-quit: function [  ; Register handler for normal program termination.
;	handler		[function! []]  ; Callback
	handler		[integer!]
	return:		[logic!]
][
	#either OS = 'Syllable [
		not as-logic _on-quit handler none none
	][
		not as-logic _on-quit handler
	]
]
