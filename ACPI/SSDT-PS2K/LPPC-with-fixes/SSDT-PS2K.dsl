DefinitionBlock ("", "SSDT", 2, "ACDT", "PS2K", 0x00000000)
{
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)

    Scope (_SB.PCI0.LPCB.PS2K)
    {
        Name (RMCF, Package ()
        {
            "Synaptics TouchPad", 
            Package ()
            {
                "Clicking", ">y",      // Force tap-to-click at driver level
                "DragLock", ">y",
                "ClickPad", ">n",
                "ForceDefaultBuiltIn", ">y" // Tell macOS it's a built-in trackpad
            }
        })

        // This method helps macOS identify the device type
        Method (_DSM, 4, NotSerialized)
        {
            If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 }) }
            Return (Package ()
            {
                "RM,device-id", Buffer() { 0x02, 0x1E, 0x00, 0x00 },
                "built-in", Buffer () { 0x00 }
            })
        }
    }
}
