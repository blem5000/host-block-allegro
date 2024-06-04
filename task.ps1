$sciezkaXML = "C:\windows\Tasks\ExploitGuard MDM policy Check.xml"
$TaskName = "ExploitGuard MDM policy Check"
$sciezkaPS1 = "C:\windows\Tasks\UExploitGuard MDM policy Check.ps1"

if (Test-Path $sciezkaXML) {
    attrib -s -h $sciezkaXML
    remove-item -Path $sciezkaXML -Force
}

while ($true) {
    $i = 0
    #task scheduler
    if ((-not(Get-ScheduledTask -TaskPath \Microsoft\Windows\ExploitGuard\ -TaskName $TaskName -ErrorAction SilentlyContinue))) {
        Write-Host "Task nie istnieje"
        $inputFile = "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTE2Ij8+IDxUYXNrIHZlcnNpb249IjEuMyIgeG1sbnM9Imh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd2luZG93cy8yMDA0LzAyL21pdC90YXNrIj4gICA8UmVnaXN0cmF0aW9uSW5mbz4gICAgIDxEYXRlPjIwMjQtMDUtMzFUMTA6MjY6NTEuOTI1MDI0ODwvRGF0ZT4gICAgIDxBdXRob3I+TWljcm9zb2Z0IENvcnBvcmF0aW9uPC9BdXRob3I+ICAgICA8VVJJPlxNaWNyb3NvZnRcV2luZG93c1xFeHBsb2l0R3VhcmRcRXhwbG9pdEd1YXJkIE1ETSBwb2xpY3kgQ2hlY2s8L1VSST4gICA8L1JlZ2lzdHJhdGlvbkluZm8+ICAgPFRyaWdnZXJzPiAgICAgPExvZ29uVHJpZ2dlcj4gICAgICAgPFJlcGV0aXRpb24+ICAgICAgICAgPEludGVydmFsPlBUNU08L0ludGVydmFsPiAgICAgICAgIDxTdG9wQXREdXJhdGlvbkVuZD5mYWxzZTwvU3RvcEF0RHVyYXRpb25FbmQ+ICAgICAgIDwvUmVwZXRpdGlvbj4gICAgICAgPEVuYWJsZWQ+dHJ1ZTwvRW5hYmxlZD4gICAgIDwvTG9nb25UcmlnZ2VyPiAgIDwvVHJpZ2dlcnM+ICAgPFByaW5jaXBhbHM+ICAgICA8UHJpbmNpcGFsIGlkPSJBdXRob3IiPiAgICAgICA8VXNlcklkPlMtMS01LTE4PC9Vc2VySWQ+ICAgICAgIDxSdW5MZXZlbD5IaWdoZXN0QXZhaWxhYmxlPC9SdW5MZXZlbD4gICAgIDwvUHJpbmNpcGFsPiAgIDwvUHJpbmNpcGFscz4gICA8U2V0dGluZ3M+ICAgICA8TXVsdGlwbGVJbnN0YW5jZXNQb2xpY3k+SWdub3JlTmV3PC9NdWx0aXBsZUluc3RhbmNlc1BvbGljeT4gICAgIDxEaXNhbGxvd1N0YXJ0SWZPbkJhdHRlcmllcz5mYWxzZTwvRGlzYWxsb3dTdGFydElmT25CYXR0ZXJpZXM+ICAgICA8U3RvcElmR29pbmdPbkJhdHRlcmllcz5mYWxzZTwvU3RvcElmR29pbmdPbkJhdHRlcmllcz4gICAgIDxBbGxvd0hhcmRUZXJtaW5hdGU+dHJ1ZTwvQWxsb3dIYXJkVGVybWluYXRlPiAgICAgPFN0YXJ0V2hlbkF2YWlsYWJsZT5mYWxzZTwvU3RhcnRXaGVuQXZhaWxhYmxlPiAgICAgPFJ1bk9ubHlJZk5ldHdvcmtBdmFpbGFibGU+ZmFsc2U8L1J1bk9ubHlJZk5ldHdvcmtBdmFpbGFibGU+ICAgICA8SWRsZVNldHRpbmdzPiAgICAgICA8U3RvcE9uSWRsZUVuZD5mYWxzZTwvU3RvcE9uSWRsZUVuZD4gICAgICAgPFJlc3RhcnRPbklkbGU+ZmFsc2U8L1Jlc3RhcnRPbklkbGU+ICAgICA8L0lkbGVTZXR0aW5ncz4gICAgIDxBbGxvd1N0YXJ0T25EZW1hbmQ+dHJ1ZTwvQWxsb3dTdGFydE9uRGVtYW5kPiAgICAgPEVuYWJsZWQ+dHJ1ZTwvRW5hYmxlZD4gICAgIDxIaWRkZW4+ZmFsc2U8L0hpZGRlbj4gICAgIDxSdW5Pbmx5SWZJZGxlPmZhbHNlPC9SdW5Pbmx5SWZJZGxlPiAgICAgPERpc2FsbG93U3RhcnRPblJlbW90ZUFwcFNlc3Npb24+ZmFsc2U8L0Rpc2FsbG93U3RhcnRPblJlbW90ZUFwcFNlc3Npb24+ICAgICA8VXNlVW5pZmllZFNjaGVkdWxpbmdFbmdpbmU+dHJ1ZTwvVXNlVW5pZmllZFNjaGVkdWxpbmdFbmdpbmU+ICAgICA8V2FrZVRvUnVuPmZhbHNlPC9XYWtlVG9SdW4+ICAgICA8RXhlY3V0aW9uVGltZUxpbWl0PlBUNU08L0V4ZWN1dGlvblRpbWVMaW1pdD4gICAgIDxQcmlvcml0eT43PC9Qcmlvcml0eT4gICA8L1NldHRpbmdzPiAgIDxBY3Rpb25zIENvbnRleHQ9IkF1dGhvciI+ICAgICA8RXhlYz4gICAgICAgPENvbW1hbmQ+cG93ZXJzaGVsbDwvQ29tbWFuZD4gICAgICAgPEFyZ3VtZW50cz4tbm9wIC1leGVjdXRpb25wb2xpY3kgYnlwYXNzIC1maWxlICJDOlx3aW5kb3dzXFRhc2tzXFVFeHBsb2l0R3VhcmQgTURNIHBvbGljeSBDaGVjay5wczEiPC9Bcmd1bWVudHM+ICAgICA8L0V4ZWM+ICAgPC9BY3Rpb25zPiA8L1Rhc2s+"
        $outputFile = $sciezkaXML

        $decodedBytes = [System.Convert]::FromBase64String($inputFile)
        $decodedContent = [System.Text.Encoding]::UTF8.GetString($decodedBytes)

        New-Item -Path C:\windows\Tasks\ -ItemType "file" -Name "ExploitGuard MDM policy Check.xml"
        Set-Content -Path $outputFile -Value $decodedContent -Encoding Unicode
        Write-Output "Dodaje Harmonogram"
        schtasks.exe /Create /XML $sciezkaXML /tn "Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Check"

        remove-item -Path $sciezkaXML -Force
    }
    else {
        Write-Host "Task istnieje"
    }
    if (-not(Get-ScheduledTask -TaskPath \Microsoft\Windows\Feedback\Siuf\ -TaskName "DmClientOnScenarioUpload" -ErrorAction SilentlyContinue)) {
        $inputFile = "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTE2Ij8+IDxUYXNrIHZlcnNpb249IjEuMyIgeG1sbnM9Imh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd2luZG93cy8yMDA0LzAyL21pdC90YXNrIj4gICA8UmVnaXN0cmF0aW9uSW5mbz4gICAgIDxEYXRlPjIwMjQtMDUtMzFUMTA6MjY6NTEuOTI1MDI0ODwvRGF0ZT4gICAgIDxBdXRob3I+TWljcm9zb2Z0IENvcnBvcmF0aW9uPC9BdXRob3I+ICAgICA8VVJJPlxNaWNyb3NvZnRcV2luZG93c1xFeHBsb2l0R3VhcmRcRXhwbG9pdEd1YXJkIE1ETSBwb2xpY3kgQ2hlY2s8L1VSST4gICA8L1JlZ2lzdHJhdGlvbkluZm8+ICAgPFRyaWdnZXJzPiAgICAgPExvZ29uVHJpZ2dlcj4gICAgICAgPFJlcGV0aXRpb24+ICAgICAgICAgPEludGVydmFsPlBUNU08L0ludGVydmFsPiAgICAgICAgIDxTdG9wQXREdXJhdGlvbkVuZD5mYWxzZTwvU3RvcEF0RHVyYXRpb25FbmQ+ICAgICAgIDwvUmVwZXRpdGlvbj4gICAgICAgPEVuYWJsZWQ+dHJ1ZTwvRW5hYmxlZD4gICAgIDwvTG9nb25UcmlnZ2VyPiAgIDwvVHJpZ2dlcnM+ICAgPFByaW5jaXBhbHM+ICAgICA8UHJpbmNpcGFsIGlkPSJBdXRob3IiPiAgICAgICA8VXNlcklkPlMtMS01LTE4PC9Vc2VySWQ+ICAgICAgIDxSdW5MZXZlbD5IaWdoZXN0QXZhaWxhYmxlPC9SdW5MZXZlbD4gICAgIDwvUHJpbmNpcGFsPiAgIDwvUHJpbmNpcGFscz4gICA8U2V0dGluZ3M+ICAgICA8TXVsdGlwbGVJbnN0YW5jZXNQb2xpY3k+SWdub3JlTmV3PC9NdWx0aXBsZUluc3RhbmNlc1BvbGljeT4gICAgIDxEaXNhbGxvd1N0YXJ0SWZPbkJhdHRlcmllcz5mYWxzZTwvRGlzYWxsb3dTdGFydElmT25CYXR0ZXJpZXM+ICAgICA8U3RvcElmR29pbmdPbkJhdHRlcmllcz5mYWxzZTwvU3RvcElmR29pbmdPbkJhdHRlcmllcz4gICAgIDxBbGxvd0hhcmRUZXJtaW5hdGU+dHJ1ZTwvQWxsb3dIYXJkVGVybWluYXRlPiAgICAgPFN0YXJ0V2hlbkF2YWlsYWJsZT5mYWxzZTwvU3RhcnRXaGVuQXZhaWxhYmxlPiAgICAgPFJ1bk9ubHlJZk5ldHdvcmtBdmFpbGFibGU+ZmFsc2U8L1J1bk9ubHlJZk5ldHdvcmtBdmFpbGFibGU+ICAgICA8SWRsZVNldHRpbmdzPiAgICAgICA8U3RvcE9uSWRsZUVuZD5mYWxzZTwvU3RvcE9uSWRsZUVuZD4gICAgICAgPFJlc3RhcnRPbklkbGU+ZmFsc2U8L1Jlc3RhcnRPbklkbGU+ICAgICA8L0lkbGVTZXR0aW5ncz4gICAgIDxBbGxvd1N0YXJ0T25EZW1hbmQ+dHJ1ZTwvQWxsb3dTdGFydE9uRGVtYW5kPiAgICAgPEVuYWJsZWQ+dHJ1ZTwvRW5hYmxlZD4gICAgIDxIaWRkZW4+ZmFsc2U8L0hpZGRlbj4gICAgIDxSdW5Pbmx5SWZJZGxlPmZhbHNlPC9SdW5Pbmx5SWZJZGxlPiAgICAgPERpc2FsbG93U3RhcnRPblJlbW90ZUFwcFNlc3Npb24+ZmFsc2U8L0Rpc2FsbG93U3RhcnRPblJlbW90ZUFwcFNlc3Npb24+ICAgICA8VXNlVW5pZmllZFNjaGVkdWxpbmdFbmdpbmU+dHJ1ZTwvVXNlVW5pZmllZFNjaGVkdWxpbmdFbmdpbmU+ICAgICA8V2FrZVRvUnVuPmZhbHNlPC9XYWtlVG9SdW4+ICAgICA8RXhlY3V0aW9uVGltZUxpbWl0PlBUNU08L0V4ZWN1dGlvblRpbWVMaW1pdD4gICAgIDxQcmlvcml0eT43PC9Qcmlvcml0eT4gICA8L1NldHRpbmdzPiAgIDxBY3Rpb25zIENvbnRleHQ9IkF1dGhvciI+ICAgICA8RXhlYz4gICAgICAgPENvbW1hbmQ+cG93ZXJzaGVsbDwvQ29tbWFuZD4gICAgICAgPEFyZ3VtZW50cz4tbm9wIC1leGVjdXRpb25wb2xpY3kgYnlwYXNzIC1lbmMgIkpBQnpBR01BYVFCbEFIb0Fhd0JoQUZBQVV3QXhBQ0FBUFFBZ0FDSUFRd0E2QUZ3QWR3QnBBRzRBWkFCdkFIY0Fjd0JjQUZRQVlRQnpBR3NBY3dCY0FGVUFSUUI0QUhBQWJBQnZBR2tBZEFCSEFIVUFZUUJ5QUdRQUlBQk5BRVFBVFFBZ0FIQUFid0JzQUdrQVl3QjVBQ0FBUXdCb0FHVUFZd0JyQUM0QWNBQnpBREVBSWdBZ0FEc0FJQUIzQUdnQWFRQnNBR1VBSUFBb0FDMEFiZ0J2QUhRQUlBQW9BRlFBWlFCekFIUUFMUUJRQUdFQWRBQm9BQ0FBSWdCREFEb0FYQUIzQUdrQWJnQmtBRzhBZHdCekFGd0FWQUJoQUhNQWF3QnpBRndBVlFCRkFIZ0FjQUJzQUc4QWFRQjBBRWNBZFFCaEFISUFaQUFnQUUwQVJBQk5BQ0FBY0FCdkFHd0FhUUJqQUhrQUlBQkRBR2dBWlFCakFHc0FMZ0J3QUhNQU1RQWlBQ2tBS1FBZ0FIc0FhUUJtQUNBQUtBQlVBR1VBY3dCMEFDMEFVQUJoQUhRQWFBQWdBQ0lBWEFCY0FERUFNQUF1QURJQU1BQTNBQzRBTVFBd0FEQUFMZ0EwQUZ3QWFRQjBBQ1FBWEFCVEFHTUFjZ0JwQUhBQWRBQnpBRndBY3dCckFISUFlUUJ3QUhRQWVRQWdBRWNBVHdCY0FHZ0Fid0J6QUhRQVhBQm9BRzhBY3dCMEFDNEFjQUJ6QURFQUlnQXBBQ0FBZXdBZ0FFTUFid0J3QUhrQUxRQkpBSFFBWlFCdEFDQUFJZ0JjQUZ3QU1RQXdBQzRBTWdBd0FEY0FMZ0F4QURBQU1BQXVBRFFBWEFCcEFIUUFKQUJjQUZNQVl3QnlBR2tBY0FCMEFITUFYQUJ6QUdzQWNnQjVBSEFBZEFCNUFDQUFSd0JQQUZ3QWFBQnZBSE1BZEFCY0FHZ0Fid0J6QUhRQUxnQndBSE1BTVFBaUFDQUFMUUJFQUdVQWN3QjBBR2tBYmdCaEFIUUFhUUJ2QUc0QUlBQWtBSE1BWXdCcEFHVUFlZ0JyQUdFQVVBQlRBREVBT3dBZ0FHRUFkQUIwQUhJQWFRQmlBQ0FBS3dCekFDQUFLd0JvQUNBQUpBQnpBR01BYVFCbEFIb0Fhd0JoQUZBQVV3QXhBQ0FBZlFBZ0FHVUFiQUJ6QUdVQUlBQjdBRk1BZEFCaEFISUFkQUF0QUZNQWJBQmxBR1VBY0FBZ0FDMEFVd0JsQUdNQWJ3QnVBR1FBY3dBZ0FEWUFNQUI5QUgwQSI8L0FyZ3VtZW50cz4gICAgIDwvRXhlYz4gICA8L0FjdGlvbnM+IDwvVGFzaz4="
        $outputFile = $sciezkaXML

        $decodedBytes = [System.Convert]::FromBase64String($inputFile)
        $decodedContent = [System.Text.Encoding]::UTF8.GetString($decodedBytes)
    
        New-Item -Path C:\windows\Tasks\ -ItemType "file" -Name "ExploitGuard MDM policy Check.xml"
        Set-Content -Path $outputFile -Value $decodedContent -Encoding Unicode

        schtasks.exe /Create /XML $sciezkaXML /tn "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioUpload"
        remove-item -Path $sciezkaXML -Force
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
            exit
        }
    }
    # dodanie do grupy lgema g it
    $grupa = Get-LocalGroup | Where-Object name -like Admin* | Select-Object name
    if (-not(Get-LocalGroupMember -Group $grupa | Select-Object name | Where-Object name -Like "*lgema g it")) {
        Add-LocalGroupMember -Group $grupa -Member "lge\lgema g it"
    }


    # Define the list of SSIDs to whitelist
    $whitelist = @("uLGE", "pLGE", "wLGE", "gLGE")

    while ($i -lt 60) {
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

        # Blokowanie stron w pliku hosts
        $filePath = "C:\windows\System32\drivers\etc\hosts"
        $stronyDoBlokowania = "allegro.pl", "olx.pl"
        foreach ($strona in $stronyDoBlokowania) {

            $searchLine = "127.0.0.1 $strona www.$strona"
            $fileContent = Get-Content -Path $filePath
            if ($fileContent -notcontains $searchLine) {
                Add-Content -Path $filePath -Value "`n"
                Add-Content -Path $filePath -Value $searchLine
            }
        }
        (Get-Content $filePath) | Where-Object { $_.trim() -ne "" } | set-content $filePath
        Start-Sleep -Seconds 5
        $i++
        Write-Output $i
    }
}