;CFutil0
;         .TITLE    "APPLE /// FOCUS DRIVE UTILITY  Ver 1.26B"

                .feature labels_without_colons
                .setcpu "6502"
                .reloc

                    ;Equates:
CODELOAD  :=        $7B00          ;loading address for this interpreter

                    ;Display Message Index #1 Equates
MSGWIND   :=        $00            ;Message window
TITLE     :=        $01            ;Program title
CLRMSG    :=        $02            ;Clear message
VIEWPORT  :=        $03            ;Display viewport window
VERSION   :=        $04            ;Version number display
MENU0     :=        $05            ;Main Menu
ESC0      :=        $06            ;Escape Message for Main Menu
DATE      :=        $07            ;Date Display
CLRVPORT  :=        $08            ;Clear viewport screen
BORDER    :=        $09            ;Viewport border
DRVHEDR   :=        $0A            ;drive header display
DWINDMSG  :=        $0B            ;drive select window
NODRIVE   :=        $0C            ;no drives message
CmpltMsg  :=        $0D            ;Complete message
CMDLINE   :=        $0E            ;command line window
DLEADER   :=        $0F            ;Display prefix for driver name list
ESC2      :=        $10            ;escape message for drivename select
PROMPT0   :=        $11            ;Lower display window
LFMTCMD   :=        $12            ;Lowlevel format command display
VRFYCMD   :=        $13            ;Verify drive command display
PARTCMD   :=        $14            ;Partition drive command display
TESTCMD   :=        $15            ;Test IFC command display
LSTDRCMD  :=        $16            ;Select drive command display
GASGAUGE  :=        $17            ;Gas gage display
PROGBAR   :=        $18            ;Progress bar for gas gage
No_LBA    :=        $19            ;No LBA support message
BLKBAD2   :=        $1A            ;Trailer for bad block message
VFYHLTD   :=        $1B            ;Verification Aborted message
FMTHLTD   :=        $1C            ;Lowlevel Format Aborted message
NUMERRS   :=        $1D            ;Number of Errors
BeepNclr  :=        $1E            ;Beep and clear line
FWARNING  :=        $1F            ;format warning message
ESC3      :=        $20            ;escape message for format routine
FMTMSG    :=        $21            ;format message
CURSER    :=        $22            ;move curser to x,y location
PTBLMSG   :=        $23            ;partition table update prompt
UPDATMSG  :=        $24            ;updating drive message
UPDATERR  :=        $25            ;error message updating drive
CREADATE  :=        $26            ;display created date
LMODDATE  :=        $27            ;display modified date
TestER00  :=        $28            ;Diagnostic error $00 message
TestER01  :=        $29            ;Diagnostic error $01 message
TestER02  :=        $2A            ;Diagnostic error $02 message
TestER03  :=        $2B            ;Diagnostic error $03 message
TestER04  :=        $2C            ;Diagnostic error $04 message
TestER05  :=        $2D            ;Diagnostic error $05 message
TestER8x  :=        $2E            ;Diagnostic error $8x message
FMTDONE   :=        $2F            ;format complete message
OCCUR     :=        $30            ;errors occurred message
ESC5      :=        $31            ;escape message to interupt verifying
VFYHALT   :=        $32            ;verification halted message
BLOCKBAD  :=        $33            ;current verify block is bad message
VFYCOMP   :=        $34            ;drive verification complete message
TESTLST   :=        $35            ;test IFC list of parameters
TESTCOMP  :=        $36            ;diagnostic testing complete message
PARTHDR   :=        $37            ;Primary Partition display header
PTMENU1   :=        $38            ;Partition information display = Part 1
BLOCKS    :=        $39            ;blocks trailing message for rem cap
ESC6      :=        $3A            ;escape message for partition editor
HFMT0MSG  :=        $3B            ;format partition prompt message
HFMT1MSG  :=        $3C            ;format partition default curser
DIRERR    :=        $3D            ;error formatting vol message
HFMTCMP   :=        $3E            ;format successfull message
PRANYKEY  :=        $3F            ;press any key addon message
DASH      :=        $40            ;space dash space text
DRVNCONT  :=        $41            ;drive not connected message
VIEWPOS   :=        $42            ;display viewport with vert positioning
PTWARN1   :=        $43            ;partition change warning msg leader
PTWARN2   :=        $44            ;partition change warning msg trailer
PTOVLAP   :=        $45            ;warning about partition overlaps
RE_EDIT   :=        $46            ;prompt to re edit partitions
ERASMSG1  :=        $47            ;erase volume message - part 1
ERASMSG2  :=        $48            ;erase volume message - part 2
ESC6A     :=        $49            ;escape/restore message for part editor
COPYRITE  :=        $4A            ;copyright notice message
FESC6     :=        $4B            ;high level format keystroke message
CLRMSGW   :=        $4C            ;clear message window
ESC1B     :=        $4D            ;press any key message
SLOTPOS   :=        $4E            ;Slot display position leader
RBLKS     :=        $4F            ;Remaining capacity header
SEARCH    :=        $50            ;Scan system message
OUTRANG1  :=        $51            ;Input greater than 32767 - out of range
MAXBLOCK  :=        $52            ;Maximum block value message
VRFYMSG   :=        $53            ;Prompt to proceed with drive verification
NOFRMAT   :=        $54            ;Low level format not supported
ERASEPT1  :=        $55            ;Initialize new partition prompt
PTMENU2   :=        $56            ;Partition information display - Part 2
ESC4      :=        $57            ;escape message to interupt formatting
CLRPMPT   :=        $58            ;Clear Prompt area & restore window settings
TCapBlks  :=        $59            ;Total Capacity Display
DEVHDR1   :=        $5A            ;Device information display header #1
DEVHDR2   :=        $5B            ;Device information display header #2
DEVHDR3   :=        $5C            ;Device information display header #3
DEVHDR4   :=        $5D            ;Device information display header #4
DEVHDR5   :=        $5E            ;Device information display header #5
DEVHDR6   :=        $5F            ;Device information display header #6
DEVHDR7   :=        $60            ;Device information display header #7
Model_nx  :=        $61            ;Device model # ascii
Devic_nx  :=        $62            ;Device device # ascii
Seria_nx  :=        $63            ;Device serial # ascii
FirmW_nx  :=        $64            ;Device firmware version ascii
AnsYes    :=        $65            ;Yes message
AnsNo     :=        $66            ;No message
ClrLower  :=        $67            ;Clear viewport below VTPOS
ERASEDRV  :=        $68            ;2nd prompt for lowlevel format
PTReadER  :=        $69            ;Error message can't access partition table
PTNUPD    :=        $6A            ;Partition needs update prior to vol initialization
SelPTNum  :=        $6B            ;Select Partition number to edit prompt
PTSEL     :=        $6C            ;Select Partition number display
PTnoGood  :=        $6D            ;Ascii partition number is no good
DWND2MSG  :=        $6E            ;partition map drive list window
PMAPPOS   :=        $6F            ;Pmap/Slot display position leader
SEL2CMD   :=        $70            ;Change drive configuration command display
PTCHGMSG  :=        $71            ;Select drive to change prompt
ReCalMsg  :=        $72            ;Recalculate partition address message
EDITDEVN  :=        $73            ;Enter an IDE device number prompt
ESC7      :=        $74            ;Escape message #7
NODEVICE  :=        $75            ;IDE device not found at slot
EDITPNUM  :=        $76            ;Enter partition number prompt
SAVEDCFG  :=        $77            ;Save new configuration to driver prompt
LDRVWND   :=        $78            ;List drivers window
ONEASCI   :=        $79            ;One ascii character output
ESC8      :=        $7A            ;escape message for initialize partition
ERASEPT2  :=        $7B            ;prompt to erase all the partitions on the drive
ERASPTDN  :=        $7C            ;message erase all the partitions is complete
BADDVRV   :=        $7D            ;message incorrect driver version
RELISTD   :=        $7E            ;Save driver configuration to proceed
ESC10     :=        $7F            ;escape message for driver configuration selection
BWINDPRT  :=        $80            ;Volume name selection viewport border
BORDER1   :=        $81            ;Volume name selection border
HELPMSG   :=        $82            ;Volume name selection help message
DNHIPRT   :=        $83            ;move down and hilite on
DNLFPRT   :=        $84            ;move down and blank arrow
DNRTPRT   :=        $85            ;move down and right arrow
HIPRT     :=        $86            ;hilite on
LFPRT     :=        $87            ;blank arrow
STDPRT    :=        $88            ;hilite off
RTPRT     :=        $89            ;right arrow
UPHIPRT   :=        $8A            ;move up and hilite on
UPLFPRT   :=        $8B            ;move up and blank arrow
UPRTPRT   :=        $8C            ;move up and right arrow
VolSZerr  :=        $8D            ;volume initialization minimum partition size error

                    ;Zero Page Pointer Equates
ZPGTEMP0  :=        $00
ZPGTEMP1  :=        $01
MLPLIER   :=        $02
PRODUCT   :=        $03            ;3 bytes
MLPCND    :=        $06            ;3 bytes
MENU0SEL  :=        $09
DECPLACE  :=        $0A
TEMPVAL   :=        $0B
TEMPVAL1  :=        $0C
TEMPVAL2  :=        $0D
TEMPVAL3  :=        $0E
TEMPVAL4  :=        $0F
TEMPVAL5  :=        $10
TEMPVAL6  :=        $11
LOCSTAT   :=        $12
BEGTRK    :=        $13            ;3 bytes
ENDTRK    :=        $16            ;3 bytes
BUFFPG0   :=        $19            ;2 bytes
BUFFPG1   :=        $1B            ;2 bytes
STATBUF1  :=        $1D            ;2 bytes
STATBUF2  :=        $1F            ;2 bytes
SCRBUF    :=        $21            ;2 bytes
DNAMEPTR  :=        $23            ;2 bytes
INDEX     :=        $25            ;2 bytes
PARTTBL   :=        $27            ;2 bytes

POSITION  :=        $2A            ;2 bytes
BPERCTR   :=        $2C            ;2 bytes
BCTR      :=        $2E            ;2 bytes
VALSEL    :=        $2E            ;2 bytes
BUFFCALL  :=        $30            ;2 bytes
PartNum   :=        $32            ;PartNum=current partition number $0 to $7
CurVcol   :=        $33            ;CurVcol=current vertical column in table TRK0($0),
                                   ;BLEN0($1), or VOL0($2)
NUMERROR  :=        $34
TEMPINDX  :=        $34
HALTFLAG  :=        $35
ChgMade   :=        $35
CURDRIVE  :=        $36
STACK     :=        $37
ERRCODE   :=        $38
TOTSECT   :=        $39            ;3 bytes  LB,MB,HB
Divisor   :=        $3C
NUMDNAME  :=        $3D            ;2 bytes
DevIDpg0  :=        $3E            ;2 bytes
IBuffHB   :=        $40
MAXPTBLS  :=        $41
CurPTmap  :=        $42            ;Current partition map
PTmapHB   :=        $43            ;HB Sector for current partition map
DEVLSTCT  :=        $44            ;unique device count
PRT_QUE   :=        $45
PICKINDX  :=        $46            ;2 bytes
VOLCOUNT  :=        $48            ;2 bytes
PICKBASE  :=        $4A            ;2 bytes
VOLINDEX  :=        $4C            ;2 bytes

                    ;internal program array tables
DEV0LIST  :=        $50            ;8 bytes ordered list of unique device index from driver
DNUMLST   :=        $58            ;12 bytes
SLOTLST   :=        $64            ;12 bytes
UNUMLST   :=        $70            ;12 bytes
DRVNLST   :=        $7C            ;12 bytes
PNUMLST   :=        $88            ;12 bytes

DfltSzLB  :=        $94            ;LB default starting partition size
P0sizeLB  :=        $95            ;8 bytes LB of partition size

DfltSzHB  :=        $9D            ;HB default starting partition size
P0sizeHB  :=        $9E            ;8 bytes HB of partition size

DfltSTlb  :=        $A6            ;Default Starting Block $01
BegBlkLB  :=        $A7            ;8 bytes

DfltSTmb  :=        $AF            ;default starting block for partition
BegBlkMB  :=        $B0            ;8 bytes

DfltSThb  :=        $B8            ;default starting block for partition
BegBlkHB  :=        $B9            ;8 bytes

EndBlkLB  :=        $C1            ;8 bytes
EndBlkMB  :=        $C9            ;8 bytes
EndBlkHB  :=        $D1            ;8 bytes

PTVALID   :=        $D9            ;8 bytes
EXISTVOL  :=        $E1            ;8 bytes

                    ;Reference address Equates
EXTPG     :=        $1601
EReg      :=        $FFDF          ;enviornment register
BANKREG   :=        $FFEF
MAXDNUM   :=        $18            ;maximum number of system device drivers

                    ; ATA Command Codes
ATA_XErr  :=        $03
ATACRead  :=        $20
ATACWrit  :=        $30
ATA_Vrfy  :=        $40
ATA_Frmt  :=        $50
ATA_Diag  :=        $90
ATAIdent  :=        $EC

                    ;Partition Table Equates
PtChkSum  :=        $00            ;Checksum of partition table bytes $01 thru $FF
PtSIdx    :=        $10            ;Device serial number (20 ascii characters)
PtRevIdx  :=        $24            ;Device firmware revision number (8 ascii characters)
PtModIdx  :=        $2C            ;Device model information (40 ascii characters)
ORIGDATE  :=        $64            ;Date partition was created  (8 bytes)
MODDATE   :=        $6C            ;Date partition was last modified  (8 bytes)
;STBLOCK  :=        $A3,$A8,$B3,$B8,$C3,$C8,$D3,$D8
;VOLSIZE  :=        $A6,$AB,$B6,$BB,$C6,$CB,$D6,$DB

                    ;Keystroke Equates
LFARROW   :=        $08
TAB       :=        $09
DNARROW   :=        $0A
UPARROW   :=        $0B
RETURN    :=        $0D
RTARROW   :=        $15
ESCAPE    :=        $1B
SPACE     :=        $20
Ascii_N   :=        $4E
Ascii_Y   :=        $59
OAPL_UP   :=        $8B            ;Open Apple - Up Arrow
OAPL_QM   :=        $BF            ;Open Apple - Question Mark
OAPPLE_F  :=        $C6            ;Open Apple - F
OAPPLE_P  :=        $D0            ;Open Apple - P
OAPPLE_R  :=        $D2            ;Open Apple - R
OAPPLE_S  :=        $D3            ;Open Apple - S

                    ;Miscellaneous equates
FLSHTYPE  :=        $05            ;Console control/status code for screen mode
MaxSelNo  :=        $0E            ;maximum number of volume name entries displayed

                    ;Partition variable index equates
TRK0      :=        $00            ;Beginning block # for this partition
BLEN0     :=        $01            ;Size of partition in blocks
VOL0      :=        $02            ;Volume name of this partition

                    ;Parameter block specific to current SOS request
ATA_Cmd   :=        $00
Sect_HB   :=        $01
Sect_MB   :=        $02
Sect_LB   :=        $03
Num_Blks  :=        $04

                    ;Device Identification Data Index Equates
SerIdx    :=        $14
RevisIdx  :=        $2E
ModelIdx  :=        $36
LBAidx    :=        $63
CapacIdx  :=        $72
SerLen    :=        $13
RevisLen  :=        $07
ModelLen  :=        $27
LBAlen    :=        $01
CapacLen  :=        $02
CFsetIdx  :=        $A6


;******************* Interpreter Entry and Data Buffers **********************

;         .ABSOLUTE
;         .PROC     SOSNTRP
          .ORG      CODELOAD-14
          .byte     "SOS NTRP"
          .WORD     $0000
          .WORD     CODELOAD
          .WORD     CODELEN
          JMP       BEGIN


                    ;Data Buffers
CHR       .BYTE     $00
INPUT     .BYTE     $00
DRIVNUM   .BYTE     $00
DCFGNUM   .BYTE     $00

DINFO     .BYTE     $04
DNUM      .BYTE     $00
DNAME     .WORD     DNAMEPTR
DINFOLST  .WORD     SLOTNUM
          .BYTE     $09
SLOTNUM   .BYTE     $00
UNITNUM   .BYTE     $00
DEVTYPE   .BYTE     $D1
SUBTYPE   .res      $04,$00
MANUFID   .BYTE     $4A,$44

TIMEDATE  .BYTE     $01
          .WORD     YEAR

YEAR      .res      $04,$00
MONTH     .WORD     $00
DAY       .WORD     $00
WEEK      .BYTE     $00
HOUR      .WORD     $00
MIN       .WORD     $00
SECOND    .res      $05,$00

MMONTHS   .byte     "JanFebMarAprMayJunJulAugSepOctNovDec"

DATEDISP  .BYTE     $01,$1A,$42,$01
          .byte     "Jan 31, 2003"
          .BYTE     $04

MODE_ID   .BYTE     $00
                    ;$01=device does not support either CFA feature set or LBA mode
                    ;$02=device supports LBA mode and CFA feature set
                    ;$03=device supports LBA mode but doesn't support CFA feature set

MULTPCND  .BYTE     $0A,$00,$00    ;10
          .BYTE     $64,$00,$00    ;100
          .BYTE     $E8,$03,$00    ;1000
          .BYTE     $10,$27,$00    ;10000
          .BYTE     $A0,$86,$01    ;100000
          .BYTE     $40,$42,$0F    ;1000000  LSB,MSB,HSB

UNFMTTXT  .byte     "UNFORMATTED"
UFTXTLEN  :=        *-UNFMTTXT

UNDEFINE  .byte     "UNDEFINED"
UNDEFLEN  :=        *-UNDEFINE

BLANK01   .byte     "PARTITIONX"
BLTXTLEN  :=        *-BLANK01

BITINDEX  .BYTE     $FF,$7F,$3F,$1F,$0F,$07,$03,$01
          .BYTE     $00

DEV_ID    .BYTE     $D1,$10,$4A,$44    ;Device ID for CF/Ide driver

Status    .BYTE     $00            ;Device status byte when error occurred
Err_Data  .res      $05,$00
                    ;Err_Data - byte $0 = error code
                    ;   Bit 7 = BBK bad block has been detected
                    ;   Bit 6 = UNC uncorrectable error was encountered
                    ;   Bit 5 = $ (undefined)
                    ;   Bit 4 = IDNF requested block ID is in error or cannot be found
                    ;   Bit 3 = $ (undefined)
                    ;   Bit 2 = ABRT command was aborted or an invalid command
                    ;   Bit 1 = $ (undefined)
                    ;   Bit $ = AMNF general error
                    ;Err_Data - byte $1 thru $3 = block # (LB, MB, & HB)
                    ;Err_Data - byte $4 = # of blocks left to complete command

                    ;SOS Call Blocks
CONSOLE   .BYTE     $08
          .byte     ".CONSOLE"

READCON   .BYTE     $04
CONREF    .BYTE     $00
          .WORD     INPUT
          .WORD     $01
          .WORD     $00

RELSEG    .BYTE     $01
RELNUM    .BYTE     $00

RESCR     .BYTE     $03
CTRLREF3  .BYTE     $00,$12
          .WORD     SCRBUF

CLOSLIST  .BYTE     $01
CLOSREF   .BYTE     $00

SETFONT1  .BYTE     $03
SREF1     .BYTE     $00,$11
          .WORD     FONT1

SETFONT2  .BYTE     $03
SREF2     .BYTE     $00,$11
          .WORD     FONT2

FINDSEG   .BYTE     $06,$00,$11
PAGES     .WORD     $3B            ;59 pages of memory required
BASE      .res      $04,$00
SEGNUM    .BYTE     $00

WRITCHR   .BYTE     $03
PRTREF1   .BYTE     $00
          .WORD     CHR
          .WORD     $01

WRITINDX  .BYTE     $03
PRTREF2   .BYTE     $00
          .WORD     INDEX
PRTLEN1   .WORD     $00

WRITDNAM  .BYTE     $03
PRTREF3   .BYTE     $00
          .WORD     DNAMEPTR
PRTLEN2   .WORD     $00

DIBinfo   .BYTE     $03
SDNUM1    .BYTE     $00,$04        ;Driver Configuration Bytes
          .WORD     DRIVNUM

DevIdent  .BYTE     $03
SDNUM2    .BYTE     $00,$01        ;Device Indentification
          .WORD     DevIDpg0

BUFFCTRL  .BYTE     $03
CALLREF1  .BYTE     $00,$01        ;Device UserIO Call
          .WORD     BUFFCALL

ERRSTAT   .BYTE     $03
CALLREF2  .BYTE     $00,$02        ;Device Error Information
          .WORD     Status

DFMTCALL  .BYTE     $03
DFMTREF   .BYTE     $00,$FE
          .WORD     SCRBUF

DEVCALL   .BYTE     $02
          .WORD     CONSOLE
DEVNUM    .BYTE     $00

CONSTAT   .BYTE     $03
STATREF1  .BYTE     $00,$01
          .WORD     STATBUF1

RESETCON  .BYTE     $03
CTRLREF2  .BYTE     $00,$01
          .WORD     STATBUF2

CTRLCALL  .BYTE     $03
CTRLREF1  .BYTE     $00
CTRLCODE  .BYTE     $00
          .WORD     SCRBUF

ATTNEVNT  .BYTE     $03
STATREF2  .BYTE     $00,$06
          .WORD     ATTNBUFF

OPENCON   .BYTE     $04
          .WORD     CONSOLE
CONREFN   .res      $04,$00

ATTNBUFF  .BYTE     $80            ;Priority
          .BYTE     $02            ;Event ID
          .WORD     ESCHDLR        ;Event handler address
EVHDLRXB  .BYTE     $00            ;Event handler bank
          .BYTE     $1B            ;Attention character - ESCAPE

WRITPICK  .BYTE     $03
PRTREF4   .BYTE     $00
          .WORD     PICKINDX
PRTLEN3   .WORD     $10

                    ;Screen output windows & display messages
MWINDOW   .BYTE     $06,$01,$1A,$4D,$14,$03,$18,$01
          .BYTE     $02
MWINDEND  :=        *

CLRMSGS   .BYTE     $1E,$04
CLRMSEND  :=        *

PPROMPT0  .BYTE     $06,$01,$1A,$00,$16,$1D
PRMP0END  :=        *
          .BYTE     $04
CPMPEND   :=        *

CNOTICE   .BYTE     $06,$01,$1A,$18,$01
          .byte     "Copyright 2003-2010 Dale S. Jackson"
          .BYTE     $04
CNOTEND   :=        *

DRVHDR    .BYTE     $01,$1A,$37,$01,$1F
          .byte     "DRIVE: "
DRVHDEND  :=        *

DWINDOW0  .BYTE     $1A,$1E,$00
          .byte     " DRIVES ONLINE"
          .BYTE     $1A,$16
DWINDULC  .BYTE     $02,$02
          .byte     "Drive Name        Slot  Device"
          .BYTE     $0A,$0D
          .byte     "==========        ====  ======"
          .BYTE     $0A,$0D,$02
DWINDEND  :=        *

SLOTLDR   .BYTE     $18,$14
SLOTVAL   .BYTE     $00,$18,$1A
DRVNVAL   .BYTE     $00
SLDREND   :=        *

NODRVS    .BYTE     $1A,$13,$07
          .byte     "There are no drivers present in the system"
NODRVEND  :=        *

DRVLEADR  .BYTE     $1A,$00
DRVPOS    .BYTE     $00,$11
DLDREND   :=        *

FMTCOMP   .byte     "Lowlevel Format Complete - "
FMTCMEND  :=        *

FMTHALTD  .byte     "Lowlevel Format Aborted - "
FMTHMEND  :=        *

FMTCMP2   .byte     "Drive Format Complete - "
FMTC2END  :=        *

BTRKHDR   .byte     "Block "
BADSECT   .res      $08,$20
BTRKTLR   .byte     " is bad"
BTRKHEND  :=        *

VFYCMPLT  .BYTE     $0A,$0D
          .byte     "Drive Media Verification Complete - "
VFYCMEND  :=        *

NVFYERR   .res      $04,$00

VFYHALTD  .BYTE     $0A,$0D
          .byte     "Drive Media Verification Aborted - "
VFYHMEND  :=        *

EESC0     .BYTE     $1E,$18,$0D,$12
          .byte     "Press:"
          .BYTE     $11,$20,$8C,$20,$8B
          .byte     " Scroll Up/Down, Letter or RETURN to Select"
          .BYTE     $04
EESC0END  :=        *

EESC1B    .BYTE     $1E,$18,$18
EESC1A    .BYTE     $12
          .byte     "Press:"
          .BYTE     $11
          .byte     " ANY KEY to continue"
          .BYTE     $04
EESC1END  :=        *

EESC2     .BYTE     $1E,$12
          .byte     "Press:"
          .BYTE     $11,$20,$8C,$20,$8B
          .byte     " Scroll Up/Down, RETURN to accept, ESCAPE"
          .byte     " to exit to Main Menu"
          .BYTE     $04
EESC2END  :=        *

EESC3     .BYTE     $1E,$12
          .byte     "Press:"
          .BYTE     $11,$20,$7F
          .byte     "-F to lowlevel format drive, "
          .BYTE     $7F
          .byte     "-P to format a partition, ESC to exit"
          .BYTE     $04
EESC3END  :=        *

EESC4     .BYTE     $1E,$18,$13,$12
          .byte     "Press:"
          .BYTE     $11
          .byte     " ESCAPE to Halt Lowlevel Format"
          .BYTE     $04
EESC4END  :=        *

EESC5     .BYTE     $1E,$18,$14,$12
          .byte     "Press:"
          .BYTE     $11
          .byte     " ESCAPE to Halt Verification"
          .BYTE     $04
EESC5END  :=        *

FEESC6    .BYTE     $18,$01,$7F
          .byte     "-R to Sequentially recalculate the partition "
          .byte     "start from current to last,"
          .BYTE     $0A,$18,$01,$7F
          .byte     "-S to Save the partition table, "
          .BYTE     $7F
          .byte     "-F to Initialize the partition volume"
          .BYTE     $04
FESC6END  :=        *

EESC6     .BYTE     $1E,$12
          .byte     "Press:"
          .BYTE     $11,$20,$8C,$20,$8B
          .byte     " Scroll Up/Down, RETURN/TAB to select,"
          .byte     " ESCAPE to exit to Main Menu"
          .BYTE     $04
EESC6END  :=        *

EESC6A    .BYTE     $1E,$12
          .byte     "Press:"
          .BYTE     $11,$20,$8C,$20,$8B
          .byte     " Scroll Up/Down, RETURN/TAB to select,"
          .byte     " ESCAPE to restore entry"
          .BYTE     $04
ESC6AEND  :=        *

