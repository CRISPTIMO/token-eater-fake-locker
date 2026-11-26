param([string]$mode = "run")

[Console]::OutputEncoding = [Text.Encoding]::UTF8
$host.UI.RawUI.WindowTitle = "Token Eater"

try {
    if (-not ([System.Management.Automation.PSTypeName]'Win32.WinMax').Type) {
        $sig = '[DllImport("kernel32.dll")] public static extern IntPtr GetConsoleWindow();
                [DllImport("user32.dll")]   public static extern bool ShowWindow(IntPtr h, int n);'
        Add-Type -MemberDefinition $sig -Name WinMax -Namespace Win32
    }
    [Win32.WinMax]::ShowWindow([Win32.WinMax]::GetConsoleWindow(), 3) | Out-Null
    Start-Sleep -Milliseconds 350
} catch {}

function Delay($ms) { Start-Sleep -Milliseconds $ms }

function ShowEye {
    $art = @'
⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⢠⡆⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⣷⣄⠀⠀⠀⠀⣾⣷⠀⠀⠀⠀⣠⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢿⠿⠃⠀⠀⠀⠉⠉⠁⠀⠀⠐⠿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⣶⣶⣶⣤⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣠⣶⣿⣿⡿⣿⣿⣿⡿⠋⠉⠀⠀⠉⠙⢿⣿⣿⡿⣿⣿⣷⣦⡀⠀⠀⠀
⠀⢀⣼⣿⣿⠟⠁⢠⣿⣿⠏⠀⠀⢠⣤⣤⡀⠀⠀⢻⣿⣿⡀⠙⢿⣿⣿⣦⠀⠀
⣰⣿⣿⡟⠁⠀⠀⢸⣿⣿⠀⠀⠀⢿⣿⣿⡟⠀⠀⠈⣿⣿⡇⠀⠀⠙⣿⣿⣷⡄
⠈⠻⣿⣿⣦⣄⠀⠸⣿⣿⣆⠀⠀⠀⠉⠉⠀⠀⠀⣸⣿⣿⠃⢀⣤⣾⣿⣿⠟⠁
⠀⠀⠈⠻⣿⣿⣿⣶⣿⣿⣿⣦⣄⠀⠀⠀⢀⣠⣾⣿⣿⣿⣾⣿⣿⡿⠋⠁⠀⠀
⠀⠀⠀⠀⠀⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠛⠿⠿⠿⠿⠿⠿⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢰⣷⡦⠀⠀⠀⢀⣀⣀⠀⠀⠀⢴⣾⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣸⠟⠁⠀⠀⠀⠘⣿⡇⠀⠀⠀⠀⠙⢷⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠻⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀
'@
    $pw = [Console]::WindowWidth
    if ($pw -lt 1) { $pw = 80 }
    $padStr = ' ' * [int][Math]::Max(0, ($pw - 30) / 2)
    ($art -split "`n") | ForEach-Object {
        Write-Host ($padStr + $_.TrimEnd()) -ForegroundColor White
    }
}


function ShowDeath {
    $art = @'
             ;::::;
           ;::::; :;
         ;:::::'   :;
        ;:::::;     ;.
       ,:::::'       ;           OOO\
       ::::::;       ;          OOOOO\
       ;:::::;       ;         OOOOOOOO
      ,;::::::;     ;'         / OOOOOOO
    ;:::::::::`. ,,,;.        /  / DOOOOOO
  .';:::::::::::::::::;,     /  /     DOOOO
,::::::;::::::;;;;::::;,   /  /        DOOO
;`::::::`'::::::;;;::::: ,#/  /          DOOO
:`:::::::`;::::::;;::: ;::#  /            DOOO
::`:::::::`;:::::::: ;::::# /              DOO
`:`:::::::`;:::::: ;::::::#/               DOO
:::`:::::::`;; ;:::::::::##                OO
::::`:::::::`;::::::::;:::#                OO
`:::::`::::::::::::;'`:;::#                O
  `:::::`::::::::;' /  / `:#
   ::::::`:::::;'  /  /   `#
'@
    Write-Host $art -ForegroundColor White
}

