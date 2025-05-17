@echo off
chcp 65001 >nul
cls

set "currentPath=%~dp0"
set "currentPath=%currentPath:~0,-1%"

set "scriptName=WatchDesktop.ps1"
set "scriptFullPath=%currentPath%\%scriptName%"

echo [DEBUG] Текущий путь: %currentPath%
echo [DEBUG] Полный путь к скрипту: %scriptFullPath%

if not exist "%scriptFullPath%" (
    echo [ERROR] Файл %scriptFullPath% не найден!
    pause
    exit /b 1
)

echo [INFO] Завершаем все процессы powershell.exe...
taskkill /im powershell.exe /f >nul 2>&1

reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v WatchRobloxShortcut /f >nul 2>&1
echo [INFO] Удалена старая запись автозапуска (если была).

reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v WatchRobloxShortcut /t REG_SZ /d "powershell.exe -NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File \"%scriptFullPath%\"" /f
echo [INFO] Добавлена новая запись автозапуска.

(
    echo Windows Registry Editor Version 5.00
    echo.
    echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]
    echo "WatchRobloxShortcut"="powershell.exe -NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File \\"%scriptFullPath:\\=\\\\%\\""
) > "%currentPath%\AddToStartup.reg"
echo [INFO] Обновлен файл AddToStartup.reg.

echo [INFO] Запускаю WatchDesktop.ps1 вручную...
start "" powershell.exe -NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File "%scriptFullPath%"

echo [INFO] Перезапуск завершён. Окно закроется через 5 секунд...
timeout /t 5 >nul
