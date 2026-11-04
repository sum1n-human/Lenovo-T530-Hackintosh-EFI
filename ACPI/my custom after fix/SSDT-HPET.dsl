/*
 * Supplementary HPET _CRS tailored for Lenovo ThinkPad T530
 * Verified native ACPI device path: \_SB.PCI0.LPC.HPET
 * Requires the HPET _CRS to XCRS rename patch enabled in your config.plist
 */
DefinitionBlock ("", "SSDT", 2, "CORP", "HPET", 0x00000000)
{
    External (\_SB.PCI0.LPC.HPET, DeviceObj)
    External (\_SB.PCI0.LPC.HPET.XCRS, MethodObj)
    External (\_SB.PCI0.LPC.HPET.XSTA, MethodObj)

    Scope (\_SB.PCI0.LPC.HPET)
    {
        Name (BUFX, ResourceTemplate ()
        {
            // Routing IRQ 0 and 8 mimics a native Apple Mac device tree 
            IRQNoFlags ()
                {0}
            Memory32Fixed (ReadOnly, 
                0xFED00000,           // Address Base
                0x00000400,           // Address Length
            )
        })
        
        Method (_CRS, 0, Serialized)  
        {
            If (LOr (_OSI ("Darwin"), LNot(CondRefOf (\_SB.PCI0.LPC.HPET.XCRS))))
            {
                Return (BUFX)
            }
            Return (\_SB.PCI0.LPC.HPET.XCRS ())
        }
        
        Method (_STA, 0, NotSerialized)  
        {
            If (LOr (_OSI ("Darwin"), LNot (CondRefOf (\_SB.PCI0.LPC.HPET.XSTA))))
            {
                Return (0x0F)
            }
            Return (\_SB.PCI0.LPC.HPET.XSTA ())
        }
    }
}
