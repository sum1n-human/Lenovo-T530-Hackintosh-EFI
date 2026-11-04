/*
 * Dual-GPU Brightness Control SSDT for Lenovo ThinkPad T530
 * Targets Intel HD 4000 panel controls exclusively under macOS.
 */
DefinitionBlock ("", "SSDT", 2, "CORP", "PNLF", 0x00000000)
{
    External (\_SB.PCI0.VID, DeviceObj)

    Scope (\_SB.PCI0.VID)
    {
        Device (PNLF)
        {
            Name (_HID, EisaId ("APP0002"))  // Hardware ID for Apple Backlight
            Name (_CID, "backlight")         // Compatible ID
            Name (_UID, 0x0E)                // ID 14: Targets Ivy Bridge PWM controls
            
            Method (_STA, 0, NotSerialized)  
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0B) // Active only in macOS
                }
                Else
                {
                    Return (Zero) // Completely hidden from Linux/Windows
                }
            }
        }
    }
}