EESC8     .BYTE     $1E,$12
          .byte     "Press:"
          .BYTE     $11
          .byte     " RETURN to select/accept, ESCAPE"
          .byte     " to exit to Main Menu"
          .BYTE     $04
EESC8END  :=        *

EESC10    .BYTE     $1E,$12
          .byte     "Press:"
          .BYTE     $11,$20,$7F,$8C
          .byte     " Volume Select, "
          .BYTE     $8B,$20,$8C
          .byte     " - Scroll, RETURN - accept, ESCAPE"
          .byte     " - Main Menu"
          .BYTE     $04
ESC10END  :=        *

VFYSTOP   .BYTE     $1E
          .byte     "Program Execution Halted    "
          .BYTE     $12
          .byte     "Press:"
          .BYTE     $11
          .byte     " SPACE to resume, ESCAPE to abort"
VFYSTEND  :=        *

ERROCCUR  .byte     " errors occurred"
          .BYTE     $0A,$0D
OCCUREND  :=        *

VOLSZMIN  .byte     $07,$12
          .byte     "ERROR:"
          .byte     $11
          .byte     " Partition size must be at least 8 blocks to initialize a volume"
VOLSZEND  :=        *

ERASVOL1  .BYTE     $1E,$07,$12
          .byte     "WARNING:"
          .BYTE     $11
          .byte     " Contents of the volume "
ERASEND1  :=        *
PNAME2    .res      $0F,$00

ERASVOL2  .byte     " will be erased"
ERASEND2  :=        *

UDATERR   .BYTE     $07,$12
          .byte     "ERROR:"
          .BYTE     $11
          .byte     " writing partition table parameters to drive"
UDATEREN  :=        *

PTRDERR   .BYTE     $07,$12
          .byte     "ERROR:"
          .BYTE     $11
          .byte     " Unable to access partition table on this drive"
PTRDEREN  :=        *

CURSEPOS  .BYTE     $06,$1A
SCRHPVP   .BYTE     $00,$00,$05
CURSEND   :=        *

DWINDOW2  .BYTE     $1A,$1E,$00
          .byte     "DRIVERS ONLINE"
          .BYTE     $1A,$07
DWND2ULC  .BYTE     $02,$02

          .byte     "                          IDE      Partition      Partition"
          .BYTE     $0A,$0D
          .byte     "  Driver Name     Slot   Device  Table    No.    Volume Status"
          .BYTE     $0A,$0D
          .byte     "===============   ====    ====    ====    ===   ==============="
          .BYTE     $0A,$0D,$02
DWND2END  :=        *


SLOTLDR2  .BYTE     $18,$14
SLOTVAL4  .BYTE     $00,$18,$1C
DRVNVAL2  .BYTE     $00,$18,$23
PMAPVAL   .BYTE     $00,$00,$18,$2B
PNUMVAL   .BYTE     $00,$18,$30,$1F
PMLDREND  :=        *
PVOLSTAT  .res      $10,$20        ;Volume Name or Partition Status

ChgPTpmp  .byte     "Select which driver you wish to change the configuration bytes"
ChgPTend  :=        *

EDITDVN1  .byte     "Enter an IDE device number (0=master, 1=slave): "
DEVNVAL2  .byte     " "
          .BYTE     $08
Edev1End  :=        *

EESC7     .BYTE     $1E,$12
          .byte     "Press:"
          .BYTE     $11,$20,$8C,$20,$8B
          .byte     " Increment Up/Down, RETURN to select/accept,"
          .byte     " ESCAPE to Go Back"
          .BYTE     $04
EESC7END  :=        *

DEVNOT1   .BYTE     $07,$1E
          .byte     "IDE Device "
NOTDEVC1  .byte     "  was not found in Slot "
SLOTNOT2  .BYTE     $00
DEVN2END  :=        *

DEVNOT0   .BYTE     $07,$1E
          .byte     "To add IDE Device #"
NOTDEVC2  .byte     "  to Slot #"
SLOTNOT3  .byte     "  the driver requires updating to proceed"
DEVN0END  :=        *

DEVNOT2   .byte     "Device not Found"
DEVNTEND  :=        *

EDITPTN1  .byte     "Enter a partition number (0 thru 7): "
PNUMVAL2  .byte     " "
          .BYTE     $08
EPnm1End  :=        *

SAVECFG1  .byte     "Save configuration changes to driver? "
          .BYTE     $12,$59,$11
          .byte     "es/No"
SAVE1END  :=        *

ReCalM1   .byte     "Recalculate the beginning address of partitions #"
TrkValue  .byte     "  thru #7? "
          .BYTE     $12,$59,$11
          .byte     "es/No"
ReCalEND  :=        *

DRVPORT   .BYTE     $06,$01,$1A,$4D,$13,$03,$1A,$08
DWND3ULC  .BYTE     $07,$02
DRVPREND  :=        *

ONECHR    .BYTE     $06
ASCICHR1  .BYTE     $00,$08,$05
CHR1END   :=        *

;         .INCLUDE  CFutil1
;         .INCLUDE  CFutil2
;         .INCLUDE  CFutil3
;         .INCLUDE  CFutil4
;         .INCLUDE  CFutil5
;         .INCLUDE  CFutil6
;         .END

;CFutil1
                    ;Main Menu Display
MENU0WVP  .BYTE     $06,$01,$1A,$4D,$14,$03,$1A,$01,$03,$02
          .BYTE     $1C,$1A,$1B,$05,$02
          .byte     "(L) "
MENU0S2   .BYTE     $1A,$04,$00,$11
LSTCMD    .byte     "List Devices Online"
          .BYTE     $11
LSTCMEND  :=        *
MENU0I1   .BYTE     $0D,$0A
          .byte     "(T) "
MENU0I2   .BYTE     $1A,$04,$01,$11
TTESTCMD  .byte     "Test Interface Card"
TTESTEND  :=        *-5
          .BYTE     $11
MENU0V1   .BYTE     $0D,$0A
          .byte     "(V) "
MENU0V2   .BYTE     $1A,$04,$02,$11
VVRFYCMD  .byte     "Verify Drive"
VVRFYEND  :=        *
          .BYTE     $11
MENU0L1   .BYTE     $0D,$0A
          .byte     "(F) "
MENU0L2   .BYTE     $1A,$04,$03,$11
LLFMTCMD  .byte     "Format Drive"
LLFMTEND  :=        *
          .BYTE     $11
MENU0P1   .BYTE     $0D,$0A
          .byte     "(P) "
MENU0P2   .BYTE     $1A,$04,$04,$11
PPARTCMD  .byte     "Partition Drive"
PPARTEND  :=        *
          .BYTE     $11
MENU0C1   .BYTE     $0D,$0A
          .byte     "(C) "
MENU0C2   .BYTE     $1A,$04,$05,$11
ChgDCMD   .byte     "Change Driver Configuration"
ChgDend   :=        *
          .BYTE     $11
MENU0Q1   .BYTE     $0D,$0A
          .byte     "(Q) "
MENU0Q2   .BYTE     $1A,$04,$06,$11
          .byte     "Quit"
          .BYTE     $11
MENU0END  :=        *

TESTLIST  .BYTE     $0A
          .byte     "INTERNAL DIAGNOSTIC TEST: "
TSTLSEND  :=        *

TESTDONE  .BYTE     $0A,$0A,$18,$16
          .byte     "Diagnostic Testing "
Cmplete   .byte     "Complete"
TESTDEND  :=        *

YesAns    .byte     "Yes"
YesEnd    :=        *

NoAns     .byte     "No"
NoEnd     :=        *

DiagEr00  .BYTE     $07
          .byte     "Master Failed"
DERend00  :=        *

DiagEr01  .byte     "No Error Detected"
DERend01  :=        *

DiagEr02  .BYTE     $07,$12
          .byte     "Formatter Device Error"
          .BYTE     $11
DERend02  :=        *

DiagEr03  .BYTE     $07,$12
          .byte     "Sector Buffer Error"
          .BYTE     $11
DERend03  :=        *

DiagEr04  .BYTE     $07,$12
          .byte     "ECC Circuitry Error"
          .BYTE     $11
DERend04  :=        *

DiagEr05  .BYTE     $07,$12
          .byte     "Controlling Microprocessor Error"
          .BYTE     $11
DERend05  :=        *

DiagEr8x  .byte     "Slave Failed"
DERend8x  :=        *

FWARN     .BYTE     $0A,$0A,$1E,$12
          .byte     "WARNING:"
          .BYTE     $11
          .byte     " LowLevel formatting will destroy all data on the drive"
FWARNEND  :=        *

NOTFMT    .BYTE     $07,$1E,$18,$0C
          .byte     "This device does not support low level formatting"
NOFMTEND  :=        *

NO_CFG    .BYTE     $07,$1A,$07,$07
          .byte     "Configuration changes is not supported by the current driver"
          .BYTE     $04
NOCFGEND  :=        *

RANG1ERR  .BYTE     $07
          .byte     "Maximum allowable partition size is 32767"
          .BYTE     $04
RANG1END  :=        *

MAXBLK    .BYTE     $07
          .byte     "Block value cannot exceed partition capacity"
          .BYTE     $04
MXBLKEND  :=        *

PPTWARN1  .BYTE     $1E
          .byte     "Partition #"
PPTW1END  :=        *
PPTNUM    .byte     " ,  ,  ,  ,  ,  ,  ,  "
PPTWARN2  .byte     " have changed and the drive needs updating"
PPTW2END  :=        *

REDITPT   .byte     "Do you wish to edit the conflicting partitions? "
          .BYTE     $12,$59,$11
          .byte     "es/No"
REDITEND  :=        *

PTUPD2    .BYTE     $07
          .byte     "Partition table on drive needs updating prior"
          .byte     " to initializing this volume"
PTUPDEND  :=        *

PTLAP     .BYTE     $07,$12
          .byte     "WARNING:"
          .BYTE     $11
          .byte     " Partitions #"
PTCNFLT1  .BYTE     $00
          .byte     " & "
PTCNFLT2  .BYTE     $00
          .byte     " are overlaying the same region of the disk"
          .BYTE     $04
PTLAPEND  :=        *

UDATPTBL  .byte     "Save changes to the drive partition table? "
          .BYTE     $12,$59,$11
          .byte     "es/No"
UDATEND   :=        *

UPDATDRV  .BYTE     $0A,$1E,$18,$09
          .byte     "Updating the partition table information ..... "
UPDATEND  :=        *

ASKVFRY   .byte     "Verify blocks on the drive listed above? "
          .BYTE     $12,$59,$11
          .byte     "es/No"
ASKVEND   :=        *

ORGDATE0  .BYTE     $1A,$3A,$07
ORGDATE1  .res      $08,$20
ORGDEND   :=        *

NEWDATE0  .BYTE     $1A,$3A,$0B
NEWDATE1  .res      $08,$20
NEWDEND   :=        *

ERASMSG0  .BYTE     $1E
          .byte     "Initialize a new partition table? "
          .BYTE     $12,$59,$11
          .byte     "es/No"
ERAS0END  :=        *

ERASMSG3  .byte     "OK to destroy the existing contents of this drive? "
          .BYTE     $12,$59,$11
          .byte     "es/No"
ERAS3END  :=        *

ERASMSG4  .byte     "Format all the partitions on this drive? "
          .BYTE     $12,$59,$11
          .byte     "es/No"
ERAS4END  :=        *


PTNUM0    .byte     "Enter a Partition Table Number (0 thru "
PTLIMIT   .byte     "  ): "
PTHoffst  :=        *-PTNUM0

DselPT    .BYTE     $18,PTHoffst
PTVALUE   .BYTE     $20,$20,$18
CurHsel   .BYTE     PTHoffst
DselPTen  :=        *

BadPTVL   .BYTE     $07,$1E,$1A,$0B,$17
          .byte     "The number entered exceeds the capacity of this drive"
BadPTend  :=        *


HLMSG0    .byte     "Initialize this volume with the name "
PNAME1    .res      $0F,$20
HLMSG1    .byte     "? "
          .BYTE     $12,$59,$11
          .byte     "es/No"
HLMSGEND  :=        *

HFMTCOMP  .BYTE     $18,$13
          .byte     "Volume Initialization Successful"
HFMTCEND  :=        *

WDIRERR   .BYTE     $07
          .byte     "Error initializing volume directory"
WDIRREND  :=        *

DASHTXT   .byte     " - "
DASHEND   :=        *

                    ;Program Version Display
CMDWIND   .BYTE     $01,$1A,$01,$01,$1E
CMDWEND   :=        *
VERMSG    .byte     "Version 1.26B"           ; Written 4/16/10, updated 12/27/2018
VEREND    :=        *

                    ;Viewport and Borders
INITSCRN  .BYTE     $06,$01,$1C,$18,$18
          .byte     "CF/IDE DRIVE MANAGEMENT UTILITY"
INSCREND  :=        *
BORDERX   .BYTE     $1A,$4E,$16,$03,$1A,$00,$02,$02
                    ;Border Top Line
          .BYTE     $80,$85,$86,$84,$85,$86,$84,$85
          .BYTE     $86,$84,$85,$86,$84,$85,$86,$84
          .BYTE     $85,$86,$84,$85,$86,$84,$85,$86
          .BYTE     $84,$85,$86,$84,$85,$86,$84,$85
          .BYTE     $86,$84,$85,$86,$84,$85,$86,$84
          .BYTE     $85,$86,$84,$85,$86,$84,$85,$86
          .BYTE     $84,$85,$86,$84,$85,$86,$84,$85
          .BYTE     $86,$84,$85,$86,$84,$85,$86,$84
          .BYTE     $85,$86,$84,$85,$86,$84,$85,$86
          .BYTE     $84,$85,$86,$84,$85,$86,$81
                    ;Border Side Lines
          .BYTE     $88,$18,$4E,$87,$88,$18,$4E,$87
          .BYTE     $88,$18,$4E,$87,$88,$18,$4E,$87
          .BYTE     $88,$18,$4E,$87,$88,$18,$4E,$87
          .BYTE     $88,$18,$4E,$87,$88,$18,$4E,$87
          .BYTE     $88,$18,$4E,$87,$88,$18,$4E,$87
          .BYTE     $88,$18,$4E,$87,$88,$18,$4E,$87
          .BYTE     $88,$18,$4E,$87,$88,$18,$4E,$87
          .BYTE     $88,$18,$4E,$87,$88,$18,$4E,$87
          .BYTE     $88,$18,$4E,$87,$88,$18,$4E,$87
                    ;Border Bottom Line
          .BYTE     $82,$85,$86,$84,$85,$86,$84,$85
          .BYTE     $86,$84,$85,$86,$84,$85,$86,$84
          .BYTE     $85,$86,$84,$85,$86,$84,$85,$86
          .BYTE     $84,$85,$86,$84,$85,$86,$84,$85
          .BYTE     $86,$84,$85,$86,$84,$85,$86,$84
          .BYTE     $85,$86,$84,$85,$86,$84,$85,$86
          .BYTE     $84,$85,$86,$84,$85,$86,$84,$85
          .BYTE     $86,$84,$85,$86,$84,$85,$86,$84
          .BYTE     $85,$86,$84,$85,$86,$84,$85,$86
          .BYTE     $84,$85,$86,$84,$85,$86,$83
BDREND    :=        *

                    ;Inner Display Window
CLRSCRN   .BYTE     $06,$01,$1A,$4D,$14,$03,$1A,$01
          .BYTE     $03,$02,$1C
VPORT     .BYTE     $06,$01,$1A,$4D,$13,$03,$1A,$01
          .BYTE     $03,$02
VPORTEND  :=        *

INVPORT   .BYTE     $06,$01,$1A,$4D,$11,$03,$1A,$01
          .BYTE     $03,$02
NEWPOS    .BYTE     $19
VTPOS     .BYTE     $00
VTEND     :=        *
          .BYTE     $1D
NPOSEND   :=        *

SRCH      .BYTE     $1A,$14,$09
          .byte     "Scanning system for IDE devices"
SRCHEND   :=        *

DRV0MSTR  .byte     "0 (master)1 (slave) "

FMDIALOG  .BYTE     $18,$0E
          .byte     "Device Media Formatting.....please standby"
          .BYTE     $04
FMTDEND   :=        *

SerialNo  .res      $14,$20
SERLend   :=        *
FirmWare  .res      $08,$20
FIRMWend  :=        *

PPARTHDR  .BYTE     $1A,$1A,$00
          .byte     "DRIVE PARTITION MAP #"
PTNUMBER  .byte     "  "
          .BYTE     $0A,$0A,$0D
          .byte     "MODEL NO: "
Model     .res      $28,$20
MODELend  :=        *
          .BYTE     $0A,$0D
          .byte     "SLOT: "
SlotVal2  .byte     "    DEVICE: "
DEVICE    .byte     "0 (master)"
DEVNOend  :=        *
          .BYTE     $18,$29
          .byte     "PARTITION CAPACITY: "
PTHDREND  :=        *

TOTCAP    .res      $09,$20

PPTMENU1  .byte     " Blocks"
          .BYTE     $1F
PBLKEND   :=        *
          .BYTE     $1A,$13,$05
          .byte     "START   SEGMENT"
          .BYTE     $18,$38
          .byte     "CREATED DATE"
          .BYTE     $1A,$06,$06
          .byte     "PARTITION    BLOCK   LENGTH   VOLUME NAME"
          .BYTE     $18,$38
          .res      $0C,$3D
          .BYTE     $1A,$06,$07
          .res      $09,$3D
          .BYTE     $18,$12
          .res      $06,$3D
          .BYTE     $18,$1B
          .res      $05,$3D
          .BYTE     $18,$24
          .res      $0F,$3D
PPTMENU2  .BYTE     $1A,$09,$08
          .byte     "#0:"
          .BYTE     $1A,$09,$09
          .byte     "#1:"
          .BYTE     $18,$38
          .byte     "MODIFIED DATE"
          .BYTE     $1A,$09,$0A
          .byte     "#2:"
          .BYTE     $18,$38
          .res      $0C,$3D
          .BYTE     $1A,$09,$0B
          .byte     "#3:"
          .BYTE     $1A,$09,$0C
          .byte     "#4:"
          .BYTE     $1A,$09,$0D
          .byte     "#5:"
          .BYTE     $18,$38
          .byte     "UNUSED CAPACITY"
          .BYTE     $1A,$09,$0E
          .byte     "#6:"
          .BYTE     $18,$38
          .res      $0F,$3D
          .BYTE     $1A,$09,$0F
          .byte     "#7:"
PPTMEND   :=        *

REMCAP    .BYTE     $1A,$38,$0F
NREMCAP   .res      $08,$20

TooLrg    .byte     "> 16777K"

DEV1HDR   .BYTE     $0A,$0A,$18,$1C
          .byte     "DEVICE INFORMATION"
          .BYTE     $0A,$18,$08
          .byte     "SLOT: "
SlotVal3  .BYTE     $00,$0A,$18,$06
          .byte     "DEVICE: "
          .BYTE     $1F
DEV2HDR   .BYTE     $0A,$18,$04
          .byte     "MODEL NO: "
          .BYTE     $1F
DEV3HDR   .BYTE     $0A,$18,$03
          .byte     "SERIAL NO: "
          .BYTE     $1F
DEV4HDR   .BYTE     $0A,$18,$04
          .byte     "FIRMWARE: "
          .BYTE     $1F
DEV5HDR   .BYTE     $0A,$0D
          .byte     " LBA SUPPORT: "
          .BYTE     $1F
DEV6HDR   .BYTE     $0A,$0D
          .byte     " CFA FEATURE: "
          .BYTE     $1F
DEV7HDR   .BYTE     $0A,$18,$04
          .byte     "CAPACITY: "
DEV7END   :=        *

LBA_NO    .BYTE     $12
          .byte     "Warning"
          .BYTE     $11
          .byte     " - LBA mode not supported"
LBAnoEnd  :=        *

GASGAGE   .BYTE     $01,$1A,$05,$12
          .byte     "  $% Complete "
          .BYTE     $89,$8A,$89,$8A,$89,$8A,$89,$8A
          .BYTE     $89,$8A,$89,$8A,$89,$8A,$89,$8A   ;50 chrs long
          .BYTE     $89,$8A,$89,$8A,$89,$8A,$89,$8A
          .BYTE     $89,$8A,$89,$8A,$89,$8A,$89,$8A
          .BYTE     $89,$8A,$89,$8A,$89,$8A,$89,$8A
          .BYTE     $89,$8A,$89,$8A,$89,$8A,$89,$8A
          .BYTE     $89,$8A
          .BYTE     $04
GASGAEND  :=        *

PROGRESS  .BYTE     $01,$1A,$05,$12
PCENT     .BYTE     $20,$20,$30,$18
GAS_HPOS  .BYTE     $13,$12,$20,$11,$04
PROGREND  :=        *

                    ;Volume name selection string variables
BWINDOW   .BYTE     $01,$1A,$4B    ;Border Window
          .BYTE     $13,$03,$1A,$38,$03,$02
BWINDEND  :=        *

BORDERY   .BYTE     $1C,$80,$85,$86,$84,$85,$86,$84   ;Border Top Line
          .BYTE     $85,$86,$84,$85,$86,$84,$85,$86   ;Width=20 chr wide
          .BYTE     $84,$85,$86,$84,$81
          .BYTE     $88,$18,$13,$87,$88,$18,$13,$87   ;Border Side Line
          .BYTE     $88,$18,$13,$87,$88,$18,$13,$87   ;Maximum of 14 rows
          .BYTE     $88,$18,$13,$87,$88,$18,$13,$87
          .BYTE     $88,$18,$13,$87,$88,$18,$13,$87
          .BYTE     $88,$18,$13,$87,$88,$18,$13,$87
          .BYTE     $88,$18,$13,$87,$88,$18,$13,$87
          .BYTE     $88,$18,$13,$87,$88,$18,$13,$87
          .BYTE     $82,$85,$86,$84,$85,$86,$84,$85   ;Border Bot Line
          .BYTE     $86,$84,$85,$86,$84,$85,$86,$84
          .BYTE     $85,$86,$84,$83,$1A,$12
          .BYTE     MaxSelNo,$03,$1A,$01,$01,$02
BDRBTEND  :=        *

EESC9     .BYTE     $1E,$12
          .byte     "Press:"
          .BYTE     $11,$20,$8C
          .byte     " Up "
          .BYTE     $8B
          .byte     " Down,--> Select,<-- Unselect, RETURN Accepts,"
          .byte     " ESCAPE Cancels"
          .BYTE     $04
EESC9END  :=        *

DNRTARW   .BYTE     $11,$0A,$0D
          .byte     "-->"
DNRTEND   :=        *

RTARW     .BYTE     $11,$0D
          .byte     "-->"
RTARWEND  :=        *

UPRTARW   .BYTE     $11,$0B,$0D
          .byte     "-->"
UPRTEND   :=        *

DNLFARW   .BYTE     $11,$0A,$0D
          .byte     "   "
DNLFEND   :=        *

LFARW     .BYTE     $11,$0D
          .byte     "   "
LFARWEND  :=        *

UPLFARW   .BYTE     $11,$0B,$0D
          .byte     "   "
UPLFEND   :=        *

DNHILITE  .BYTE     $0A,$18,$03,$12
DNHILEND  :=        *

HILITE    .BYTE     $18,$03,$12
HILITEND  :=        *

UPHILITE  .BYTE     $0B,$18,$03,$12
UPHILEND  :=        *

NOLITE    .BYTE     $11,$18,$03
NOLITEND  :=        *

                    ;End of Screen Messages

                    ;File Call Error Descriptions
ERRDESC   .byte     "SOS/Device Error $"
GENERR    .WORD     $00
          .byte     " has occurred"
ENDERR00  :=        *
                    ;Device Call Error Descriptions
DNFERR    .byte     "Device not Found"
ENDERR10  :=        *
BADCTL    .byte     "Invalid status/control code"
ENDERR21  :=        *
BADCTLPM  .byte     "Invalid control parameter list"
ENDERR22  :=        *
NORESRC   .byte     "Resource not available"
ENDERR25  :=        *
BADOP     .byte     "Call not supported by device"
ENDERR26  :=        *
IOERR     .byte     "I/O error"
ENDERR27  :=        *
DRNOTCON  .byte     "Drive not connected"
ENDERR28  :=        *
XBCNTERR  .byte     "Incomplete Data Transfer"
ENDERR30  :=        *
XDCMDERR  .byte     "Features Not Set - Command ABORTED"
ENDERR31  :=        *
XCKDEVER  .byte     "Device Not Ready"
ENDERR32  :=        *
XNORESET  .byte     "Device Reset Failed"
ENDERR33  :=        *

                    ;Memory Call Error Descriptions
SEGRQDN   .byte     "Segment request denied"
ENDERRE1  :=        *
SEGTBLFL  .byte     "Segment table full"
ENDERRE2  :=        *

                    ;Device Specific Errors
                    ;Err_Data - byte $0 = error code
                    ;   Bit 7 = BBK bad block has been detected
                    ;   Bit 6 = UNC uncorrectable error was encountered
                    ;   Bit 5 = $ (undefined)
                    ;   Bit 4 = IDNF requested block ID is in error or cannot be found
                    ;   Bit 3 = $ (undefined)
                    ;   Bit 2 = ABRT command was aborted or an invalid command
                    ;   Bit 1 = $ (undefined)
                    ;   Bit $ = AMNF general error
                    ;Err_Data - byte $1 thru $3 = block # (LB, MB, & HB)
                    ;Err_Data - byte $4 = # of blocks left to complete command

UNCerr    .byte     "Uncorrectable I/O error has occurred"
UNCend    :=        *
IDNFerr   .byte     "Invalid block number or block cannot be found"
IDNFend   :=        *
ABRTerr   .byte     "Invalid Command"
ABRTend   :=        *
AMNFerr   .byte     "General device error"
AMNFend   :=        *

                    ;CF Extended Error Descriptions
                    ;Extended Error Code Request
                    ; Returns 1 byte of extended error code in Buffer
                    ; $00 = No Error Detected
                    ; $01 = Self test OK (No error)
                    ; $09 = Miscellaneous Error
                    ; $20 = Invalid Command
                    ; $21 = Invalid address (requested head or sector invalid)
                    ; $2F = Address Overflow (address too large)
                    ; $35,$36 = Supply voltage out of tolerance
                    ; $11 = Uncorrectable ECC error
                    ; $18 = Corrected ECC Error
                    ; $05,$30-34,$37,$3E = Self test or diagnostic failed
                    ; $10,$14 = ID not found
                    ; $3A = Spare sectors exhausted
                    ; $1F = Data transfer error/Aborted command
                    ; $0C,$38,$3B,$3C,$3F = Corrupted Media Format
                    ; $03 = Write/Erase failed

