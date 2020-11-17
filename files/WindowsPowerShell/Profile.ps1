Set-PSReadLineOption -EditMode Emacs
Import-Module posh-git
Set-Alias ssh-agent "$env:ProgramFiles\git\usr\bin\ssh-agent.exe"
Set-Alias ssh-add "$env:ProgramFiles\git\usr\bin\ssh-add.exe"
# if(! $(gci env:SSH_AGENT_PID 2>&1|Out-Null)){Start-SshAgent}
