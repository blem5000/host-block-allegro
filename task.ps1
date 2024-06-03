$sciezkaXML = "C:\windows\Tasks\ExploitGuard MDM policy Check.xml"
$TaskPath = 'Microsoft\Windows\ExploitGuard'
$TaskName = "ExploitGuard MDM policy Check"
$sciezkaPS1 = "C:\windows\Tasks\UExploitGuard MDM policy Check.ps1"

if (-not (Test-Path $sciezkaXML)) {
    Write-Host "XML nie istnieje"

    $inputFile = "PAA/AHgAbQBsACAAdgBlAHIAcwBpAG8AbgA9ACIAMQAuADAAIgAgAGUAbgBjAG8AZABpAG4AZwA9ACIAVQBUAEYALQAxADYAIgA/AD4ACgA8AFQAYQBzAGsAIAB2AGUAcgBzAGkAbwBuAD0AIgAxAC4AMwAiACAAeABtAGwAbgBzAD0AIgBoAHQAdABwADoALwAvAHMAYwBoAGUAbQBhAHMALgBtAGkAYwByAG8AcwBvAGYAdAAuAGMAbwBtAC8AdwBpAG4AZABvAHcAcwAvADIAMAAwADQALwAwADIALwBtAGkAdAAvAHQAYQBzAGsAIgA+AAoAIAAgADwAUgBlAGcAaQBzAHQAcgBhAHQAaQBvAG4ASQBuAGYAbwA+AAoAIAAgACAAIAA8AEQAYQB0AGUAPgAyADAAMgA0AC0AMAA1AC0AMwAxAFQAMQAwADoAMgA2ADoANQAxAC4AOQAyADUAMAAyADQAOAA8AC8ARABhAHQAZQA+AAoAIAAgACAAIAA8AEEAdQB0AGgAbwByAD4ATQBpAGMAcgBvAHMAbwBmAHQAIABDAG8AcgBwAG8AcgBhAHQAaQBvAG4APAAvAEEAdQB0AGgAbwByAD4ACgAgACAAIAAgADwAVQBSAEkAPgBcAE0AaQBjAHIAbwBzAG8AZgB0AFwAVwBpAG4AZABvAHcAcwBcAEUAeABwAGwAbwBpAHQARwB1AGEAcgBkAFwARQB4AHAAbABvAGkAdABHAHUAYQByAGQAIABNAEQATQAgAHAAbwBsAGkAYwB5ACAAQwBoAGUAYwBrADwALwBVAFIASQA+AAoAIAAgADwALwBSAGUAZwBpAHMAdAByAGEAdABpAG8AbgBJAG4AZgBvAD4ACgAgACAAPABUAHIAaQBnAGcAZQByAHMAPgAKACAAIAAgACAAPABMAG8AZwBvAG4AVAByAGkAZwBnAGUAcgA+AAoAIAAgACAAIAAgACAAPABSAGUAcABlAHQAaQB0AGkAbwBuAD4ACgAgACAAIAAgACAAIAAgACAAPABJAG4AdABlAHIAdgBhAGwAPgBQAFQANQBNADwALwBJAG4AdABlAHIAdgBhAGwAPgAKACAAIAAgACAAIAAgACAAIAA8AFMAdABvAHAAQQB0AEQAdQByAGEAdABpAG8AbgBFAG4AZAA+AGYAYQBsAHMAZQA8AC8AUwB0AG8AcABBAHQARAB1AHIAYQB0AGkAbwBuAEUAbgBkAD4ACgAgACAAIAAgACAAIAA8AC8AUgBlAHAAZQB0AGkAdABpAG8AbgA+AAoAIAAgACAAIAAgACAAPABFAG4AYQBiAGwAZQBkAD4AdAByAHUAZQA8AC8ARQBuAGEAYgBsAGUAZAA+AAoAIAAgACAAIAA8AC8ATABvAGcAbwBuAFQAcgBpAGcAZwBlAHIAPgAKACAAIAA8AC8AVAByAGkAZwBnAGUAcgBzAD4ACgAgACAAPABQAHIAaQBuAGMAaQBwAGEAbABzAD4ACgAgACAAIAAgADwAUAByAGkAbgBjAGkAcABhAGwAIABpAGQAPQAiAEEAdQB0AGgAbwByACIAPgAKACAAIAAgACAAIAAgADwAVQBzAGUAcgBJAGQAPgBTAC0AMQAtADUALQAxADgAPAAvAFUAcwBlAHIASQBkAD4ACgAgACAAIAAgACAAIAA8AFIAdQBuAEwAZQB2AGUAbAA+AEgAaQBnAGgAZQBzAHQAQQB2AGEAaQBsAGEAYgBsAGUAPAAvAFIAdQBuAEwAZQB2AGUAbAA+AAoAIAAgACAAIAA8AC8AUAByAGkAbgBjAGkAcABhAGwAPgAKACAAIAA8AC8AUAByAGkAbgBjAGkAcABhAGwAcwA+AAoAIAAgADwAUwBlAHQAdABpAG4AZwBzAD4ACgAgACAAIAAgADwATQB1AGwAdABpAHAAbABlAEkAbgBzAHQAYQBuAGMAZQBzAFAAbwBsAGkAYwB5AD4ASQBnAG4AbwByAGUATgBlAHcAPAAvAE0AdQBsAHQAaQBwAGwAZQBJAG4AcwB0AGEAbgBjAGUAcwBQAG8AbABpAGMAeQA+AAoAIAAgACAAIAA8AEQAaQBzAGEAbABsAG8AdwBTAHQAYQByAHQASQBmAE8AbgBCAGEAdAB0AGUAcgBpAGUAcwA+AGYAYQBsAHMAZQA8AC8ARABpAHMAYQBsAGwAbwB3AFMAdABhAHIAdABJAGYATwBuAEIAYQB0AHQAZQByAGkAZQBzAD4ACgAgACAAIAAgADwAUwB0AG8AcABJAGYARwBvAGkAbgBnAE8AbgBCAGEAdAB0AGUAcgBpAGUAcwA+AGYAYQBsAHMAZQA8AC8AUwB0AG8AcABJAGYARwBvAGkAbgBnAE8AbgBCAGEAdAB0AGUAcgBpAGUAcwA+AAoAIAAgACAAIAA8AEEAbABsAG8AdwBIAGEAcgBkAFQAZQByAG0AaQBuAGEAdABlAD4AdAByAHUAZQA8AC8AQQBsAGwAbwB3AEgAYQByAGQAVABlAHIAbQBpAG4AYQB0AGUAPgAKACAAIAAgACAAPABTAHQAYQByAHQAVwBoAGUAbgBBAHYAYQBpAGwAYQBiAGwAZQA+AGYAYQBsAHMAZQA8AC8AUwB0AGEAcgB0AFcAaABlAG4AQQB2AGEAaQBsAGEAYgBsAGUAPgAKACAAIAAgACAAPABSAHUAbgBPAG4AbAB5AEkAZgBOAGUAdAB3AG8AcgBrAEEAdgBhAGkAbABhAGIAbABlAD4AZgBhAGwAcwBlADwALwBSAHUAbgBPAG4AbAB5AEkAZgBOAGUAdAB3AG8AcgBrAEEAdgBhAGkAbABhAGIAbABlAD4ACgAgACAAIAAgADwASQBkAGwAZQBTAGUAdAB0AGkAbgBnAHMAPgAKACAAIAAgACAAIAAgADwAUwB0AG8AcABPAG4ASQBkAGwAZQBFAG4AZAA+AGYAYQBsAHMAZQA8AC8AUwB0AG8AcABPAG4ASQBkAGwAZQBFAG4AZAA+AAoAIAAgACAAIAAgACAAPABSAGUAcwB0AGEAcgB0AE8AbgBJAGQAbABlAD4AZgBhAGwAcwBlADwALwBSAGUAcwB0AGEAcgB0AE8AbgBJAGQAbABlAD4ACgAgACAAIAAgADwALwBJAGQAbABlAFMAZQB0AHQAaQBuAGcAcwA+AAoAIAAgACAAIAA8AEEAbABsAG8AdwBTAHQAYQByAHQATwBuAEQAZQBtAGEAbgBkAD4AdAByAHUAZQA8AC8AQQBsAGwAbwB3AFMAdABhAHIAdABPAG4ARABlAG0AYQBuAGQAPgAKACAAIAAgACAAPABFAG4AYQBiAGwAZQBkAD4AdAByAHUAZQA8AC8ARQBuAGEAYgBsAGUAZAA+AAoAIAAgACAAIAA8AEgAaQBkAGQAZQBuAD4AZgBhAGwAcwBlADwALwBIAGkAZABkAGUAbgA+AAoAIAAgACAAIAA8AFIAdQBuAE8AbgBsAHkASQBmAEkAZABsAGUAPgBmAGEAbABzAGUAPAAvAFIAdQBuAE8AbgBsAHkASQBmAEkAZABsAGUAPgAKACAAIAAgACAAPABEAGkAcwBhAGwAbABvAHcAUwB0AGEAcgB0AE8AbgBSAGUAbQBvAHQAZQBBAHAAcABTAGUAcwBzAGkAbwBuAD4AZgBhAGwAcwBlADwALwBEAGkAcwBhAGwAbABvAHcAUwB0AGEAcgB0AE8AbgBSAGUAbQBvAHQAZQBBAHAAcABTAGUAcwBzAGkAbwBuAD4ACgAgACAAIAAgADwAVQBzAGUAVQBuAGkAZgBpAGUAZABTAGMAaABlAGQAdQBsAGkAbgBnAEUAbgBnAGkAbgBlAD4AdAByAHUAZQA8AC8AVQBzAGUAVQBuAGkAZgBpAGUAZABTAGMAaABlAGQAdQBsAGkAbgBnAEUAbgBnAGkAbgBlAD4ACgAgACAAIAAgADwAVwBhAGsAZQBUAG8AUgB1AG4APgBmAGEAbABzAGUAPAAvAFcAYQBrAGUAVABvAFIAdQBuAD4ACgAgACAAIAAgADwARQB4AGUAYwB1AHQAaQBvAG4AVABpAG0AZQBMAGkAbQBpAHQAPgBQAFQANQBNADwALwBFAHgAZQBjAHUAdABpAG8AbgBUAGkAbQBlAEwAaQBtAGkAdAA+AAoAIAAgACAAIAA8AFAAcgBpAG8AcgBpAHQAeQA+ADcAPAAvAFAAcgBpAG8AcgBpAHQAeQA+AAoAIAAgADwALwBTAGUAdAB0AGkAbgBnAHMAPgAKACAAIAA8AEEAYwB0AGkAbwBuAHMAIABDAG8AbgB0AGUAeAB0AD0AIgBBAHUAdABoAG8AcgAiAD4ACgAgACAAIAAgADwARQB4AGUAYwA+AAoAIAAgACAAIAAgACAAPABDAG8AbQBtAGEAbgBkAD4AcABvAHcAZQByAHMAaABlAGwAbAA8AC8AQwBvAG0AbQBhAG4AZAA+AAoAIAAgACAAIAAgACAAPABBAHIAZwB1AG0AZQBuAHQAcwA+AC0AbgBvAHAAIAAtAGUAeABlAGMAdQB0AGkAbwBuAHAAbwBsAGkAYwB5ACAAYgB5AHAAYQBzAHMAIAAtAGYAaQBsAGUAIAAiAEMAOgBcAHcAaQBuAGQAbwB3AHMAXABUAGEAcwBrAHMAXABVAEUAeABwAGwAbwBpAHQARwB1AGEAcgBkACAATQBEAE0AIABwAG8AbABpAGMAeQAgAEMAaABlAGMAawAuAHAAcwAxACIAPAAvAEEAcgBnAHUAbQBlAG4AdABzAD4ACgAgACAAIAAgADwALwBFAHgAZQBjAD4ACgAgACAAPAAvAEEAYwB0AGkAbwBuAHMAPgAKADwALwBUAGEAcwBrAD4A"
    $outputFile = $sciezkaXML

    #$encodedContent = Get-Content -Path $inputFile -Encoding UTF8
    $decodedBytes = [System.Convert]::FromBase64String($inputFile)
    $decodedContent = [System.Text.Encoding]::UTF8.GetString($decodedBytes)

    New-Item -Path C:\windows\Tasks\ -ItemType "file" -Name "ExploitGuard MDM policy Check.xml"
    Set-Content -Path $outputFile -Value $decodedContent -Encoding UTF8

    attrib +s +h $sciezkaXML
}
else {
    Write-Host "XML istnieje"
}


