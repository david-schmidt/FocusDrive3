; Focus3

;			.TITLE "Apple /// Focus Drive Driver"
			.PROC  Focus3

			.setcpu "6502"
			.reloc

DriverVersion	= $001B		; Version number
DriverMfgr		= $4453		; Driver Manufacturer - DS
DriverType		= $F1		; 
InitialSlot		= $01		; Slot number to assume we're in

;
; SOS Equates
;
ExtPG		= $1401			; Driver extended bank address offset
AllocSIR	= $1913			; Allocate system internal resource
SELC800		= $1922			; Enable Expansion Rom Space
DeAlcSIR	= $1916			; De-allocate system internal resource
SysErr		= $1928			; Report error to system
EReg		= $FFDF			; Environment register

;
; SOS Zero page parameters
;
ReqCode		= $C0			; Request code
SOS_Unit	= $C1			; Unit number
SosBuf		= $C2			; SOS buffer pointer
ReqCnt		= $C4			; Requested byte count
CtlStat		= $C2			; Control/status code
CSList		= $C3			; Control/status list pointer
SosBlk		= $C6			; Starting block number
QtyRead		= $C8			; Bytes read return by D_READ

;
; Focus Hardware
;
ATOffset		= $8F
ATData8			= $C080-ATOffset+8	; 8 bit data port
ATError			= $C081-ATOffset+8	; Error flags
ATSectorCount	= $C082-ATOffset+8	; Number of sectors to process
ATSectorNumber	= $C083-ATOffset+8	; Sector number requested
ATCylL			= $C084-ATOffset+8	; Cylinder # Low
ATCylH			= $C085-ATOffset+8	; Cylinder # High
ATHead			= $C086-ATOffset+8	; Head #
ATStatus		= $C087-ATOffset+8	; (R) Status of drive
ATCommand		= $C087-ATOffset+8	; (W) Issue a command
ATData16		= $C088-ATOffset-8	; 16 bit data port, accessed with MSlot16 index value
ATReset			= $C08B-ATOffset-8	; (W) Reset the drive

;
; Parameter block specific to current SOS request
;
Num_Blks	= $D2			; Number of blocks requested
Count		= $D4			; 2 bytes lb,hb

;
; Focus zero page
;
Track		= $D6			; (3) Current track / ProDOS block
Head		= $D9			; (1) Current head
Sector		= $DA			; (1) Current sector
Temp		= $DB			; (2) Timer temp
RetryCount	= $DD			; (1) Number of read retries
OkFlag		= $DE			; (1) Compare byte for return value
ProCommand	= $DF			; (1) 0=Status,1=Read,2=Write,3=Format
;ProUnit		= $E0			; (1) Drive/Slot
ProBuffer	= $C2			; (2) Address to load data at
ProBlock	= $E3			; (3) Block # to work with

;
; SOS Error Codes
;
XDNFERR		= $10			; Device not found
XBADDNUM	= $11			; Invalid device number
XREQCODE	= $20			; Invalid request code
XCTLCODE	= $21			; Invalid control/status code
XCTLPARAM	= $22			; Invalid control/status parameter
XNORESRC	= $25			; Resource not available
XBADOP  	= $26			; Invalid operation
XIOERROR	= $27			; I/O error
XNODRIVE	= $28			; Drive not connected
XBYTECNT	= $2C			; Byte count not a multiple of 512
XBLKNUM 	= $2D			; Block number to large
XDCMDERR	= $31			; device command ABORTED error occurred
XCKDEVER	= $32			; Check device readiness routine failed
XNORESET	= $33			; Device reset failed
XNODEVIC	= $38			; Device not connected

;
; Switch Macro
;
.MACRO		SWITCH index,bounds,adrs_table,noexec	; See SOS Reference
.IFNBLANK index							; If PARM1 is present,
			lda		index				; load A with switch index
.ENDIF
.IFNBLANK	bounds						; If PARM2 is present,
			cmp		#bounds+1			; perform bounds checking
			bcs		@110				; on switch index
.ENDIF
			asl		A					; Multiply by 2 for table index
			tay
			lda		adrs_table+1,y		; Get switch address from table
			pha							; and push onto Stack
			lda		adrs_table,y
			pha
.IFBLANK	noexec
			rts							; Exit to code
