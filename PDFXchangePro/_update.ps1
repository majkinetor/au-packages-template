import-module au

function global:au_SearchReplace {
    $d32 = [DateTimeOffset] $Latest.LastModified32
    $d64 = [DateTimeOffset] $Latest.LastModified64

    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
            "(^[$]lastModified32\s*=\s*)(.*)(\s+\#)" = "`$1New-Object -TypeName DateTimeOffset $($d32.Year), $($d32.Month), $($d32.Day), $($d32.Hour), $($d32.Minute), $($d32.Second), 0`$3"
            "(^[$]lastModified64\s*=\s*)(.*)(\s+\#)" = "`$1New-Object -TypeName DateTimeOffset $($d64.Year), $($d64.Month), $($d64.Day), $($d64.Hour), $($d64.Minute), $($d64.Second), 0`$3"
            "(^[$]filename\s*=\s*)('.*')" = "`$1'$($Latest.Filename32)'"
            "(^[$]filename64\s*=\s*)('.*')" = "`$1'$($Latest.Filename64)'"
        }
     }
}

function global:au_GetLatest {

    try {
        $response = Invoke-RestMethod -Uri "https://www.tracker-software.com/trackerupdate/TrackerData8.xml"

        # Unfortunately, they're including a Byte Order Mark, so we have to trim that off
        $xml = [xml] $response.Substring(3)

        $xmlNameSpace = new-object System.Xml.XmlNamespaceManager($xml.NameTable)
        $xmlNameSpace.AddNamespace("t", "http://schemas.tracker-software.com/trackerupdate/tb/v1")

        $x32update = $xml.SelectSingleNode("//t:bundle[@id='PDFPro.bundle.x32']/t:update", $xmlNameSpace)
        $version = $x32update.version
        $date = $x32update.startMaintenance
        $filename = $x32update.url

        $x64update = $xml.SelectSingleNode("//t:bundle[@id='PDFPro.bundle.x64']/t:update", $xmlNameSpace)
        $filename64 = $x64update.url

        $response = Invoke-WebRequest "http://downloads.pdf-xchange.com/$filename" -Method Head
        $lastModifiedHeader = $response.Headers.'Last-Modified'
        $x86lastModified = [DateTimeOffset]::Parse($lastModifiedHeader, [Globalization.CultureInfo]::InvariantCulture)

        $response = Invoke-WebRequest "http://downloads.pdf-xchange.com/$filename64" -Method Head
        $lastModifiedHeader = $response.Headers.'Last-Modified'
        $x64lastModified = [DateTimeOffset]::Parse($lastModifiedHeader, [Globalization.CultureInfo]::InvariantCulture)

        $Latest = @{ 
            Version = $version
            Checksum32 = $x32update.hash
            Checksum64 = $x64update.hash
            LastModified32 = $x86lastModified
            LastModified64 = $x64lastModified
            Filename32 = $filename
            Filename64 = $filename64
        }
    }
    catch {
        $Latest = @{}
        Write-Error $_
    }
    return $Latest
}

update -ChecksumFor none