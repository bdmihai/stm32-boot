.include "startup.s"

.section .isr_vector, "a", %progbits
.type vector_table, %object
.size vector_table, .-vector_table
vector_table:
    .word __end_stack
    .word Reset_Handler
    .word NMI_Handler
    .word HardFault_Handler
    .word MemManage_Handler
    .word BusFault_Handler
    .word UsageFault_Handler
    .word 0
    .word 0
    .word 0
    .word 0
    .word SVC_Handler
    .word DebugMon_Handler
    .word 0
    .word PendSV_Handler
    .word SysTick_Handler

    .word WWDG_IRQHandler
    .word PVD_IRQHandler
    .word TAMP_STAMP_IRQHandler
    .word RTC_WKUP_IRQHandler
    .word FLASH_IRQHandler
    .word RCC_IRQHandler
    .word EXTI0_IRQHandler
    .word EXTI1_IRQHandler
    .word EXTI2_IRQHandler
    .word EXTI3_IRQHandler
    .word EXTI4_IRQHandler
    .word DMA1_Stream0_IRQHandler
    .word DMA1_Stream1_IRQHandler
    .word DMA1_Stream2_IRQHandler
    .word DMA1_Stream3_IRQHandler
    .word DMA1_Stream4_IRQHandler
    .word DMA1_Stream5_IRQHandler
    .word DMA1_Stream6_IRQHandler
    .word ADC_IRQHandler
    .word 0
    .word 0
    .word 0
    .word 0
    .word EXTI9_5_IRQHandler
    .word TIM1_BRK_TIM9_IRQHandler
    .word TIM1_UP_IRQHandler
    .word TIM1_TRG_COM_TIM11_IRQHandler
    .word TIM1_CC_IRQHandler
    .word 0
    .word 0
    .word 0
    .word I2C1_EV_IRQHandler
    .word I2C1_ER_IRQHandler
    .word I2C2_EV_IRQHandler
    .word I2C2_ER_IRQHandler
    .word SPI1_IRQHandler
    .word 0
    .word USART1_IRQHandler
    .word USART2_IRQHandler
    .word 0
    .word EXTI15_10_IRQHandler
    .word RTC_Alarm_IRQHandler
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word DMA1_Stream7_IRQHandler
    .word 0
    .word 0
    .word TIM5_IRQHandler
    .word 0
    .word 0
    .word 0
    .word TIM6_DAC_IRQHandler
    .word 0
    .word DMA2_Stream0_IRQHandler
    .word DMA2_Stream1_IRQHandler
    .word DMA2_Stream2_IRQHandler
    .word DMA2_Stream3_IRQHandler
    .word DMA2_Stream4_IRQHandler
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word DMA2_Stream5_IRQHandler
    .word DMA2_Stream6_IRQHandler
    .word DMA2_Stream7_IRQHandler
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word RNG_IRQHandler
    .word FPU_IRQHandler
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word FMPI2C1_EV_IRQHandler
    .word FMPI2C1_ER_IRQHandler
    .word LPTIM1_IRQHandler


.weak NMI_Handler
.thumb_set NMI_Handler, Default_Handler

.weak HardFault_Handler
.thumb_set HardFault_Handler, Default_Handler

.weak MemManage_Handler
.thumb_set MemManage_Handler, Default_Handler

.weak BusFault_Handler
.thumb_set BusFault_Handler, Default_Handler

.weak UsageFault_Handler
.thumb_set UsageFault_Handler, Default_Handler

.weak SVC_Handler
.thumb_set SVC_Handler, Default_Handler

.weak DebugMon_Handler
.thumb_set DebugMon_Handler, Default_Handler

.weak PendSV_Handler
.thumb_set PendSV_Handler, Default_Handler

.weak SysTick_Handler
.thumb_set SysTick_Handler, Default_Handler

.weak WWDG_IRQHandler
.thumb_set WWDG_IRQHandler, Default_Handler

.weak PVD_IRQHandler
.thumb_set PVD_IRQHandler, Default_Handler

.weak TAMP_STAMP_IRQHandler
.thumb_set TAMP_STAMP_IRQHandler, Default_Handler

.weak RTC_WKUP_IRQHandler
.thumb_set RTC_WKUP_IRQHandler, Default_Handler

.weak FLASH_IRQHandler
.thumb_set FLASH_IRQHandler, Default_Handler

.weak RCC_IRQHandler
.thumb_set RCC_IRQHandler, Default_Handler

.weak EXTI0_IRQHandler
.thumb_set EXTI0_IRQHandler, Default_Handler

.weak EXTI1_IRQHandler
.thumb_set EXTI1_IRQHandler, Default_Handler

.weak EXTI2_IRQHandler
.thumb_set EXTI2_IRQHandler, Default_Handler

