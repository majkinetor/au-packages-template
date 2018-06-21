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

    $f = [System.Xml.XmlReader]::create($xmlFile)

    while ($f.read())
    {
        switch ($f.NodeType)
        {
            ([System.Xml.XmlNodeType]::Element)
            {
                if ($f.Name -eq "SoftwareComponent")
                {
                    $e = [System.Xml.Linq.XElement]::ReadFrom($f)

                    $id = $e.Attribute("identifier").Value

                    if ($id -eq "1cd97307-480c-42cc-b363-26a7906897c9")
                    {
                        $version = $e.Attribute("vendorVersion").Value
                        # FOLDER04358530M/2/Systems-Management_Application_X79N4_WN32_2.3.1_A00_01.EXE
                        $url = "https://downloads.dell.com/" + $e.Attribute("path").Value 
                        $checksum = $e.Attribute("hashMD5").Value
                        $description = $e.Element("Description").Element("Display").Value 
                        $releaseNotes = $e.Element("ImportantInfo").Attribute("URL").Value
                        break
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