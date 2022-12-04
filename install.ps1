$files = @(
    @{
        filename = ".gitconfig";
        targetPath = [Environment]::GetFolderPath("UserProfile")
    },
    @{
        filename = "profile.ps1";
        targetPath = (Join-Path ([Environment]::GetFolderPath("MyDocuments")) "WindowsPowerShell")
    }
)

$originalDirectory = Get-Location
Set-Location $PSScriptRoot

foreach ($file in $files) {
    New-Item -Value $file.filename -Path $file.targetPath -Name $file.filename -ItemType SymbolicLink -Force
}

Set-Location $originalDirectory
