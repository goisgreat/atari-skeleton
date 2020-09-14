	processor 6502

	;; include required files
	include "lib/vcs.h"
	include "lib/macro.h"

	;; this is code
	seg code
	;; ...that starts at origin $F000
	org $F000

;;; start of program
START:
	;; clear all memory
	CLEAN_START

;;; initial register configuration
CONFIGURE:
	;; blue background color
	ldy #$80
	sty COLUBK

	;; yellow playfield color
	ldy #$1C
	sty COLUPF

;;; rendering loop
RENDER:
	;; turn on VBLANK/VSYNC
	ldy #2
	sty VBLANK
	sty VSYNC

	;; three scanlines of VSYNC
	REPEAT 3
		sty WSYNC ; hit WSYNC 
	REPEND

	;; turn off VSYNC
	sta VSYNC

	;; prepare counter for 37 lines of VBLANK
	ldx #37

;;; render of VBLANK
DO_VBLANK:
	;; hit WSYNC
	sta WSYNC

	;; loop
	dex
	bne DO_VBLANK

	;; turn off VBLANK
	sta VBLANK

;;; render 192 visible scanlines
VISIBLE:
	;; allow playfield reflection via the CTRLPF register
	ldy #%00000001 ; playfield reflection
	sty CTRLPF

	;; reset PF0-PF2
	ldy #0
	sty PF0 ; reset PF0
	sty PF1 ; reset PF1
	sty PF2 ; reset PF2

	;; prepare counter for 14 scanlines
	ldx #14

;;; render top portion of the screen
RENDER_TOP:
	;; hit WSYNC, waiting for the next scanline
	sta WSYNC

	;; loop
	dex
	bne RENDER_TOP

;;; prepare to render the middle of the screen
PREPARE_MIDDLE:
	;; configure the LEFT side of the screen (right side infered on lines 67 and 68)
	ldy #%11100000
	sty PF0
	ldy #%11111111
	sty PF1
	sty PF2

	;; repeat PF config for 7 scanlines
	REPEAT 7
	   sta WSYNC ; hit WSYNC, waiting for the next scanline
	REPEND

	;; configure....
	ldy #%00100000
	sty PF0 ; ....PF0 with only 3rd bit
	ldy #%00000000
	sty PF1 ; ....PF1 with nothing
	sty PF2 ; ....PF2 with nothing
	
	;; prepare counter for 164 scanlines of current configuration [see above]
	ldx #164

;;; scan the middle of the screen
SCAN_164:
	;; hit WSYNC, waiting for a new scanline
	sta WSYNC

	;; loop
	dex
	bne SCAN_164

;;; end with 7 scanlines of just border
SCAN_BOTTOM:
	;; configure....
	ldy #%11100000
	sty PF0 ; ....PF0 with first 3 bits
	ldy #%11111111
	sty PF1 ; ....PF1 with all bits
	sty PF2 ; ....PF2 with all bits 

	;; repeat PF config for 7 scanlines
	REPEAT 7
	   sta WSYNC ; hit WSYNC, waiting for the next scanline
	REPEND

	;; reset PF0-PF2
	ldy #0
	sty PF0 ; reset PF0
	sty PF1 ; reset PF1
	sty PF2 ; reset PF2

	;; do seven scanlines
	REPEAT 7
		sta WSYNC ; hit WSYNC, waiting for the next scanline
	REPEND

	;; prepare counter for 30 lines of overscan
	ldx #30

;;; 30 lines of overscan
OVERSCAN:
	;; one scanline of overscan
	sta WSYNC

	;; loop
	dex
	bne OVERSCAN

	;; render the next frame
	jmp RENDER

;;; complete ROM size to 4 kb
END:
	org $FFFC
	.word START
	.word START