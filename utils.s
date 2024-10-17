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

/*-----------------------------------------------------------*/
/*                             init                          */
/*-----------------------------------------------------------*/
.section .text.init
.weak init
.type init,%function
.thumb_func
init:
    bx lr

/*-----------------------------------------------------------*/
/*                             exit                          */
/*-----------------------------------------------------------*/
.section .text.exit
.weak exit
.type exit,%function
.thumb_func
exit:
1:
    bkpt #0
    b 1b

/*-----------------------------------------------------------*/
/*                          zero_data                        */
/*-----------------------------------------------------------*/
.section .text.zero_data
.global zero_data
.type zero_data,%function
zero_data:
    movs r3, #0
1:
    ldmia r0!, {r1-r2}
    cmp r1, #0
    beq 4f
2:
    cmp r1, r2
    blo 3f
    b 1b
3:
    str r3, [r1], #4
    b 2b
4:
    bx lr

/*-----------------------------------------------------------*/
/*                          copy_data                        */
/*-----------------------------------------------------------*/
.section .text.copy_data
.global copy_data
.type copy_data,%function
copy_data:
    push {r4}
1:
    ldmia r0!, {r1-r3}
    cmp r1, #0
    beq 4f
2:
    cmp r2, r3
    blo 3f
    b 1b
3:
    ldm r1!, {r4}
    stm r2!, {r4}
    b 2b
4:
    pop {r4}
    bx lr

.end