.ENDIF
@110:
.ENDMACRO

			.SEGMENT "TEXT"

;
; Comment Field of driver
;
			.word	$FFFF ; Signal that we have a comment
			.word	COMMENT_END - COMMENT
COMMENT:	.byte	"Apple /// Focus Driver - by David Schmidt 2019"
COMMENT_END:

			.SEGMENT	"DATA"

;------------------------------------
;
; Device identification Block (DIB) - Volume #0
;
;------------------------------------

DIB_0:		.word	DIB_1			; Link pointer
			.word	Entry			; Entry pointer
			.byte	$08				; Name length byte
			.byte	".FOCUSD1       "; Device name
			.byte	$80				; Active, no page alignment
DIB0_Slot:	.byte	InitialSlot		; Slot number
			.byte	$00				; Unit number
			.byte	DriverType		; Type
			.byte	$10				; Subtype
			.byte	$00				; Filler
DIB0_Blks:	.word	$0000			; # Blocks in device
			.word	DriverMfgr		; Manufacturer
			.word	DriverVersion	; Driver version
			.word	$0000			; DCB length followed by DCB
;
; Device identification Block (DIB) - Volume #1
; Page alignment begins here
;
DIB_1:		.word	DIB_2			; Link pointer
			.word	Entry			; Entry pointer
			.byte	$08				; Name length byte
			.byte	".FOCUSD2       "; Device name
			.byte	$80				; Active
DIB1_Slot:	.byte	InitialSlot		; Slot number
			.byte	$01				; Unit number
			.byte	DriverType		; Type
			.byte	$10				; Subtype
			.byte	$00				; Filler
DIB1_Blks:	.word	$0000			; # Blocks in device
			.word	DriverMfgr		; Driver manufacturer
			.word	DriverVersion	; Driver version
			.word	$0000			; DCB length followed by DCB
;
; Device identification Block (DIB) - Volume #2
;
DIB_2:		.word	DIB_3			; Link pointer
			.word	Entry			; Entry pointer
			.byte	$08				; Name length byte
			.byte	".FOCUSD3       "; Device name
			.byte	$80				; Active
DIB2_Slot:	.byte	InitialSlot		; Slot number
			.byte	$02				; Unit number
			.byte	DriverType		; Type
			.byte	$10				; Subtype
			.byte	$00				; Filler
DIB2_Blks:	.word	$0000			; # Blocks in device
			.word	DriverMfgr		; Driver manufacturer
			.word	DriverVersion	; Driver version
			.word	$0000			; DCB length followed by DCB
;
; Device identification Block (DIB) - Volume #3
;
DIB_3:		.word	DIB_4			; Link pointer
			.word	Entry			; Entry pointer
			.byte	$08				; Name length byte
			.byte	".FOCUSD4       "; Device name
			.byte	$80				; Active
DIB3_Slot:	.byte	InitialSlot		; Slot number
			.byte	$03				; Unit number
			.byte	DriverType		; Type
			.byte	$10				; Subtype
			.byte	$00				; Filler
DIB3_Blks:	.word	$0000			; # Blocks in device
			.word	DriverMfgr		; Driver manufacturer
			.word	DriverVersion	; Driver version
			.word	$0000			; DCB length followed by DCB
;
; Device identification Block (DIB) - Volume #4
;
DIB_4:		.word	DIB_5			; Link pointer
			.word	Entry			; Entry pointer
			.byte	$08				; Name length byte
			.byte	".FOCUSD5       "; Device name
			.byte	$80				; Active
DIB4_Slot:	.byte	InitialSlot		; Slot number
			.byte	$04				; Unit number
			.byte	DriverType		; Type
			.byte	$10				; Subtype
			.byte	$00				; Filler
DIB4_Blks:	.word	$0000			; # Blocks in device
			.word	DriverMfgr		; Driver manufacturer
			.word	DriverVersion	; Driver version
			.word	$0000			; DCB length followed by DCB
;
; Device identification Block (DIB) - Volume #5
;
DIB_5:		.word	DIB_6			; Link pointer
			.word	Entry			; Entry pointer
			.byte	$08				; Name length byte
			.byte	".FOCUSD6       "; Device name
			.byte	$80				; Active
