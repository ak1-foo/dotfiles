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

New-Item -Value ".vscode\settings.json" -Path (Join-Path $env:APPDATA "Code\User") -Name "settings.json" -ItemType SymbolicLink -Force
New-Item -Value ".vscode\keybindings.json" -Path (Join-Path $env:APPDATA "Code\User") -Name "keybindings.json" -ItemType SymbolicLink -Force

Set-Location $originalDirectory