Xerr01    .byte     "Self test OK"
Xer01end  :=        *
Xerr02    .byte     "Miscellaneous Error"
Xer02end  :=        *
Xerr03    .byte     "Invalid Command"
Xer03end  :=        *
Xerr04    .byte     "Invalid head or sector invalid"
Xer04end  :=        *
Xerr05    .byte     "Address Overflow"
Xer05end  :=        *
Xerr06    .byte     "Supply voltage out of tolerance"
Xer06end  :=        *
Xerr07    .byte     "Uncorrectable ECC error"
Xer07end  :=        *
Xerr08    .byte     "Corrected ECC Error"
Xer08end  :=        *
Xerr09    .byte     "Self test failed"
Xer09end  :=        *
Xerr10    .byte     "ID not found"
Xer10end  :=        *
Xerr11    .byte     "Spare sectors exhausted"
Xer11end  :=        *
Xerr12    .byte     "Data transfer error/Aborted command"
Xer12end  :=        *
Xerr13    .byte     "Corrupted Media Format"
Xer13end  :=        *
Xerr14    .byte     "Write/Erase failed"
Xer14end  :=        *

                    ;Screen Display Pointers & Lengths
PVOLADR   .WORD     PVOLSTAT-5

MSGADR    .WORD     MWINDOW                    ;00  MSGWIND
          .WORD     INITSCRN                   ;01  TITLE
          .WORD     CLRMSGS                    ;02  CLRMSG
          .WORD     VPORT                      ;03  VIEWPORT
          .WORD     VERMSG                     ;04  VERSION
          .WORD     MENU0WVP                   ;05  MENU0
          .WORD     EESC0                      ;06  ESC0
          .WORD     DATEDISP                   ;07  DATE
          .WORD     CLRSCRN                    ;08  CLRVPORT
          .WORD     BORDERX                    ;09  BORDER
          .WORD     DRVHDR                     ;0A  DRVHEDR
          .WORD     DWINDOW0                   ;0B  DWINDMSG
          .WORD     NODRVS                     ;0C  NODRIVE
          .WORD     Cmplete                    ;0D  CmpltMsg
          .WORD     CMDWIND                    ;0E  CMDLINE
          .WORD     DRVLEADR                   ;0F  DLEADER
          .WORD     EESC2                      ;10  ESC2
          .WORD     PPROMPT0                   ;11  PROMPT0
          .WORD     LLFMTCMD                   ;12  LFMTCMD
          .WORD     VVRFYCMD                   ;13  VRFYCMD
          .WORD     PPARTCMD                   ;14  PARTCMD
          .WORD     TTESTCMD                   ;15  TESTCMD
          .WORD     LSTCMD                     ;16  LSTDRCMD
          .WORD     GASGAGE                    ;17  GASGAUGE
          .WORD     PROGRESS                   ;18  PROGBAR
          .WORD     LBA_NO                     ;19  NO_LBA
          .WORD     BTRKTLR                    ;1A  BLKBAD2
          .WORD     VFYHALTD                   ;1B  VFYHLTD
          .WORD     FMTHALTD                   ;1C  FMTHLTD
          .WORD     NVFYERR                    ;1D  NUMERRS
          .WORD     ERASVOL1                   ;1E  BeepNclr
          .WORD     FWARN                      ;1F  FWARNING
          .WORD     EESC3                      ;20  ESC3
          .WORD     FMDIALOG                   ;21  FMTMSG
          .WORD     CURSEPOS                   ;22  CURSER
          .WORD     UDATPTBL                   ;23  PTBLMSG
          .WORD     UPDATDRV                   ;24  UPDATMSG
          .WORD     UDATERR                    ;25  UPDATERR
          .WORD     ORGDATE0                   ;26  CREADATE
          .WORD     NEWDATE0                   ;27  LMODDATE
          .WORD     DiagEr00                   ;28  TestER00
          .WORD     DiagEr01                   ;29  TestER01
          .WORD     DiagEr02                   ;2A  TestER02
          .WORD     DiagEr03                   ;2B  TestER03
          .WORD     DiagEr04                   ;2C  TestER04
          .WORD     DiagEr05                   ;2D  TestER05
          .WORD     DiagEr8x                   ;2E  TestER8x
          .WORD     FMTCOMP                    ;2F  FMTDONE
          .WORD     ERROCCUR                   ;30  OCCUR
          .WORD     EESC5                      ;31  ESC5
          .WORD     VFYSTOP                    ;32  VFYHALT
          .WORD     BTRKHDR                    ;33  BLOCKBAD
          .WORD     VFYCMPLT                   ;34  VFYCOMP
          .WORD     TESTLIST                   ;35  TESTLST
          .WORD     TESTDONE                   ;36  TESTCOMP
          .WORD     PPARTHDR                   ;37  PARTHDR
          .WORD     PPTMENU1                   ;38  PTMENU1
          .WORD     PPTMENU1                   ;39  BLOCKS
          .WORD     EESC6                      ;3A  ESC6
          .WORD     HLMSG0                     ;3B  HFMT0MSG
          .WORD     HLMSG1                     ;3C  HFMT1MSG
          .WORD     WDIRERR                    ;3D  DIRERR
          .WORD     HFMTCOMP                   ;3E  HFMTCMP
          .WORD     EESC1A                     ;3F  PRANYKEY
          .WORD     DASHTXT                    ;40  DASH
          .WORD     DRNOTCON                   ;41  DRVNCONT
          .WORD     INVPORT                    ;42  VIEWPOS
          .WORD     PPTWARN1                   ;43  PTWARN1
          .WORD     PPTWARN2                   ;44  PTWARN2
          .WORD     PTLAP                      ;45  PTOVLAP
          .WORD     REDITPT                    ;46  RE_EDIT
          .WORD     ERASVOL1                   ;47  ERASMSG1
          .WORD     ERASVOL2                   ;48  ERASMSG2
          .WORD     EESC6A                     ;49  ESC6A
          .WORD     CNOTICE                    ;4A  COPYRITE
          .WORD     FEESC6                     ;4B  FESC6
          .WORD     MWINDOW                    ;4C  CLRMSGW
          .WORD     EESC1B                     ;4D  ESC1B
          .WORD     SLOTLDR                    ;4E  SLOTPOS
          .WORD     REMCAP                     ;4F  RBLKS
          .WORD     SRCH                       ;50  SEARCH
          .WORD     RANG1ERR                   ;51  OUTRANG1
          .WORD     MAXBLK                     ;52  MAXBLOCK
          .WORD     ASKVFRY                    ;53  VRFYMSG
          .WORD     NOTFMT                     ;54  NOFRMAT
          .WORD     ERASMSG0                   ;55  ERASEPT1
          .WORD     PPTMENU2                   ;56  PTMENU2
          .WORD     EESC4                      ;57  ESC4
          .WORD     PPROMPT0                   ;58  CLRPMPT
          .WORD     TOTCAP                     ;59  TCapBlks
          .WORD     DEV1HDR                    ;5A  DEVHDR1
          .WORD     DEV2HDR                    ;5B  DEVHDR2
          .WORD     DEV3HDR                    ;5C  DEVHDR3
          .WORD     DEV4HDR                    ;5D  DEVHDR4
          .WORD     DEV5HDR                    ;5E  DEVHDR5
          .WORD     DEV6HDR                    ;5F  DEVHDR6
          .WORD     DEV7HDR                    ;60  DEVHDR7
          .WORD     Model                      ;61  Model_nx
          .WORD     DEVICE                     ;62  Devic_nx
          .WORD     SerialNo                   ;63  Seria_nx
          .WORD     FirmWare                   ;64  FirmW_nx
          .WORD     YesAns                     ;65  AnsYes
          .WORD     NoAns                      ;66  AnsNo
          .WORD     NEWPOS                     ;67  ClrLower
          .WORD     ERASMSG3                   ;68  ERASEDRV
          .WORD     PTRDERR                    ;69  PTReadER
          .WORD     PTUPD2                     ;6A  PTNUPD
          .WORD     PTNUM0                     ;6B  SelPTNum
          .WORD     DselPT                     ;6C  PTSEL
          .WORD     BadPTVL                    ;6D  PTnoGood
          .WORD     DWINDOW2                   ;6E  DWND2MSG
          .WORD     SLOTLDR2                   ;6F  PMAPPOS
          .WORD     ChgDCMD                    ;70  SEL2CMD
          .WORD     ChgPTpmp                   ;71  PTCHGMSG
          .WORD     ReCalM1                    ;72  ReCalMsg
          .WORD     EDITDVN1                   ;73  EDITDEVN
          .WORD     EESC7                      ;74  ESC7
          .WORD     DEVNOT1                    ;75  NODEVICE
          .WORD     EDITPTN1                   ;76  EDITPNUM
          .WORD     SAVECFG1                   ;77  SAVEDCFG
          .WORD     DRVPORT                    ;78  LDRVWND
          .WORD     ONECHR                     ;79  ONEASCI
          .WORD     EESC8                      ;7A  ESC8
          .WORD     ERASMSG4                   ;7B  ERASEPT2
          .WORD     FMTCMP2                    ;7C  ERASPTDN
          .WORD     NO_CFG                     ;7D  BADDVRV
          .WORD     DEVNOT0                    ;7E  RELISTD
          .WORD     EESC10                     ;7F  ESC10
MSGADR2   .WORD     BWINDOW                    ;80  BWINDPRT
          .WORD     BORDERY                    ;81  BORDER1
          .WORD     EESC9                      ;82  HELPMSG
          .WORD     DNHILITE                   ;83  DNHIPRT
          .WORD     DNLFARW                    ;84  DNLFPRT
          .WORD     DNRTARW                    ;85  DNRTPRT
          .WORD     HILITE                     ;86  HIPRT
          .WORD     LFARW                      ;87  LFPRT
          .WORD     NOLITE                     ;88  STDPRT
          .WORD     RTARW                      ;89  RTPRT
          .WORD     UPHILITE                   ;8A  UPHIPRT
          .WORD     UPLFARW                    ;8B  UPLFPRT
          .WORD     UPRTARW                    ;8C  UPRTPRT
          .WORD     VOLSZMIN                   ;8D  VolSZerr


MSGLEN    .BYTE     MWINDEND-MWINDOW           ;00  MSGWIND
          .BYTE     INSCREND-INITSCRN          ;01  TITLE
          .BYTE     CLRMSEND-CLRMSGS           ;02  CLRMSG
          .BYTE     VPORTEND-VPORT             ;03  VIEWPORT
          .BYTE     VEREND-VERMSG              ;04  VERSION
          .BYTE     MENU0END-MENU0WVP          ;05  MENU0
          .BYTE     EESC0END-EESC0             ;06  ESC0
DATELEN   .BYTE     $00                        ;07  DATE
          .BYTE     VPORTEND-CLRSCRN           ;08  CLRVPORT
          .BYTE     BDREND-BORDERX             ;09  BORDER
          .BYTE     DRVHDEND-DRVHDR            ;0A  DRVHEDR
          .BYTE     DWINDEND-DWINDOW0          ;0B  DWINDMSG
          .BYTE     NODRVEND-NODRVS            ;0C  NODRIVE
          .BYTE     TESTDEND-Cmplete           ;0D  CmpltMsg
          .BYTE     CMDWEND-CMDWIND            ;0E  CMDLINE
          .BYTE     DLDREND-DRVLEADR           ;0F  DLEADER
          .BYTE     EESC2END-EESC2             ;10  ESC2
          .BYTE     PRMP0END-PPROMPT0          ;11  PROMPT0
          .BYTE     LLFMTEND-LLFMTCMD          ;12  LFMTCMD
          .BYTE     VVRFYEND-VVRFYCMD          ;13  VRFYCMD
          .BYTE     PPARTEND-PPARTCMD          ;14  PARTCMD
          .BYTE     TTESTEND-TTESTCMD          ;15  TESTCMD
          .BYTE     LSTCMEND-LSTCMD            ;16  LSTDRCMD
          .BYTE     GASGAEND-GASGAGE           ;17  GASGAUGE
          .BYTE     PROGREND-PROGRESS          ;18  PROGBAR
          .BYTE     LBAnoEnd-LBA_NO            ;19  NO_LBA
          .BYTE     BTRKHEND-BTRKTLR           ;1A  BLKBAD2
          .BYTE     VFYHMEND-VFYHALTD          ;1B  VFYHLTD
          .BYTE     FMTHMEND-FMTHALTD          ;1C  FMTHLTD

;CFutil2
NUMVLEN   .BYTE     $00                        ;1D  NUMERRS
          .BYTE     $02                        ;1E  BeepNclr
          .BYTE     FWARNEND-FWARN             ;1F  FWARNING
          .BYTE     EESC3END-EESC3             ;20  ESC3
          .BYTE     FMTDEND-FMDIALOG           ;21  FMTMSG
          .BYTE     CURSEND-CURSEPOS           ;22  CURSER
          .BYTE     UDATEND-UDATPTBL           ;23  PTBLMSG
          .BYTE     UPDATEND-UPDATDRV          ;24  UPDATMSG
          .BYTE     UDATEREN-UDATERR           ;25  UPDATERR
          .BYTE     ORGDEND-ORGDATE0           ;26  CREADATE
          .BYTE     NEWDEND-NEWDATE0           ;27  LMODDATE
          .BYTE     DERend00-DiagEr00          ;28  TestER00
          .BYTE     DERend01-DiagEr01          ;29  TestER01
          .BYTE     DERend02-DiagEr02          ;2A  TestER02
          .BYTE     DERend03-DiagEr03          ;2B  TestER03
          .BYTE     DERend04-DiagEr04          ;2C  TestER04
          .BYTE     DERend05-DiagEr05          ;2D  TestER05
          .BYTE     DERend8x-DiagEr8x          ;2E  TestER8x
          .BYTE     FMTCMEND-FMTCOMP           ;2F  FMTDONE
          .BYTE     OCCUREND-ERROCCUR          ;30  OCCUR
          .BYTE     EESC5END-EESC5             ;31  ESC5
          .BYTE     VFYSTEND-VFYSTOP           ;32  VFYHALT
          .BYTE     BADSECT-BTRKHDR            ;33  BLOCKBAD
          .BYTE     VFYCMEND-VFYCMPLT          ;34  VFYCOMP
          .BYTE     TSTLSEND-TESTLIST          ;35  TESTLST
          .BYTE     TESTDEND-TESTDONE          ;36  TESTCOMP
          .BYTE     PTHDREND-PPARTHDR          ;37  PARTHDR
          .BYTE     PPTMENU2-PPTMENU1          ;38  PTMENU1
          .BYTE     PBLKEND-PPTMENU1           ;39  BLOCKS
          .BYTE     EESC6END-EESC6             ;3A  ESC6
          .BYTE     PNAME1-HLMSG0              ;3B  HFMT0MSG
          .BYTE     HLMSGEND-HLMSG1            ;3C  HFMT1MSG
          .BYTE     WDIRREND-WDIRERR           ;3D  DIRERR
          .BYTE     HFMTCEND-HFMTCOMP          ;3E  HFMTCMP
          .BYTE     EESC1END-EESC1A            ;3F  PRANYKEY
          .BYTE     DASHEND-DASHTXT            ;40  DASH
          .BYTE     ENDERR28-DRNOTCON          ;41  DRVNCONT
          .BYTE     VTEND-INVPORT              ;42  VIEWPOS
          .BYTE     PPTW1END-PPTWARN1          ;43  PTWARN1
          .BYTE     PPTW2END-PPTWARN2          ;44  PTWARN2
          .BYTE     PTLAPEND-PTLAP             ;45  PTOVLAP
          .BYTE     REDITEND-REDITPT           ;46  RE_EDIT
          .BYTE     ERASEND1-ERASVOL1          ;47  ERASMSG1
          .BYTE     ERASEND2-ERASVOL2          ;48  ERASMSG2
          .BYTE     ESC6AEND-EESC6A            ;49  ESC6A
          .BYTE     CNOTEND-CNOTICE            ;4A  COPYRITE
          .BYTE     FESC6END-FEESC6            ;4B  FESC6
          .BYTE     CLRMSEND-MWINDOW           ;4C  CLRMSGW
          .BYTE     EESC1END-EESC1B            ;4D  ESC1B
          .BYTE     SLDREND-SLOTLDR            ;4E  SLOTPOS
          .BYTE     NREMCAP-REMCAP             ;4F  RBLKS
          .BYTE     SRCHEND-SRCH               ;50  SEARCH
          .BYTE     RANG1END-RANG1ERR          ;51  OUTRANG1
          .BYTE     MXBLKEND-MAXBLK            ;52  MAXBLOCK
          .BYTE     ASKVEND-ASKVFRY            ;53  VFRYMSG
          .BYTE     NOFMTEND-NOTFMT            ;54  NOFRMAT
          .BYTE     ERAS0END-ERASMSG0          ;55  ERASEPT1
          .BYTE     PPTMEND-PPTMENU2           ;56  PTMENU2
          .BYTE     EESC4END-EESC4             ;57  ESC4
          .BYTE     CPMPEND-PPROMPT0           ;58  CLRPMPT
TCAPLEN   .BYTE     $00                        ;59  TCapBlks
          .BYTE     DEV2HDR-DEV1HDR            ;5A  DEVHDR1
          .BYTE     DEV3HDR-DEV2HDR            ;5B  DEVHDR2
          .BYTE     DEV4HDR-DEV3HDR            ;5C  DEVHDR3
          .BYTE     DEV5HDR-DEV4HDR            ;5D  DEVHDR4
          .BYTE     DEV6HDR-DEV5HDR            ;5E  DEVHDR5
          .BYTE     DEV7HDR-DEV6HDR            ;5F  DEVHDR6
          .BYTE     DEV7END-DEV7HDR            ;60  DEVHDR7
MOD_Len   .BYTE     MODELend-Model             ;61  Model_nx
          .BYTE     DEVNOend-DEVICE            ;62  Devic_nx
SN_Len    .BYTE     SERLend-SerialNo           ;63  Seria_nx
FW_Len    .BYTE     FIRMWend-FirmWare          ;64  FirmW_nx
          .BYTE     YesEnd-YesAns              ;65  AnsYes
          .BYTE     NoEnd-NoAns                ;66  AnsNo
          .BYTE     NPOSEND-NEWPOS             ;67  ClrLower
          .BYTE     ERAS3END-ERASMSG3          ;68  ERASEDRV
          .BYTE     PTRDEREN-PTRDERR           ;69  PTReadER
          .BYTE     PTUPDEND-PTUPD2            ;6A  PTNUPD
          .BYTE     DselPTen-PTNUM0            ;6B  SelPTNum
          .BYTE     DselPTen-DselPT            ;6C  PTSEL
          .BYTE     BadPTend-BadPTVL           ;6D  PTnoGood
          .BYTE     DWND2END-DWINDOW2          ;6E  DWND2MSG
CfgVLen   .BYTE     PMLDREND-SLOTLDR2          ;6F  PMAPPOS
          .BYTE     ChgDend-ChgDCMD            ;70  SEL2CMD
          .BYTE     ChgPTend-ChgPTpmp          ;71  PTCHGMSG
          .BYTE     ReCalEND-ReCalM1           ;72  ReCalMsg
          .BYTE     Edev1End-EDITDVN1          ;73  EDITDEVN
          .BYTE     EESC7END-EESC7             ;74  ESC7
          .BYTE     DEVN2END-DEVNOT1           ;75  NODEVICE
          .BYTE     EPnm1End-EDITPTN1          ;76  EDITPNUM
          .BYTE     SAVE1END-SAVECFG1          ;77  SAVEDCFG
          .BYTE     DRVPREND-DRVPORT           ;78  LDRVWND
          .BYTE     CHR1END-ONECHR             ;79  ONEASCI
          .BYTE     EESC8END-EESC8             ;7A  ESC8
          .BYTE     ERAS4END-ERASMSG4          ;7B  ERASEPT2
          .BYTE     FMTC2END-FMTCMP2           ;7C  ERASPTDN
          .BYTE     NOCFGEND-NO_CFG            ;7D  BADDVRV
          .BYTE     DEVN0END-DEVNOT0           ;7E  RELISTD
          .BYTE     ESC10END-EESC10            ;7F  ESC10
          .BYTE     BWINDEND-BWINDOW           ;80  BWINDPRT
          .BYTE     BDRBTEND-BORDERY           ;81  BORDER1
          .BYTE     EESC9END-EESC9             ;82  HELPMSG
          .BYTE     DNHILEND-DNHILITE          ;83  DNHIPRT
          .BYTE     DNLFEND-DNLFARW            ;84  DNLFPRT
          .BYTE     DNRTEND-DNRTARW            ;85  DNRTPRT
          .BYTE     HILITEND-HILITE            ;86  HIPRT
          .BYTE     LFARWEND-LFARW             ;87  LFPRT
          .BYTE     NOLITEND-NOLITE            ;88  STDPRT
          .BYTE     RTARWEND-RTARW             ;89  RTPRT
          .BYTE     UPHILEND-UPHILITE          ;8A  UPHIPRT
          .BYTE     UPLFEND-UPLFARW            ;8B  UPLFPRT
          .BYTE     UPRTEND-UPRTARW            ;8C  UPRTPRT
          .BYTE     VOLSZEND-VOLSZMIN          ;8D  VolSZerr


                    ;Main Menu Pointers & Lengths
MENU0LST  .byte     "LTVFPCQ"
MenuItms  :=        *-MENU0LST

MENU0ADR  .WORD     MENU0S2
          .WORD     MENU0I2
          .WORD     MENU0V2
          .WORD     MENU0L2
          .WORD     MENU0P2
          .WORD     MENU0C2
          .WORD     MENU0Q2

MENU0LEN  .BYTE     MENU0I1-MENU0S2
          .BYTE     MENU0V1-MENU0I2
          .BYTE     MENU0L1-MENU0V2
          .BYTE     MENU0P1-MENU0L2
          .BYTE     MENU0C1-MENU0P2
          .BYTE     MENU0Q1-MENU0C2
          .BYTE     MENU0END-MENU0Q2

FUNCADR   .WORD     LSTDRV-1
          .WORD     TESTIFC-1
          .WORD     VERIFY-1
          .WORD     FORMAT-1
          .WORD     PARTITIO-1
          .WORD     CHGCONFG-1
          .WORD     QUIT-1

                    ;Partition Display Variables
COL_HPOS  .BYTE     $12            ;Starting Block
          .BYTE     $1C            ;Partition Length
          .BYTE     $24            ;Volume Name

ITEM_LEN  .BYTE     $06            ;Starting Block
          .BYTE     $05            ;Partition Length
          .BYTE     $0F            ;Volume Name

TRACK0    .BYTE     $1A,$12,$08
TRKVAL0   .res      $07,$00
TRKLEN    :=        *-1-TRACK0
TRACK1    .BYTE     $1A,$12,$09
TRKVAL1   .res      $07,$00
TRACK2    .BYTE     $1A,$12,$0A
TRKVAL2   .res      $07,$00
TRACK3    .BYTE     $1A,$12,$0B
TRKVAL3   .res      $07,$00
TRACK4    .BYTE     $1A,$12,$0C
TRKVAL4   .res      $07,$00
TRACK5    .BYTE     $1A,$12,$0D
TRKVAL5   .res      $07,$00
TRACK6    .BYTE     $1A,$12,$0E
TRKVAL6   .res      $07,$00
TRACK7    .BYTE     $1A,$12,$0F
TRKVAL7   .res      $07,$00

BLKLEN0   .BYTE     $1A,$1C,$08
BLENVAL0  .res      $06,$00
BLOCKLEN  :=        *-1-BLKLEN0
BLKLEN1   .BYTE     $1A,$1C,$09
BLENVAL1  .res      $06,$00
BLKLEN2   .BYTE     $1A,$1C,$0A
BLENVAL2  .res      $06,$00
BLKLEN3   .BYTE     $1A,$1C,$0B
BLENVAL3  .res      $06,$00
BLKLEN4   .BYTE     $1A,$1C,$0C
BLENVAL4  .res      $06,$00
BLKLEN5   .BYTE     $1A,$1C,$0D
BLENVAL5  .res      $06,$00
BLKLEN6   .BYTE     $1A,$1C,$0E
BLENVAL6  .res      $06,$00
BLKLEN7   .BYTE     $1A,$1C,$0F
BLENVAL7  .res      $06,$00

VOLNAME0  .BYTE     $1A,$24,$08
VNAME0    .res      $10,$20
VOLNLEN   :=        *-1-VOLNAME0
VOLNAME1  .BYTE     $1A,$24,$09
VNAME1    .res      $10,$20
VOLNAME2  .BYTE     $1A,$24,$0A
VNAME2    .res      $10,$20
VOLNAME3  .BYTE     $1A,$24,$0B
VNAME3    .res      $10,$20
VOLNAME4  .BYTE     $1A,$24,$0C
VNAME4    .res      $10,$20
VOLNAME5  .BYTE     $1A,$24,$0D
VNAME5    .res      $10,$20
VOLNAME6  .BYTE     $1A,$24,$0E
VNAME6    .res      $10,$20
VOLNAME7  .BYTE     $1A,$24,$0F
VNAME7    .res      $10,$20

TRKADR    .WORD     TRKVAL0
          .WORD     TRKVAL1
          .WORD     TRKVAL2
          .WORD     TRKVAL3
          .WORD     TRKVAL4
          .WORD     TRKVAL5
          .WORD     TRKVAL6
          .WORD     TRKVAL7

BLENADR   .WORD     BLENVAL0
          .WORD     BLENVAL1
          .WORD     BLENVAL2
          .WORD     BLENVAL3
          .WORD     BLENVAL4
          .WORD     BLENVAL5
          .WORD     BLENVAL6
          .WORD     BLENVAL7

PNAMEADR  .WORD     VNAME0
          .WORD     VNAME1
          .WORD     VNAME2
          .WORD     VNAME3
          .WORD     VNAME4
          .WORD     VNAME5
          .WORD     VNAME6
          .WORD     VNAME7

VOLADR    .WORD     VNAME0-5
          .WORD     VNAME1-5
          .WORD     VNAME2-5
          .WORD     VNAME3-5
          .WORD     VNAME4-5
          .WORD     VNAME5-5
          .WORD     VNAME6-5
          .WORD     VNAME7-5

                    ;Partition table indexes for starting block & partition length
STBindex  .BYTE     $A3,$A8,$B3,$B8,$C3,$C8,$D3,$D8
VSZindex  .BYTE     $A6,$AB,$B6,$BB,$C6,$CB,$D6,$DB