DIB5_Slot:	.byte	InitialSlot		; Slot number
			.byte	$05				; Unit number
			.byte	DriverType		; Type
			.byte	$10				; Subtype
			.byte	$00				; Filler
DIB5_Blks:	.word	$0000			; # Blocks in device
			.word	DriverMfgr		; Driver manufacturer
			.word	DriverVersion	; Driver version
			.word	$0000			; DCB length followed by DCB
;
; Device identification Block (DIB) - Volume #6
;
DIB_6:		.word	DIB_7			; Link pointer
			.word	Entry			; Entry pointer
			.byte	$08				; Name length byte
			.byte	".FOCUSD7       "; Device name
			.byte	$80				; Active
DIB6_Slot:	.byte	InitialSlot		; Slot number
			.byte	$06				; Unit number
			.byte	DriverType		; Type
			.byte	$10				; Subtype
			.byte	$00				; Filler
DIB6_Blks:	.word	$0000			; # Blocks in device
			.word	DriverMfgr		; Driver manufacturer
			.word	DriverVersion	; Driver version
			.word	$0000			; DCB length followed by DCB
;
; Device identification Block (DIB) - Volume #7
;
DIB_7:		.word	$0000			; Link pointer
			.word	Entry			; Entry pointer
			.byte	$08				; Name length byte
			.byte	".FOCUSD8       "; Device name
			.byte	$80				; Active
DIB7_Slot:	.byte	InitialSlot		; Slot number
			.byte	$07				; Unit number
			.byte	DriverType		; Type
			.byte	$10				; Subtype
			.byte	$00				; Filler
DIB7_Blks:	.word	$0000			; # Blocks in device
			.word	DriverMfgr		; Driver manufacturer
			.word	DriverVersion	; Driver version
			.word	$0000			; DCB length followed by DCB

;------------------------------------
;
; Local storage locations
;
;------------------------------------

LastOP:		.RES	$08, $FF		; Last operation for D_REPEAT calls
SIR_Addr:	.word	SIR_Tbl
SIR_Tbl:	.RES	$05, $00
SIR_Len		=		*-SIR_Tbl
RdBlk_Proc:	.word	$0000
WrBlk_Proc:	.word	$0000
MaxUnits:	.byte	$08				; The maximum number of units
DCB_Idx:	.byte	$00				; DCB 0's blocks
			.byte	DIB1_Blks-DIB0_Blks	; DCB 1's blocks
			.byte	DIB2_Blks-DIB0_Blks	; DCB 2's blocks
			.byte	DIB3_Blks-DIB0_Blks	; DCB 3's blocks
			.byte	DIB4_Blks-DIB0_Blks	; DCB 4's blocks
			.byte	DIB5_Blks-DIB0_Blks	; DCB 5's blocks
			.byte	DIB6_Blks-DIB0_Blks	; DCB 6's blocks
			.byte	DIB7_Blks-DIB0_Blks	; DCB 7's blocks
SigFocus:	.byte	"Parsons Engin."	; Focus card signature in memory
CardIsOK:	.byte	$00				; Have we found the Focus card yet?
LastError:	.byte	$00				; Recent error RC from Focus
StatusBlks:	.word	$0000			; Temp storage for number of blocks

;
; Storage items from Focus ROM
;

; Simulate screen holes
SH478:			.res	$08
SH4F8:			.res	$08
SH578:			.res	$08
SH5F8:			.res	$08
SH678:			.res	$08
SH6F8:			.res	$08
SH778:			.res	$08
SH7F8:			.res	$08

; Pointers to screen holes (minus MSlot indexes)
CheckSum1		= SH478-$C0				; Check for word so I may set up my variables
DriveType		= SH4F8-$C0				; Number of sectors per cylinder
CurPart			= SH578-$C0				; Current partition #
PartLo1			= SH5F8-$C0				; Partition start block
PartMd1			= SH678-$C0				;    wait for it...
PartHi1			= SH6F8-$C0				;    24 bit!
MaxPart			= SH778-$C0				; Maximum number of partitions
WritePro		= MaxPart				; 1XXXXXXX=Write protected
DriveUnit		= MaxPart				; X1XXXXXX=Outer drive
CheckSum2		= SH7F8-$C0				; Partition table checksum

