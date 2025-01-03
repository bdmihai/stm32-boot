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
 
import qbs.FileInfo

Product {
    name: 'boot'
    type: 'lib'

    Depends { name: 'stm32' }

    Group {
        condition: stm32.targetMcu == 'STM32F103C8'
        files: ['STM32F1/STM32F103xB.s', 'STM32F1/STM32F103x8.ld']
    }

    Group {
        condition: stm32.targetMcu == 'STM32F103RC'
        files: ['STM32F1/STM32F103xE.s', 'STM32F1/STM32F103xC.ld']
    }

    Group {
        condition: stm32.targetMcu == 'STM32F401CC'
        files: ['STM32F4/STM32F401xC.s', 'STM32F4/STM32F401xC.ld']
    }

    Group {
        condition: stm32.targetMcu == 'STM32F407VG'
        files: ['STM32F4/STM32F407xx.s', 'STM32F4/STM32F407xG.ld']
    }

    Group {
        condition: stm32.targetMcu == 'STM32F411CE'
        files: ['STM32F4/STM32F411xE.s', 'STM32F4/STM32F411xE.ld']
    }

    Group {
        condition: stm32.targetMcu == 'STM32F412ZG'
        files: ['STM32F4/STM32F412Zx.s', 'STM32F4/STM32F412xG.ld']
    }

    Group {
        condition: stm32.targetMcu == 'STM32H7B0VB'
        files: ['STM32H7/STM32H7B0xx.s', 'STM32H7/STM32H7B0xB.ld']
    }

    Group {
        condition: stm32.targetMcu == 'STM32G0B1CB'
        files: ['STM32G0/STM32G0B1Cx.s', 'STM32G0/STM32G0B1xB.ld']
    }

    files: [
        'utils.s'
    ]

    Export {
        Depends { name: 'stm32' }
        stm32.libraryPaths: [ 
            exportingProduct.destinationDirectory, 
            FileInfo.joinPaths(exportingProduct.sourceDirectory, stm32.targetSeries)
        ]
    }
}