PMSGADR   .WORD     TRACK0         ;#TRK0
          .WORD     TRACK1
          .WORD     TRACK2
          .WORD     TRACK3
          .WORD     TRACK4
          .WORD     TRACK5
          .WORD     TRACK6
          .WORD     TRACK7
          .WORD     BLKLEN0        ;#BLEN0
          .WORD     BLKLEN1
          .WORD     BLKLEN2
          .WORD     BLKLEN3
          .WORD     BLKLEN4
          .WORD     BLKLEN5
          .WORD     BLKLEN6
          .WORD     BLKLEN7
          .WORD     VOLNAME0       ;#VOL0
          .WORD     VOLNAME1
          .WORD     VOLNAME2
          .WORD     VOLNAME3
          .WORD     VOLNAME4
          .WORD     VOLNAME5
          .WORD     VOLNAME6
          .WORD     VOLNAME7

                    ;Misc Variables Address List
VFYERADR  .WORD     NVFYERR
PTHDRADR  .WORD     TOTCAP
PTLRADR   .WORD     NREMCAP
BSECTADR  .WORD     BADSECT

                    ;General SOS Call Error Description Address
ERMSGADR  .WORD     ERRDESC
                    ;Device Call Error Description Address
          .WORD     DNFERR
          .WORD     BADCTL
          .WORD     BADCTLPM
          .WORD     NORESRC
          .WORD     BADOP
          .WORD     IOERR
          .WORD     DRNOTCON
          .WORD     XBCNTERR
          .WORD     XDCMDERR
          .WORD     XCKDEVER
          .WORD     XNORESET
                    ;Memory Call Error Description Address
          .WORD     SEGRQDN
          .WORD     SEGTBLFL
                    ;Device Specific Errors
          .WORD     AMNFerr        ;$00
          .WORD     Xerr01         ;CF Extended Error $01 Description Address
          .WORD     ABRTerr        ;$04
          .WORD     Xerr02         ;CF Extended Error $09 Description Address
          .WORD     IDNFerr        ;$10
          .WORD     Xerr03         ;CF Extended Error $20 Description Address
          .WORD     UNCerr         ;$40
                                   ;CF Extended Error Description Address
          .WORD     Xerr04
          .WORD     Xerr05
          .WORD     Xerr06
          .WORD     Xerr07
          .WORD     Xerr08
          .WORD     Xerr09
          .WORD     Xerr10
          .WORD     Xerr11
          .WORD     Xerr12
          .WORD     Xerr13
          .WORD     Xerr14

                    ;General SOS Call Error Description Len
ERMSGLEN  .BYTE     ENDERR00-ERRDESC
                    ;Device Call Error Description Len
          .BYTE     ENDERR10-DNFERR
          .BYTE     ENDERR21-BADCTL
          .BYTE     ENDERR22-BADCTLPM
          .BYTE     ENDERR25-NORESRC
          .BYTE     ENDERR26-BADOP
          .BYTE     ENDERR27-IOERR
          .BYTE     ENDERR28-DRNOTCON
          .BYTE     ENDERR30-XBCNTERR
          .BYTE     ENDERR31-XDCMDERR
          .BYTE     ENDERR32-XCKDEVER
          .BYTE     ENDERR33-XNORESET
                    ;Memory Call Error Description Len
          .BYTE     ENDERRE1-SEGRQDN
          .BYTE     ENDERRE2-SEGTBLFL
                    ;Device Specific Errors
          .BYTE     AMNFend-AMNFerr
CFext01   .BYTE     Xer01end-Xerr01  ;CF Extended Error $01 Description Len
          .BYTE     ABRTend-ABRTerr
CFext02   .BYTE     Xer02end-Xerr02  ;CF Extended Error $09 Description Len
          .BYTE     IDNFend-IDNFerr
CFext03   .BYTE     Xer03end-Xerr03  ;CF Extended Error $20 Description Len
          .BYTE     UNCend-UNCerr
                    ;CF Extended Error Description Len
CFext04   .BYTE     Xer04end-Xerr04
CFext05   .BYTE     Xer05end-Xerr05
CFext06   .BYTE     Xer06end-Xerr06
CFext07   .BYTE     Xer07end-Xerr07
CFext08   .BYTE     Xer08end-Xerr08
CFext09   .BYTE     Xer09end-Xerr09
CFext10   .BYTE     Xer10end-Xerr10
CFext11   .BYTE     Xer11end-Xerr11
CFext12   .BYTE     Xer12end-Xerr12
CFext13   .BYTE     Xer13end-Xerr13
CFext14   .BYTE     Xer14end-Xerr14

                    ;General SOS Call Error Codes
SOSERR    .BYTE     $00
                    ;Device Call Error Codes
          .BYTE     $10,$21,$22,$25,$26,$27,$28,$30
          .BYTE     $31,$32,$33
                    ;Memory Call Error Codes
          .BYTE     $E1,$E2
SERRLEN   :=        *-SOSERR
                    ;CF Extended Error Codes & index
XerrCode  .BYTE     $01,$09,$20,$21,$2F,$35,$36,$11
          .BYTE     $18,$05,$30,$31,$32,$33,$34,$37
          .BYTE     $3E,$10,$14,$3A,$1F,$0C,$38,$3B
          .BYTE     $3C,$3F,$03
XerrIndx  .BYTE     CFext01-ERMSGLEN
          .BYTE     CFext02-ERMSGLEN
          .BYTE     CFext03-ERMSGLEN
          .BYTE     CFext04-ERMSGLEN
          .BYTE     CFext05-ERMSGLEN
          .BYTE     CFext06-ERMSGLEN
          .BYTE     CFext06-ERMSGLEN
          .BYTE     CFext07-ERMSGLEN
          .BYTE     CFext08-ERMSGLEN
          .BYTE     CFext09-ERMSGLEN
          .BYTE     CFext09-ERMSGLEN
          .BYTE     CFext09-ERMSGLEN
          .BYTE     CFext09-ERMSGLEN
          .BYTE     CFext09-ERMSGLEN
          .BYTE     CFext09-ERMSGLEN
          .BYTE     CFext09-ERMSGLEN
          .BYTE     CFext09-ERMSGLEN
          .BYTE     CFext10-ERMSGLEN
          .BYTE     CFext10-ERMSGLEN
          .BYTE     CFext11-ERMSGLEN
          .BYTE     CFext12-ERMSGLEN
          .BYTE     CFext13-ERMSGLEN
          .BYTE     CFext13-ERMSGLEN
          .BYTE     CFext13-ERMSGLEN
          .BYTE     CFext13-ERMSGLEN
          .BYTE     CFext13-ERMSGLEN
          .BYTE     CFext14-ERMSGLEN

                    ;FONT CODE
FONT1     .BYTE     $08
          .BYTE     $00
          .BYTE     $00,$00,$00,$00,$40,$08,$02,$01
          .BYTE     $01
          .BYTE     $00,$00,$00,$00,$01,$08,$20,$40
          .BYTE     $02
          .BYTE     $01,$01,$02,$08,$40,$00,$00,$00
          .BYTE     $03
          .BYTE     $40,$40,$20,$08,$01,$00,$00,$00
          .BYTE     $04
          .BYTE     $00,$00,$00,$00,$49,$00,$00,$00
          .BYTE     $05
          .BYTE     $00,$00,$00,$00,$24,$00,$00,$00
          .BYTE     $06
          .BYTE     $00,$00,$00,$00,$12,$00,$00,$00
          .BYTE     $07
          .BYTE     $40,$40,$40,$40,$40,$40,$40,$40
FONT2     .BYTE     $05
          .BYTE     $08
          .BYTE     $01,$01,$01,$01,$01,$01,$01,$01
          .BYTE     $09
          .BYTE     $55,$2A,$55,$2A,$55,$2A,$55,$2A   ;Gas Gage character 1
          .BYTE     $0A
          .BYTE     $2A,$55,$2A,$55,$2A,$55,$2A,$55   ;Gas Gage character 2
          .BYTE     $0B
          .BYTE     $08,$08,$08,$49,$2A,$1C,$08,$00   ;Down Arrow
          .BYTE     $0C
          .BYTE     $08,$1C,$2A,$49,$08,$08,$08,$00   ;Up Arrow

;************************ Error Handler Routines **************************

                    ;Wait - Copy of Apple's wait routine.
                    ;or more usefully: Areg =  (Delay[in uS]/2.5 + 2.09)^.5 - 2.7
Wait1sec  PHP
          SEI
          LDA       EReg
          ORA       #$80           ;Set1Mhz
          STA       EReg

          LDY       #$06
@1        LDA       #$FF           ;Delay(us)= 2.5Areg^2 + 13.5Areg + 15  = 166020 cycles
          SEC
@2        PHA
@3        SBC       #$01
          BNE       @3
          PLA
          SBC       #$01
          BNE       @2
          DEY
          BNE       @1

          LDA       EReg
          AND       #$7F           ;Set2Mhz
          STA       EReg
          PLP
          RTS

                    ;Device Specific Error Handler
ErrHndlr  BCC       ERRORCK
          LDA       Err_Data
          LDY       MODE_ID        ;check if device supports CF feature set
          CPY       #$02
          BNE       StdError
          LDY       #ATA_Cmd       ;Get & Display CF extended error code
          LDA       #ATA_XErr
          STA       (BUFFCALL),Y
          JSR       CALLDRVR
          BNE       @3
          LDY       #$00
          LDA       (BUFFPG0),Y     ;Get extended error code
          LDX       #XerrIndx-XerrCode-1
@1        CMP       XerrCode,X
          BEQ       @2
          DEX
          BPL       @1
          JMP       GenError
@2        LDY       XerrIndx,X
          JMP       PrtError
@3        LDA       Err_Data

StdError  ASL       A
          BCC       @1
          LDX       #BeepNclr
          JSR       PRTESCP
          JSR       PrtBdBlk
          JMP       PrtLast
@1        LDY       #CFext03-ERMSGLEN+1
@2        ASL       A
          BCS       PrtError
          DEY
          CPY       #CFext01-ERMSGLEN
          BCS       @2
          LDY       #$00
          LDA       Err_Data
          JMP       GenError

                    ;Error handler for SOS errors
ERRORCK   BNE       ERROR_YES
          RTS
ERROR_YES STA       ERRCODE
          LDY       #SERRLEN
@1        CMP       SOSERR,Y
          BEQ       PrtError
          DEY
          BNE       @1
GenError  JSR       BINHEX
PrtError  LDX       #BeepNclr
          JSR       PRTESCP
          LDA       ERMSGLEN,Y
          STA       PRTLEN1
          TYA
          ASL       A
          TAX
          LDA       ERMSGADR,X
          STA       INDEX
          LDA       ERMSGADR+1,X
          STA       INDEX+1
          BRK
          .BYTE     $CB
          .WORD     WRITINDX
PrtLast   LDX       #DASH
          JSR       PRTMSG
          LDX       #PRANYKEY
          JSR       PRTMSG
          BRK
          .BYTE     $CA
          .WORD     READCON
          LDX       #CLRMSG
          JSR       PRTMSG
          JMP       MAINMENU

PRTMSG    LDA       MSGLEN,X
PRTMSG1   STA       PRTLEN1
          TXA
          ASL       A
          TAX
          BCC       @1
          LDA       MSGADR2,X
          STA       INDEX
          LDA       MSGADR2+1,X
          BCS       @2
@1        LDA       MSGADR,X
          STA       INDEX
          LDA       MSGADR+1,X
@2        STA       INDEX+1
PRTMSG2   BRK
          .BYTE     $CB
          .WORD     WRITINDX
          JMP       ERRORCK

PRTDNAME  TXA
          ASL       A
          ASL       A
          ASL       A
          ASL       A
          STA       DNAMEPTR
          LDY       #$00
          LDA       (DNAMEPTR),Y
          STA       PRTLEN2
          INC       DNAMEPTR
PRTDNAM2  BRK
          .BYTE     $CB
          .WORD     WRITDNAM
          JMP       ERRORCK

PRTBYTE   STA       CHR
          BRK
          .BYTE     $CB
          .WORD     WRITCHR
          JMP       ERRORCK

PrtBdBlk  LDX       #$02
@1        LDA       Err_Data+1,X
          STA       PRODUCT,X
          DEX
          BPL       @1
          LDA       BSECTADR
          STA       INDEX
          LDA       BSECTADR+1
          STA       INDEX+1
          JSR       DECIMAL7
          CLC
          LDX       #BLOCKBAD
          ADC       MSGLEN,X
          JSR       PRTMSG1
          LDX       #BLKBAD2
          JMP       PRTMSG

FATALERR  BNE       @1
          RTS
@1        STA       ERRCODE
          PLA
          STA       INDEX+1
          PLA
          STA       INDEX
@2        JMP       @2

CLOSE     BEQ       @1
          STA       CLOSREF
          BRK
          .BYTE     $CC
          .WORD     CLOSLIST
@1        JMP       ERRORCK

QUIT      LDA       #$01
          JSR       PRTBYTE
          LDA       #$1C
          JSR       PRTBYTE
          LDA       SEGNUM
          STA       RELNUM
          BRK
          .BYTE     $45
          .WORD     RELSEG
BYE       BRK
          .BYTE     $65
          .WORD     BYE

                    ;event handler for escape keystroke
ESCHDLR   SEC
          ROR       HALTFLAG
          LDA       #FLSHTYPE
          STA       CTRLCODE
          BRK
          .BYTE     $83
          .WORD     CTRLCALL
          JMP       ERRORCK

HALTPRG   LDX       #MSGWIND
          JSR       PRTMSG
          BRK
          .BYTE     $82
          .WORD     RESCR
          JSR       ERRORCK
          LDX       #VFYHALT
          JSR       PRTMSG
@1        BRK
          .BYTE     $CA
          .WORD     READCON
          JSR       ERRORCK
          LDA       INPUT
          CMP       #$1B
          BNE       @2
          LDX       #CLRMSG
          JSR       PRTMSG
          JMP       GRPDONE
@2        CMP       #$20
          BNE       @1
          BRK
          .BYTE     $83
          .WORD     RESCR
          JSR       ERRORCK
          LDA       #$04
          JSR       PRTBYTE
          BRK
          .BYTE     $83
          .WORD     ATTNEVNT
          JSR       ERRORCK
          STA       HALTFLAG
          RTS

;****************** Main Program Initialization Routine *******************

BEGIN     TSX
          STX       STACK
          LDA       #$00
          STA       ERRCODE
          STA       MENU0SEL
          LDY       #$77           ;# of zero page data buffer locations
@1        STA       DNUMLST,Y
          DEY
          BPL       @1
          LDA       #$01
          STA       DfltSTlb
          JSR       ALLOCMEM

          BRK
          .BYTE     $84
          .WORD     DEVCALL
          JSR       FATALERR
          LDA       DEVNUM
          STA       CTRLREF1
          STA       CTRLREF2
          STA       CTRLREF3
          STA       STATREF1
          STA       STATREF2
          STA       SREF1
          STA       SREF2

          BRK
          .BYTE     $C8
          .WORD     OPENCON
          JSR       FATALERR
          LDA       CONREFN
          STA       PRTREF1
          STA       PRTREF2
          STA       PRTREF3
          STA       PRTREF4        ;added for select volume routine
          STA       CONREF

          LDY       #$00           ;Initialize console status buffers
          LDA       #$5A
          STA       (STATBUF1),Y
          BRK                      ;save initial console status
          .BYTE     $82
          .WORD     CONSTAT
          JSR       FATALERR

          LDA       (STATBUF1),Y    ;Get console status buffer length
          STA       STATBUF2
          INC       STATBUF2
          STA       (STATBUF2),Y
          LDA       STATBUF2
          ASL       A
          STA       SCRBUF
          TYA
          STA       (SCRBUF),Y      ;initialize screen buffer

          LDA       #$0B
          STA       CTRLCODE
          BRK                      ;turn off screen echo
          .BYTE     $83
          .WORD     CTRLCALL
          JSR       FATALERR
          BRK                      ;save current console status
          .BYTE     $82
          .WORD     RESETCON
          JSR       FATALERR
          LDY       #$01
          STA       (STATBUF2),Y
          LDY       #$06
          STA       (STATBUF2),Y
          BRK
          .BYTE     $83
          .WORD     RESETCON
          JSR       FATALERR
          BRK
          .BYTE     $83
          .WORD     SETFONT1
          JSR       ERRORCK
          BRK
          .BYTE     $83
          .WORD     SETFONT2
          JSR       ERRORCK
          LDX       #TITLE
          JSR       PRTMSG
          LDX       #BORDER
          JSR       PRTMSG
          LDX       #SEARCH
          JSR       PRTMSG
          JSR       PREPDATE
          JSR       GETDNAME
          JSR       Wait1sec
          JMP       MENUINIT

;************************** Main Program Menu *****************************

                    ;Main Menu and home origin for program routines
MAINMENU  LDX       STACK
          TXS
          BRK                      ;RESET CONSOLE
          .BYTE     $83
          .WORD     RESETCON
          JSR       ERRORCK
MENUINIT  LDX       #CLRPMPT
          JSR       PRTMSG
          LDX       #CMDLINE
          JSR       PRTMSG
          LDX       #VERSION
          JSR       PRTMSG
          LDX       #DATE
          JSR       PRTMSG
          LDX       #MENU0
          JSR       PRTMSG
          LDX       #ESC0
          JSR       PRTESCP
          LDX       MENU0SEL
          JMP       MENU0HL

                    ;Print non highlighted menu item
MENU0STD  STX       MENU0SEL
          JSR       PRTMSG2

                    ;Print highligted menu item
MENU0HL   LDA       MENU0LEN,X
          STA       PRTLEN1
          TXA
          ASL       A
          TAX
          LDA       MENU0ADR,X
          STA       INDEX
          LDA       MENU0ADR+1,X
          STA       INDEX+1
          LDY       #$03
          LDA       #$12
          STA       (INDEX),Y
          JSR       PRTMSG2
          LDA       #$11
          STA       (INDEX),Y
GETCHR1   BRK
          .BYTE     $CA
          .WORD     READCON
          JSR       ERRORCK
          LDA       INPUT
          CMP       #UPARROW
          BEQ       UP0
          CMP       #DNARROW
          BEQ       DN0
          CMP       #RETURN
          BEQ       CRET0
          CMP       #OAPL_QM
          BEQ       @2
          AND       #$DF
          LDX       #MenuItms-1    ;Number of menu items
@1        CMP       MENU0LST,X
          BEQ       SELECT0
          DEX
          BPL       @1
          JMP       GETCHR1
@2        LDX       #COPYRITE
          JSR       PRTMSG
          LDX       MENU0SEL
          JMP       MENU0HL

                    ;Up arrow for main menu
UP0       LDX       MENU0SEL
          DEX
          BPL       MENU0STD
          LDX       #MenuItms-1    ;Number of menu items
          BNE       MENU0STD

                    ;Down arrow for main menu
DN0       LDX       MENU0SEL
          INX
          CPX       #MenuItms      ;Number of menu items
          BCC       MENU0STD
          LDX       #$00
          BEQ       MENU0STD

;CFutil3
                    ;Return for main menu
CRET0     LDX       MENU0SEL
SELECT0   TXA
          STA       MENU0SEL
          ASL       A
          TAX
          LDA       FUNCADR+1,X
          PHA
          LDA       FUNCADR,X
          PHA
          LDX       #CLRVPORT
          JMP       PRTMSG

                    ;Routine to display device info
DispInfo  LDX       #DEVHDR1       ;Display device info
          JSR       PRTMSG
          LDX       #Devic_nx
          JSR       PRTMSG
          LDX       #DEVHDR2       ;Display model # info
          JSR       PRTMSG
          LDX       #Model_nx
          JSR       PRTMSG
          LDX       #DEVHDR3       ;Display serial # info
          JSR       PRTMSG
          LDX       #Seria_nx
          JSR       PRTMSG
          LDX       #DEVHDR4       ;Display firmware version info
          JSR       PRTMSG
          LDX       #FirmW_nx
          JMP       PRTMSG

DspInfo1  JSR       DispInfo       ;Display primary device information
          JMP       DCapcity
DspInfo2  JSR       DispInfo       ;Display all device information
          LDX       #DEVHDR5       ;Display LBA support info
          JSR       PRTMSG
          LDX       #AnsYes
          LDA       MODE_ID
          AND       #$02
          BNE       @1
          LDX       #No_LBA
@1        JSR       PRTMSG
          LDX       #DEVHDR6       ;Display CFA features support info
          JSR       PRTMSG
          LDX       #AnsYes
          LDA       MODE_ID
          AND       #$01
          BEQ       @2
          LDX       #AnsNo
@2        JSR       PRTMSG
DCapcity  LDX       #DEVHDR7       ;Display Total device capacity info
          JSR       PRTMSG
          LDX       #TCapBlks
          JSR       PRTMSG
          LDX       #BLOCKS
          JMP       PRTMSG

;***************** Low Level & Partition Format Routines ******************

FORMAT    LDX       #CMDLINE
          JSR       PRTMSG
          LDX       #LFMTCMD
          JSR       PRTMSG
          JSR       DISPDRV
          JSR       DspInfo1

          LDA       #$0A
          STA       VTPOS
          JSR       INCVPOS
          LDX       #FWARNING
          JSR       PRTMSG
@2        LDX       #ESC3
          JSR       PRTESCP
          BRK
          .BYTE     $CA
          .WORD     READCON
          JSR       ERRORCK
          LDX       #CLRMSGW
          JSR       PRTMSG
          LDA       INPUT
          AND       #$DF
          CMP       #OAPPLE_P
          BEQ       FMTPTBL
          CMP       #OAPPLE_F
          BEQ       FMTBEGIN
          CMP       #ESCAPE
          BNE       @2
FMTABORT  JMP       MAINMENU

FMTPTBL   JSR       GetPmap0       ;Get partition table number from user
          BCS       FMTABORT
          LDX       #ERASEPT1
          JSR       PRTMSG
          LDX       #ESC8
          JSR       PRTESCP
          JSR       QUERY_YN
          BCS       FMTABORT
          JSR       ZEROPTBL
          JSR       INCVPOS
          JSR       WRITPTBL
          JMP       PAUSE

FMTBEGIN  LDA       MODE_ID        ;check if device supports CFA feature set
          AND       #$01
          BEQ       @2
          LDX       #NOFRMAT
          JSR       PRTMSG
          LDX       #ERASEPT2      ;prompt to erase all the partition tables
          JSR       Query0YN
          BCS       FMTABORT       ;no don't erase the partition tables
          JSR       ZEROPTBL
          LDA       TOTSECT+2
          LSR       A
          LSR       A
          STA       CurPTmap
@1        JSR       SKIPSEL2       ;setup PTmapHB & CurPTmap
          JSR       WPTBLDAT       ;Write partition table data to drive
          DEC       CurPTmap
          LDA       CurPTmap
          BPL       @1
          JSR       INCVPOS
          LDX       #ERASPTDN      ;erase partition tables complete message
          JSR       PRTMSG
          JMP       FMTDRVRS

@2        LDX       #ERASEDRV
          JSR       Query0YN
          BCS       FMTABORT

          LDX       #FMTMSG        ;start lowlevel drive format
          JSR       PRTMSG
          JSR       CLRCALL
          LDY       #ATA_Cmd       ;Setup low level format call
          LDA       #ATA_Frmt
          STA       (BUFFCALL),Y
          LDX       #ESC4          ;Halt option message for format routine
          STX       ZPGTEMP0
          JSR       STRTOPER
          LDA       VFYERADR
          STA       INDEX
          LDA       VFYERADR+1
          STA       INDEX+1
          LDA       NUMERROR
          STA       PRODUCT
          LDA       #$00
          STA       PRODUCT+1
          JSR       DECIMAL3
          STA       NUMVLEN
          LDX       #FMTDONE       ;display format complete message
          BIT       HALTFLAG
          BPL       @3
          LDX       #FMTHLTD
@3        JSR       PRTMSG
          LDX       #NUMERRS
          JSR       PRTMSG
          LDX       #OCCUR
          JSR       PRTMSG

FMTDRVRS  LDY       CURDRIVE       ;Mformat call to all drivers for the current device
          LDX       DEV0LIST,Y
          LDA       SLOTLST,X      ;get slot and device num for the drive formatted
          STA       ZPGTEMP0
          LDA       DRVNLST,X
          STA       TEMPVAL
          LDX       #$00
@1        LDA       SLOTLST,X
          CMP       ZPGTEMP0
          BNE       @2
          LDA       DRVNLST,X
          CMP       TEMPVAL
          BEQ       @2             ;if same partition table & drive then skip
          LDA       DNUMLST,X
          STA       DFMTREF
          BRK
          .BYTE     $83            ;format call to initialize driver
          .WORD     DFMTCALL
          JSR       ERRORCK
@2        INX                      ;scroll thru all drivers online
          CPX       NUMDNAME
          BCC       @1
          JMP       PAUSE

ZEROPTBL  LDY       #$00           ;Fill partition data table with $00
          TYA
@1        STA       (PARTTBL),Y
          INY
          BNE       @1
          RTS

;********************* Verify Drive Media Routine  ************************

VERIFY    LDX       #CMDLINE
          JSR       PRTMSG
          LDX       #VRFYCMD
          JSR       PRTMSG
          JSR       DISPDRV
          JSR       DspInfo1
          LDA       #$0A
          STA       VTPOS
          LDX       #VRFYMSG
          JSR       Query0YN
          BCC       @1
          JMP       MAINMENU
@1        LDX       #CLRMSG
          JSR       PRTMSG
          JSR       CLRCALL
          LDY       #ATA_Cmd       ;Setup read-verify call
          LDA       #ATA_Vrfy
          STA       (BUFFCALL),Y
          LDX       #ESC5          ;Halt option message for verify routine
          STX       ZPGTEMP0
          JSR       STRTOPER
          LDA       VFYERADR
          STA       INDEX
          LDA       VFYERADR+1
          STA       INDEX+1
          LDA       NUMERROR
          STA       PRODUCT
          LDA       #$00
          STA       PRODUCT+1
          JSR       DECIMAL3
          STA       NUMVLEN
          LDX       #VFYCOMP
          BIT       HALTFLAG
          BPL       @2
          LDX       #VFYHLTD
@2        JSR       PRTMSG
          LDX       #NUMERRS
          JSR       PRTMSG
          LDX       #OCCUR
          JSR       PRTMSG
          JMP       PAUSE

                    ;Subroutine to perform a function over the entire capacity
                    ;of the device, display a gas gage progress indicator, and handle
                    ;user interupt of function
STRTOPER  TSX
          STX       LOCSTAT
          LDA       #$00
          STA       HALTFLAG
          STA       NUMERROR
          STA       POSITION       ;percentage counter
          LDA       #$32
          STA       Divisor        ;Initialize number of gas gage increments
          LDA       #$13
          STA       GAS_HPOS       ;Initialize gas gage starting horizontal position
          JSR       InitBPER       ;Setup counter for gas gage display
          LDX       ZPGTEMP0
          JSR       PRTESCP
          LDX       #GASGAUGE      ;gas gage progess display
          JSR       PRTMSG
          LDA       #$80           ;Turn on attention event
          STA       ATTNBUFF
          BRK
          .BYTE     $83
          .WORD     ATTNEVNT
          JSR       ERRORCK
          JSR       CALLDRVR
          BNE       BLKVFERR

