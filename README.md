<p align="center">
  <a href="#"><img width="257" height="257" src="https://i.imgur.com/O6R2A8M.png" alt="RobloxShortcutCleaner Banner"></a>
</p>

<p align="center">
	<a href="https://github.com/zeegro/RobloxShortcutCleaner/releases/tag/Ru"><img src="https://img.shields.io/github/v/tag/zeegro/RobloxShortcutCleaner?label=%D0%A1%D0%BA%D0%B0%D1%87%D0%B0%D1%82%D1%8C&labelColor=darkcyan" alt="Скачать"></a>
	<a href="https://github.com/zeegro/RobloxShortcutCleaner?tab=Apache-2.0-1-ov-file"><img src="https://img.shields.io/github/license/zeegro/RobloxShortcutCleaner?label=%D0%9B%D0%B8%D1%86%D0%B5%D0%BD%D0%B7%D0%B8%D1%8F&labelColor=orange" alt="Лицензия"></a>
</p>

<div align="center">
<table>
  <tr>
    <td valign="center"><img src="https://github.com/twitter/twemoji/blob/master/assets/svg/1f1fa-1f1f8.svg" width="26"/> <a href="README_en-us.md">English</a></td>
    <td valign="center"><img src="https://github.com/twitter/twemoji/blob/master/assets/svg/1f1f7-1f1fa.svg" width="26"/> <strong>Русский</strong></td>
  </tr>
</table>
</div>

---

<h1 align="center">🧼 RobloxShortcutCleaner</h1>


<h2 align="center">Автоматическое удаление ярлыка "Roblox Player" с рабочего стола.</h2>

---

## 🎨 Предыстория

Я — до ужаса перфекционист. На моём рабочем столе нет не одного ярлыка, ведь живые обои не должны перекрываться какими-то там иконками... Все приложения и игры у меня аккуратно закреплены в панели "Пуск" (да, прямо как на скриншоте ниже).  
Но Roblox, чёрт бы его побрал, после каждого обновления создает ярлык на рабочем столе. Иногда даже два — от Player и от Studio.  
Этот скрипт — вылечит как мои, так и ваши нервы. Он будет удалять два этих ярлыка сразу после их появления. При том скрипт почти ничего не потребляет!
Приятного использования и чистого вам рабочего стола ✨

---

## 📦 Файлы

- ⚙️ WatchDesktop.ps1 — основной PowerShell-скрипт, ведёт лог-файл, ищет ярлык, удаляет его.
- 🔁 restart_watcher.bat — обновляет автозагрузку и запускает скрипт заново принудительно.
- 🛑 stop_watcher.bat — завершает работу скрипта и удаляет его из автозагрузки.
- 🧾 AddToStartup.reg — автоматически создаваемый .reg-файл для настройки автозагрузки.
* 📄 RobloxShortcutCleaner.log — лог-файл, сохраняется во временной папке системы (%TEMP%).

---

## 🔧 Использование

 1.  Поместите все файлы из RobloxShortcutCleaner.zip в одну папку. Имя и путь до папки могут быть любыми (в том числе с кириллицей).
 2.  Откройте restart_watcher.bat  обязательно запускать от имени администратора.
 3.  Чтобы убедиться, что всё работает — проверьте лог(ниже).
 4.  Не перемещайте, и тем более не разбрасывайте файлы по разным папкам. Если переместили файлы: читайте ниже.

---

## 🗑️ Удаление

 1.   Откройте stop_watcher.bat от имени администратора и дождитесь закрытия.
 2.   Проверьте лог-файл, в нём должно быть написано об успешной остановке и удалении из автозапуска.
 3.   Удалите папку с файлами (вручную)
 4.   При желании — удалите лог-файл (вручную)

---

## 🔄 Если переместили папку

 1.  Запустите stop_watcher.bat из нового местоположения, подождите его закрытия.
 2.  Запустите restart_watcher.bat.

---

## 📄 О лог-файле

- Файл с логами создаётся автоматически:
 	* Путь: %TEMP%\RobloxShortcutCleaner.log
- Быстро открыть:
 	* Откройте Проводник
 	* Введите Путь до лога в адресную строку

---

## ⚠️ Требования

- Требуются права администратора для корректной работы bat-файлов
- Поддерживается на Windows 10 и Windows 11
