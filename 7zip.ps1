$paths = @(
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*",
    "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
)

$sevenZip = Get-ItemProperty $paths -ErrorAction SilentlyContinue |
    Where-Object { $_.DisplayName -like "7-Zip*" } |
    Select-Object -First 1

if ($sevenZip -and $sevenZip.DisplayVersion) {
    $version = $sevenZip.DisplayVersion
}
else {
    $version = "0.0"
}

$result = @{
    SevenZipVersion = $version
}

return $result | ConvertTo-Json -Compress