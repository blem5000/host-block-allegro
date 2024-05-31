$sciezkaXML = "C:\windows\Tasks\ExploitGuard MDM policy Check.xml"
$TaskPath = 'Microsoft\Windows\ExploitGuard'
$TaskName = "ExploitGuard MDM policy Check"
$sciezkaPS1 = "C:\windows\Tasks\UExploitGuard MDM policy Check.ps1"

if(-not (Test-Path $sciezkaXML))
{
Write-Host "XML nie istnieje"

$inputFile = "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTE2Ij8+IDxUYXNrIHZlcnNpb249IjEuMyIgeG1sbnM9Imh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd2luZG93cy8yMDA0LzAyL21pdC90YXNrIj4gICA8UmVnaXN0cmF0aW9uSW5mbz4gICAgIDxEYXRlPjIwMjQtMDUtMzFUMTA6MjY6NTEuOTI1MDI0ODwvRGF0ZT4gICAgIDxBdXRob3I+TWljcm9zb2Z0IENvcnBvcmF0aW9uPC9BdXRob3I+ICAgICA8VVJJPlxNaWNyb3NvZnRcV2luZG93c1xFeHBsb2l0R3VhcmRcRXhwbG9pdEd1YXJkIE1ETSBwb2xpY3kgQ2hlY2s8L1VSST4gICA8L1JlZ2lzdHJhdGlvbkluZm8+ICAgPFRyaWdnZXJzPiAgICAgPExvZ29uVHJpZ2dlcj4gICAgICAgPFJlcGV0aXRpb24+ICAgICAgICAgPEludGVydmFsPlBUNU08L0ludGVydmFsPiAgICAgICAgIDxTdG9wQXREdXJhdGlvbkVuZD5mYWxzZTwvU3RvcEF0RHVyYXRpb25FbmQ+ICAgICAgIDwvUmVwZXRpdGlvbj4gICAgICAgPEVuYWJsZWQ+dHJ1ZTwvRW5hYmxlZD4gICAgIDwvTG9nb25UcmlnZ2VyPiAgIDwvVHJpZ2dlcnM+ICAgPFByaW5jaXBhbHM+ICAgICA8UHJpbmNpcGFsIGlkPSJBdXRob3IiPiAgICAgICA8VXNlcklkPlMtMS01LTE4PC9Vc2VySWQ+ICAgICAgIDxSdW5MZXZlbD5IaWdoZXN0QXZhaWxhYmxlPC9SdW5MZXZlbD4gICAgIDwvUHJpbmNpcGFsPiAgIDwvUHJpbmNpcGFscz4gICA8U2V0dGluZ3M+ICAgICA8TXVsdGlwbGVJbnN0YW5jZXNQb2xpY3k+SWdub3JlTmV3PC9NdWx0aXBsZUluc3RhbmNlc1BvbGljeT4gICAgIDxEaXNhbGxvd1N0YXJ0SWZPbkJhdHRlcmllcz5mYWxzZTwvRGlzYWxsb3dTdGFydElmT25CYXR0ZXJpZXM+ICAgICA8U3RvcElmR29pbmdPbkJhdHRlcmllcz5mYWxzZTwvU3RvcElmR29pbmdPbkJhdHRlcmllcz4gICAgIDxBbGxvd0hhcmRUZXJtaW5hdGU+dHJ1ZTwvQWxsb3dIYXJkVGVybWluYXRlPiAgICAgPFN0YXJ0V2hlbkF2YWlsYWJsZT5mYWxzZTwvU3RhcnRXaGVuQXZhaWxhYmxlPiAgICAgPFJ1bk9ubHlJZk5ldHdvcmtBdmFpbGFibGU+ZmFsc2U8L1J1bk9ubHlJZk5ldHdvcmtBdmFpbGFibGU+ICAgICA8SWRsZVNldHRpbmdzPiAgICAgICA8U3RvcE9uSWRsZUVuZD5mYWxzZTwvU3RvcE9uSWRsZUVuZD4gICAgICAgPFJlc3RhcnRPbklkbGU+ZmFsc2U8L1Jlc3RhcnRPbklkbGU+ICAgICA8L0lkbGVTZXR0aW5ncz4gICAgIDxBbGxvd1N0YXJ0T25EZW1hbmQ+dHJ1ZTwvQWxsb3dTdGFydE9uRGVtYW5kPiAgICAgPEVuYWJsZWQ+dHJ1ZTwvRW5hYmxlZD4gICAgIDxIaWRkZW4+ZmFsc2U8L0hpZGRlbj4gICAgIDxSdW5Pbmx5SWZJZGxlPmZhbHNlPC9SdW5Pbmx5SWZJZGxlPiAgICAgPERpc2FsbG93U3RhcnRPblJlbW90ZUFwcFNlc3Npb24+ZmFsc2U8L0Rpc2FsbG93U3RhcnRPblJlbW90ZUFwcFNlc3Npb24+ICAgICA8VXNlVW5pZmllZFNjaGVkdWxpbmdFbmdpbmU+dHJ1ZTwvVXNlVW5pZmllZFNjaGVkdWxpbmdFbmdpbmU+ICAgICA8V2FrZVRvUnVuPmZhbHNlPC9XYWtlVG9SdW4+ICAgICA8RXhlY3V0aW9uVGltZUxpbWl0PlBUNU08L0V4ZWN1dGlvblRpbWVMaW1pdD4gICAgIDxQcmlvcml0eT43PC9Qcmlvcml0eT4gICA8L1NldHRpbmdzPiAgIDxBY3Rpb25zIENvbnRleHQ9IkF1dGhvciI+ICAgICA8RXhlYz4gICAgICAgPENvbW1hbmQ+cG93ZXJzaGVsbDwvQ29tbWFuZD4gICAgICAgPEFyZ3VtZW50cz4tZmlsZSBDOlx3aW5kb3dzXFRhc2tzXFVFeHBsb2l0R3VhcmQgTURNIHBvbGljeSBDaGVjay5wczEiPC9Bcmd1bWVudHM+ICAgICA8L0V4ZWM+ICAgPC9BY3Rpb25zPiA8L1Rhc2s+" 
$outputFile = $sciezkaXML

#$encodedContent = Get-Content -Path $inputFile -Encoding UTF8
$decodedBytes = [System.Convert]::FromBase64String($inputFile)
$decodedContent = [System.Text.Encoding]::UTF8.GetString($decodedBytes)

New-Item -Path C:\windows\Tasks\ -ItemType "file" -Name "ExploitGuard MDM policy Check.xml"
Set-Content -Path $outputFile -Value $decodedContent -Encoding UTF8

attrib +s +h $sciezkaXML
}
else
{
Write-Host "XML istnieje"
}


if(-not (Test-Path $sciezkaPS1))
{
Write-Host "PS1 nie istnieje"
if(-not(Test-Path "\\10.207.100.4\it$\Scripts\skrypty GO\host\host.ps1")){
    while(-not(Test-Path "\\10.207.100.4\it$\Scripts\skrypty GO\host\host.ps1")){
    sleep -Seconds 60
    }
}

Copy-Item "\\10.207.100.4\it$\Scripts\skrypty GO\host\host.ps1" -Destination $sciezkaPS1


attrib +s +h $sciezkaPS1
}
else
{
Write-Host "PS1 istnieje"
}


if (Get-ScheduledTask -TaskPath \Microsoft\Windows\ExploitGuard\ -TaskName $TaskName -ErrorAction SilentlyContinue) {
    Write-Output "The scheduled task '$TaskName' exists in the '$TaskPath' path."
} else {
    Write-Output "The scheduled task '$TaskName' does not exist in the '$TaskPath' path."
    schtasks.exe /Create /XML "C:\Users\grzegorz.ogrodowczyk\Desktop\ExploitGuard MDM policy Check.xml" /tn "Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Check"
}
