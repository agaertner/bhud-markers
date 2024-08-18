@echo off
setlocal
set zipname=temp.zip
set finalname=Nekres.Markers.taco
set scriptname=%~nx0
powershell -command "$items = Get-ChildItem | Where-Object { $_.FullName -ne '%~dpnx0' -and $_.Name -ne '.gitignore' -and $_.Name -ne '%finalname%' -and $_.Name -ne '%zipname%'}; Compress-Archive -Path $items.FullName -DestinationPath '%zipname%' -Force"
if exist %finalname% del %finalname%
ren %zipname% %finalname%
echo SUCCESS! Marker Pack created: '%finalname%'