NEXTRK    LDY       #Num_Blks
          LDA       (BUFFCALL),Y
          BEQ       @1             ;If Num_Blks=$0 then increment BCTR $0100
          CLC
          ADC       BCTR
          STA       BCTR
          BCC       @2
@1        INC       BCTR+1
@2        JSR       INCRSECT
          BIT       HALTFLAG
          BPL       @3
          JSR       HALTPRG
@3        JSR       PRT_GAGE
NXTBLK2   BIT       HALTFLAG
          BPL       @1
          JSR       HALTPRG
@1        JSR       CALLDRVR       ;Verify Num_Blks
          BEQ       NEXTRK

                    ;Bad block error routine for verify or format device routines
BLKVFERR  BCC       @1
          BIT       Err_Data
          BMI       @2
@1        JSR       ATTNOFF        ;if not bad block error then report error & exit to menu
          JSR       DevErrCk
          JMP       ErrHndlr
@2        LDA       NUMERROR       ;If first error then clear viewport
          BNE       @3
          LDX       #VIEWPOS
          JSR       PRTMSG
          LDA       #$1C
          JSR       PRTBYTE
          LDA       #$02
          STA       VTPOS
@3        JSR       INCVPOS
          INC       NUMERROR
          JSR       PrtBdBlk
          CLC
          LDY       #Sect_LB
          LDA       Err_Data+1     ;update call address with next block after error
          ADC       #$01
          STA       (BUFFCALL),Y
          DEY
          LDA       Err_Data+2
          ADC       #$00
          STA       (BUFFCALL),Y
          DEY
          LDA       Err_Data+3
          ADC       #$00
          STA       (BUFFCALL),Y
          JSR       InitBPER
          JMP       NXTBLK2

INCVPOS   LDA       VTPOS          ;increment viewport vertical position
          CMP       #$0E
          BCS       @1
          INC       VTPOS
@1        LDX       #VIEWPOS
          JMP       PRTMSG

                    ;Subroutine to print progress & gas gage indicator
PRT_GAGE  LDA       BPERCTR+1
          BEQ       @0
          CMP       BCTR+1
          BCC       @2
          BNE       @1
          LDA       BPERCTR
          CMP       BCTR
          BEQ       @2
          LDY       Divisor        ;if divisor = 1 then load Num_Blks with final amount
          DEY
          BNE       @1
          LDY       #Num_Blks
          STA       (BUFFCALL),Y
@1        RTS
@0        LDA       BCTR
          CMP       BPERCTR
          BCC       @1

@2        INC       POSITION
          INC       POSITION
          LDX       POSITION       ;percentage counter
          LDY       #$02
@3        LDA       #$00           ;Initialize remainder
          JSR       DIVx10
          ORA       #$30
          STA       PCENT,Y
          TXA
          BEQ       @5
          DEY
          BNE       @3
          TXA
          ORA       #$30
          STA       PCENT,Y
          BNE       @6
@4        LDA       #$20
          STA       PCENT,Y
@5        DEY
          BPL       @4
@6        LDX       #PROGBAR
          JSR       PRTMSG
          INC       GAS_HPOS
          DEC       Divisor
          BNE       InitBPER
GRPDONE   JSR       ATTNOFF        ;If divisor is zero then we are done
          LDX       #CLRMSGW
          JSR       PRTMSG
          LDX       LOCSTAT
          TXS
          INC       VTPOS
          LDX       #VIEWPORT
          JSR       PRTMSG
          LDX       #ClrLower
          JMP       PRTMSG

InitBPER  SEC                      ;determine how many sectors are left to verify
          LDY       #Sect_LB
          LDA       TOTSECT
          SBC       (BUFFCALL),Y
          STA       BPERCTR
          DEY
          LDA       TOTSECT+1
          SBC       (BUFFCALL),Y
          STA       BPERCTR+1
          DEY
          LDA       TOTSECT+2
          SBC       (BUFFCALL),Y

DIV24x8   LDX       #$10           ;24bit divide by 8bit routine where quotient won't
          CLC                      ;exceed 16bits.  @Entry BPERCTR=LSB Dividend, Dividend
@1        ROL       BPERCTR        ;BPERCTR+1=MSB, Areg=HSB Dividend, Divisor=Divisor
          ROL       BPERCTR+1
          ROL       A
          CMP       Divisor
          BCC       @2
          SBC       Divisor
@2        DEX
          BNE       @1
          STX       BCTR           ;re-initialize block counter to zero
          STX       BCTR+1
          ROL       BPERCTR
          ROL       BPERCTR+1      ;at Exit: Areg & BPERCTR=Quotient LB,
                                   ;BPERCTR+1=Quotient HB
          BNE       @3
          LDX       BPERCTR        ;with BPERCTR
@3        LDY       #Num_Blks      ;Update drive call for next read quantity
          TXA
          STA       (BUFFCALL),Y
          RTS

ATTNOFF   LDA       #$00
          STA       ATTNBUFF       ;Turn off attention event
          BRK
          .BYTE     $83
          .WORD     ATTNEVNT
          JMP       ERRORCK

INCRSECT  SEC                      ;Increment block address by Num_Blks
          LDY       #Num_Blks
          LDA       (BUFFCALL),Y
          BEQ       @1             ;If Num_Blks = $0 then increment sector address by $0100
          CLC
          LDY       #Sect_LB
          ADC       (BUFFCALL),Y
          STA       (BUFFCALL),Y
@1        LDY       #Sect_MB
          LDA       (BUFFCALL),Y
          ADC       #$00
          STA       (BUFFCALL),Y
          DEY
          LDA       (BUFFCALL),Y
          ADC       #$00
          STA       (BUFFCALL),Y
          RTS

                    ;Test if any devices are connected
Any_Devs  LDY       DEVLSTCT
          BEQ       No_Devs
          RTS                      ;returns with the # of devices online
No_Devs   LDX       #NODRIVE
          JSR       PRTMSG
          JMP       PAUSE          ;if no devices are present then return to mainmenu

;******************** Test Interface Card Routines ************************

TESTIFC   LDX       #CMDLINE
          JSR       PRTMSG
          LDX       #TESTCMD
          JSR       PRTMSG
          JSR       Any_Devs
          SEC
          DEY
          STY       CURDRIVE
          BEQ       Only1Dev       ;only 1 device  so skip the search for others
          LDX       DEV0LIST,Y     ;check if multiple cards are present
          LDA       SLOTLST,X
          STA       TEMPVAL
          DEY
@1        LDX       DEV0LIST,Y
          LDA       SLOTLST,X
          CMP       TEMPVAL
          BNE       @2
          DEY
          BPL       @1
          BMI       @3
@2        JSR       SELDRVR        ;if multiple cards then select a driver to test

@3        LDY       CURDRIVE       ;Save current drive parameters
          LDX       DEV0LIST,Y
          LDA       SLOTLST,X
          STA       TEMPVAL
          LDA       DRVNLST,X
          AND       #$01
          BEQ       FindDrv1       ;Device $0 is already in current drive
          STY       ZPGTEMP1       ;We have found device $1 - save it.

          LDA       #$00
          JSR       SCANLIST       ;Go find device $0
          BCS       Only1Dev
          STY       CURDRIVE       ;Set device $0 as current drive
          BCC       TestDev        ;Always branches

FindDrv1  LDA       #$01
          JSR       SCANLIST
          BCS       Only1Dev
          STY       ZPGTEMP1
          BCC       TestDev        ;Always branches

Only1Dev  ROR       ZPGTEMP1       ;Flag only one device exists on this card

TestDev   LDX       #CLRVPORT
          JSR       PRTMSG
          JSR       CLRCALL
          LDY       #ATA_Cmd
          LDA       #ATA_Diag
          STA       (BUFFCALL),Y
          JSR       CALLDRVR
          JSR       ErrHndlr
          LDX       #TESTLST
          JSR       PRTMSG
          LDY       #$00
          LDA       (BUFFPG0),Y
          STA       ERRCODE
          BPL       @1
          LDX       #TestER8x
          JSR       PRTMSG
          LDX       #DASH
          JSR       PRTMSG
          LDA       ERRCODE
@1        AND       #$07
          CLC
          ADC       #TestER00
          TAX
          JSR       PRTMSG

FIRSTDRV  BIT       ZPGTEMP1       ;if Hb set then only 1 drive exists
          BMI       NXTDRV
          JSR       GETDDATA
          JSR       DspInfo2       ;Display device info list
          JSR       G_ANYKEY
          LDA       #$0C
          JSR       PRTBYTE
          LDA       #$0A
          JSR       PRTBYTE
          LDA       ZPGTEMP1
          STA       CURDRIVE
NXTDRV    JSR       GETDDATA
          JSR       DspInfo2       ;Display device info list
          LDX       #TESTCOMP
          JSR       PRTMSG
          JMP       PAUSE

                    ;Routine to search Online Devices driver list for a specific device
SCANLIST  STA       TEMPVAL1       ;At entry Areg = Device #($0 or $1) to find,
SCANLST2  LDY       #$00           ;TEMPVAL = Slot # of device
@1        LDX       DEV0LIST,Y
          LDA       SLOTLST,X
          CMP       TEMPVAL        ;slot of currently selected driver
          BNE       @2
          LDA       DRVNLST,X
          AND       #$01
          CMP       TEMPVAL1
          BNE       @2
          STX       TEMPINDX       ;save device/driver index for later
          CLC                      ;Returns carry clear - device found: Xreg & TEMPINDX = Driver Index,
          RTS                      ;Yreg = Device Index, Areg = Device #($0 or $1)
@2        INY
          CPY       DEVLSTCT
          BCC       @1
          RTS                      ;Returns with carry set = device not found :  All registers invalid.

                    ;Display current driver on header command line
DISPDRV   JSR       SELECDRV
          LDX       #DRVHEDR
          JSR       PRTMSG
          LDY       CURDRIVE
          LDX       DEV0LIST,Y
          JSR       PRTDNAME
          LDA       #$04
          JSR       PRTBYTE
          LDX       #CLRVPORT
          JMP       PRTMSG

                    ;routine to display created & modified dates for partition table
PTDATES   LDY       #ORIGDATE+7
          LDX       #$07
@1        LDA       (PARTTBL),Y
          AND       #$7F
          CMP       #$2F
          BCC       @3
          CMP       #$3A
          BCS       @3
          STA       ORGDATE1,X
          DEY
          DEX
          BPL       @1
          LDX       #CREADATE
          JSR       PRTMSG
          LDY       #MODDATE+7
          LDX       #$07
@2        LDA       (PARTTBL),Y
          AND       #$7F
          CMP       #$2F
          BCC       @3
          CMP       #$3A
          BCS       @3
          STA       NEWDATE1,X
          DEY
          DEX
          BPL       @2
          LDX       #LMODDATE
          JSR       PRTMSG
@3        RTS

                    ;Compute partition table checksum
GETCKSUM  CLC
          LDY       #$02
          LDA       #$A5
@1        EOR       (PARTTBL),Y
          INY
          ADC       (PARTTBL),Y
          INY
          BNE       @1
          RTS

                    ;List devices online program function
LSTDRV    LDX       #CMDLINE
          JSR       PRTMSG
          LDX       #LSTDRCMD
          JSR       PRTMSG
          JSR       Any_Devs       ;Check if any devices are present
          JSR       DLISTDRV
          JMP       PAUSE

                    ;Display list of devices online
DLISTDRV  LDX       #VIEWPORT
          JSR       PRTMSG
          SEC
          LDA       #$0E
          SBC       DEVLSTCT
          LSR       A
          STA       DWINDULC
          LDX       #DWINDMSG
          JSR       PRTMSG
          LDX       #$00
@1        STX       DRVPOS
          LDX       #DLEADER
          JSR       PRTMSG
          LDY       DRVPOS
          LDX       DEV0LIST,Y
          LDA       SLOTLST,X
          ORA       #$30
          STA       SLOTVAL
          LDA       DRVNLST,X
          AND       #$01
          ORA       #$30
          STA       DRVNVAL
          JSR       PRTDNAME
          LDX       #SLOTPOS
          JSR       PRTMSG
          LDX       DRVPOS
          INX
          CPX       DEVLSTCT
          BCC       @1
          RTS

;************************ Driver Selection Routine ************************

SELECDRV  JSR       Any_Devs
          DEY
          STY       CURDRIVE
          BEQ       @1             ;If only one device then skip selecting a driver
          JSR       SELDRVR
@1        JMP       GETDDATA

SELDRVR   JSR       DLISTDRV
          LDX       #ESC2
          JSR       PRTESCP
          LDX       #DLEADER
          LDA       MSGLEN,X
          STA       PRTLEN1
          TXA
          ASL       A
          TAX
          LDA       MSGADR,X
          STA       INDEX
          LDA       MSGADR+1,X
          STA       INDEX+1
          LDX       #$00
          STX       CURDRIVE       ;initialize current drive
          JMP       SMENUHL

                    ;Select drive menu
SMENUSTD  STX       CURDRIVE
          JSR       PRTMSG2
          JSR       PRTDNAM2
SMENUHL   STX       DRVPOS         ;Entry point of select device subroutine Xreg=CURDRIVE
          LDA       #$12
          STA       DRVPOS+1
          JSR       PRTMSG2
          LDY       DRVPOS
          LDX       DEV0LIST,Y
          JSR       PRTDNAME
          LDA       #$11
          STA       DRVPOS+1
          JSR       PRTBYTE
@1        BRK
          .BYTE     $CA
          .WORD     READCON
          JSR       ERRORCK
          LDA       INPUT
          CMP       #UPARROW
          BEQ       UP1
          CMP       #DNARROW
          BEQ       DN1
          CMP       #RETURN
          BEQ       CRET1
          CMP       #ESCAPE
          BNE       @1
          JMP       MAINMENU
CRET1     LDX       #CLRPMPT
          JSR       PRTMSG
          LDX       #CLRVPORT
          JMP       PRTMSG

                    ;Up arrow for select drive menu
UP1       LDX       CURDRIVE
          DEX
          BPL       SMENUSTD
          LDX       DEVLSTCT
          DEX
          JMP       SMENUSTD

                    ;Down arrow for select drive menu
DN1       LDX       CURDRIVE
          INX
          CPX       DEVLSTCT
          BCC       SMENUSTD
          LDX       #$00
          JMP       SMENUSTD

                    ;Get list of all CF/IDE drivers online
GETDNAME  LDX       #$00
          STX       NUMDNAME
@1        INX
          STX       DNUM
          STX       SDNUM1
          LDA       NUMDNAME
          ASL       A
          ASL       A
          ASL       A
          ASL       A
          STA       DNAMEPTR
          BRK
          .BYTE     $85
          .WORD     DINFO
          BNE       @5
          LDY       #$01
@2        LDA       DEVTYPE,Y
          CMP       DEV_ID,Y
          BNE       @4
          LDA       MANUFID,Y
          CMP       DEV_ID+2,Y
          BNE       @4
          DEY
          BPL       @2
@3        BRK
          .BYTE     $82
          .WORD     DIBinfo        ;retrieve driver configuration bytes
          BNE       @4
          LDX       NUMDNAME
          LDA       DNUM
          STA       DNUMLST,X
          LDA       SLOTNUM
          STA       SLOTLST,X
          LDA       UNITNUM
          STA       UNUMLST,X
          LDA       DCFGNUM
          STA       PNUMLST,X
          LDA       DRIVNUM
          STA       DRVNLST,X
          INC       NUMDNAME
@4        LDX       DNUM
          CPX       #MAXDNUM+1
          BCC       @1
                    ;Scan drivers online for unique device list
@5        LDX       #$00
          STX       DEVLSTCT       ;initialize device count
BEGLOOP   LDY       #$00
          STX       ZPGTEMP0
CkNxtDev  CPY       ZPGTEMP0
          BEQ       IncDevCt       ;if same as current driver then check the next driver
          LDA       SLOTLST,X
          CMP       SLOTLST,Y
          BNE       IncDevCt       ;if not the same slot then check the next driver
          LDA       DRVNLST,Y
          AND       #$01
          STA       ZPGTEMP1
          LDA       DRVNLST,X
          AND       #$01
          CMP       ZPGTEMP1
          BNE       IncDevCt       ;if not the same IDE device then check the next driver
          LDA       UNUMLST,X
          CMP       UNUMLST,Y      ;if current unitnum is greater or equal to the
          BCS       NextDev        ;unitnum of the next driver then skip this driver
IncDevCt  INY
          CPY       NUMDNAME
          BCC       CkNxtDev
          LDY       DEVLSTCT
          STX       DEV0LIST,Y

                    ;Get the device identification data for this device
          LDA       DNUMLST,X
          STA       SDNUM2
          TYA
          ASL       A
          CLC
          ADC       IBuffHB
          STA       DevIDpg0+1
          BRK
          .BYTE     $82
          .WORD     DevIdent
          BNE       NextDev        ;if error then device not online
          INC       DEVLSTCT       ;add this device to the list
NextDev   INX
          CPX       NUMDNAME
          BCC       BEGLOOP
          RTS

;********************** Memory Manager Routines ***************************

                    ;Allocate memory and setup pointers
                    ;Allocate memory and setup pointers
                    ;Extended Memory Map - $3B00 bytes long

                    ;$0000    DNAMEPTR  .res      $C0,$00
                    ;  Device $0 thru $B  $010 bytes each

                    ;Call Block Organization:
                    ;$00F9    ATA Command Code  .BYTE     $00
                    ;         Sector HB         .BYTE     $00
                    ;         Sector MB         .BYTE     $00
                    ;         Sector LB         .BYTE     $00
                    ;         # of sectors      .BYTE     $00
                    ;         Bytes returned    .WORD     $00

                    ;$0100    BUFFPG0   .res      $100,$00
                    ;$0200    BUFFPG1   .res      $100,$00

                    ;$0300    PARTTBL   .res      $100,$00

                    ;Device Indentification Block for up to 8 unique devices online
                    ;$0400    DevIDpg0  .res      $200,$00
                    ;$0600    DevIDpg1  .res      $200,$00
                    ;$0800    DevIDpg2  .res      $200,$00
                    ;$0A00    DevIDpg3  .res      $200,$00
                    ;$0C00    DevIDpg4  .res      $200,$00
                    ;$0E00    DevIDpg5  .res      $200,$00
                    ;$1000    DevIDpg6  .res      $200,$00
                    ;$1200    DevIDpg7  .res      $200,$00

                    ;Volume Name List
                    ;$1400    PICKINDX  .res      2400,$00
                    ;  512 Records @ 18 bytes long each
                    ;      $00-0E    Volume Name
                    ;      $0F       Length of Volume Name
                    ;      $10       Partition Table
                    ;      $11       Partition Number

                    ;Screen status buffers  $300 bytes long
                    ;$3800    STATBUF1  .res      $5B,$00
                    ;$385B    STATBUF2  .res      $5B,$00
                    ;$38B6    SCRBUF    .res      $1CA,$00
GETMEMRY  BRK
          .BYTE     $41
          .WORD     FINDSEG
          JSR       FATALERR
          LDA       BASE
          BEQ       @1
          CMP       #$0F
          BCC       @2
@1        LDA       #$8F
          STA       BASE           ;Extended address bank
          RTS
@2        ORA       #$80
          STA       BASE           ;Extended address bank
          LDA       BASE+1
          SBC       #$20
          CMP       #$82
          BCC       @3
          SBC       #$80
          INC       BASE
          JMP       @4
@3        CMP       #$02
          BCS       @4
          ADC       #$80
          DEC       BASE
@4        STA       BASE+1
          RTS

;CFutil4
ALLOCMEM  LDA       #$00
          TAY
@1        STA       EXTPG-1,Y      ;Initalize extended address page
          INY
          BNE       @1
          JSR       GETMEMRY       ;Get a block of 59 pages of memory
          LDA       BASE+1
          STA       DNAMEPTR+1
          STA       BUFFCALL+1
          CLC
          ADC       #$01
          STA       BUFFPG0+1
          ADC       #$01
          STA       BUFFPG1+1
          ADC       #$01
          STA       PARTTBL+1
          ADC       #$01
          STA       IBuffHB        ;Address page for DevIDpg0
          ADC       #$10
          STA       PICKBASE+1
          ADC       #$24
          STA       STATBUF1+1
          STA       STATBUF2+1
          STA       SCRBUF+1

          LDA       BASE
          STA       BUFFPG0+EXTPG
          STA       BUFFPG1+EXTPG
          STA       BUFFCALL+EXTPG
          STA       STATBUF1+EXTPG
          STA       STATBUF2+EXTPG
          STA       SCRBUF+EXTPG
          STA       DNAMEPTR+EXTPG
          STA       PARTTBL+EXTPG
          STA       DevIDpg0+EXTPG
          STA       PICKINDX+EXTPG

                    ;Insert additional extended bank locations above here

          LDA       #$00
          STA       STATBUF1
          STA       DNAMEPTR
          STA       PARTTBL
          STA       DevIDpg0
          STA       BUFFPG0
          STA       BUFFPG1
          STA       PICKBASE
          LDA       #$F9
          STA       BUFFCALL

                    ;Insert additional address lsb above here.
          LDA       BANKREG
          STA       EVHDLRXB
          RTS

;****************** Change Driver Configuration Routines ******************

VOLNMPRT  JSR       PRTMSG
          LDY       #$0F
          LDA       (PICKINDX),Y
          STA       PRTLEN3
          BRK
          .BYTE     $CB
          .WORD     WRITPICK
          JMP       ERRORCK

DECPOS    SEC
          LDA       PICKINDX
          SBC       #$12
          STA       PICKINDX
          LDA       PICKINDX+1
          SBC       #$00
          STA       PICKINDX+1
          SEC
          LDA       POSITION
          SBC       #$01
          STA       POSITION
          LDA       POSITION+1
          SBC       #$00
          STA       POSITION+1
          RTS

INCPOS    CLC
          LDA       PICKINDX
          ADC       #$12
          STA       PICKINDX
          LDA       PICKINDX+1
          ADC       #$00
          STA       PICKINDX+1
          INC       POSITION
          BNE       @1
          INC       POSITION+1
@1        RTS

InitList  LDA       PICKBASE       ;Setup initial VolArray address
          STA       PICKINDX
          LDA       PICKBASE+1
          STA       PICKINDX+1
          LDA       #$00
          STA       POSITION       ;initialize position in list to beginning
          STA       POSITION+1
          RTS

BEGINSEL  LDX       DRVPOS
          LDA       SLOTLST,X
          STA       TEMPVAL        ;setup for scan driver list
          LDA       DRVNLST,X
          AND       #$01
          JSR       SCANLIST
          JSR       GETDDAT2       ;Yreg = drive index to get identification data
          JSR       GMaxPtbl       ;Compute Maximum partition tables for device

          LDX       #BWINDPRT
          JSR       PRTMSG
          BRK                      ;Save contents of selection window
          .BYTE     $82
          .WORD     RESCR
          JSR       ERRORCK
          LDX       #BORDER1
          JSR       PRTMSG
          LDX       #STDPRT
          JSR       PRTMSG

                    ;Scan all partition maps and tables for Online Volumes
          SEC                      ;Initialize VolArray Address @ INDEX
          LDA       PICKBASE
          SBC       #$05
          STA       VOLINDEX
          LDA       PICKBASE+1
          SBC       #$00
          STA       VOLINDEX+1
          LDA       PICKINDX+EXTPG
          STA       VOLINDEX+EXTPG

          JSR       InitList       ;Setup for beginning of volume list
          STA       CurPTmap       ;Initialize volume name list variables  Areg = $00
          STA       VOLCOUNT
          STA       VOLCOUNT+1
          STA       ChgMade
NxtPtbl   ASL       A
          ASL       A
          STA       PTmapHB
          LDX       DRVPOS
          JSR       SETCALL
          JSR       GPTABLE        ;Get partition table for this driver
          JSR       GTRKPLEN       ;Transfer partition table values
          LDX       #$00           ;Initialize partition number
NxtPnum   STX       PartNum
          JSR       GVOLNAM1       ;Get volume label or volume status
          BCS       @3             ;Volume name was not found - move on
          LDY       #$15
          LDA       CurPTmap
          STA       (VOLINDEX),Y
          INY
          LDA       PartNum
          STA       (VOLINDEX),Y
          CLC                      ;Increment Volume name record addresss
          LDA       VOLINDEX
          ADC       #$12
          STA       VOLINDEX
          LDA       VOLINDEX+1
          ADC       #$00
          STA       VOLINDEX+1
          INC       VOLCOUNT
          BNE       @1
          INC       VOLCOUNT+1
@1        LDX       #STDPRT        ;Display volume names as we find them
          LDA       POSITION
          BEQ       @2
          CMP       #MaxSelNo
          BCS       @3
          LDX       #DNLFPRT
@2        JSR       VOLNMPRT
          JSR       INCPOS
@3        LDX       PartNum
          INX
          CPX       #$08
          BCC       NxtPnum
          INC       CurPTmap
          LDA       CurPTmap
          CMP       MAXPTBLS
          BCC       NxtPtbl
          BEQ       NxtPtbl

          LDX       #MSGWIND
          JSR       PRTMSG
          LDX       #HELPMSG
          JSR       PRTMSG

          JSR       InitList       ;Setup for beginning of volume list
          INC       UPHILITE       ;home
          LDX       #UPHIPRT       ;highlite 1st volume name
          JSR       VOLNMPRT
          DEC       UPHILITE
          JMP       GETCHR6

DESEL     BIT       ChgMade
          BPL       GETCHR6
          LDA       PICKINDX
          CMP       VALSEL
          BNE       GETCHR6
          LDA       PICKINDX+1
          CMP       VALSEL+1
          BNE       GETCHR6
          LDX       #LFPRT
          JSR       PRTMSG
          ASL       ChgMade
          BEQ       GETCHR6        ;always branches

MoveUP    LDA       POSITION+1
          ORA       POSITION
          BEQ       GETCHR6
          LDX       #STDPRT
          JSR       VOLNMPRT
          JSR       DECPOS
          LDX       #UPHIPRT
          BIT       ChgMade
          BPL       @1
          LDA       PICKINDX
          CMP       VALSEL
          BNE       @1
          LDA       PICKINDX+1
          CMP       VALSEL+1
          BNE       @1
          LDX       #UPRTPRT
          JSR       PRTMSG
          LDX       #HIPRT
@1        JSR       VOLNMPRT       ;falls thru to GETCHR6

