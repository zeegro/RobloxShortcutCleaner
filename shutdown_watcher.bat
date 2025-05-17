@echo off
chcp 65001 >nul
cls

echo [INFO] Попытка остановить скрипт: %~dp0WatchDesktop.ps1
set "scriptFullPath=%~dp0WatchDesktop.ps1"
set "logFile=%TEMP%\RobloxShortcutCleaner.log"

timeout /t 1 >nul

echo [INFO] Поиск процессов PowerShell с этим скриптом...

powershell -NoProfile -Command ^
  "$target = [regex]::Escape('%scriptFullPath:~0,-1%');" ^
  "$currentPID = $PID;" ^
  "$found = Get-CimInstance Win32_Process | Where-Object { $_.Name -eq 'powershell.exe' -and $_.CommandLine -match $target -and $_.ProcessId -ne $currentPID };" ^
  "if ($found) {" ^
    "foreach ($proc in $found) {" ^
      "Write-Host ('[INFO] Завершаю PID ' + $proc.ProcessId);" ^
      "Write-Host ('[INFO] Командная строка: ' + $proc.CommandLine);" ^
      "Write-Host ('[INFO] Время запуска: ' + $proc.CreationDate);" ^
      "Stop-Process -Id $proc.ProcessId -Force;" ^
    "}" ^
  "} else {" ^
    "Write-Host '[INFO] Не найдено подходящих процессов — возможно скрипт уже остановлен.';" ^
  "}"

reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v WatchRobloxShortcut /f >nul 2>&1
echo [INFO] Запись автозапуска удалена.

setlocal enabledelayedexpansion
for /f "tokens=1-4 delims=:.," %%a in ("%date% %time%") do (
  set "datetime=%%a-%%b-%%c %%d"
)

(
  echo [LOG] Скрипт остановлен вручную — !datetime!
  echo [LOG] Запись автозапуска удалена — !datetime!
) >> "%logFile%"

echo [INFO] Скрипт WatchDesktop.ps1 остановлен.
echo [INFO] Окно закроется через 5 секунд...
timeout /t 5 >nul
