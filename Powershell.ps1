While ($counter -lt 1000){expand-archive "C:\Users\CTF\Documents\Omega1000.zip" -force; get-content "C:\Users\CTF\Documents\Omega1000.txt"; $counter++}

$words | select-string -match 'aa[a-g]' | measure-object

function UnzipFiles($path) {
    Add-Type -AssemblyName System.IO.Compression.FileSystem

    $zipFiles = Get-ChildItem -Path $path -Filter "*.zip"

    while ($counter -le 999) {
        $zipFileDir = Split-Path -Path $zipFiles.FullName -Parent
        Write-Host "Extracting: $($zipFiles.FullName)"
        [System.IO.Compression.ZipFile]::ExtractToDirectory($zipFiles.FullName, $zipFileDir)
        Remove-Item -Path $zipFiles.FullName
        $zipFiles = Get-ChildItem -Path $path -Filter "*.zip"
        $counter++
    }
}

# Provide the path where your zip files are located
$zipPath = "C:\Path\To\Your\Zip\Files"

UnzipFiles($zipPath)