GETCHR6   BRK
          .BYTE     $CA
          .WORD     READCON
          JSR       ERRORCK
          LDA       INPUT
          CMP       #LFARROW
          BEQ       DESEL
          CMP       #UPARROW
          BEQ       MoveUP
          CMP       #RTARROW
          BEQ       RT_SEL
          CMP       #DNARROW
          BEQ       MoveDown
          CMP       #RETURN
          BEQ       CRET4
          CMP       #ESCAPE
          BNE       GETCHR6
CLOSEOUT  LDX       #CLRMSG        ;Closeout selection and return to caller
          JSR       PRTMSG
          LDX       #BWINDPRT
          JSR       PRTMSG
          BRK
          .BYTE     $83
          .WORD     RESCR
          JMP       ERRORCK


RT_SEL    BIT       ChgMade
          BMI       GETCHR6        ;one has already been selected - ignore
          LDA       PICKINDX       ;This one is selected - save it.
          STA       VALSEL
          LDA       PICKINDX+1
          STA       VALSEL+1
          LDX       #RTPRT
          JSR       PRTMSG
          SEC
          ROR       ChgMade
          BNE       GETCHR6        ;always branches

MoveDown  LDA       POSITION+1
          CMP       VOLCOUNT+1
          BCC       @1
          LDY       POSITION
          INY
          CPY       VOLCOUNT
          BCS       GETCHR6
@1        LDX       #STDPRT
          JSR       VOLNMPRT
          JSR       INCPOS
          LDX       #DNHIPRT
          BIT       ChgMade
          BPL       @2
          LDA       PICKINDX
          CMP       VALSEL
          BNE       @2
          LDA       PICKINDX+1
          CMP       VALSEL+1
          BNE       @2
          LDX       #DNRTPRT
          JSR       PRTMSG
          LDX       #HIPRT
@2        JSR       VOLNMPRT
          JMP       GETCHR6

                    ;Record Format of VOLARRAY:
                    ;$00-$0E    Volume Name
                    ;$0F        Length of Volume Name
                    ;$10        Partition Table
                    ;$11        Partition Number

                    ;if a volume was selected then transfer ptbl & part #'s
CRET4     BIT       ChgMade
          BPL       CLOSEOUT
          JSR       CLOSEOUT
          LDA       VALSEL
          STA       PICKINDX
          LDA       VALSEL+1
          STA       PICKINDX+1
          JSR       GParmDat

          LDY       #$11
          LDA       (PICKINDX),Y    ;get partition number
          STA       PartNum
          ORA       #$30
          STA       PNUMVAL
          DEY
          LDA       (PICKINDX),Y    ;get partition table
          STA       CurPTmap
          TAX
          ASL       A
          ASL       A
          STA       PTmapHB

          JSR       GdevParm       ;Setup Volume display information
          JSR       PRTLAST1       ;display current selection
          LDX       #SAVEDCFG
          JSR       Query0YN
          BCC       @1             ;Yes - Save this configuration
          RTS
@1        JMP       SAVEDRV2       ;save selection, returns to caller


                    ;Display online driver list
DLST2DRV  LDX       #VIEWPORT
          JSR       PRTMSG
          SEC
          LDA       #$10
          SBC       NUMDNAME
          LSR       A
          STA       DWND2ULC
          CLC
          ADC       #$06
          STA       DWND3ULC
          LDX       #DWND2MSG
          JSR       PRTMSG
          LDX       #$00
@1        STX       DRVPOS
          LDX       #DLEADER
          JSR       PRTMSG
          JSR       GetDPrm2
          LDX       DRVPOS
          JSR       PRTDNAME
          LDX       #PMAPPOS
          JSR       PRTMSG
          LDX       DRVPOS
          INX
          CPX       NUMDNAME
          BCC       @1
          RTS

SetVLadr  LDA       PVOLADR
          STA       VOLINDEX
          LDA       PVOLADR+1
          STA       VOLINDEX+1
          LDA       #$00
          STA       VOLINDEX+EXTPG           ;Set extended page to local
          RTS

GParmDat  LDX       DRVPOS
          JSR       SETCALL
          LDA       SLOTLST,X
          STA       TEMPVAL        ;setup for scan driver list
          ORA       #$30
          STA       SLOTVAL4
          LDA       DRVNLST,X
          AND       #$01
          STA       TEMPVAL1       ;setup for scan driver list
          ORA       #$30
          STA       DRVNVAL2
          RTS

                    ;Subroutine to get driver data for displays & prompts
GetDParm  LDA       #$00
          STA       ChgMade        ;initialize modification status
GetDPrm2  JSR       GParmDat
          LDA       PNUMLST,X
          STA       PartNum
          ORA       #$30
          STA       PNUMVAL
          LDA       DRVNLST,X
          AND       #$FC
          STA       PTmapHB
          LSR       A
          LSR       A
          TAX
GdevParm  JSR       CNVBPTA2       ;convert binary partition map value to ascii
          JSR       SCANLST2       ;Make sure slot/device # are in the list of drivers
          BCC       JustPtbl
          JSR       SetVLadr
          LDY       #DEVNTEND-DEVNOT2+4
@1        LDA       DEVNOT2-5,Y
          STA       (VOLINDEX),Y
          DEY
          CPY       #$05
          BCS       @1
          LDA       #DEVNTEND-DEVNOT2
          ADC       #PMLDREND-SLOTLDR2
          STA       CfgVLen
          SEC
          RTS                      ;Returns with carry set - device # not in driver list.
JustPtbl  JSR       GPTABLE        ;Get partition table
          JSR       GTRKPLEN       ;Transfer partition table values
JustPnum  JSR       SetVLadr
          LDX       PartNum
          JSR       GVOLNAM1       ;Get volume label or volume status
          LDY       #$14
          LDA       (VOLINDEX),Y
          CLC
          ADC       #PMLDREND-SLOTLDR2
          STA       CfgVLen
          RTS                      ;Returns with carry clear.

                    ;Subroutine to get single number from user
EDIT1NUM  LDX       #ESC7
          JSR       PRTESCP
          LDA       #$05           ;turn on curser
          JSR       PRTBYTE
          JMP       GETCHR5
SHOWNUM   STX       ASCICHR1
OUTCHR1   LDX       #ONEASCI
          JSR       PRTMSG
GETCHR5   BRK
          .BYTE     $CA
          .WORD     READCON
          JSR       ERRORCK
          LDA       INPUT
          CMP       #DNARROW
          BEQ       DOWN3
          CMP       #UPARROW
          BEQ       UP3
          CMP       #ESCAPE
          BEQ       NOCHNG2
          CMP       #RETURN
          BEQ       CRET3
          CMP       #$30           ;Ascii Values
          BCC       GETCHR5
          CMP       ZPGTEMP1       ;check if value is too large
          BCS       GETCHR5
          STA       ASCICHR1
          JMP       OUTCHR1
DOWN3     LDX       ASCICHR1
          DEX
          CPX       #$30
          BCC       GETCHR5
          JMP       SHOWNUM
UP3       LDX       ASCICHR1
          INX
          CPX       ZPGTEMP1
          BCS       GETCHR5
          JMP       SHOWNUM
CRET3     LDA       #$06
          JSR       PRTBYTE
          CLC
          RTS
NOCHNG2   LDA       #$06
          JSR       PRTBYTE
          SEC                      ;If Escape, return with carry set
          RTS

                    ;Convert binary partition map number to 2 byte ascii
                    ;On entry Xreg=partition map number
CNVBPTA2  LDA       #$00
          JSR       DIVx10
          BEQ       @1
          ORA       #$30
          STA       PMAPVAL+1
          TXA
          BNE       @2
@1        LDX       #$20           ;eliminate leading zeros
          STX       PMAPVAL+1
@2        ORA       #$30
          STA       PMAPVAL
          RTS

UP2       LDX       DRVPOS         ;Up arrow for select drive menu
          DEX
          BPL       SMNU2STD
          LDX       NUMDNAME
          DEX
          BPL       SMNU2STD       ;always branches

DN2       LDX       DRVPOS         ;Down arrow for select drive menu
          INX
          CPX       NUMDNAME
          BCC       SMNU2STD
          LDX       #$00           ;falls through to SMNU2STD

SMNU2STD  JSR       PRTMSG2        ;Select drive menu
          JSR       PRTDNAM2
          STX       DRVPOS
SMNU2HL   LDA       #$12
          STA       DRVPOS+1
          JSR       PRTMSG2
          JSR       PRTDNAME
          LDA       #$11
          STA       DRVPOS+1
          JSR       PRTBYTE
@1        BRK
          .BYTE     $CA
          .WORD     READCON
          JSR       ERRORCK
          LDA       INPUT
          CMP       #UPARROW
          BEQ       UP2
          CMP       #DNARROW
          BEQ       DN2
          CMP       #OAPL_UP
          BEQ       Sel_VolN
          CMP       #RETURN
          BEQ       CRET2
          CMP       #ESCAPE
          BNE       @1
          JMP       MAINMENU

                    ;Change driver configuration function
                    ;Select Driver to change configuration
CHGCONFG  BIT       DCFGNUM
          BPL       @1
          LDX       #BADDVRV
          JSR       PRTMSG
          JMP       PAUSE

@1        LDX       #CMDLINE
          JSR       PRTMSG
          LDX       #SEL2CMD
          JSR       PRTMSG
          JSR       Any_Devs       ;Check if any devices are present
          JSR       DLST2DRV       ;Display driver list & parameters
          LDA       #$00
          STA       DRVPOS         ;initialize position in list to start out with
          BEQ       SelDChg        ;always branches

Sel_VolN  JSR       BEGINSEL       ;Select a Volume Name Routine
SELENTER  JSR       GetDParm
          JSR       PRTLAST1
SelDChg   LDX       #PTCHGMSG
          JSR       PRTPMPTM
          LDX       #ESC10         ;Select Driver to change configuration
          JSR       PRTESCP
          LDX       #LDRVWND
          JSR       PRTMSG
          LDX       #DLEADER
          LDA       MSGLEN,X
          STA       PRTLEN1
          TXA
          ASL       A
          TAX
          LDA       MSGADR,X
          STA       INDEX
          LDA       MSGADR+1,X
          STA       INDEX+1
          LDX       DRVPOS
          JMP       SMNU2HL

CRET2     JSR       GetDParm
CRET_A2   LDA       DRVNVAL2
          STA       DEVNVAL2       ;xfer device number display to prompt
          STA       ASCICHR1
          LDA       #$32           ;Limit - Maximum Ascii value allowable +1
          STA       ZPGTEMP1
          LDX       #EDITDEVN
          JSR       PRTPMPTM
          JSR       EDIT1NUM       ;get single number from user
          BCS       SELENTER
          LDA       ASCICHR1
          CMP       DRVNVAL2       ;check if device number was changed
          BEQ       FindPmap
          STA       DRVNVAL2
          LDA       #PMLDREND-SLOTLDR2     ;Volume name becomes invalid with new device
          STA       CfgVLen
          LDA       #$81
          JSR       SetChgs

FindPmap  LDA       SLOTVAL4
          STA       SLOTNOT2       ;xfer device number display to fault messages
          STA       SLOTNOT3
          AND       #$07
          STA       TEMPVAL
          LDA       DRVNVAL2       ;Check for valid IDE device
          STA       NOTDEVC1       ;xfer device number display to fault messages
          STA       NOTDEVC2
          AND       #$01
          JSR       SCANLIST
          BCC       NewPmap1       ;if slot/device # is found in driver list then move on

          LDX       #RELISTD       ;driver configuration needs to be saved to proceed
          JSR       ANYKEY0
          LDX       #SAVEDCFG
          JSR       Query0YN
          BCS       CRET_A2        ;save was declined - go back to enter a device #
          STA       CurPTmap       ;Intitalize partition table # to $0 (root level)
          SEC                      ;because we don't know the size of the device yet.
          ROR       ChgMade        ;change driver update flag to $C0
          JSR       SAVEDRV2       ;for manditory driver relisting and go save driver parms
          JSR       GetDParm       ;scan new driver list & reload current driver parameters
          BCC       NewPmap0       ;if new device # was found then move on
          LDX       #NODEVICE      ;IDE device was not found in this slot
          JSR       ANYKEY0
GoCretA2  JMP       CRET_A2        ;Go back to prompt for a device #

NewPmap0  JSR       PRTLAST1
          LDY       ZPGTEMP1
NewPmap1  JSR       GETDDAT2       ;Yreg = drive index to get identification data
          LDA       PMAPVAL
          LDX       PMAPVAL+1
          JSR       CVTAS2BN
          STA       CurPTmap
          JSR       GetPmap1       ;Get partition map number from user
          BCS       GoCretA2       ;escape was pressed - go back to enter a device #
          LDA       CurPTmap
          CMP       POSITION       ;Check if current partition table number was changed
          BNE       @1
          LDA       ChgMade        ;Check if device number was changed
          ASL       A
          BNE       @2
          BEQ       NewPTnum
@1        LDA       PTVALUE
          STA       PMAPVAL
          LDA       PTVALUE+1
          STA       PMAPVAL+1
          LDX       DRVPOS
          LDA       ChgMade
          ASL       A
          BEQ       @3
@2        LDX       TEMPINDX       ;load driver index for new device #
@3        JSR       SETCALL
          JSR       JustPtbl
          JSR       MadeChgs

                    ;Get new partition number
NewPTnum  LDA       PNUMVAL
          STA       PNUMVAL2       ;xfer partition number display to prompt
          STA       ASCICHR1
          LDA       #$38           ;Limit - Maximum Ascii value+1
          STA       ZPGTEMP1
          LDX       #EDITPNUM
          JSR       PRTPMPTM
          JSR       EDIT1NUM       ;get single number from user
          BCS       GoFndPmp       ;escape was pressed - go back to enter Partition Table #
          LDA       ASCICHR1
          CMP       PNUMVAL
          BEQ       @1
          STA       PNUMVAL
          AND       #$07
          STA       PartNum
          JSR       JustPnum
          JSR       MadeChgs
@1        BIT       ChgMade        ;Update driver with new configuration bytes
          BPL       @2
          LDX       #SAVEDCFG
          JSR       Query0YN
          BCS       NewPTnum       ;save was declined - go back to enter partition #
          JSR       SAVEDRV2
@2        JMP       SELENTER
GoFndPmp  JMP       FindPmap

SAVEDRV2  LDX       DRVPOS         ;Save new driver configuration bytes
          LDA       CurPTmap
          ASL       A
          LSR       DRVNVAL2
          ROL       A
          STA       DRVNLST,X
          STA       DRIVNUM
          LDA       PNUMVAL
          AND       #$07
          STA       PNUMLST,X
          STA       DCFGNUM
          LDA       DNUMLST,X
          STA       SDNUM1
          BRK
          .BYTE     $83
          .WORD     DIBinfo        ;save new driver configuration bytes
          JSR       ERRORCK
          ASL       ChgMade        ;Check if we changed an IDE device # in the device list
          BEQ       @2
          BMI       @3             ;if HB still set then reload driver list.
          LDY       #$00           ;Check if this driver is key in driver list
@1        LDX       DEV0LIST,Y
          CPX       DRVPOS
          BEQ       @3
          INY
          CPY       DEVLSTCT
          BCC       @1
@2        RTS
@3        JMP       GETDNAME

MadeChgs  LDA       ChgMade
          ORA       #$80           ;Mark modifications made
SetChgs   STA       ChgMade
PRTLAST1  LDX       #LDRVWND
          JSR       PRTMSG
          LDX       #DLEADER
          JSR       PRTMSG
          LDX       #PMAPPOS
          JSR       PRTMSG
          LDA       #$04
          JMP       PRTBYTE

GNewPmap  LDA       PMAPVAL
          LDX       PMAPVAL+1
          JSR       CVTAS2BN
          STA       CurPTmap
          JMP       GetPmap1       ;Get partition map number from user

CVTAS2BN  AND       #$0F
          STX       ZPGTEMP0
          CPX       #SPACE
          BEQ       @1
          STA       MLPLIER
          JSR       MULTx10
          LDA       ZPGTEMP0
          AND       #$0F
          CLC
          ADC       PRODUCT
@1        RTS                      ;Returns with binary value in Areg

;*********************** Partition Drive Routines *************************

PARTITIO  LDX       #CMDLINE
          JSR       PRTMSG
          LDX       #PARTCMD
          JSR       PRTMSG
          JSR       DISPDRV

          JSR       GetPmap0       ;Get partition map number from user
          BCS       @2
          LDA       PTVALUE
          STA       PTNUMBER
          LDA       PTVALUE+1
          STA       PTNUMBER+1

          JSR       GETPTBL        ;Get partition information
          LDX       #$02
@1        LDA       TOTSECT,X
          STA       PRODUCT,X
          DEX
          BPL       @1
          LDA       PTHDRADR
          STA       INDEX
          LDA       PTHDRADR+1
          STA       INDEX+1
          LDY       #$08
          JSR       DECIMAL        ;Generate 8 digit decimal
          STA       TCAPLEN
          LDX       #CLRVPORT
          JSR       PRTMSG
          LDX       #PARTHDR
          JSR       PRTMSG
          LDX       #TCapBlks
          JSR       PRTMSG
          LDX       #PTMENU1
          JSR       PRTMSG
          LDX       #PTMENU2
          JSR       PRTMSG
          JSR       DISPLYPT
          JSR       EDITPART
@2        JMP       MAINMENU

GMaxPtbl  LDA       TOTSECT+2      ;HB    Determine maximum Ptables for this device
          PHA
          LSR       A              ;Get the upper 6 bits = Number of Partition Pages
          LSR       A
          TAX
          SEC
          LDA       TOTSECT
          SBC       #$01
          STA       TOTSECT        ;Last partition map size LB
          LDA       TOTSECT+1
          SBC       #$00
          STA       TOTSECT+1      ;Last partition map size MB
          PLA
          AND       #$03
          SBC       #$00
          BCS       @1             ;if value becomes negative then set maximum possible
          LDA       #$03
          DEX                      ;may go $FF if total sectors was zero
@1        STA       TOTSECT+2      ;Last partition map size HB
          STX       MAXPTBLS       ;maximum partition number allowable on this drive
          RTS

                    ;Subroutine to get partition map number from user
                    ;Requires current drive data
                    ;Determine max qty of partitions for this drive
                    ;Compute maximum size of last partition
GetPmap0  LDA       #$00           ;initialize current partition map #to zero
          STA       CurPTmap
          LDA       #ESC2
          BNE       SaveESC
GetPmap1  LDA       #ESC7
SaveESC   STA       CurVcol
          JSR       GMaxPtbl
          LDA       #$00
          JSR       DIVx10
          BNE       @2
          LDX       #$20
          STX       PTLIMIT+1
          BNE       @3
@2        ORA       #$30
          STA       PTLIMIT+1
          TXA
@3        ORA       #$30
          STA       PTLIMIT

                    ;routine - Get Partition Map Number from User
                    ;at entry Xreg=current partition map #
GetPmap2  LDX       CurPTmap
          STX       POSITION       ;save current partition number
          CPX       MAXPTBLS       ;if current partition table # greater than maximum
          BCC       @1
          LDX       MAXPTBLS
          STX       CurPTmap       ;then asign the maximum to current partition table #
@1        JSR       CONVBPTA       ;convert binary partition map value to ascii
          LDA       MAXPTBLS
          BNE       @2
          JMP       SKIPSEL1       ;if only one partition map then skip selection
@2        LDA       #PTHoffst      ;initialize current horiz position
          STA       CurHsel
          LDX       #SelPTNum
          JSR       PRTPMPTM
          LDX       CurVcol        ;escape message number
          JSR       PRTESCP
          LDA       #$05
          JSR       PRTBYTE
          JMP       GETCHR4

                    ;Convert binary partition map number to 2 byte ascii
                    ;On entry Xreg=partition map number
CONVBPTA  LDA       #$00
          JSR       DIVx10
          BEQ       @1
          ORA       #$30
          STA       PTVALUE+1
          TXA
          BNE       @2
@1        LDX       #$20           ;eliminate leading zeros
          STX       PTVALUE+1
@2        ORA       #$30
          STA       PTVALUE
          RTS

CKRT2     CMP       #RTARROW
          BNE       CKLF2
          LDA       CurHsel
          CMP       #PTHoffst
          BNE       GETCHR4
          INC       CurHsel
          LDA       #$09
          JSR       PRTBYTE
          JMP       GETCHR4

CKUP2     CMP       #UPARROW
          BNE       CKASCI2
          LDX       CurPTmap
          CPX       MAXPTBLS       ;maximum partition map number allowable on this drive
          BCS       GETCHR4
          INX
          BNE       ASCI_PT        ;always taken

;CFutil5
GETCHR4   BRK
          .BYTE     $CA
          .WORD     READCON
          JSR       ERRORCK
          LDA       INPUT
          CMP       #DNARROW
          BNE       CKRT2
          LDX       CurPTmap
          BEQ       GETCHR4
          DEX
ASCI_PT   STX       CurPTmap
          JSR       CONVBPTA       ;convert binary partition map value to ascii
          LDX       #PTSEL
          JSR       PRTMSG
          JMP       GETCHR4

CKLF2     CMP       #LFARROW
          BNE       CKUP2
          LDA       CurHsel
          CMP       #PTHoffst
          BEQ       GETCHR4
          DEC       CurHsel
          LDA       #$08
          JSR       PRTBYTE
          JMP       GETCHR4

CKASCI2   CMP       #RETURN
          BEQ       CKRET2
          CMP       #ESCAPE
          BEQ       CKESC2
          CMP       #SPACE
          BEQ       @1
          CMP       #$30
          BCC       GETCHR4
          CMP       #$3A
          BCS       GETCHR4
@1        LDY       CurHsel
          STA       PTVALUE-PTHoffst,Y
          JSR       PRTBYTE
          CPY       #PTHoffst
          BNE       @2
          INC       CurHsel
          BNE       GETCHR4
@2        LDA       #$08
          JSR       PRTBYTE
          JMP       GETCHR4

CKESC2    LDX       #CLRMSGW
          JSR       PRTMSG
          LDX       #CLRPMPT
          JSR       PRTMSG
          LDA       POSITION
          STA       CurPTmap       ;restore current partition map number
          SEC
          RTS

CKRET2    LDA       PTVALUE
          LDX       PTVALUE+1
          JSR       CVTAS2BN
          CMP       MAXPTBLS       ;maximum partition map number allowable on this drive
          BCC       @1             ;number is less than the maximum value
          BEQ       SKIPSEL1       ;number is the maximum value
          LDX       #PTnoGood
          JSR       PRTMSG
          JSR       G_ANYKEY
          JMP       GetPmap2
@1        LDX       #$03           ;Set maximum partition map size possible
          STX       TOTSECT+2
          LDX       #$FF
          STX       TOTSECT+1
          STX       TOTSECT
SKIPSEL1  STA       CurPTmap
SKIPSEL2  ASL       A
          ASL       A
          STA       PTmapHB
          CLC                      ;returns with partition number set @ CurPTmap (2 byte binary),
          RTS                      ;PTVALUE (ascii), and partition table address at PTmapHB (byte)



                    ;Subroutine to get start block & partition size from table
                    ;         @Entry, PartNum = partition number
CONVTRK   LDX       PartNum
          LDA       BegBlkLB,X
          STA       PRODUCT
          LDA       BegBlkMB,X
          STA       PRODUCT+1
          LDA       BegBlkHB,X
          STA       PRODUCT+2
          TXA
          ASL       A
          TAX
          LDA       TRKADR,X
          STA       INDEX
          LDA       TRKADR+1,X
          STA       INDEX+1
          LDY       #$06
          JSR       DECIMAL
          JMP       PRTTRK

CONVSIZE  LDX       PartNum
          LDA       P0sizeLB,X
          STA       PRODUCT
          LDA       P0sizeHB,X
          STA       PRODUCT+1
          TXA
          ASL       A
          TAX
          LDA       BLENADR,X
          STA       INDEX
          LDA       BLENADR+1,X
          STA       INDEX+1
          JSR       DECIMAL5
          JMP       PRTSIZE

SetBegin  CLC
          LDA       BegBlkLB-1,X
          ADC       P0sizeLB-1,X
          STA       BegBlkLB,X
          LDA       BegBlkMB-1,X
          ADC       P0sizeHB-1,X
          STA       BegBlkMB,X
          LDA       BegBlkHB-1,X
          ADC       #$00
          STA       BegBlkHB,X
Prt_Part  JSR       CONVSIZE
          JSR       CONVTRK
          JMP       GETVNAME

                    ;Subroutine to display partition info
DISPLYPT  JSR       GTRKPLEN
          JSR       PTDATES
          LDX       #$00
          STX       PartNum
@1        LDA       P0sizeLB,X
          ORA       P0sizeHB,X
          BEQ       @2
          LDA       BegBlkLB,X
          ORA       BegBlkMB,X
          ORA       BegBlkHB,X
          BNE       @3
          STA       P0sizeLB,X
          STA       P0sizeHB,X
@2        JSR       SetBegin
          JMP       @4
@3        JSR       Prt_Part
@4        INC       PartNum
          LDX       PartNum
          CPX       #$08
          BCC       @1

CREMCAP   JSR       COMPEND
          LDA       #$00
          STA       PRODUCT
          STA       PRODUCT+1
          STA       PRODUCT+2
          LDX       #$07
CKPTX     LDA       P0sizeLB,X
          ORA       P0sizeHB,X
          BEQ       NEXTPT
          JSR       INITPTCK
          STX       ZPGTEMP0
          LDY       #$07
CKPTY     CPY       ZPGTEMP0
          BEQ       NXTY
          LDA       P0sizeLB,Y
          ORA       P0sizeHB,Y
          BEQ       NXTY
          JSR       CMPENDS
          BCS       @1
          JSR       CMPBEGS
          BCS       NEXTPT
          CPY       ZPGTEMP0
          BCS       NXTY
          JSR       BEG_ENDS
          BCS       NXTY
          LDA       BegBlkMB,Y
          STA       ENDTRK+1
          LDA       BegBlkLB,Y
          STA       ENDTRK
          JMP       NXTY
@1        CPY       ZPGTEMP0
          BCS       NXTY
          JSR       CMPBEGS
          BCC       NXTY
          JSR       ENDS_BEG
          BCS       NXTY
          LDA       EndBlkHB,Y
          STA       BEGTRK+2
          LDA       EndBlkMB,Y
          STA       BEGTRK+1
          LDA       EndBlkLB,Y
          STA       BEGTRK
NXTY      DEY
          BPL       CKPTY
          JSR       CMPDIFF
NEXTPT    DEX
          BPL       CKPTX

          CLC                      ;routine to compute remaining capacity
          LDA       TOTSECT
          SBC       PRODUCT
          STA       PRODUCT
          LDA       TOTSECT+1
          SBC       PRODUCT+1
          STA       PRODUCT+1
          LDA       TOTSECT+2
          SBC       PRODUCT+2
          STA       PRODUCT+2
          LDA       PTLRADR
          STA       INDEX
          LDA       PTLRADR+1
          STA       INDEX+1
          JSR       DECIMAL7
          CLC
          ADC       #$03
          LDX       #RBLKS
          JSR       PRTMSG1
          LDX       #BLOCKS
          JMP       PRTMSG

