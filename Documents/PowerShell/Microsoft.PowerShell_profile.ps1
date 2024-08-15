kubectl completion powershell | Out-String | Invoke-Expression
helm completion powershell | Out-String | Invoke-Expression

if (Get-Module -ListAvailable -Name PSReadLine) {
    Import-Module PSReadLine
    Set-PSReadLineOption -EditMode Emacs
}

oh-my-posh init pwsh | Invoke-Expression

# 必须放最后
zoxide init powershell | Out-String | Invoke-Expression
