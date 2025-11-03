function prompt {
	$user = $env:USERNAME
	$cwd = (Get-Location).Path

	Write-Host "╭" -ForegroundColor white -NoNewline
	Write-Host "(" -ForegroundColor red -NoNewline
	Write-Host $user -ForegroundColor white -NoNewline
	Write-Host "⮞" -ForegroundColor red -NoNewline
	Write-Host "⮞" -ForegroundColor white -NoNewline
	Write-Host "⮞" -ForegroundColor red -NoNewline
	if ($cwd -eq "C:\Users\$user") {
		Write-Host "~" -ForegroundColor white -NoNewline
	} else {
		Write-Host $cwd -ForegroundColor white -NoNewline
	}
	Write-Host ")" -ForegroundColor red
	Write-Host "╰" -ForegroundColor red -NoNewline
	return "⮞ "
}
