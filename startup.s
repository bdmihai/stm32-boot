.syntax unified

.global Default_Handler
.global Reset_Handler

/**
 * These are the addresses for the initialized (data) and uninitialized (bss)
 * variables. The initialized variables will be copied from FLASH to RAM. The
 * uninitialized variables will be set to 0. These addresses are set in the
 * linker file.
 */
.word __data_source
.word __data_start
.word __data_end
.word __bss_start
.word __bss_end

/**
 * This code is called when the processor starts following a reset event. This
 * code only copies the global variables to RAM and sets the uninitialized
 * variables to 0.
 */
.section .text.Reset_Handler
.weak Reset_Handler
.type Reset_Handler, %function
Reset_Handler:
    /* copy the initialized global variables to RAM */
    movs r0, #0
    ldr  r1, = __data_start
    ldr  r2, = __data_end
    ldr  r3, = __data_source
    b    LoopCopyData

CopyData:
    ldr  r4, [r3, r0]
    str  r4, [r1, r0]
    adds r0, r0, #4

LoopCopyData:
    adds r4, r1, r0
    cmp  r4, r2
    bcc  CopyData

.ifdef __ccmdata_start
    /* copy the initialized global variables to CCM */
    movs r0, #0
    ldr  r1, = __ccmdata_start
    ldr  r2, = __ccmdata_end
    ldr  r3, = __ccmdata_flash_start
    b    LoopCopyCCMData

CopyCCMData:
    ldr  r4, [r3, r0]
    str  r4, [r1, r0]
    adds r0, r0, #4

LoopCopyCCMData:
    adds r4, r1, r0
    cmp  r4, r2
    bcc  CopyCCMData
.endif

    /* fill uninitialized variables with zeros */
    movs r0, #0
    ldr  r1, = __bss_start
    ldr  r2, = __bss_end
    b    LoopFillZerobss

FillZerobss:
    str  r0, [r1]
    adds r1, r1, #4

LoopFillZerobss:
    cmp  r1, r2
    bcc  FillZerobss

    /* call runtime_init, main and exit funcions */
platform_entry:
    ldr r1, =runtime_init
    blx r1
    ldr r1, =main
    blx r1
    ldr r1, =exit
    blx r1

.size Reset_Handler, .-Reset_Handler

/**
 * This code gets called when the processor receives an unexpected interrupt.
 * The code simply enters an infinite loop, preserving the system state for
 * inspection by a debugger.
 */
.section .text.Default_Handler, "ax", %progbits
Default_Handler:
Infinite_Loop:
    b    Infinite_Loop

.size Default_Handler, .-Default_Handler
