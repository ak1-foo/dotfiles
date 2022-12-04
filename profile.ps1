Set-PSReadlineOption -EditMode vi

Set-Alias -Name g -Value git
function c() {
    code -r $args
}
