import-module au

Add-Type -AssemblyName System.Xml.Linq

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }     
    }
}

function global:au_GetLatest {
    # http://ftp.dell.com/catalog/CatalogPC.cab

    $downloadedFile = [IO.Path]::GetTempFileName()

    $client = new-object System.Net.WebClient
    $client.DownloadFile("http://ftp.dell.com/catalog/CatalogPC.cab", $downloadedFile)

    $xmlFile = [io.Path]::Combine([IO.Path]::GetTempPath(), "CatalogPC.xml")

    & expand $downloadedFile $xmlFile

#   <SoftwareComponent schemaVersion="2.0" identifier="5abea4d5-82fb-4d78-bf55-ac022ed3af20" packageID="DDVDP" releaseID="DDVDP" hashMD5="bd2a08db415991ab2b9605737d26a187" path="FOLDER05055451M/1/Dell-Command-Update_DDVDP_WIN_2.4.0_A00.EXE" dateTime="2018-06-27T18:26:44+00:00" releaseDate="June 27, 2018" vendorVersion="2.4.0" dellVersion="A00" packageType="LWXP" rebootRequired="false" size="99823472">
#     <Name>
#       <Display lang="en"><![CDATA[Dell Command | Update,2.4.0,A00]]></Display>
#     </Name>
#     <ComponentType value="APAC">
#       <Display lang="en"><![CDATA[Application]]></Display>
#     </ComponentType>
#     <Description>
#       <Display lang="en"><![CDATA[This Win 32 package provides the Dell Command | Update Application and is supported on OptiPlex, Venue Pro Tablet, Precision, XPS Notebook and Latitude models that are running the following Windows operating systems: Windows 7,Windows 8, Windows 8.1 and Windows 10.]]></Display>
#     </Description>
#     <Category value="SM">
#       <Display lang="en"><![CDATA[OpenManage Systems Management]]></Display>
#     </Category>
#     <SupportedDevices>
#       <Device componentID="23400" embedded="1">
#         <Display lang="en"><![CDATA[Dell Command | Update]]></Display>
#       </Device>
#     </SupportedDevices>

    $f = [System.Xml.XmlReader]::create($xmlFile)

    $compareVersion = [Version] "0.0.0.0"

    while ($f.read())
    {
        switch ($f.NodeType)
        {
            ([System.Xml.XmlNodeType]::Element)
            {
                if ($f.Name -eq "SoftwareComponent")
                {
                    $e = [System.Xml.Linq.XElement]::ReadFrom($f)

                    $componentID = $e.Element("SupportedDevices").Element("Device").Attribute("componentID").Value

                    if ($componentID -eq "23400") # This is the magic number for Dell Command Update
                    {
                        $newVersion = $e.Attribute("vendorVersion").Value
                        if ($compareVersion -lt ([version] $newVersion)) {
                            $version = $newVersion
                            # FOLDER04358530M/2/Systems-Management_Application_X79N4_WN32_2.3.1_A00_01.EXE
                            $url = "https://downloads.dell.com/" + $e.Attribute("path").Value 
                            $checksum = $e.Attribute("hashMD5").Value
                            $description = $e.Element("Description").Element("Display").Value 
                            $releaseNotes = $e.Element("ImportantInfo").Attribute("URL").Value

                            $compareVersion = [version] $newVersion
                        }
                    }
                }
            }
        }
    }
    $f.Dispose()
    
    $Latest = @{ 
        URL32 = $url
        Version = $version
        Checksum32 = $checksum
        Description = $description
        ReleaseNotes = $releaseNotes
    }
    return $Latest
}

update -ChecksumFor none