; Temps
PartSizeLo:		.byte	$00
PartSizeMid:	.byte	$00
PartSizeHi:		.byte	$00
SmartFlag:		.byte	$00
ColdTries:		.byte	$00
MSlot16:		.byte	$00
MSlot:			.byte	$00				; Set with current slot ($C1/$C4)

;------------------------------------
;
; Driver request handlers
;
;------------------------------------

Entry:
			lda		DIB0_Slot			; Slot we're in (all DIBx_Slot values are the same)
			jsr		SELC800				; Turn on C800 ROM space from our slot
			lda		SOS_Unit
			jsr		GoSlow
			jsr		Dispatch			; Call the dispatcher
			jsr		GoFast
			ldx		SOS_Unit			; Get drive number for this unit
			lda		ReqCode				; Keep request around for D_REPEAT
			sta		LastOP,x			; Keep track of last operation
			lda		#$00
			jsr		SELC800				; Unselect C800 ROM space
			rts

;
; The Dispatcher.  Note that if we came in on a D_INIT call,
; we do a branch to Dispatch normally.  
; Dispatch is called as a subroutine!
;
DoTable:	.word	DRead-1				; 0 Read request
			.word	DWrite-1			; 1 Write request
			.word	DStatus-1			; 2 Status request
			.word	DControl-1			; 3 Control request
			.word	BadReq-1			; 4 Unused
			.word	BadReq-1			; 5 Unused
			.word	BadOp-1				; 6 Open - valid for character devices
			.word	BadOp-1				; 7 Close - valid for character devices
			.word	DInit-1				; 8 Init request
			.word	DRepeat-1			; 9 Repeat last read or write request
Dispatch:	SWITCH	ReqCode,9,DoTable	; Serve the request

;
; Dispatch errors
;
BadReq:		lda		#XREQCODE			; Bad request code!
			jsr		SysErr				; Return to SOS with error in A
BadOp:		lda		#XBADOP				; Invalid operation!
			jsr		SysErr				; Return to SOS with error in A

;
; D_REPEAT - repeat the last D_READ or D_WRITE call
;
DRepeat:	ldx		SOS_Unit
			lda		LastOP,x			; Recall the last thing we did
			cmp		#$02				; Looking for operation < 2
			bcs		BadOp				; Can only repeat a read or write
			sta		ReqCode
			jmp		Dispatch

NoDevice:	lda		#XDNFERR			; Device not found
			jsr		SysErr				; Return to SOS with error in A

;
; D_INIT call processing - called once each for all volumes.
;
DInit:
			lda		SOS_Unit			; Check if we're initting the 7th unit
			cmp		#$07
			bne		UnitStatus			; No - then skip the signature check