.weak EXTI3_IRQHandler
.thumb_set EXTI3_IRQHandler, Default_Handler

.weak EXTI4_IRQHandler
.thumb_set EXTI4_IRQHandler, Default_Handler

.weak DMA1_Stream0_IRQHandler
.thumb_set DMA1_Stream0_IRQHandler, Default_Handler

.weak DMA1_Stream1_IRQHandler
.thumb_set DMA1_Stream1_IRQHandler, Default_Handler

.weak DMA1_Stream2_IRQHandler
.thumb_set DMA1_Stream2_IRQHandler, Default_Handler

.weak DMA1_Stream3_IRQHandler
.thumb_set DMA1_Stream3_IRQHandler, Default_Handler

.weak DMA1_Stream4_IRQHandler
.thumb_set DMA1_Stream4_IRQHandler, Default_Handler

.weak DMA1_Stream5_IRQHandler
.thumb_set DMA1_Stream5_IRQHandler, Default_Handler

.weak DMA1_Stream6_IRQHandler
.thumb_set DMA1_Stream6_IRQHandler, Default_Handler

.weak ADC_IRQHandler
.thumb_set ADC_IRQHandler, Default_Handler

.weak EXTI9_5_IRQHandler
.thumb_set EXTI9_5_IRQHandler, Default_Handler

.weak TIM1_BRK_TIM9_IRQHandler
.thumb_set TIM1_BRK_TIM9_IRQHandler, Default_Handler

.weak TIM1_UP_IRQHandler
.thumb_set TIM1_UP_IRQHandler, Default_Handler

.weak TIM1_TRG_COM_TIM11_IRQHandler
.thumb_set TIM1_TRG_COM_TIM11_IRQHandler, Default_Handler

.weak TIM1_CC_IRQHandler
.thumb_set TIM1_CC_IRQHandler, Default_Handler

.weak I2C1_EV_IRQHandler
.thumb_set I2C1_EV_IRQHandler, Default_Handler

.weak I2C1_ER_IRQHandler
.thumb_set I2C1_ER_IRQHandler, Default_Handler

.weak I2C2_EV_IRQHandler
.thumb_set I2C2_EV_IRQHandler, Default_Handler

.weak I2C2_ER_IRQHandler
.thumb_set I2C2_ER_IRQHandler, Default_Handler

.weak SPI1_IRQHandler
.thumb_set SPI1_IRQHandler, Default_Handler

.weak USART1_IRQHandler
.thumb_set USART1_IRQHandler, Default_Handler

.weak USART2_IRQHandler
.thumb_set USART2_IRQHandler, Default_Handler

.weak EXTI15_10_IRQHandler
.thumb_set EXTI15_10_IRQHandler, Default_Handler

.weak RTC_Alarm_IRQHandler
.thumb_set RTC_Alarm_IRQHandler, Default_Handler

.weak DMA1_Stream7_IRQHandler
.thumb_set DMA1_Stream7_IRQHandler, Default_Handler

.weak TIM5_IRQHandler
.thumb_set TIM5_IRQHandler, Default_Handler

.weak TIM6_DAC_IRQHandler
.thumb_set TIM6_DAC_IRQHandler, Default_Handler

.weak DMA2_Stream0_IRQHandler
.thumb_set DMA2_Stream0_IRQHandler, Default_Handler

.weak DMA2_Stream1_IRQHandler
.thumb_set DMA2_Stream1_IRQHandler, Default_Handler

.weak DMA2_Stream2_IRQHandler
.thumb_set DMA2_Stream2_IRQHandler, Default_Handler

.weak DMA2_Stream3_IRQHandler
.thumb_set DMA2_Stream3_IRQHandler, Default_Handler

.weak DMA2_Stream4_IRQHandler
.thumb_set DMA2_Stream4_IRQHandler, Default_Handler

.weak DMA2_Stream5_IRQHandler
.thumb_set DMA2_Stream5_IRQHandler, Default_Handler

.weak DMA2_Stream6_IRQHandler
.thumb_set DMA2_Stream6_IRQHandler, Default_Handler

.weak DMA2_Stream7_IRQHandler
.thumb_set DMA2_Stream7_IRQHandler, Default_Handler

.weak RNG_IRQHandler
.thumb_set RNG_IRQHandler, Default_Handler

.weak FPU_IRQHandler
.thumb_set FPU_IRQHandler, Default_Handler

.weakFMPI2C1_EV_IRQHandler
.thumb_set FMPI2C1_EV_IRQHandler, Default_Handler

.weak FMPI2C1_ER_IRQHandler
.thumb_set FMPI2C1_ER_IRQHandler, Default_Handler

.weak LPTIM1_IRQHandler
.thumb_set LPTIM1_IRQHandler, Default_Handler
