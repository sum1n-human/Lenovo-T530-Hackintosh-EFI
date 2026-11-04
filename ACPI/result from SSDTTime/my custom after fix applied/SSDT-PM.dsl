/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20261030
 * 
 * Corrected SSDT for Intel Core i5-3380M
 * Resolves frequency lock by utilizing native XCPM injection.
 */

DefinitionBlock ("SSDT-PM.aml", "SSDT", 1, "APPLE ", "CpuPm", 0x00021500)
{
    External (\_PR_.CPU0, DeviceObj)
    External (\_PR_.CPU1, DeviceObj)
    External (\_PR_.CPU2, DeviceObj)
    External (\_PR_.CPU3, DeviceObj)

    Scope (\_PR_.CPU0)
    {
        /* 
         * Device Specific Method to force native power management initialization.
         * This passes the configuration requirements over to the macOS kernel.
         */
        Method (_DSM, 4, NotSerialized)
        {
            If (LEqual (Arg2, Zero))
            {
                Return (Buffer (One)
                {
                    0x03
                })
            }

            Return (Package (0x02)
            {
                "plugin-type", 
                One
            })
        }
    }
}