CheckSig:	lda		#$08				; Prepare MSlot16 slot address calculation
			clc
			adc		DIB0_Slot			; A is now $08+slot#
			asl
			asl
			asl
			asl							; A is now $80+(slot#*16) in the high nibble, $0 in low
			clc
			adc		#$0F				; A is now $9F through $CF depending on slot
			sta		MSlot16				; Hang on to this for MSlot16 math
			lda		#$C0				; Form a $CsED address, where s = slot #
			ora		DIB0_Slot			; Add in slot number
			sta		Count+1
			sta		MSlot				; Hang on to this for MSlot math
			lda		#$ED				; $CxED is where "Parsons Engin." string lives
			sta		Count
			ldy		#$0D
@1:			lda		(Count),y
			cmp		SigFocus,y			; Check for 'Parsons Engin.' signature in our slot
			bne		NoDevice			; No device if all bytes don't match
			dey
			bpl		@1

			lda		DIB0_Slot			; Found a Focus!
			ora		#$10				; SIR = $10+slot#
			sta		SIR_Tbl
			sta		CardIsOK			; Remember that we found the card
			lda		#SIR_Len
			ldx		SIR_Addr
			ldy		SIR_Addr+1
			jsr		AllocSIR			; Claim SIR
			bcs		NoDevice
			
			lda		#$00				; Status
			sta		ProCommand			; Command for Focus
			jsr		InitDrive			; Hit the hardware
			bcs		NoDevice

UnitStatus:
			lda		#$00				; 0=status
			sta		ProCommand
			sta		ProBlock
			sta		ProBlock+1
			sta		ProBlock+2
;			jsr		DoBlockCommand		; 4 bytes come back: status and 3 block size bytes
;			bcs		NoDevice			; Error with Focus call

;			ldy		#$00				; Communicate out status call
;			lda		(ProBuffer),y		; Status byte
;			iny
;			lda		(ProBuffer),y		; Blocks lo
;			sta		StatusBlks
;			iny
;			lda		(ProBuffer),y		; Blocks med
;			sta		StatusBlks+1
;			ldx		SOS_Unit			; Copy size to DIB
;			ldy		DCB_Idx,x
;			lda		StatusBlks
;			sta		DIB0_Blks,y
;			lda		StatusBlks+1
;			sta		DIB0_Blks+1,y
DInitDone:
			clc
			rts

;
; D_READ call processing
;
DRead:
			lda		CardIsOK			; Did we previously find a card?
			bne		DReadGo
			jmp		NoDevice			; If not... then bail
DReadGo:
			jsr		CkCnt				; Checks for validity, aborts if not
			jsr		CkUnit				; Checks for unit below unit max
			jsr		InitDrive
			lda		#$00				; Zero # bytes read
			sta		Count				; Local count of bytes read
			sta		Count+1
			sta		ProBlock+2
			tay
			sta		(QtyRead),y			; Userland count of bytes read
			iny
			sta		(QtyRead),y			; Msb of userland bytes read
			lda		Num_Blks			; Check for block count greater than zero
			ora		Num_Blks+1
			beq		ReadExit
			jsr		FixUp				; Correct for addressing anomalies
			lda		#$01				; 1=read
			sta		ProCommand
			lda		SosBlk
			sta		ProBlock
			lda		SosBlk+1
			sta		ProBlock+1
			jsr		ReadBlock
			ldy		#$00
			lda		Count				; Local count of bytes read
			sta		(QtyRead),y			; Update # of bytes actually read
			iny
			lda		Count+1
			sta		(QtyRead),y
ReadExit:
			rts							; Exit read routines

;
; D_WRITE call processing
;
DWrite:
;			lda		CardIsOK			; Did we previously find a card?
;			bne		DWriteGo
			jmp		NoDevice			; If not... then bail
			
DWriteGo:
WriteExit:
			sec							; hard error
			rts

;
; D_STATUS call processing
;  $00 = Driver Status
;  $FE = Return preferrred bitmap location ($FFFF)
;
DStatus:
			sec
			jmp		NoDevice			; If not... then bail

;
; D_CONTROL call processing
;  $00 = Reset device
;  $FE = Perform media formatting
;
DControl:
			sec
			jmp		NoDevice			; If not... then bail

;------------------------------------
;
; Utility routines
;
;------------------------------------

;
; Check ReqCnt to ensure it is a multiple of 512.
;
CkCnt:		lda		ReqCnt				; Look at the lsb of bytes requested
			bne		@1					; No good!  lsb should be 00
			sta		Num_Blks+1			; Zero out the high byte of blocks
			lda		ReqCnt+1			; Look at the msb
			lsr		A					; Put bottom bit into carry, 0 into top
			sta		Num_Blks			; Convert bytes to number of blks to xfer
			bcc		CvtBlk				; Carry is set from LSR to mark error.
@1:			lda		#XBYTECNT
			jsr		SysErr				; Return to SOS with error in A

;
; Test for valid block number; abort on error
;
CvtBlk:		ldx		SOS_Unit
			ldy		DCB_Idx,x
			sec
			lda		DIB0_Blks+1,y		; Blocks on unit msb
			sbc		SosBlk+1			; User requested block number msb
			bvs		BlkErr				; Not enough blocks on device for request
			beq		@1					; Equal msb; check lsb.
			rts							; Greater msb; we're ok.
@1:			lda		DIB0_Blks,y			; Blocks on unit lsb
			sbc		SosBlk				; User requested block number lsb
			bvs		BlkErr				; Not enough blocks on device for request
			rts							; Equal or greater msb; we're ok.
BlkErr:		lda		#XBLKNUM
			jsr		SysErr				; Return to SOS with error in A

;
; Fix up the buffer pointer to correct for addressing
; anomalies.  We just need to do the initial checking
; for two cases:
; 00xx bank N -> 80xx bank N-1
; 20xx bank 8F if N was 0
; FDxx bank N -> 7Dxx bank N+1
; If pointer is adjusted, return with carry set
;
FixUp:		lda		ProBuffer+1			; Look at msb
			beq		@1					; That's one!
			cmp		#$FD				; Is it the other one?
			bcs		@2					; Yep. fix it!
			rts							; Pointer unchanged, return carry clear.
@1:			lda		#$80				; 00xx -> 80xx
			sta		ProBuffer+1
			dec		ProBuffer+ExtPG		; Bank N -> band N-1
			lda		ProBuffer+ExtPG		; See if it was bank 0
			cmp		#$7F				; (80) before the DEC.
			bne		@3					; Nope! all fixed.
			lda		#$20				; If it was, change both
			sta		ProBuffer+1			; Msb of address and
			lda		#$8F
			sta		ProBuffer+ExtPG		; Bank number for bank 8F
			rts							; Return carry set
@2:			and		#$7F				; Strip off high bit
			sta		ProBuffer+1			; FDxx ->7Dxx
			INC		ProBuffer+ExtPG		; Bank N -> bank N+1
@3:			rts							; Return carry set

CkUnit:		lda		SOS_Unit			; Checks for unit below unit max
			cmp		MaxUnits
			bmi		UnitOk
NoUnit:		lda		XBADDNUM			; Report no unit to SOS
			jsr		SysErr
UnitOk:		clc
			rts

;
; Throttle back to 1 MHz
;
GoSlow:		pha
			php
			sei
			lda		EReg
			ora		#$80
			sta		EReg
			plp
			pla
			rts

;
; Throttle up to 2 MHz
;
CGoFast:	clc
GoFast:		pha
			php
			sei
			lda		EReg
			and		#$7F
			sta		EReg
			plp
			pla
			rts

;
; Gorp copied from ROM
;

DriveCount:
			.word   $0012
DSectors:
			.word   $001B,$001B,$001B,$0021
			.word   $0021,$0021,$0021,$001F
			.word   $002B,$0011,$0011,$0018
			.word   $0011,$0026,$002B,$002B
			.word   $0023,$0026
DHeads: .word   $0004,$0003,$0002,$0002
			.word   $0004,$0006,$0008,$0004
			.word   $0002,$0004,$0005,$0004
			.word   $0005,$0004,$0004,$0004
			.word   $0003,$0008
DCylinders:
			.word   $030E,$030E,$030E,$0536
			.word   $0536,$0536,$0536,$029E
			.word   $03D1,$0266,$FFFF,$0368
			.word   $03D1,$0223,$03D1,$03CD
			.word   $0317,$0224
DPark:  .word   $035D,$035D,$035D,$0537
			.word   $0537,$0537,$0537,$029E
			.word   $03DE,$0276,$FFFF,$0369
			.word   $03D4,$0228,$03DE,$03DE
			.word   $0320,$0224
DHeadCyl:
			.word   $006C,$0051,$0036,$0042
			.word   $0084,$00C6,$0108,$007C
			.word   $0056,$0044,$0055,$0060
			.word   $0055,$0098,$00AC,$00AC
			.word   $0069,$0130

InvalidCommand:
			lda     #$01
			rts

WaitDataOut:
WaitDataIn:
        lda     #$08
        bne     DoCheck
        lda     #$00
DoCheck:sta     OkFlag
        lda     #$00
        sta     Temp
        lda     #$F1
        sta     Temp+1
        ldx     MSlot16
@B:     ldy     #$00
@A:     lda     ATStatus,x
        and     #$88
        cmp     OkFlag
        beq     OK1
        iny
        bne     @A
        inc     Temp
        bne     @B
        inc     Temp+1
        bne     @B
        sec
        rts

OK1:    clc
        rts

InitDrive:
			ldx     MSlot
			lda     ProCommand
			beq     Bad
			cmp     #$03
			beq     Bad
			lda     #$E6
			cmp     CheckSum1,x
;
;			bne     Bad
			jmp		Bad				; Debug: always invalidate
;
			clc
			adc     DriveType,x
			clc
			adc     CurPart,x
			clc
			adc     PartLo1,x
			clc
			adc     PartMd1,x
			clc
			adc     PartHi1,x
			clc
			adc     MaxPart,x
			cmp     CheckSum2,x
			bne     Bad
			lda     SOS_Unit
			bne     CC
			lda     #$01
CC:			sbc     #$01
			cmp     CurPart,x
			beq     OK2
Bad:		jsr     SetUpDefaults
			ldx     MSlot
			bcs     Err2
			lda     #$E6
			sta     CheckSum1,x
			clc
			adc     DriveType,x
			clc
			adc     CurPart,x
			clc
			adc     PartLo1,x
			clc
			adc     PartMd1,x
			clc
			adc     PartHi1,x
			clc
			adc     MaxPart,x
			sta     CheckSum2,x
OK2:
			lda     #$00
			clc
			rts

Err2:		pha
			lda     #$00
			sta     CheckSum1,x
			tax
			tay
			pla
			sec
LocalRTS:
			rts

SetUpDefaults:
			jsr     ReadPartition
			lda     #$27
			bcs     LocalRTS
			ldx     MSlot16
			lda     ATData16,x
			sta     Track
			lda     ATData16+1,x
			sta     Track+1
			ldy     #$06
			jsr     KillYWords
			ldy     MSlot
			lda     ATData16,x
			lda     ATData16+1,x
			sta     MaxPart,y
			ldy     #$06
			jsr     KillYWords
			ldy     MSlot
			lda     ATData16,x
			asl     a
			sta     DriveType,y
			lda     SOS_Unit
;			bne     CYY
;			lda     #$01
;CYY:		sec
;			sbc     #$01
			sta     Temp
			sta     CurPart,y
			pha
			ldy     #$01
@A:			jsr     KillYWords
			ldy     #$08
			dec     Temp
			bpl     @A
			ldy     MSlot
			lda     ATData16,x
			sta     PartLo1,y
			lda     ATData16+1,x
			sta     PartMd1,y
			lda     ATData16,x
			sta     PartHi1,y
			lda     ATData16+1,x
			lda     ATData16,x
			sta     PartSizeLo
			lda     ATData16+1,x
			sta     PartSizeMid
			lda     ATData16,x
			sta     PartSizeHi
			lda     ATData16,x
			eor     WritePro,y
			and     #$80
			eor     WritePro,y
			sta     WritePro,y
			pla
			sta     Temp
			ldy     #$01
@B:			jsr     KillYWords
			ldy     #$08
			inc     Temp
			lda     Temp
			cmp     #$1E
			bcc     @B
			jsr     WaitStatus
			bcs     Err1
			ldx     Track
			cpx     #$50
			bne     Invalid
			ldx     Track+1
			cpx     #$61
			bne     Invalid
			ldx     MSlot
			ldy     DriveType,x
			ldx     MSlot16
			lda     DHeads,y
			sec
			sbc     #$01
			ora     #$A0
			sta     ATHead,x
			lda     DSectors,y
			sta     ATSectorCount,x
			lda     #$91
			sta     ATCommand,x
			jsr     WaitStatus
			bcs     Err1
			ldx     MSlot
			lda     MaxPart,x
			and     #$3F
			cmp     CurPart,x
			bcs     NoErr2
			lda     #$28
Err1:		rts

NoErr2:		lda     #$00
			clc
			rts

Invalid:	ldx     MSlot
			lda     #$00
			sta     MaxPart,x
			lda     #$28
			sec
			rts

ReadPartition:
			lda     #$02
			sta     RetryCount
ReadIt:		lda     #$00
			sta     Track
			sta     Track+1
			sta     Head
			sta     Sector
			ldx     MSlot
			lda     DriveUnit,x
			and     #$BF
			sta     DriveUnit,x
			jsr     TRYME
			bcc     VERR
			dec     RetryCount
			beq     VERR
			jsr     RecalDrive
			jmp     ReadIt

TRYME:		lda     #$20
			jsr     SendPacket
			jmp     WaitDataIn

VERR:
			rts

RecalDrive:
			ldx     MSlot16
			lda     #$00
			sta     ATReset,x
			lda     #$80
			sta     ATReset,x
			lda     #$10
			jsr     SendPacket
			jmp     WaitStatus

WaitStatus:
			ldx     MSlot16
			ldy     #$00
			sty     Temp
			lda     #$F1
			sta     Temp+1
@A:			lda     ATStatus,x
			bpl     NotBusy
			iny
			bne     @A
			inc     Temp
			bne     @A
			inc     Temp+1
			bne     @A
IOErr:		lda     #$27
			sec
			rts

NotBusy:	and     #$01
			bne     IOErr
			clc
			rts

KillYWords:
			lda     ATStatus,x
			and     #$08
			beq     KillYWords
			lda     ATData16,x
			dey
			bne     KillYWords
			rts

ReadBlock:
WriteBlock:	jsr     FindBlock
			lda     #$04
			sta     RetryCount
OneTry:		lda     ProCommand
			lsr     a
			bcs     DoRead
			ldx     MSlot
			lda     MaxPart,x
			bmi     WriteErr
			jsr     Write1Block
			bcs     Retry
NoErr1:		lda     #$00
			tax
			ldy     #$02
			rts

DoRead:		jsr     Read1Block
			bcc     NoErr1
Retry:		jsr     RecalDrive
			dec     RetryCount
			bne     OneTry
IOError:	lda     #$27
			.byte   $2C
WriteErr:
			lda     #$2B
			ldx     #$00
			ldy     #$00
			rts

Read1Block:
			lda     #$20
			jsr     SendPacket
			jsr     WaitDataIn
			bcs     OhWell
			ldx     MSlot16
			ldy     #$00
@1:			lda     ATData16,x
			sta     (ProBuffer),y
			iny
			lda     ATData16+1,x
			sta     (ProBuffer),y
			iny
			bne     @1
			inc     ProBuffer+1
@2:			lda     ATData16,x
			sta     (ProBuffer),y
			iny
			lda     ATData16+1,x
			sta     (ProBuffer),y
			iny
			bne     @2
			dec     ProBuffer+1
			jmp     WaitStatus

OhWell:		sec
			rts

Write1Block:
			lda     #$30
			jsr     SendPacket
			jsr     WaitDataIn
			lda     #$CB
			pha
			lda     #$17
			pha
			lda     MSlot
			pha
			lda     #$CD
			pha
			ldy     #$00
			rts

SendPacket:
        pha
        ldx     MSlot16
        lda     Head
        ora     #$A0
        sta     ATHead,x
        lda     #$01
        sta     ATSectorCount,x
        clc
        adc     Sector
        sta     ATSectorNumber,x
        lda     Track
        sta     ATCylL,x
        lda     Track+1
        sta     ATCylH,x
        pla
        sta     ATCommand,x
        rts

;
; Locate the drive block number given MSlot, ProBlock(+1+2)
; Sets Track, Sector, Head
;
FindBlock:
			ldy     MSlot
			clc
			lda     PartLo1,y
			adc     ProBlock
			sta     Track
			lda     PartMd1,y
			adc     ProBlock+1
			sta     Track+1
			lda     PartHi1,y
			adc     ProBlock+2
			sta     Track+2
			ldy     MSlot
			ldx     DriveType,y
			lda     DHeadCyl,x
			sta     Head
			lda     DHeadCyl+1,x
			sta     Sector
			ldx     #$00
			stx     Temp
			stx     Temp+1
			ldy     #$18
			lda     Track+2
			bne     Do24Bit
			lda     Track+1
			beq     Do8Bit
			sta     Track+2
			lda     Track
			sta     Track+1
			ldy     #$10
			bne     Do16Bit
Do8Bit:		lda     Track
			sta     Track+2
			ldy     #$08
			stx     Track+1
Do16Bit:	stx     Track
Do24Bit:	asl     Track
			rol     Track+1
			rol     Track+2
			rol     Temp
			rol     Temp+1
			sec
			lda     Temp
			sbc     Head
			tax
			lda     Temp+1
			sbc     Sector
			bcc     @A
			stx     Temp
			sta     Temp+1
			inc     Track
@A:			dey
			bne     Do24Bit
			sty     Head
			ldy     MSlot
			ldx     DriveType,y
@B:			sec
			lda     Temp
			sbc     DSectors,x
			tay
			lda     Temp+1
			sbc     DSectors+1,x
			bcc     CF
			sty     Temp
			sta     Temp+1
			inc     Head
			bne     @B
CF:			lda     Temp
			sta     Sector
			rts

			.ENDPROC
			.END