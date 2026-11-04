/*
 * SMBus & MCHC injection table for Lenovo ThinkPad T530 (Ivy Bridge 7-Series)
 * Fixed for systems where SBUS/SMBU and MCHC are completely missing from native ACPI.
 */
DefinitionBlock ("", "SSDT", 2, "CORP", "SBUSMCHC", 0x00000000)
{
    External (\_SB.PCI0, DeviceObj)

    Scope (\_SB.PCI0)
    {
        // 1. Inject MCHC (Memory Controller Hub) since CondRefOf failed
        Device (MCHC)
        {
            Name (_ADR, Zero)  // _ADR: Address 0x00000000 (Bus 0, Device 0, Function 0)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F) // Visible only in macOS
                }
                Else
                {
                    Return (Zero) // Hidden from Linux/Windows to prevent conflicts
                }
            }
        }

        // 2. Inject SBUS (SMBus Controller) from scratch
        Device (SBUS)
        {
            Name (_ADR, 0x001F0003)  // _ADR: Address 0x001F0003 (Bus 0, Device 31, Function 3)
            
            Device (BUS0)
            {
                Name (_CID, "smbus")  // _CID: Compatible ID
                Name (_ADR, Zero)  // _ADR: Address
                
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
}