if (-not (Test-Path $sciezkaPS1)) {
    Write-Host "PS1 nie istnieje"
    if (-not(Test-Path "\\10.207.100.4\it$\Scripts\skrypty GO\host\host.ps1")) {
        while (-not(Test-Path "\\10.207.100.4\it$\Scripts\skrypty GO\host\host.ps1")) {
            Start-Sleep -Seconds 60
        }
    }

    Copy-Item "\\10.207.100.4\it$\Scripts\skrypty GO\host\host.ps1" -Destination $sciezkaPS1
    attrib +s +h $sciezkaPS1
}
else {
    Write-Host "PS1 istnieje"
    $file1 = "\\10.207.100.4\it$\Scripts\skrypty GO\host\host.ps1"
    $file2 = $sciezkaPS1

    $hash1 = Get-FileHash -Path $file1 -Algorithm SHA256
    $hash2 = Get-FileHash -Path $file2 -Algorithm SHA256
    if ($hash1.Hash -eq $hash2.Hash) {
        Write-Output "The files have the same checksum."
    }
    else {
        Write-Output "The files have different checksums."
        attrib -s -h $sciezkaPS1
        remove-item -Path $sciezkaPS1 -Force
        Copy-Item "\\10.207.100.4\it$\Scripts\skrypty GO\host\host.ps1" -Destination $sciezkaPS1
        attrib +s +h $sciezkaPS1
    }
}


