DefinitionBlock ("", "SSDT", 2, "CORP", "XOSI", 0x00001000)
{
    Method (XOSI, 1, NotSerialized)
    {
        Store (Package ()
        {
            // --- Windows Client OS ---
            "Windows 2009",      // Windows 7, Win Server 2008 R2
            "Windows 2012",      // Windows 8, Win Server 2012
            "Windows 2013",      // Windows 8.1
            "Windows 2015",      // Windows 10
            "Windows 2016",      // Windows 10 Version 1607
            "Windows 2017",      // Windows 10 Version 1703
            "Windows 2018",      // Windows 10 Version 1803
            "Windows 2018.2",    // Windows 10 Version 1809
            "Windows 2019",      // Windows 10 Version 1903
            "Windows 2020",      // Windows 10 Version 2004
            "Windows 2021",      // Windows 11 / Windows 10 Version 21H2
            "Windows 2022",      // Windows 11 Version 22H2
            "Windows 2025",      // Windows 11 Version 24H2 / 25H2
            "Windows 2026",      // Windows 11 Version 26H2

            // --- Windows Server OS ---
            "Windows Server 2012",    // Windows Server 2012
            "Windows Server 2012 R2", // Windows Server 2012 R2
            "Windows Server 2016",    // Windows Server 2016
            "Windows Server 2019",    // Windows Server 2019
            "Windows Server 2022",    // Windows Server 2022
            "Windows Server 2025"     // Windows Server 2025
        }, Local0)
        
        If (_OSI ("Darwin"))
        {
            Return (LNotEqual (Match (Local0, MEQ, Arg0, MTR, Zero, Zero), Ones))
        }
        Else
        {
            Return (_OSI (Arg0))
        }
    }
}
