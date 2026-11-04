
DefinitionBlock ("", "SSDT", 2, "CORP ", "SsdtEC", 0x00001000)
{
    External (\_SB.PCI0.LPC, DeviceObj)
    External (\_SB.PCI0.LPC.EC, DeviceObj)
    External (\_SB.PCI0.LPC.EC._STA, MethodObj)
    External (\_SB.PCI0.LPC.EC.XSTA, MethodObj)

    If (LAnd (CondRefOf (\_SB.PCI0.LPC.EC.XSTA), LNot (CondRefOf (\_SB.PCI0.LPC.EC._STA))))
    {
        Scope (\_SB.PCI0.LPC.EC)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (\_SB.PCI0.LPC.EC.XSTA ())
                }
            }
        }
    }

}