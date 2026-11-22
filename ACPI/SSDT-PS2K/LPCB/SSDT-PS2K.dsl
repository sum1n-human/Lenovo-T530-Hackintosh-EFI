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
                "Clicking", ">y",
                "DragLock", ">y",
                "ClickPad", ">n",
                "FingerZ", 30,
                "MouseMultiplierX", 2, 
                "MouseMultiplierY", 2
            }, 

            "LENOVO", 
            Package ()
            {
                "T530", 
                "Thinkpad_TrackPad"
            }
        })
    }
}
