OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")

ENTRY(Reset_Handler)

SECTIONS {
    /* put ISR vector first into FLASH */
    .isr_vector : ALIGN(4) {
        __isr_vector_start = .;

        KEEP(*(.isr_vector));
        
        __isr_vector_end = .;
    } >RAM AT >FLASH
    __isr_vector_source = LOADADDR(.isr_vector);

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

        . = ALIGN(4);
        /* preinit data */
        PROVIDE_HIDDEN (__preinit_array_start = .);
        KEEP(*(.preinit_array*))
        PROVIDE_HIDDEN (__preinit_array_end = .);

        . = ALIGN(4);
        /* init data */
        PROVIDE_HIDDEN (__init_array_start = .);
        KEEP(*(SORT(.init_array.*)))
        KEEP(*(.init_array*))
        PROVIDE_HIDDEN (__init_array_end = .);

        . = ALIGN(4);
        /* finit data */
        PROVIDE_HIDDEN (__fini_array_start = .);
        KEEP(*(SORT(.fini_array.*)))
        KEEP(*(.fini_array*))
        PROVIDE_HIDDEN (__fini_array_end = .);

        . = ALIGN(4);
        __text_end = .;
    } >FLASH

    /* put read only data into FLASH */
    .rodata : ALIGN(4) {
        __rodata_start = .;

        *(.rodata)
        *(.rodata*)

        . = ALIGN(4);
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

    /* put initialized data in RAM with the source located in flash */
    .data : ALIGN(4) {
        __data_start = .;

        *(.time_critical*)

        *(.data)
        *(.data*)

        . = ALIGN(4);
        __data_end = .;
    } >RAM AT >FLASH
    __data_source = LOADADDR(.data);

    /* put uninitialized data in RAM */
    .bss : ALIGN(4) {
        __bss_start = .;

        *(.bss)
        *(.bss*)
        *(COMMON)

        . = ALIGN(4);
        __bss_end = .;
    } >RAM

    /* heap for memory allocation */
    .heap (NOLOAD) : ALIGN(4) {
        __heap_start = .;

        KEEP(*(.heap*))
        . = . + 4*1024;

        . = ALIGN(4);
        __heap_end = .;
    } >RAM

    /* stack will fill the rest of the RAM */
    .stack : ALIGN(4) {
        PROVIDE ( end = . ); /* needed by libc */
        __stack_start = .;
        
        . = . + LENGTH(RAM) - (__stack_start - __isr_vector_start);

        . = ALIGN(4);
        __stack_end = .;
    } >RAM

    /DISCARD/ : {
        libc.a(*)
        libm.a(*)
        libgcc.a(*)
    }

    .ARM.attributes 0 : {
        *(.ARM.attributes)
    }
}