function ShowLockerScreen {
    $host.UI.RawUI.BackgroundColor = "DarkBlue"
    $host.UI.RawUI.ForegroundColor = "White"
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host "   +----------------------------------------------------------+"
    Write-Host "   |                                                          |"
    Write-Host "   |            ВАШИ ФАЙЛЫ ЗАШИФРОВАНЫ!                      |"
    Write-Host "   |                                                          |"
    Write-Host "   +----------------------------------------------------------+"
    Write-Host ""
    Write-Host "   УПС! Вы подверглись масштабной хакерской атаке, и теперь"
    Write-Host "   Ваш компьютер заблокирован, а все имеющиеся диски и файлы"
    Write-Host "   на них зашифрованы хакерской группировкой. Любые действия,"
    Write-Host "   связанные с попыткой обмануть систему, нанесут"
    Write-Host "   непоправимый вред Вашему компьютеру и приведут к потере"
    Write-Host "   всех важных файлов без возможности восстановления."
    Write-Host "   При попытке снять блокировку главный загрузчик материнки"
    Write-Host "   будет снесён и подана рекурсивная нагрузка на процессор."
    Write-Host ""
    Write-Host "   У вас есть 48 часов с момента запуска чтобы ввести код."
    Write-Host "   Чтобы получить код, напишите: MAKC_MAKCBETOB   (Telegram)"
    Write-Host ""
    Write-Host "   +----------------------------------------------------------+"
    Write-Host "   |                                                          |"
    Write-Host "   |  Текущий ПК: $env:COMPUTERNAME"
    Write-Host "   |                                                          |"
    Write-Host "   +-- КОД РАЗБЛОКИРОВКИ: ------------------------------------+"
    Write-Host "   |                                                          |"
}