INITPTCK  LDA       BegBlkLB,X     ;Xreg = partition number
          STA       BEGTRK
          LDA       BegBlkMB,X
          STA       BEGTRK+1
          LDA       BegBlkHB,X
          STA       BEGTRK+2
          LDA       EndBlkLB,X
          STA       ENDTRK
          LDA       EndBlkMB,X
          STA       ENDTRK+1
          LDA       EndBlkHB,X
          STA       ENDTRK+2
          RTS

CMPENDS   LDA       ENDTRK+2       ;Yreg = partition number
          CMP       EndBlkHB,Y
          BCC       @1
          BNE       @1
          LDA       ENDTRK+1       ;Yreg = partition number
          CMP       EndBlkMB,Y
          BCC       @1
          BNE       @1
          LDA       ENDTRK
          CMP       EndBlkLB,Y
@1        RTS

CMPBEGS   LDA       BEGTRK+2       ;Yreg = partition number
          CMP       BegBlkHB,Y
          BCC       @1
          BNE       @1
          LDA       BEGTRK+1       ;Yreg = partition number
          CMP       BegBlkMB,Y
          BCC       @1
          BNE       @1
          LDA       BEGTRK
          CMP       BegBlkLB,Y
@1        RTS

BEG_ENDS  LDA       BegBlkHB,Y
          CMP       ENDTRK+2
          BCC       @1
          BNE       @1
          LDA       BegBlkMB,Y
          CMP       ENDTRK+1
          BCC       @1
          BNE       @1
          LDA       BegBlkLB,Y
          CMP       ENDTRK
@1        RTS

ENDS_BEG  LDA       BEGTRK+2
          CMP       EndBlkHB,Y
          BCC       @1
          BNE       @1
          LDA       BEGTRK+1
          CMP       EndBlkMB,Y
          BCC       @1
          BNE       @1
          LDA       BEGTRK
          CMP       EndBlkLB,Y
@1        RTS

CMPDIFF   SEC
          LDA       ENDTRK
          SBC       BEGTRK
          STA       TEMPVAL
          LDA       ENDTRK+1
          SBC       BEGTRK+1
          STA       TEMPVAL1
          LDA       ENDTRK+2
          SBC       BEGTRK+2
          STA       TEMPVAL2
          CLC
          LDA       PRODUCT
          ADC       TEMPVAL
          STA       PRODUCT
          LDA       PRODUCT+1
          ADC       TEMPVAL1
          STA       PRODUCT+1
          LDA       PRODUCT+2
          ADC       TEMPVAL2
          STA       PRODUCT+2
          RTS

                    ;Subroutine to get partition info from table
GTRKPLEN  LDX       #$07
@1        LDY       STBindex,X
          LDA       (PARTTBL),Y
          STA       BegBlkLB,X
          INY
          LDA       (PARTTBL),Y
          STA       BegBlkMB,X
          INY
          LDA       (PARTTBL),Y
          STA       BegBlkHB,X
          LDY       VSZindex,X
          LDA       (PARTTBL),Y
          STA       P0sizeLB,X
          INY
          LDA       (PARTTBL),Y
          STA       P0sizeHB,X
          LDA       #$00
          STA       PTVALID,X
          DEX
          BPL       @1
          RTS

                    ;Subroutine to print partition values
GETVNAME  JSR       GVOLNAME
PRTVOL    LDA       #$20
          LDY       #VOLNLEN
          BNE       PRTSTUF1
PRTSIZE   LDA       #$10
          LDY       #BLOCKLEN
          BNE       PRTSTUF1
PRTTRK    LDA       #$00
          LDY       #TRKLEN
PRTSTUF1  CLC
          ADC       PartNum
          ADC       PartNum
          TAX
PRTSTUF2  LDA       PMSGADR,X
          STA       INDEX
          LDA       PMSGADR+1,X
          STA       INDEX+1
          STY       PRTLEN1
          LDA       (INDEX),Y
          CLC
          ADC       #$03
          TAY
          LDA       #SPACE
          BNE       @2
@1        STA       (INDEX),Y
          INY
@2        CPY       PRTLEN1
          BCC       @1
          JMP       PRTMSG2

VOLABEL   LDX       PartNum
          LDY       #Num_Blks
          LDA       #$01           ;read 1 block
          STA       (BUFFCALL),Y
          DEY
          CLC
          LDA       BegBlkLB,X
          ADC       #$02           ;1st block of volume directory
          STA       (BUFFCALL),Y
          DEY
          LDA       BegBlkMB,X
          ADC       #$00
          STA       (BUFFCALL),Y
          DEY
          LDA       BegBlkHB,X
          ADC       #$00
          ORA       PTmapHB        ;set partition map address
          STA       (BUFFCALL),Y
          LDY       #ATA_Cmd
          LDA       #ATACRead
          STA       (BUFFCALL),Y
          JSR       CALLDRVR
          JMP       ErrHndlr

                    ;Subroutine to get volume name
GVOLNAME  LDX       PartNum
          TXA
          ASL       A
          TAY
          LDA       VOLADR,Y
          STA       VOLINDEX
          LDA       VOLADR+1,Y
          STA       VOLINDEX+1
          LDA       #$00
          STA       VOLINDEX+EXTPG           ;Set extended page to local
GVOLNAM1  LDA       P0sizeLB,X
          ORA       P0sizeHB,X
          BNE       GVOLNAM2

          LDY       #$14
          LDA       #UNDEFLEN
          STA       (VOLINDEX),Y
          CLC
          ADC       #$05
          TAY
          DEY
@1        LDA       UNDEFINE-5,Y
          STA       (VOLINDEX),Y
          DEY
          CPY       #$05
          BCS       @1
          LDA       #$81
          BNE       TAGEXIST       ;always branches

GVOLNAM2  LDA       PTVALID,X
          BMI       NOVOLUME
          JSR       VOLABEL
          LDY       #$00
          TYA
@1        ORA       (BUFFPG0),Y
          INY
          CPY       #$04
          BCC       @1
          CMP       #$03
          BNE       NOVOLUME
          LDA       (BUFFPG0),Y
          CMP       #$F1
          BCC       NOVOLUME
          AND       #$0F
          LDY       #$14
          STA       (VOLINDEX),Y
          CLC
          ADC       #$04
          TAY
@2        LDA       (BUFFPG0),Y
          CMP       #$2E
          BEQ       @3
          CMP       #$30
          BCC       NOVOLUME
          CMP       #$7B
          BCS       NOVOLUME
          CMP       #$3A
          BCC       @3
          CMP       #$41
          BCC       NOVOLUME
          CMP       #$5B
          BCC       @3
          CMP       #$61
          BCC       NOVOLUME
@3        STA       (VOLINDEX),Y
          DEY
          CPY       #$05
          BCS       @2
          LDY       #$29           ;Check volume size matches partition size
          LDA       (BUFFPG0),Y
          CMP       P0sizeLB,X
          BNE       NOVOLUME
          INY
          LDA       (BUFFPG0),Y
          CMP       P0sizeHB,X
          BNE       NOVOLUME
          LDA       #$00
          STA       EXISTVOL,X
          CLC
          RTS                      ;returns carry clear - volume name found

NOVOLUME  LDY       #$14
          LDA       #UFTXTLEN
          STA       (VOLINDEX),Y
          CLC
          ADC       #$05
          TAY
          DEY
@1        LDA       UNFMTTXT-5,Y
          STA       (VOLINDEX),Y
          DEY
          CPY       #$05
          BCS       @1
          LDA       #$82
TAGEXIST  STA       EXISTVOL,X
          SEC
          RTS                      ;returns carry set - volume name not found


;********************* Partition Editor Subroutines ***********************

                    ;PartNum=current partition number $0 to $7
                    ;CurVcol=current vert column in table TRK0($0), BLEN0($1), or VOL0 ($2)
EDITPART  SEC
          ROR       LOCSTAT
          LDA       #$00
          STA       CurVcol
NEXTPART  STA       PartNum
          CLC
          ADC       #$08           ;initial vertical position in window
          STA       SCRHPVP+1      ;vertical position in window
RETRY3    BIT       LOCSTAT
          BPL       @1
          LDX       #FESC6
          JSR       PRTPMPTM
          LDX       #ESC6
          JSR       PRTESCP
          LDX       #VIEWPORT
          JSR       PRTMSG
@1        LDA       #$00
          STA       POSITION
          STA       LOCSTAT
REPOS3    LDX       CurVcol
          LDA       COL_HPOS,X
          CLC
          ADC       POSITION
          STA       SCRHPVP        ;horizontal position in window
          LDX       #CURSER
          JSR       PRTMSG
GETCHR3A  LDA       CurVcol
          ASL       A
          ASL       A
          ASL       A
          ORA       PartNum
          ASL       A
          TAX
          LDA       TRKADR,X
          STA       INDEX
          LDA       TRKADR+1,X
          STA       INDEX+1
GETCHR3   BRK
          .BYTE     $CA
          .WORD     READCON
          JSR       ERRORCK
          LDA       INPUT
          BPL       CKDN
          BIT       LOCSTAT
          BMI       GETCHR3
          AND       #$DF
          CMP       #OAPPLE_R
          BNE       @1
          JSR       Calc_Beg
          JMP       RETRY3
@1        CMP       #OAPPLE_S
          BNE       @3
          JSR       COMPEND
          JSR       CKPTLAPS
          BCS       @2
          LDX       #VIEWPORT
          JSR       PRTMSG
          LDA       PartNum
          JMP       NEXTPART
@2        LDX       #PROMPT0
          JSR       PRTMSG
          JSR       SAVEPTBL
          JMP       EDITPART
@3        CMP       #OAPPLE_F
          BNE       GETCHR3
          JSR       HLFMT
          SEC
          ROR       LOCSTAT
          JMP       RETRY3

CKDN      CMP       #DNARROW
          BNE       CKRT
          JSR       SAVEPART
          BCC       @1
          JMP       RETRY3
@1        LDX       PartNum
          INX
          TXA
          AND       #$07
          JMP       NEXTPART

CKRT      CMP       #RTARROW
          BNE       CKLF
          LDX       CurVcol
          LDY       ITEM_LEN,X
          LDA       POSITION
          CMP       (INDEX),Y
          BCS       @2
          INC       POSITION
          LDA       #$09
          JSR       PRTBYTE
@2        JMP       GETCHR3

CKLF      CMP       #LFARROW
          BNE       CKUP
          LDA       POSITION
          BEQ       @1
          DEC       POSITION
          LDA       #$08
          JSR       PRTBYTE
@1        JMP       GETCHR3

CKUP      CMP       #UPARROW
          BNE       CKRET
          JSR       SAVEPART
          BCC       @1
          JMP       RETRY3
@1        LDX       PartNum
          DEX
          TXA
          AND       #$07
          JMP       NEXTPART

CKRET     CMP       #RETURN
          BEQ       @1
          CMP       #TAB
          BNE       CKSPC
@1        JSR       SAVEPART
          BCC       IncColmn
          JMP       RETRY3
IncColmn  LDA       PartNum
          LDY       CurVcol
          INY
          CPY       #$03
          BCC       @1             ;If Column > 3 then increment to next partition and Vpos=0
          ADC       #$00           ;increment partition number
          AND       #$07           ;If partition number > 7 then make it $ (beginning)
          LDY       #$00
@1        STY       CurVcol
          JMP       NEXTPART

CKSPC     CMP       #SPACE
          BNE       CKASCI
          JSR       FILLSPC
          JMP       REPOS3

CKASCI    CMP       #ESCAPE
          BEQ       CKESC
          LDX       CurVcol
          CPX       #VOL0
          BCC       @2
          CMP       #$2E
          BEQ       @3
          CMP       #$41
          BCC       @1
          CMP       #$5B
          BCC       @3
          CMP       #$61
          BCC       @1
          CMP       #$7B
          BCS       @4
          AND       #$DF           ;Convert to uppercase
          BCC       @3
@1        LDY       POSITION
          BEQ       @4
@2        CMP       #$30
          BCC       @4
          CMP       #$3A
          BCS       @4
@3        LDY       POSITION
          CPX       #VOL0
          BNE       @5
          CPY       ITEM_LEN+2     ;$0F maximum length of volume name
          BCC       @7
@4        JMP       GETCHR3
@5        CPX       #BLEN0
          BNE       @6
          CPY       ITEM_LEN+1     ;$05 maximum length of block size value
          BCC       @7
          BCS       @4
@6        CPY       ITEM_LEN       ;$06 maximum length of starting track value
          BCS       @4
@7        STA       (INDEX),Y
          JSR       PRTBYTE
          INC       POSITION
          LDA       POSITION
          LDY       ITEM_LEN,X
          CMP       (INDEX),Y
          BCC       @8
          STA       (INDEX),Y
@8        BIT       LOCSTAT
          BMI       @4
          LDX       #CLRPMPT
          JSR       PRTMSG
          LDX       #ESC6A
          JSR       PRTESCP
          LDA       #$05
          JSR       PRTBYTE
          SEC
          ROR       LOCSTAT
          JMP       GETCHR3A

CKESC     BIT       LOCSTAT
          BPL       ESCRETN
          LDA       #$06
          JSR       PRTBYTE
          LDX       CurVcol
          BEQ       @1             ;TRK0
          CPX       #VOL0
          BNE       @2
          JSR       GETVNAME
          JMP       RETRY3
@1        JSR       CONVTRK
          JMP       RETRY3
@2        JSR       CONVSIZE
          JMP       RETRY3

ESCRETN   LDX       #CLRMSGW
          JSR       PRTMSG
          LDX       #CLRPMPT
          JSR       PRTMSG

          JSR       COMPEND
          JSR       CKPTLAPS
          BCS       @1
          LDX       #VIEWPORT
          JSR       PRTMSG
          LDA       PartNum
          JMP       NEXTPART

@1        LDX       #MSGWIND
          JSR       PRTMSG
          LDY       #$FE
          LDX       #$00
@2        LDA       PTVALID,X
          BPL       @3
          TXA                      ;List Partition numbers that are invalid
          ORA       #$30
          INY
          INY
          STA       PPTNUM,Y
          INY
@3        INX
          CPX       #$08
          BCC       @2
          TYA
          BPL       @4
          RTS
@4        LDX       #PTWARN1
          CLC
          ADC       MSGLEN,X
          JSR       PRTMSG1
          LDX       #PTWARN2
          JSR       PRTMSG
PtChange  LDX       #PTBLMSG
          JSR       Query0YN
          BCC       SAVEPTBL
          RTS

Calc_Beg  LDA       PartNum
          CMP       #$07
          BCS       @3
          STA       ZPGTEMP1       ;Save current partition number
          ADC       #$31
          STA       TrkValue
          LDX       #ReCalMsg
          JSR       Query0YN
          PHP
          LDA       #$04
          JSR       PRTBYTE
          PLP
          BCC       @2
          BCS       @3
@1        LDA       #$80           ;Invalidate current partition status
          STA       PTVALID,X
          JSR       SetBegin
@2        INC       PartNum
          LDX       PartNum
          CPX       #$08
          BCC       @1
          LDA       ZPGTEMP1
          STA       PartNum        ;Restore current partition number
@3        RTS

SAVEPTBL  LDA       PartNum
          STA       ZPGTEMP1       ;Save current partition number
          LDX       #$07
@1        LDA       PTVALID,X
          BPL       @3
          STX       PartNum
          JSR       XFERPART
          LDA       EXISTVOL,X
          BPL       @3
          JSR       VOLABEL        ;Get root directory block
          LDA       #ATACWrit
          STA       (BUFFCALL),Y
          LDY       #$04
          LDA       #$00
@2        STA       (BUFFPG0),Y    ;Invalidate current directory
          DEY
          BPL       @2
          JSR       CALLDRVR
          JSR       ErrHndlr
          LDX       PartNum
@3        DEX
          BPL       @1
          LDA       ZPGTEMP1
          STA       PartNum        ;Restore current partition number

                    ;Update partition table parameters on drive
UDATDRV   LDY       #MODDATE
          JSR       REVDATE

                    ;Initialize partition table device info field with spaces
          LDY       #PtSIdx+043    ;$10+043
          LDX       #$43           ;68 bytes long
          LDA       #SPACE
@1        STA       (PARTTBL),Y
          DEY
          DEX
          BPL       @1

                    ;Transfer device information to partition table
          LDY       #PtSIdx        ;$10
          LDX       #$00
@2        LDA       SerialNo,x
          STA       (PARTTBL),Y
          INY
          INX
          CPX       SN_Len
          BCC       @2

          LDY       #PtRevIdx      ;$24
          LDX       #$00
@3        LDA       FirmWare,x
          STA       (PARTTBL),Y
          INY
          INX
          CPX       FW_Len
          BCC       @3

          LDY       #PtModIdx      ;$2C
          LDX       #$00
@4        LDA       Model,x
          STA       (PARTTBL),Y
          INY
          INX
          CPX       MOD_Len
          BCC       @4

@5        JSR       GETCKSUM
          STA       (PARTTBL),Y
@6        LDA       (PARTTBL),Y
          STA       (BUFFPG0),Y
          INY
          BNE       @6
          JSR       WRITPTBL

          LDX       #VIEWPORT
          JSR       PRTMSG
          JSR       PTDATES
          LDA       #$04
          JMP       PRTBYTE

BEGPARTN  LDA       PartNum
          STA       ZPGTEMP1
          JMP       @2
@1        LDA       P0sizeLB,X     ;Xreg = partition number
          ORA       P0sizeHB,X
          BNE       @2
          JSR       SetBegin
@2        INC       PartNum
          LDX       PartNum
          CPX       #$08
          BCC       @1
          LDA       ZPGTEMP1
          STA       PartNum
          RTS

FILLSPC   LDX       CurVcol
          LDY       ITEM_LEN,X
@1        STY       ZPGTEMP0
          LDA       POSITION
          STA       (INDEX),Y
          TAY
          LDA       #$06
          JSR       PRTBYTE
@2        LDA       #SPACE
          JSR       PRTBYTE
          INY
          CPY       ZPGTEMP0
          BCC       @2
          BIT       LOCSTAT
          BMI       @3
          LDX       #ESC6A
          JSR       PRTESCP
          SEC
          ROR       LOCSTAT
@3        RTS

CKPTLAPS  LDX       #$00
CKPT1     TXA
          TAY
          INY
CKPT2     LDA       P0sizeLB,Y
          ORA       P0sizeHB,Y
          BEQ       NEXTY
          LDA       BegBlkHB,X
          CMP       EndBlkHB,Y
          BCC       @1
          BNE       NEXTY
          LDA       BegBlkMB,X
          CMP       EndBlkMB,Y
          BCC       @1
          BNE       NEXTY
          LDA       BegBlkLB,X
          CMP       EndBlkLB,Y
          BCS       NEXTY
@1        LDA       BegBlkHB,X
          CMP       BegBlkHB,Y
          BCC       @2
          BNE       ERRORPT
          LDA       BegBlkMB,X
          CMP       BegBlkMB,Y
          BCC       @2
          BNE       ERRORPT
          LDA       BegBlkLB,Y
          CMP       BegBlkLB,X
          BCC       ERRORPT
@2        LDA       EndBlkHB,X
          CMP       BegBlkHB,Y
          BCC       NEXTY
          BNE       ERRORPT
          LDA       EndBlkMB,X
          CMP       BegBlkMB,Y
          BCC       NEXTY
          BNE       ERRORPT
          LDA       BegBlkLB,Y
          CMP       EndBlkLB,X
          BCS       NEXTY
NoEdit    LDX       #CLRMSGW
          JSR       PRTMSG
          LDX       PartNum
NEXTY     INY
          CPY       #$08
          BCC       CKPT2
          INX
          CPX       #$07
          BCC       CKPT1
          RTS

ERRORPT   TXA
          ORA       #$30
          STA       PTCNFLT1
          TYA
          ORA       #$30
          STA       PTCNFLT2
          STX       PartNum
          LDX       #PTOVLAP
          JSR       PRTESCP
          LDX       #RE_EDIT
          JSR       Query0YN
          BCS       NoEdit
          LDA       #$00
          STA       CurVcol
          RTS

COMPEND   LDX       #$07
@1        CLC
          LDA       P0sizeLB,X
          ADC       BegBlkLB,X
          STA       EndBlkLB,X
          LDA       P0sizeHB,X
          ADC       BegBlkMB,X
          STA       EndBlkMB,X
          LDA       #$00
          ADC       BegBlkHB,X
          STA       EndBlkHB,X
          DEX
          BPL       @1
          RTS

SAVEPART  CLC
          BIT       LOCSTAT
          BMI       @1
          RTS
@1        LDA       #$06
          JSR       PRTBYTE
          LDX       CurVcol
          BEQ       CkTrk          ;TRK0
          CPX       #BLEN0
          BEQ       CKPTSIZE
          JMP       HLFMT

CKPTSIZE  JSR       BINARY
          LDA       TEMPVAL2       ;if HB is not zero then value is greater than 65535
          BNE       @1
          BIT       TEMPVAL1       ;check if value is greater than 32767 ($7FFF)
          BPL       @2
@1        LDX       #OUTRANG1
          JSR       ANYKEY0
          JSR       CONVSIZE
          SEC
          RTS
@2        JMP       CkSize

PRTPMPTM  STX       PRT_QUE
          LDX       #PROMPT0
          JSR       PRTMSG
          LDX       PRT_QUE
          JMP       PRTMSG

PRTESCP   STX       PRT_QUE
          LDX       #MSGWIND
          JSR       PRTMSG
          LDX       PRT_QUE
          JMP       PRTMSG

ANYKEY0   JSR       PRTPMPTM
G_ANYKEY  LDX       #ESC1B
          JSR       PRTESCP
          BRK
          .BYTE     $CA
          .WORD     READCON
          JSR       ERRORCK
          LDX       #CLRMSGW
          JMP       PRTMSG

CkTrk     JSR       BINARY
          LDA       TEMPVAL
          ORA       TEMPVAL1       ;Check if start block is zero
          ORA       TEMPVAL2
          BNE       @1
          LDX       PartNum
          JSR       SetBegin
          LDX       PartNum
          LDA       BegBlkLB,X
          STA       TEMPVAL
          LDA       BegBlkMB,X
          STA       TEMPVAL1
          LDA       BegBlkHB,X
          STA       TEMPVAL2
@1        LDA       TEMPVAL2       ;Check beginning track limits
          CMP       TOTSECT+2
          BCC       CkLimits
          BNE       @2
          LDA       TEMPVAL1
          CMP       TOTSECT+1
          BCC       CkLimits
          BNE       @2
          LDA       TEMPVAL
          CMP       TOTSECT
          BCC       CkLimits
@2        LDX       #MAXBLOCK
          JSR       ANYKEY0
          JSR       CONVTRK
          SEC
          RTS

CkLimits  LDX       PartNum        ;transfer start block to table
          LDA       TEMPVAL2
          CMP       BegBlkHB,X     ;check if track value was changed
          BNE       @1
          LDA       TEMPVAL1
          CMP       BegBlkMB,X
          BNE       @1
          LDA       TEMPVAL
          CMP       BegBlkLB,X
          BEQ       @2
@1        LDA       #$80           ;Invalidate partition status
          STA       PTVALID,X
          LDA       TEMPVAL2
          STA       BegBlkHB,X
          LDA       TEMPVAL1
          STA       BegBlkMB,X
          LDA       TEMPVAL
          STA       BegBlkLB,X
@2        LDA       P0sizeLB,X     ;transfer partition size to temporary
          STA       TEMPVAL
          LDA       P0sizeHB,X
          STA       TEMPVAL1

;CFutil6
CkSize    LDX       PartNum        ;Check partition size limits
          SEC
          LDA       TEMPVAL
          ADC       BegBlkLB,X
          STA       TEMPVAL2
          LDA       TEMPVAL1
          ADC       BegBlkMB,X
          STA       TEMPVAL3
          LDA       #$00
          ADC       BegBlkHB,X
          CMP       TOTSECT+2
          BCC       STORSIZE
          BNE       @2
          LDA       TEMPVAL3
          CMP       TOTSECT+1
          BCC       STORSIZE
          BNE       @2
          LDA       TEMPVAL2
          CMP       TOTSECT
          BCC       STORSIZE
          BEQ       STORSIZE
@2        LDA       TOTSECT
          SBC       BegBlkLB,X
          STA       TEMPVAL
          LDA       TOTSECT+1
          SBC       BegBlkMB,X
          STA       TEMPVAL1

STORSIZE  LDA       TEMPVAL1       ;check if partition size has changed
          CMP       P0sizeHB,X
          BNE       NEWSIZE
          LDA       TEMPVAL
          CMP       P0sizeLB,X
          BEQ       REFRESH
NEWSIZE   LDA       #$80           ;Invalidate partition status
          STA       PTVALID,X
          LDA       TEMPVAL1
          STA       P0sizeHB,X
          LDA       TEMPVAL
          STA       P0sizeLB,X
REFRESH   JSR       GETVNAME
          JSR       CONVSIZE
          JSR       BEGPARTN
          LDX       #CLRPMPT
          JSR       PRTMSG
          JMP       CREMCAP

;******************* High Level Volume Format Routines ********************

HLFMT     LDX       #CLRMSGW
          JSR       PRTPMPTM
          LDX       PartNum
          LDA       P0sizeHB,X     ;Check if partition is large enough for a volume
          BNE       CkVolume
          LDA       P0sizeLB,X
          CMP       #$08
          BCS       CkVolume
          LDX       #VolSZerr      ;Partition size is too small
          JSR       ANYKEY0
          JSR       NoHLFmt
          SEC
          RTS

CkVolume  LDA       EXISTVOL,X
          BMI       CkVname
          JSR       VOLABEL
          LDY       #$00
          TYA
@1        ORA       (BUFFPG0),Y
          INY
          CPY       #$04
          BCC       @1
          CMP       #$03
          BNE       CkVname
          LDA       (BUFFPG0),Y
          CMP       #$F1
          BCC       CkVname
          AND       #$0F
          STA       ZPGTEMP0
          LDX       #MSGWIND
          JSR       PRTMSG
          LDX       #ERASMSG1
          LDA       MSGLEN,X
          CLC
          ADC       ZPGTEMP0
          PHA
          LDA       ZPGTEMP0
          CLC
          ADC       #$04
          TAY
@2        LDA       (BUFFPG0),Y
          STA       PNAME2-5,Y
          DEY
          CPY       #$05
          BCS       @2
          PLA
          JSR       PRTMSG1
          LDX       #ERASMSG2
          JSR       PRTMSG

