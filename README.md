<p align="center">
  <a href="#"><img width="650" height="213" src="https://imgur.com/a/BmbV0Wu" alt="RobloxShortcutCleaner Banner"></a>
</p>

<p align="center">
	<a href="https://github.com/your-username/RobloxShortcutCleaner/releases"><img src="https://img.shields.io/github/downloads/your-username/RobloxShortcutCleaner/total.svg?style=for-the-badge&color=darkcyan" alt="Downloads"></a>
	<a href="https://github.com/your-username/RobloxShortcutCleaner/graphs/contributors"><img src="https://img.shields.io/github/contributors/your-username/RobloxShortcutCleaner?style=for-the-badge&color=darkcyan" alt="Contributors"></a>
</p>

<div align="center">
<table>
  <tr>
    <td valign="center"><img src="https://github.com/twitter/twemoji/blob/master/assets/svg/1f1fa-1f1f8.svg" width="16"/> <a href="README_en-us.md">English</a></td>
    <td valign="center"><img src="https://github.com/twitter/twemoji/blob/master/assets/svg/1f1f7-1f1fa.svg" width="16"/> <strong>Русский</strong></td>
  </tr>
</table>
</div>

---

## 🧼 RobloxShortcutCleaner

Автоматическое удаление ярлыка "Roblox Player.lnk" с рабочего стола.

---

## 📦 Файлы

- ⚙️ WatchDesktop.ps1 — основной PowerShell-скрипт, ведёт лог-файл, ищет ярлык, удаляет его.
- 🔁 restart_watcher.bat — обновляет автозагрузку и запускает скрипт заново принудительно.
- 🛑 stop_watcher.bat — завершает работу скрипта и удаляет его из автозагрузки.
- 🧾 AddToStartup.reg — автоматически создаваемый .reg-файл для настройки автозагрузки.
- 📄 RobloxShortcutCleaner.log — лог-файл, сохраняется во временной папке системы (%TEMP%).

---

## 🔧 Использование

1. Поместите все файлы из RobloxShortcutCleaner.zip в одну папку. Имя и путь до папки могут быть любыми (в том числе с кириллицей).
2. Запустите restart_watcher.bat от имени администратора.
3. Убедитесь, что всё работает — проверьте лог-файл.
4. Не перемещайте и не разбрасывайте файлы. Если переместили — читайте ниже.

---

## 🗑️ Удаление

1. Запустите stop_watcher.bat от имени администратора и дождитесь закрытия.
2. Проверьте лог — там должна быть информация об остановке скрипта и удалении автозагрузки.
3. Удалите папку вручную.
4. (По желанию) удалите лог-файл.

---

## 🔄 Если переместили папку

1. Запустите stop_watcher.bat из нового расположения.
2. Затем перезапустите скрипт через restart_watcher.bat.

---

## 📄 О лог-файле

Лог создаётся автоматически:
- Путь: %TEMP%\RobloxShortcutCleaner.log

Быстрый доступ:
1. Откройте Проводник.
2. Введите путь до лог-файла в адресной строке.

---

## ⚠️ Требования

- Требуются права администратора для корректной работы bat-файлов.
- Поддерживается Windows 10 и Windows 11.

---

## 🎨 Предыстория

Я — истинный эстет. На моём рабочем столе нет ничего лишнего, ведь обои у меня живые и красивые. Все приложения и игры у меня аккуратно закреплены в панели "Пуск" (да, прямо как на скриншоте).  
Но Roblox, чёрт бы его побрал, после каждого обновления создает ярлык на рабочем столе. Иногда даже два — от Player и от Studio.  
Этот скрипт — моя месть. Как только обновится Studio — обновлю и скрипт, чтобы он удалял и его тоже. Инструкция уже есть в README и на главной странице.  
Приятного использования и чистого вам рабочего стола ✨

---