switch ($mode) {

    "run" {

        # === ПУСТОЙ ФИОЛЕТОВЫЙ — последствие щелчка жука ===
        $host.UI.RawUI.BackgroundColor = "Black"
        $host.UI.RawUI.ForegroundColor = "DarkMagenta"
        Clear-Host
        Write-Host ""
        Write-Host ""
        Write-Host "                                           * " -ForegroundColor DarkMagenta
        Delay 100

        Clear-Host
        Write-Host ""
        Write-Host ""
        Write-Host "                                        ███" -ForegroundColor Magenta
        Write-Host "                                       █████" -ForegroundColor Magenta
        Write-Host "                                        ███" -ForegroundColor Magenta
        Delay 100

        Clear-Host
        Write-Host ""
        Write-Host ""
        Write-Host "                                   █████████" -ForegroundColor Magenta
        Write-Host "                                  ███████████" -ForegroundColor Magenta
        Write-Host "                                 █████████████" -ForegroundColor Magenta
        Write-Host "                                  ███████████" -ForegroundColor Magenta
        Write-Host "                                   █████████" -ForegroundColor Magenta
        Delay 100

        Clear-Host
        Write-Host ""
        Write-Host "                           ███████████████████" -ForegroundColor Magenta
        Write-Host "                          █████████████████████" -ForegroundColor Magenta
        Write-Host "                         ███████████████████████" -ForegroundColor Magenta
        Write-Host "                         ███████████████████████" -ForegroundColor Magenta
        Write-Host "                         ███████████████████████" -ForegroundColor Magenta
        Write-Host "                          █████████████████████" -ForegroundColor Magenta
        Write-Host "                           ███████████████████" -ForegroundColor Magenta
        Delay 100

        Clear-Host
        Write-Host "                   ███████████████████████████████████" -ForegroundColor Magenta
        Write-Host "                 ███████████████████████████████████████" -ForegroundColor Magenta
        Write-Host "               ███████████████████████████████████████████" -ForegroundColor Magenta
        Write-Host "              █████████████████████████████████████████████" -ForegroundColor Magenta
        Write-Host "             ███████████████████████████████████████████████" -ForegroundColor Magenta
        Write-Host "              █████████████████████████████████████████████" -ForegroundColor Magenta
        Write-Host "               ███████████████████████████████████████████" -ForegroundColor Magenta
        Write-Host "                 ███████████████████████████████████████" -ForegroundColor Magenta
        Write-Host "                   ███████████████████████████████████" -ForegroundColor Magenta
        Delay 100

        $host.UI.RawUI.BackgroundColor = "DarkMagenta"
        $host.UI.RawUI.ForegroundColor = "Magenta"
        Clear-Host
        Delay 100

        $host.UI.RawUI.ForegroundColor = "White"
        Clear-Host
        $pw = [Console]::WindowWidth
        $ph = [Console]::WindowHeight
        for ($r = 0; $r -lt [Math]::Max(0, [int]($ph/2) - 2); $r++) { Write-Host "" }
        $t1 = "虚式茈"
        Write-Host ((' ' * [Math]::Max(0,[int](($pw - $t1.Length)/2))) + $t1) -ForegroundColor White
        Delay 1800

        # Переход к взлому
        $host.UI.RawUI.BackgroundColor = "Black"
        $host.UI.RawUI.ForegroundColor = "White"
        Clear-Host
        Delay 300

        Write-Host "Загрузка Windows . . ." -ForegroundColor Cyan
        Delay 50
        Write-Host "ошибка: 0x03527737" -ForegroundColor Cyan
        Delay 50
        Write-Host "ошибка: 0x0266712" -ForegroundColor Cyan
        Delay 50
        Write-Host "ошибка: 0x02897593" -ForegroundColor Cyan
        Delay 50
        Write-Host "ошибка: 0x01447812" -ForegroundColor Cyan
        Delay 50
        Write-Host "ошибка: 0x0150974" -ForegroundColor Cyan
        Delay 50
        Write-Host "ошибка: 0x03873700" -ForegroundColor Cyan
        Delay 50
        Write-Host "ошибка: 0x0700882" -ForegroundColor Cyan
        Delay 50
        Write-Host "ошибка: 0x03803618" -ForegroundColor Cyan
        Delay 50
        Write-Host "Раздел памяти 0x0424* заблокирован!" -ForegroundColor Cyan
        Delay 50
        Write-Host "PID 0x7FFE0030 :: занято :: недоступно" -ForegroundColor Cyan
        Delay 50
        Write-Host "Дескриптор безопасности повреждён." -ForegroundColor Cyan
        Delay 50
        Write-Host "Запущен UXCryptor." -ForegroundColor Cyan
        Delay 50
        Write-Host ""

        # Прогресс-бар
        $stages = @(0, 7, 15, 24, 34, 45, 57, 68, 78, 87, 94, 100)
        foreach ($p in $stages) {
            $filled = [int]($p * 0.40)
            $empty  = 40 - $filled
            $bar    = "#" * $filled + " " * $empty
            Write-Host ("  Шифрование файлов... [$bar] $($p.ToString().PadLeft(3))%") `
                -ForegroundColor Yellow -NoNewline
            [Console]::Write("`r")
            Delay 50
        }
        Write-Host "  Шифрование файлов... [########################################] 100%" `
            -ForegroundColor Yellow
        Delay 50
        try {
            $cDrive = Get-PSDrive -Name C -ErrorAction Stop
            $usedGB = [Math]::Round($cDrive.Used / 1GB, 1)
            $fileCount = 100000 + [int]($usedGB * 1200)
            $fileCountStr = "{0:N0}" -f $fileCount
            Write-Host "  Зашифровано: $fileCountStr файлов  |  $usedGB ГБ" -ForegroundColor Green
        } catch {
            Write-Host "  Зашифровано: 3 847 файлов  |  48.3 ГБ" -ForegroundColor Green
        }
        Delay 400

        # === ВАС ЗАМЕТИЛИ — отдельная сцена ===
        $host.UI.RawUI.BackgroundColor = "Black"
        $host.UI.RawUI.ForegroundColor = "White"
        Clear-Host
        $pw2 = [Console]::WindowWidth
        $ph2 = [Console]::WindowHeight
        $topPad = [Math]::Max(1, [int](($ph2 - 20) / 2))
        for ($r = 0; $r -lt $topPad; $r++) { Write-Host "" }
        ShowEye
        Write-Host ""
        Delay 600

        $caught = "ВАС ЗАМЕТИЛИ"
        if ($pw2 -lt 1) { $pw2 = 80 }
        $cpad = ' ' * [int][Math]::Max(0, ($pw2 - 12) / 2)
        for ($k = 0; $k -lt 6; $k++) {
            Write-Host "$cpad$caught" -ForegroundColor Red
            Delay 300
            $top2 = [Console]::CursorTop - 1
            if ($top2 -ge 0) {
                [Console]::SetCursorPosition(0, $top2)
                Write-Host (' ' * ($pw2 - 1)) -ForegroundColor Black
            }
            Delay 220
        }
        Write-Host "$cpad$caught" -ForegroundColor Red
        Delay 2000

        # Красный экран
        $host.UI.RawUI.BackgroundColor = "Red"
        $host.UI.RawUI.ForegroundColor = "White"
        Clear-Host
        ShowDeath
        Write-Host ""
        Write-Host "                 >>> КОМПЬЮТЕР СКОМПРОМЕТИРОВАН <<<"
        Write-Host ""
        Write-Host "              Все данные переданы третьим лицам."
        Write-Host "              Восстановление без кода невозможно."
        Delay 3500

        # Цикл ввода кода — всё внутри PowerShell
        while ($true) {
            ShowLockerScreen
            Write-Host "   |   > " -NoNewline
            $code = [Console]::ReadLine()
            Write-Host "   |                                                          |"
            Write-Host "   +----------------------------------------------------------+"
            if ($code -ieq "TOKEN_EATER" -or $code -ieq "TOKEN EATER") {
                Delay 400
                # Разблокировка
                $host.UI.RawUI.BackgroundColor = "DarkGreen"
                $host.UI.RawUI.ForegroundColor = "White"
                Clear-Host
                Write-Host ""
                Write-Host ""
                Write-Host ""
                Write-Host ""
                Write-Host ""
                Write-Host ""
                Write-Host "   +----------------------------------------------------------+"
                Write-Host "   |                                                          |"
                Write-Host "   |          Код верный. Система разблокирована.             |"
                Write-Host "   |                                                          |"
                Write-Host "   |              Добро пожаловать, TOKEN_EATER.              |"
                Write-Host "   |                                                          |"
                Write-Host "   +----------------------------------------------------------+"
                Write-Host ""
                Delay 2500
                break
            } else {
                # Анти-чит
                $host.UI.RawUI.BackgroundColor = "Red"
                $host.UI.RawUI.ForegroundColor = "White"
                Clear-Host
                Write-Host ""
                Write-Host ""
                Write-Host ""
                Write-Host ""
                Write-Host ""
                Write-Host ""
                Write-Host ""
                Write-Host ""
                Write-Host "   +----------------------------------------------------------+"
                Write-Host "   |                                                          |"
                Write-Host "   |   ЗАМЕЧЕНА И ОСТАНОВЛЕНА ПОПЫТКА ОБМАНУТЬ СИСТЕМУ!      |"
                Write-Host "   |                                                          |"
                Write-Host "   |       Запуск таймера самоуничтожения данных...          |"
                Write-Host "   |                                                          |"
                Write-Host "   +----------------------------------------------------------+"
                Write-Host ""
                Delay 3000
            }
        }
    }
}
