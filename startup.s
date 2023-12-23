/*_____________________________________________________________________________
 │                                                                            |
 │ COPYRIGHT (C) 2023 Mihai Baneu                                             |
 │                                                                            |
 | Permission is hereby  granted,  free of charge,  to any person obtaining a |
 | copy of this software and associated documentation files (the "Software"), |
 | to deal in the Software without restriction,  including without limitation |
 | the rights to  use, copy, modify, merge, publish, distribute,  sublicense, |
 | and/or sell copies  of  the Software, and to permit  persons to  whom  the |
 | Software is furnished to do so, subject to the following conditions:       |
 |                                                                            |
 | The above  copyright notice  and this permission notice  shall be included |
 | in all copies or substantial portions of the Software.                     |
 |                                                                            |
 | THE SOFTWARE IS PROVIDED  "AS IS",  WITHOUT WARRANTY OF ANY KIND,  EXPRESS |
 | OR   IMPLIED,   INCLUDING   BUT   NOT   LIMITED   TO   THE  WARRANTIES  OF |
 | MERCHANTABILITY,  FITNESS FOR  A  PARTICULAR  PURPOSE AND NONINFRINGEMENT. |
 | IN NO  EVENT SHALL  THE AUTHORS  OR  COPYRIGHT  HOLDERS  BE LIABLE FOR ANY |
 | CLAIM, DAMAGES OR OTHER LIABILITY,  WHETHER IN AN ACTION OF CONTRACT, TORT |
 | OR OTHERWISE, ARISING FROM,  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR  |
 | THE USE OR OTHER DEALINGS IN THE SOFTWARE.                                 |
 |____________________________________________________________________________|
 |                                                                            |
 |  Author: Mihai Baneu                           Last modified: 23.Dec.2023  |
 |                                                                            |
 |___________________________________________________________________________*/

.syntax unified
.thumb

.global Default_Handler
.global Reset_Handler

/**
 * This code is called when the processor starts following a reset event. This
 * code only copies the global variables to RAM and sets the uninitialized
 * variables to 0.
 */
.section .text.Reset_Handler, "ax", %progbits
.type Reset_Handler, %function
Reset_Handler:
    /* copy defined sections from FLASH to RAM */
    adr r4, data_copy_table
1:
    ldmia r4!, {r1-r3}
    cmp r1, #0
    beq 2f
    bl data_copy
    b 1b
2:

    /* fill uninitialized variables with zeros */
    adr r3, data_init_table
    movs r0, #0
1:
    ldmia r3!, {r1-r2}
    cmp r1, #0
    beq 2f
    bl data_init
    b 1b
2:

    /* call runtime_init, main and exit funcions */
platform_entry:
    ldr r1, =runtime_init
    blx r1
    ldr r1, =main
    blx r1
    ldr r1, =exit
    blx r1

data_copy_loop:
    ldm r1!, {r0}
    stm r2!, {r0}

data_copy:
    cmp r2, r3
    blo data_copy_loop
    bx lr

data_init_loop:
    str r0, [r1], #4

data_init:
    cmp r1, r2
    blo data_init_loop
    bx lr

/**
 * These are the addresses for the initialized (data) variables. The initialized 
 * variables will be copied from FLASH to RAM. These addresses are set in the
 * linker file.
 */
 data_copy_table:
    .word __isr_vector_source
    .word __isr_vector_start
    .word __isr_vector_end
    .word __data_source
    .word __data_start
    .word __data_end
    //.word __ccmdata_source
    //.word __ccmdata_start
    //.word __ccmdata_end
    .word 0 // null terminator

/**
 * These are the addresses for the uninitialized (bss) variables. The
 * uninitialized variables will be set to 0. These addresses are set in the
 * linker file.
 */
data_init_table:
    .word __bss_start
    .word __bss_end
    .word 0 // null terminator

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
