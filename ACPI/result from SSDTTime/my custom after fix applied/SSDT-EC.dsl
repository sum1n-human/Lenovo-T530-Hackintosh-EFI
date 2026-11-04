/*
 * Embedded Controller (EC) Injection Table for Lenovo ThinkPad T530
 * Verified native ACPI bridge path: \_SB.PCI0.LPC
 * Injects a dummy 'EC' device specifically for macOS AppleACPIEC compatibility.
 */
DefinitionBlock ("", "SSDT", 2, "CORP", "SsdtEC", 0x00001000)
{
    External (\_SB.PCI0.LPC, DeviceObj)

    Scope (\_SB.PCI0.LPC)
    {
        Device (EC)
        {
            Name (_HID, "PNP0C09")  // _HID: Hardware ID matching a standard industrial EC
            
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F) // Enable the fake loop strictly inside macOS
                }
                Else
                {
                    Return (Zero) // Completely hidden from Linux/Windows to prevent battery tracking loops
                }
            }
        }
    }
}
