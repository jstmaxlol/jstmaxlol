Import-Module -Name Microsoft.WinGet.CommandNotFound

function prompt
{
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

function gcc        { F:\downloadzszszszsz\z_winlib_mingw_ucrt\bin\gcc.exe }
function g++        { F:\downloadzszszszsz\z_winlib_mingw_ucrt\bin\g++.exe }
function v          { nvim          } 
function src        { . $profile    }
function vimrc      { nvim ~/.vimrc }
function frc        { nvim $profile }
function :q         { exit          }
function suv        { sudo nvim     }
function py         { python        }

