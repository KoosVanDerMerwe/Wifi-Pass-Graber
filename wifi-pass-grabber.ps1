# Fetch Wi-Fi profiles
$profiles = netsh wlan show profiles

# Extract profile names
$profileNames = $profiles | Select-String ":(.+)" | ForEach-Object {
    $_.Matches.Groups[1].Value.Trim()
}

# Retrieve profile details and save to file
$wifiProfiles = $profileNames | ForEach-Object {
    $name = $_
    $profileDetails = netsh wlan show profile name="$name" key=clear
    if ($profileDetails) {
        $passMatch = $profileDetails | Select-String "Key Content\s+:(.+)"
        if ($passMatch) {
            $pass = $passMatch.Matches.Groups[1].Value.Trim()
            [PSCustomObject]@{ PROFILE_NAME = $name; PASSWORD = $pass }
        }
    }
} | Format-Table -AutoSize | Out-String

# Define the path to save the file
$tempPath = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), 'wifi-pass.txt')

# Save the profiles to the file
$wifiProfiles | Out-File -FilePath $tempPath -Encoding UTF8

# Output the location of the saved file
Write-Output "File saved to: $tempPath"

# Cleanup unnecessary variables (optional but good practice)
Remove-Variable profiles, profileNames, wifiProfiles, profileDetails, passMatch, name, pass

# Force garbage collection to clean up memory
[System.GC]::Collect()
