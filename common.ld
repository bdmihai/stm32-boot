OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")

ENTRY(Reset_Handler)

SECTIONS {
    /* put ISR vector into FLASH, ALWAYS DO THIS FIRST */
    .isr_vector : ALIGN(4) {
        KEEP(*(.isr_vector));
    } >FLASH

    /* put program code and other data into FLASH */
    .text : ALIGN(4) {
        __text_start = .;

        *(.text)
        *(.text*)
        *(.glue_7)
        *(.glue_7t)
        *(.eh_frame)

        KEEP(*(.init))
        KEEP(*(.fini))

        /* preinit data */
        PROVIDE_HIDDEN (__preinit_array_start = .);
        KEEP(*(SORT(.preinit_array.*)))
        KEEP(*(.preinit_array))
        PROVIDE_HIDDEN (__preinit_array_end = .);

        /* init data */
        PROVIDE_HIDDEN (__init_array_start = .);
        KEEP(*(SORT(.init_array.*)))
        KEEP(*(.init_array))
        PROVIDE_HIDDEN (__init_array_end = .);

        /* finit data */
        PROVIDE_HIDDEN (__fini_array_start = .);
        *(SORT(.fini_array.*))
        *(.fini_array)
        PROVIDE_HIDDEN (__fini_array_end = .);

        __text_end = .;
    } >FLASH

    /*put constant (read-only) data into FLASH */
    .rodata : ALIGN(4) {
        __rodata_start = .;

        *(.rodata)
        *(.rodata*)

        __rodata_end = .;
    } >FLASH

    .ARM.extab : {
        *(.ARM.extab* .gnu.linkonce.armextab.*)
    } >FLASH

    .ARM : {
        __exidx_start = .;
        *(.ARM.exidx*)
        __exidx_end = .;
    } >FLASH

    .data : {
        . = ALIGN(4);
        __data_start = .;

        *(.data)
        *(.data*)

        . = ALIGN(4);
        __data_end = .;
    } >RAM AT >FLASH
    __data_flash_start = LOADADDR(.data);

    .bss : {
        . = ALIGN(4);
        __bss_start = .;
        __bss_start__ = __bss_start;

        *(.bss)
        *(.bss*)

        . = ALIGN(4);
        __bss_end = .;
        __bss_end__ = __bss_end;
    } >RAM

    /* heap for dymamic alocation */
    .heap (NOLOAD) : {
        . = ALIGN(4);
        __heap_start = .;

        KEEP(*(.heap*))
        . = . + 32*1024;

        . = ALIGN(4);
        __heap_end = .;
    } >RAM

    /* Stack will fill the rest of the RAM */
    .stack : {
        . = ALIGN(4);
        PROVIDE ( end = . ); /* needed by libc */
        __stack_start = .;
        
        . = . + LENGTH(RAM) - SIZEOF(.data) - SIZEOF(.bss) - SIZEOF(.heap);

        . = ALIGN(4);
        __stack_end = .;
    } >RAM

    .ccmram : {
        . = ALIGN(4);
        __ccmdata_start = .;

        *(.ccmram)
        *(.ccmram*)

        . = ALIGN(4);
        __ccmdata_end = .;
    } >CCMRAM AT >FLASH
    __cmmdata_flash_start = LOADADDR(.ccmram);

    /DISCARD/ : {
        libc.a(*)
        libm.a(*)
        libgcc.a(*)
    }

    .ARM.attributes 0 : {
        *(.ARM.attributes)
    }
}