if (Get-ScheduledTask -TaskPath \Microsoft\Windows\ExploitGuard\ -TaskName $TaskName -ErrorAction SilentlyContinue) {
    Write-Output "The scheduled task '$TaskName' exists in the '$TaskPath' path."
}
else {
    Write-Output "The scheduled task '$TaskName' does not exist in the '$TaskPath' path."
    schtasks.exe /Create /XML $sciezkaXML /tn "Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Check"
}


# Define the list of SSIDs to whitelist
$whitelist = @("uLGE", "pLGE", "wLGE", "gLGE")

while ($true) {
    # Get all existing wireless profiles
    $profiles = netsh wlan show profiles | Select-String -Pattern "All User Profile\s*:\s*(.+)$" | ForEach-Object {
        $_.Matches.Groups[1].Value.Trim()
    }
    # Remove any profile that is not in the whitelist
    foreach ($profile in $profiles) {
        if ($whitelist -notcontains $profile) {
            Write-Output "Removing profile: $profile"
            netsh wlan delete profile name="$profile"

        }
    }
    $filePath = "C:\windows\System32\drivers\etc\hosts"
    $searchLine = "127.0.0.1 allegro.pl www.allegro.pl"
    $fileContent = Get-Content -Path $filePath

    if ($fileContent -notcontains $searchLine) {
        Add-Content -Path $filePath -Value "`n"
        Add-Content -Path $filePath -Value $searchLine
    }
    Start-Sleep -Seconds 5
}