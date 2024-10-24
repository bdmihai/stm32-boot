/*_____________________________________________________________________________
 │                                                                            |
 │ COPYRIGHT (C) 2024 Mihai Baneu                                             |
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
 |  Author: Mihai Baneu                           Last modified: 17.Oct.2024  |
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
    /* set stack pointer */
    ldr sp, =__stack_end

    /* fill uninitialized variables with zeros */
    adr r0, zero_data_table
    bl zero_data

    /* copy defined sections from FLASH to RAM */
    adr r0, copy_data_table
    bl copy_data

    /* call init, main and exit funcions */
    ldr r1, =init
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
