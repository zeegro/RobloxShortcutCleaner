$scriptPath = $MyInvocation.MyCommand.Path
$folderPath = Split-Path -Parent $scriptPath
$logFile = "$env:TEMP\RobloxShortcutCleaner.log"

"$(Get-Date) |  Мониторинг запущен" | Out-File -FilePath $logFile -Encoding utf8
Add-Content -Path $logFile -Value "$(Get-Date) |  Пользователь: $env:USERNAME"

$desktopPath = "$env:USERPROFILE\Desktop"
Add-Content -Path $logFile -Value "$(Get-Date) |  Целевой путь: $desktopPath"

if (-not (Test-Path -Path $desktopPath)) {
    Add-Content -Path $logFile -Value "$(Get-Date) |  Папка рабочего стола не найдена!"
    exit
} else {
    Add-Content -Path $logFile -Value "$(Get-Date) |  Папка найдена."
}

$existingShortcut = Join-Path $desktopPath "Roblox Player.lnk"
if (Test-Path -Path $existingShortcut) {
    try {
        Remove-Item -Path $existingShortcut -Force -ErrorAction Stop
        Add-Content -Path $logFile -Value "$(Get-Date) |  Ярлык удален при запуске: $existingShortcut"
    } catch {
        Add-Content -Path $logFile -Value "$(Get-Date) |  Ошибка удаления при запуске: $_"
    }
} else {
    Add-Content -Path $logFile -Value "$(Get-Date) |  Ярлыка нет при запуске."
}

$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $desktopPath
$watcher.Filter = "Roblox Player.lnk"
$watcher.IncludeSubdirectories = $false
$watcher.NotifyFilter = [System.IO.NotifyFilters]::FileName
$watcher.EnableRaisingEvents = $true

Add-Content -Path $logFile -Value "$(Get-Date) |  Настройки FileSystemWatcher:"
Add-Content -Path $logFile -Value "$(Get-Date) |     Path: $($watcher.Path)"
Add-Content -Path $logFile -Value "$(Get-Date) |     Filter: $($watcher.Filter)"
Add-Content -Path $logFile -Value "$(Get-Date) |     EnableRaisingEvents: $($watcher.EnableRaisingEvents)"

$action = {
    $shortcutPath = $Event.SourceEventArgs.FullPath
    $fileName = $Event.SourceEventArgs.Name

    Add-Content -Path $logFile -Value "$(Get-Date) |  Событие: '$fileName' создан(а)"
    Add-Content -Path $logFile -Value "$(Get-Date) |     Полный путь: $shortcutPath"

    if (Test-Path $shortcutPath) {
        try {
            Remove-Item -Path $shortcutPath -Force -ErrorAction Stop
            Add-Content -Path $logFile -Value "$(Get-Date) |  Ярлык удален: $shortcutPath"
        } catch {
            Add-Content -Path $logFile -Value "$(Get-Date) |  Ошибка удаления: $_"
        }
    } else {
        Add-Content -Path $logFile -Value "$(Get-Date) |  Файл не найден по указанному пути."
    }
}

$job = Register-ObjectEvent $watcher "Created" -Action $action
Add-Content -Path $logFile -Value "$(Get-Date) |  Ожидание создания файла..."

while ($true) {
    Start-Sleep -Seconds 1
}
