."$PSScriptRoot/Xml2Html.ps1"
$xmlFile = "$PSScriptRoot/sample.xml";
$xsltFile = "$PSScriptRoot/sample.xslt";
$htmlFile = "$PSScriptRoot/sample.html";
Write-Host "Loading '$xmlFile' file..."
$xml = [System.IO.File]::ReadAllText($xmlFile);
Write-Host "Loading '$xsltFile' file..."
$xslt = [System.IO.File]::ReadAllText($xsltFile);
Write-Host "Transforming '$xmlFile' to html..." -ForegroundColor White
$html = [Xml2Html]::Transform($xml, $xslt);
Write-Host "Saving html..."
[System.IO.File]::WriteAllText($htmlFile, $html);
Write-Host "Html saved to '$htmlFile'" -ForegroundColor Green