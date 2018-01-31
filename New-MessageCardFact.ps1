function New-MessageCardFact {
<#
    .SYNOPSIS
    Create a MessageCard fact
    .DESCRIPTION
    The New-MessageCardFact creates an object that can be used with New-MessageCardSection
    .PARAMETER Name
    The name of the fact
    .PARAMETER Value
    The actual fact
    .EXAMPLE
    $fact = New-MessageCardFact -Name 'Date' -Value '2017-12-24'
#>
    Param (
        [Parameter(Mandatory = $true)]
        [string]$name,
        [Parameter(Mandatory = $true)]
        [string]$value
    )
    return @{'name'=$name; 'value'=$value}
}

Set-Alias -Name New-MCF -Value New-MessageCardFact