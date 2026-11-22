DefinitionBlock ("", "SSDT", 2, "ACDT", "PS2K", 0x00000000)
{
    // Try LPCB first, if that fails, change both to LPC
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)

    Scope (_SB.PCI0.LPCB.PS2K)
    {
        Name (RMCF, Package ()
        {
            "Synaptics TouchPad", 
            Package ()
            {
                "Clicking", ">y",
                "DragLock", ">y",
                "ClickPad", ">n"
            },
            "Mouse",
            Package ()
            {
                "PointerSpeed", 16
            }
        })
    }
}
