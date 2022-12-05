Set-PSReadlineOption -EditMode vi

Set-Alias -Name g -Value git
function vs() {
    code -r $args
}
