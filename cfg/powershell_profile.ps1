Import-Module -Name Microsoft.WinGet.CommandNotFound

function prompt {
        $user = $env:USERNAME
        $cwd = (Get-Location).Path

        Write-Host "╭" -ForegroundColor white -NoNewline
        Write-Host "(" -ForegroundColor red -NoNewline
        Write-Host "max" -ForegroundColor white -NoNewline
        Write-Host " ⮞" -ForegroundColor red -NoNewline
        Write-Host "⮞" -ForegroundColor white -NoNewline
        Write-Host "⮞ " -ForegroundColor red -NoNewline
        if ($cwd -eq "C:\Users\$user") {
                Write-Host "~" -ForegroundColor white -NoNewline
        } else {
                Write-Host $cwd -ForegroundColor white -NoNewline
        }
        Write-Host ")" -ForegroundColor red
        Write-Host "╰" -ForegroundColor red -NoNewline
        return "⮞ "
}

New-Alias gcc "F:\downloadzszszszsz\z_winlib_mingw_ucrt\bin\gcc.exe"
New-Alias v "nvim"
New-Alias src ". $profile"
New-Alias vimrc "nvim ~/.vimrc"
New-Alias frc "nvim $profile"
New-Alias ":q" "exit"
New-Alias suv "sudo nvim"
New-Alias py "python"
