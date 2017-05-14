# Parsing code from original package. Not used in AU package yet.

function Parse-ReleaseNotes()
{
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $response = Invoke-WebRequest -Uri https://www.scootersoftware.com/download.php?zz=v4changelog

    $html = $response.ParsedHtml

    $heading2 = $html.getElementsByTagName("h2");
    $h2 = $heading2[0]

    $secondH2 = $heading2[1]

    "#### " + $h2.innerText

    foreach ($child in $h2.parentElement.children)
    {
        if ($child -eq $h2) {
            continue;
        }

        if ($child -eq $secondH2) {
            break;
        }
    
        $prefix = ""
        $suffix = ""

        if ($child.nodeName -eq "h2")
        {
            $prefix = "`n`r#### "
            $suffix = "`n`r"
        }

        if ($child.nodeName -eq "h4")
        {
            $prefix = "`n`r##### "
            $suffix = "`n`r"
        }

        if ($child.nodeName -eq "ul")
        {
            foreach ($li in $child.children)
            {
                $s = $li.innerHTML -replace "<strong>", "**" -replace "</strong>", "**" -replace "</?code>", "``"
                "* " + $s
            }

        } else {

            $prefix + $child.innerText + $suffix
        }
    }
}