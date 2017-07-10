Add-type -Path ..\packages\HtmlAgilityPack\lib\Net45\HtmlAgilityPack.dll

$htmlWeb = New-Object HtmlAgilityPack.HtmlWeb
$htmlWeb.AutoDetectEncoding = $true
$doc = $htmlWeb.Load("https://documentation.red-gate.com/plugins/viewsource/viewpagesrc.action?pageId=2297030")

$td = $doc.DocumentNode.SelectSingleNode("//body/table[1]/tbody/tr[1]/td[3]")
$releaseNotesUrl = $td.FirstChild.Attributes["href"].Value
