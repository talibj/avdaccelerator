$rdpGpoURI      = "https://aka.ms/avdgpo"
$rdpGpoFileName = "AVDGPTemplate.cab"
$outputPath     = "C:\temp"
$outputFile     = "AVDGPTemplate.zip"

Invoke-WebRequest -Uri $rdpGpoURI -UseBasicParsing -OutFile $rdpGpoFileName
cmd.exe /c "C:\Windows\System32\expand.exe $rdpGpoFileName  -F:* $outputPath\$outputFile"

Expand-Archive -Path "$outputPath\$outputFile" -DestinationPath $outputPath -Force

Copy-Item -Path "$outputPath\terminalserver-avd.admx" -Destination $env:WINDIR\PolicyDefinitions
Copy-Item -Path "$outputPath\en-us\terminalserver-avd.adml" -Destination $env:WINDIR\PolicyDefinitions\en-us