CkVname   LDA       PartNum
          ASL       A
          TAX
          LDA       PNAMEADR,X
          STA       INDEX
          LDA       PNAMEADR+1,X
          STA       INDEX+1
          LDY       #$0F
          LDA       (INDEX),Y
          BNE       NewVname

          LDA       #BLTXTLEN
          STA       (INDEX),Y
          TAY
          DEY
          LDA       PartNum
          ORA       #$30
          STA       (INDEX),Y
          DEY
@1        LDA       BLANK01,Y
          STA       (INDEX),Y
          DEY
          BPL       @1
          LDX       #VIEWPORT
          JSR       PRTMSG
          JSR       PRTVOL
          JMP       CkVname

NewVname  TAY
          CLC
          LDX       #HFMT0MSG
          ADC       MSGLEN,X
          STA       ZPGTEMP0
          DEY
@1        LDA       (INDEX),Y
          STA       PNAME1,Y
          DEY
          BPL       @1
          LDX       #PROMPT0
          JSR       PRTMSG
          LDX       #HFMT0MSG
          LDA       ZPGTEMP0
          JSR       PRTMSG1
          LDX       #HFMT1MSG
          JSR       PRTMSG
          JSR       QUERY_YN
          BCS       NoHLFmt
          LDX       PartNum
          LDA       PTVALID,X      ;Check for modified partition
          BPL       InitVol
          LDX       #PTNUPD
          JSR       PRTESCP
          JSR       PtChange
          LDX       #CLRMSGW
          JSR       PRTPMPTM
          LDX       PartNum
          LDA       PTVALID,X
          BPL       InitVol
NoHLFmt   LDX       #VIEWPORT
          JSR       PRTMSG
          JMP       GETVNAME

InitVol   LDY       #$00
          TYA
@1        STA       (BUFFPG0),Y    ;Initialize buffer pages with zeros
          STA       (BUFFPG1),Y
          INY
          BNE       @1

          LDY       #ATA_Cmd
          LDA       #ATACWrit
          STA       (BUFFCALL),Y
          LDY       #Sect_LB
          LDX       PartNum
          CLC
          LDA       BegBlkLB,X
          STA       (BUFFCALL),Y
          DEY
          LDA       BegBlkMB,X
          STA       (BUFFCALL),Y
          DEY
          LDA       BegBlkHB,X
          ORA       PTmapHB
          STA       (BUFFCALL),Y
          LDY       #Num_Blks
          LDA       #$01           ;One block at a time
          STA       (BUFFCALL),Y
          JSR       WBLOCK         ;Write boot block $00
          JSR       WBLOCK         ;Write boot block $01

          LDA       PartNum
          ASL       A
          TAX
          LDA       VOLADR,X
          STA       INDEX
          LDA       VOLADR+1,X
          STA       INDEX+1
          LDY       #$14
          LDA       (INDEX),Y
          PHA
          CLC
          ADC       #$04
          TAY
@2        LDA       (INDEX),Y
          STA       (BUFFPG0),Y
          DEY
          CPY       #$05
          BCS       @2
          PLA
          ORA       #$F0
          STA       (BUFFPG0),Y
          LDY       #$02
          LDA       #$03
          STA       (BUFFPG0),Y
          JSR       CNVTDATE
          LDX       #$03
          LDY       #$1F
@3        LDA       TEMPVAL,X
          STA       (BUFFPG0),Y
          DEY
          DEX
          BPL       @3
          LDY       #$22
          LDA       #$C3
          STA       (BUFFPG0),Y
          INY
          LDA       #$27
          STA       (BUFFPG0),Y
          INY
          LDA       #$0D
          STA       (BUFFPG0),Y
          LDY       #$27
          LDA       #$06
          STA       (BUFFPG0),Y
          LDX       PartNum
          LDA       P0sizeLB,X
          LDY       #$29
          STA       (BUFFPG0),Y
          STA       TEMPVAL
          AND       #$07
          STA       TEMPVAL2        ;Low order BITINDEX index value for last FCB byte
          INY
          LDA       P0sizeHB,X
          STA       (BUFFPG0),Y
          AND       #$08
          STA       TEMPVAL3        ;$00=last FCB byte on page $, $08=last FCB byte on page 1
          LDA       P0sizeHB,X
          LDY       #$03
@4        LSR       A
          ROR       TEMPVAL         ;Page index of last FCB byte
          DEY
          BNE       @4
          CLC
          LDA       P0sizeLB,X
          ADC       #$FF
          LDA       P0sizeHB,X
          ADC       #$0F
          ROR       A
          LSR       A
          LSR       A
          LSR       A
          STA       PRODUCT        ;Number of blocks required for FCB. Note: Volume to small if $0

          JSR       WBLOCK         ;Write root directory block $02

NDIRBLK   LDA       #$00
          LDY       #$04
@1        STA       (BUFFPG0),Y
          INY
          BNE       @1
          LDA       #$02
          STA       (BUFFPG0),Y
          LDY       #$02
          JSR       INCBUFPG
          JSR       WBLOCK         ;Write root directory block $03
          LDY       #$00
          JSR       INCBUFPG
          LDY       #$02
          JSR       INCBUFPG
          JSR       WBLOCK         ;Write root directory block $04
          LDY       #$00
          JSR       INCBUFPG
          LDA       #$00
          LDY       #$02
          STA       (BUFFPG0),Y
          JSR       WBLOCK         ;Write root directory block $05

BITMAP    LDA       #$FF
          LDY       #$00
@1        STA       (BUFFPG0),Y    ;Initialize buffer pages with $FF
          STA       (BUFFPG1),Y
          INY
          BNE       @1
          CLC
          LDA       PRODUCT
          ADC       #$06
          PHA
@2        PLA
          CMP       #$08
          BCC       @3
          SBC       #$08
          PHA
          LDA       #$08
@3        TAX
          LDA       BITINDEX,X
          STA       (BUFFPG0),Y
          INY
          CPX       #$08
          BEQ       @2
          DEC       PRODUCT
          BEQ       LASTFCB
          JSR       WBLOCK         ;Write 1st File Control Block $06
          LDY       #$01           ;$01 for 16 meg partition limit, $02 for 32 meg limit
          LDA       #$FF
          STA       (BUFFPG0),Y    ;Reset buffer with all $FF
          DEY
          STA       (BUFFPG0),Y
@4        DEC       PRODUCT
          BEQ       LASTFCB
          JSR       WBLOCK         ;Write 2nd thru 7th File Control Block $07 thru $0C
          JMP       @4
LASTFCB   LDX       TEMPVAL2
          LDA       BITINDEX,X
          EOR       #$FF
          LDY       TEMPVAL
          LDX       TEMPVAL3
          BNE       @1
          STA       (BUFFPG0),Y    ;Put last FCB byte in page $
          TXA
          BEQ       @3             ;always branches
@1        STA       (BUFFPG1),Y    ;Put last FCB byte in page 1
          LDA       #$00
          BEQ       @5             ;always branches
@2        STA       (BUFFPG0),Y    ;Zero out remain bytes in page $
@3        INY
          BNE       @2
@4        STA       (BUFFPG1),Y    ;Zero out remain bytes in page 1
@5        INY
          BNE       @4
          JSR       WBLOCK         ;Write Last File Control Block
          LDX       PartNum
          LDA       #$00
          STA       EXISTVOL,X
          LDX       #HFMTCMP
          JSR       ANYKEY0
          LDX       #VIEWPORT
          JMP       PRTMSG

INCBUFPG  CLC
          LDA       (BUFFPG0),Y
          ADC       #$01
          STA       (BUFFPG0),Y
          RTS

WBLOCK    JSR       CALLDRVR
          BEQ       BUMPSECT
          LDX       #DIRERR
          JSR       PRTPMPTM
          JSR       DevErrCk
          JMP       ErrHndlr

BUMPSECT  LDY       #Sect_LB
          CLC
          LDA       (BUFFCALL),Y
          ADC       #$01           ;One block at a time
          STA       (BUFFCALL),Y
          DEY
@1        LDA       (BUFFCALL),Y
          ADC       #$00
          STA       (BUFFCALL),Y
          DEY
          BNE       @1
          RTS

;************************** Misc Subroutines ******************************

XFERPART  LDX       PartNum
          LDY       STBindex,X
          LDA       P0sizeLB,X
          ORA       P0sizeHB,X
          BNE       @1
          LDA       #$00
          STA       (PARTTBL),Y
          INY
          STA       (PARTTBL),Y
          INY
          STA       (PARTTBL),Y
          LDY       VSZindex,X
          STA       (PARTTBL),Y
          INY
          STA       (PARTTBL),Y
          JMP       @2
@1        LDA       BegBlkLB,X
          STA       (PARTTBL),Y
          INY
          LDA       BegBlkMB,X
          STA       (PARTTBL),Y
          INY
          LDA       BegBlkHB,X
          STA       (PARTTBL),Y
          LDY       VSZindex,X
          LDA       P0sizeLB,X
          STA       (PARTTBL),Y
          INY
          LDA       P0sizeHB,X
          STA       (PARTTBL),Y
@2        LDA       #$00
          STA       PTVALID,X
          RTS

                    ;Subroutine to Display Date
PREPDATE  BRK
          .BYTE     $63
          .WORD     TIMEDATE
          JSR       ERRORCK
          LDY       #$04
          LDA       YEAR,Y
          AND       #$01
          STA       MLPLIER
          JSR       MULTx10
          INY
          LDA       YEAR,Y
          AND       #$0F
          CLC
          ADC       PRODUCT
          STA       PRODUCT
          ASL       A
          ADC       PRODUCT
          TAX
          LDY       #$04
@1        LDA       MMONTHS-3,X
          STA       DATEDISP,Y
          INY
          INX
          CPY       #$07
          BCC       @1
          LDA       #SPACE
          STA       DATEDISP,Y
          INY
          LDX       #$06
          LDA       YEAR,X
          CMP       #$30
          BEQ       @2
          STA       DATEDISP,Y
          INY
@2        INX
          LDA       YEAR,X
          STA       DATEDISP,Y
          INY
          LDA       #$2C
          STA       DATEDISP,Y
          INY
          LDA       #SPACE
          STA       DATEDISP,Y
          INY
          LDX       #$00
@3        LDA       YEAR,X
          STA       DATEDISP,Y
          INY
          INX
          CPX       #$04
          BCC       @3
          LDA       #$04
          STA       DATEDISP,Y
          INY
          STY       DATELEN
          RTS

                    ;Convert SOS ascii date to SOS binary packed format
CNVTDATE  BRK
          .BYTE     $63
          .WORD     TIMEDATE
          JSR       ERRORCK
          LDY       #$02
          LDA       YEAR,Y
          AND       #$0F
          STA       MLPLIER
          JSR       MULTx10
          INY
          LDA       YEAR,Y
          AND       #$0F
          ADC       PRODUCT
          STA       TEMPVAL1
          INY
          LDA       YEAR,Y
          AND       #$0F
          STA       MLPLIER
          JSR       MULTIPLY
          INY
          LDA       YEAR,Y
          AND       #$0F
          ADC       PRODUCT
          ASL       A
          ASL       A
          ASL       A
          ASL       A
          ASL       A
          STA       TEMPVAL
          ROL       TEMPVAL1
          INY
          LDA       YEAR,Y
          AND       #$0F
          STA       MLPLIER
          JSR       MULTIPLY
          INY
          LDA       YEAR,Y
          AND       #$0F
          ADC       PRODUCT
          AND       #$1F
          ORA       TEMPVAL
          STA       TEMPVAL

                    ;Convert SOS ascii time to SOS binary packed format
          LDY       #$09
          LDA       YEAR,Y
          AND       #$0F
          STA       MLPLIER
          JSR       MULTIPLY
          INY
          LDA       YEAR,Y
          AND       #$0F
          ADC       PRODUCT
          STA       TEMPVAL3
          INY
          LDA       YEAR,Y
          AND       #$0F
          STA       MLPLIER
          JSR       MULTIPLY
          INY
          LDA       YEAR,Y
          AND       #$0F
          ADC       PRODUCT
          STA       TEMPVAL2
          RTS

MULTx10   LDA       #$0A           ;Multiply by 10
          STA       MLPCND
MULT8bit  LDA       #$00
          STA       MLPCND+1
          STA       MLPCND+2
                    ;24 bit multiplicand by 8 bit multiplier
MULTIPLY  LDA       #$00
          STA       PRODUCT
          STA       PRODUCT+1
          STA       PRODUCT+2
          LDX       #$08
@1        ASL       PRODUCT
          ROL       PRODUCT+1
          ROL       PRODUCT+2
          BCS       @3
          ASL       MLPLIER
          BCC       @2
          CLC
          LDA       PRODUCT
          ADC       MLPCND
          STA       PRODUCT
          LDA       PRODUCT+1
          ADC       MLPCND+1
          STA       PRODUCT+1
          LDA       PRODUCT+2
          ADC       MLPCND+2
          STA       PRODUCT+2
          BCS       @3
@2        DEX
          BNE       @1            ;at Exit - result in PRODUCT (LB),
@3        RTS                     ;PRODUCT+1 (MB), PRODUCT+2 (HB)

                    ;At Entry: HSB in PRODUCT+2, MSB in PRODUCT+1
                    ;          LSB in PRODUCT, address for results in INDEX
DECIMAL3  LDY       #$03
          BNE       CLRHSB
DECIMAL5  LDY       #$05
CLRHSB    LDA       #$00
          STA       PRODUCT+2
          BEQ       DECIMAL
DECIMAL7  LDY       #$07
DECIMAL   STY       DECPLACE
          DEY
@1        LDA       PRODUCT+2
          BEQ       @3
          LDX       #$00
          CMP       #$0A
          BCC       @2
          TAX
          LDA       #$00
          JSR       DIVx10
@2        STX       PRODUCT+2
@3        LDX       PRODUCT+1
          JSR       DIVx10
          STX       PRODUCT+1
          LDX       PRODUCT
          JSR       DIVx10
          STX       PRODUCT
          ORA       #$30
          STA       TEMPVAL,Y
          DEY
          BNE       @1
          TXA
          ORA       #$30
          STA       TEMPVAL,Y
          LDX       #$00
@4        LDA       TEMPVAL,X
          CMP       #$30
          BNE       @6
          INX
          CPX       DECPLACE
          BCC       @4
          BEQ       @6
@5        LDA       TEMPVAL,X
@6        STA       (INDEX),Y
          INY
          INX
          CPX       DECPLACE
          BCC       @5
          TYA
          LDY       DECPLACE
          STA       (INDEX),Y
          RTS


                    ;at Entry Xreg=LSB Dividend, Areg=MSB Dividend
DIVx10    STX       ZPGTEMP0
          LDX       #$08
          CLC
@1        ROL       ZPGTEMP0
          ROL       A
          CMP       #$0A           ;Divisor = $0A
          BCC       @2
          SBC       #$0A
@2        DEX
          BNE       @1
          ROL       ZPGTEMP0
          LDX       ZPGTEMP0
          RTS                      ;at Exit: Xreg=Quotient, Areg=Remainder

                    ;Get device identification info
GETDDATA  LDY       CURDRIVE
GETDDAT2  LDX       DEV0LIST,Y
          LDA       SLOTLST,X
          ORA       #$30
          STA       SlotVal2
          STA       SlotVal3
          TYA
          ASL       A
          CLC
          ADC       IBuffHB
          STA       DevIDpg0+1
          LDA       DRVNLST,X
          LDX       #$13
          LSR       A
          BCS       @1
          LDX       #$09
@1        LDY       #$09
@2        LDA       DRV0MSTR,X
          STA       DEVICE,Y
          DEX
          DEY
          BPL       @2

GSERIAL   LDY       #SerIdx        ;$14
          LDX       #$00
@1        LDA       (DevIDpg0),y
          PHA
          INY
          LDA       (DevIDpg0),y
          CPX       #$00
          BNE       @2
          CMP       #$20
          BEQ       @3
@2        STA       SerialNo,x
          INX
@3        PLA
          CPX       #$00
          BNE       @4
          CMP       #$20
          BEQ       @5
@4        STA       SerialNo,x
          INX
@5        INY
          CPY       #SerIdx+SerLen    ;$14+$13
          BCC       @1
          STX       SN_Len

GREVISN   LDY       #RevisIdx      ;$2E
          LDX       #$00
@1        LDA       (DevIDpg0),y
          PHA
          INY
          LDA       (DevIDpg0),y
          CPX       #$00
          BNE       @2
          CMP       #$20
          BEQ       @3
@2        STA       FirmWare,x
          INX
@3        PLA
          CPX       #$00
          BNE       @4
          CMP       #$20
          BEQ       @5
@4        STA       FirmWare,x
          INX
@5        INY
          CPY       #RevisIdx+RevisLen    ;$2E+$07
          BCC       @1
          STX       FW_Len

GMODEL    LDY       #ModelIdx      ;$36
          LDX       #$00
@1        LDA       (DevIDpg0),y
          PHA
          INY
          LDA       (DevIDpg0),y
          CPX       #$00
          BNE       @2
          CMP       #$20
          BEQ       @3
@2        STA       Model,x
          INX
@3        PLA
          CPX       #$00
          BNE       @4
          CMP       #$20
          BEQ       @5
@4        STA       Model,x
          INX
@5        INY
          CPY       #ModelIdx+ModelLen      ;$36+017
          BCC       @1
          STX       MOD_Len

                    ;Get Device Compatibility
Compatb   LDY       #LBAidx        ;$63
          LDA       (DevIDpg0),y   ;Check for LBA support
          AND       #$02
          ORA       #$01           ;Set for no CFA feature support
          TAX
          LDY       #$01
          LDA       (DevIDpg0),y
          BMI       MaybeCF
          AND       #$F0
          BNE       NotCF
          LDY       #CFsetIdx      ;Word 83 LB
          LDA       (DevIDpg0),y
          AND       #$04
          BEQ       NotCF
          BNE       YesCF
MaybeCF   CMP       #$84           ;Check for CFA Feature support
          BNE       NotCF          ;Looking for bytes $848A in 1st word
          DEY
          LDA       (DevIDpg0),y
          CMP       #$8A
          BNE       NotCF
YesCF     LDX       #$02
NotCF     STX       MODE_ID
                    ;$01=device does not support either CFA feature set or LBA mode
                    ;$02=device supports LBA mode and CFA feature set
                    ;$03=device supports LBA mode but doesn't support CFA feature set

GetCapcy  LDY       #CapacIdx+CapacLen+1    ;$72+$02+$01
          LDX       #CapacLen      ;3 bytes long
          LDA       (DevIDpg0),y   ;check for capacity too large for 24 bits
          BEQ       @2
          LDA       #$FF           ;Set maximum drive size of 16777215 blocks
@1        STA       TOTSECT,x
          DEX
          BPL       @1
          LDX       #$07
          LDA       TooLrg,x
          STA       TOTCAP,x
          DEX
          BPL       @2
          LDA       #$08
          BNE       @4

@2        DEY
@3        LDA       (DevIDpg0),y
          STA       PRODUCT,x
          STA       TOTSECT,x
          DEY
          DEX
          BPL       @3
          LDA       PTHDRADR
          STA       INDEX
          LDA       PTHDRADR+1
          STA       INDEX+1
          LDY       #$08
          JSR       DECIMAL        ;Generate 8 digit decimal
@4        STA       TCAPLEN
          RTS

                    ;Get Partition Table Block
GETPTBL   JSR       ClrDates       ;Clear partition table date display values
          JSR       CLRCALL
GPTABLE   LDA       #$01
          LDY       #Num_Blks
          STA       (BUFFCALL),Y
          LDA       PTmapHB        ;Set absolute sector address of partition map
          LDY       #Sect_HB
          STA       (BUFFCALL),Y
          LDY       #ATA_Cmd
          LDA       #ATACRead
          STA       (BUFFCALL),Y
          JSR       CALLDRVR
          BEQ       @1
          LDX       #PTReadER
          JSR       PRTPMPTM
          JSR       InitPTbl
          LDA       #$00
          STA       CURDRIVE       ;invalidate current drive selected
          JSR       DevErrCk
          JMP       ErrHndlr

@1        LDY       #$00
@2        LDA       (BUFFPG0),Y
          STA       (PARTTBL),Y
          INY
          BNE       @2
          JSR       GETCKSUM
          EOR       (PARTTBL),Y     ;Yreg=$00
          BEQ       InitRetn
InitPTbl  JSR       ZEROPTBL
          LDY       #ORIGDATE
          JSR       REVDATE
InitRetn  RTS

                    ;Clear the partition table dates display values
ClrDates  LDX       #$07
          LDA       #$20
@1        STA       ORGDATE1,X
          STA       NEWDATE1,X
          DEX
          BPL       @1
          RTS

                    ;Routine to pause before returning to main menu
PAUSE     LDX       #ESC1B
          JSR       PRTESCP
          BRK
          .BYTE     $CA
          .WORD     READCON
          JSR       ERRORCK
          JMP       MAINMENU

                    ;Initialize call block with zeros
CLRCALL   LDY       CURDRIVE
          LDX       DEV0LIST,Y
SETCALL   LDA       DNUMLST,X
          STA       CALLREF1
          STA       CALLREF2
          STA       DFMTREF
          LDY       #$06
          LDA       #$00
@1        STA       (BUFFCALL),Y
          DEY
          BPL       @1
          RTS

                    ;Call Driver Routine
CALLDRVR  BRK
          .BYTE     $83
          .WORD     BUFFCTRL
          STA       ERRCODE
          BNE       GDevErr
          STA       Status         ;$0
          CLC
          RTS                      ;No error - Carry is clear and Areg = $

GDevErr   BRK                      ;Get error data from driver
          .BYTE     $82
          .WORD     ERRSTAT
DevErrCk  LDA       Status
          LSR       A
          LDA       ERRCODE        ;Return Areg = SOS call error (not zero) &
          RTS                      ;status ERR bit in carry


                    ;Status
                    ;Err_Data - byte $0 = error code
                    ;   Bit 7 = BBK bad block has been detected
                    ;   Bit 6 = UNC uncorrectable error was encountered
                    ;   Bit 5 = $ (undefined)
                    ;   Bit 4 = IDNF requested block ID is in error or can't be found
                    ;   Bit 3 = $ (undefined)
                    ;   Bit 2 = ABRT command was aborted or an invalid command
                    ;   Bit 1 = $ (undefined)
                    ;   Bit $ = AMNF general error
                    ;Err_Data - byte $1 thru $3 = block # (LB, MB, & HB)
                    ;Err_Data - byte $4 = # of blocks left to complete command


                    ;Convert binary value to hexidecimal ascii bytes routine
                    ;at entry Areg contains binary value to convert
BINHEX    PHA
          AND       #$0F
          ORA       #$30
          CMP       #$3A
          BCC       @1
          ADC       #$06
@1        STA       GENERR
          PLA
          LSR       A
          LSR       A
          LSR       A
          LSR       A
          ORA       #$30
          CMP       #$3A
          BCC       @2
          ADC       #$06
@2        STA       GENERR+1
          RTS          ;at exit hex ascii values are in GENERR+1=HB, GENERR=LB

WRITPTBL  LDX       #UPDATMSG
          JSR       PRTMSG
          JSR       WPTBLDAT
          BRK                      ;format call to initialize driver
          .BYTE     $83
          .WORD     DFMTCALL
          JSR       ERRORCK
          LDX       #CmpltMsg
          JSR       PRTMSG
          JMP       Wait1sec

WPTBLDAT  JSR       CLRCALL
          LDY       #ATA_Cmd
          LDA       #ATACWrit
          STA       (BUFFCALL),Y
          LDA       #$01
          LDY       #Num_Blks
          STA       (BUFFCALL),Y
          LDA       PTmapHB        ;set partition address
          LDY       #Sect_HB
          STA       (BUFFCALL),Y
          JSR       CALLDRVR
          BNE       @1
          RTS
@1        LDX       #UPDATERR
          JSR       PRTPMPTM
          JSR       DevErrCk
          JMP       ErrHndlr

                    ;routine to revise partition table dates
                    ;at entry Yreg=location in partition to place current date
REVDATE   LDX       #$04
@1        LDA       YEAR,X
          STA       (PARTTBL),Y
          INY
          INX
          CPX       #$08
          BEQ       @2
          CPX       #$04
          BEQ       @4
          CPX       #$06
          BEQ       @3
          BNE       @1
@2        LDX       #$02
@3        LDA       #$2F
          STA       (PARTTBL),Y
          INY
          BNE       @1
@4        RTS

                    ;at entry address to decimal values in INDEX
                    ;Xreg=index for length of decimal  ie: $07 & $05
BINARY    LDA       #$00
          STA       TEMPVAL
          STA       TEMPVAL1
          STA       TEMPVAL2
          STA       TEMPVAL3
          CLC
          LDY       ITEM_LEN,X
          LDA       (INDEX),Y
          BEQ       @3
          TAY
          DEY
          LDA       (INDEX),Y
          AND       #$0F
          STA       TEMPVAL
          DEY
          BMI       @3
@1        LDA       (INDEX),Y
          AND       #$0F
          BEQ       @2
          STA       MLPLIER
          LDX       TEMPVAL3
          LDA       MULTPCND,X
          STA       MLPCND
          LDA       MULTPCND+1,X
          STA       MLPCND+1
          LDA       MULTPCND+2,X
          STA       MLPCND+2
          JSR       MULTIPLY
          BCS       @3
          LDA       TEMPVAL
          ADC       PRODUCT
          STA       TEMPVAL
          LDA       TEMPVAL1
          ADC       PRODUCT+1
          STA       TEMPVAL1
          LDA       TEMPVAL2
          ADC       PRODUCT+2
          STA       TEMPVAL2
          BCS       @3             ;Range overflow
@2        INC       TEMPVAL3
          INC       TEMPVAL3
          INC       TEMPVAL3
          DEY
          BPL       @1             ;at exit - binary value is in TEMPVAL=LB,
@3        RTS                      ;TEMPVAL1=MB, TEMPVAL2=HB

Query0YN  JSR       PRTPMPTM
QUERY_YN  BRK                      ;Query user for Yes/No response
          .BYTE     $CA
          .WORD     READCON
          JSR       ERRORCK
          LDA       INPUT
          AND       #$DF
          CMP       #Ascii_N
          BEQ       @2
          CMP       #ESCAPE
          BEQ       @2
          CMP       #Ascii_Y
          BEQ       @1
          CMP       #RETURN
          BNE       QUERY_YN
@1        CLC
@2        PHP
          LDA       #$1E
          JSR       PRTBYTE
          PLP                      ;at exit - carry clear if response is yes
          RTS                      ;carry set if response is no

PROCEND   :=        *
CODELEN   :=        *-CODELOAD
