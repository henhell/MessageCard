function New-MessageCardActionOpenURI {
<#
    .SYNOPSIS
    Create a potentialAction
    .DESCRIPTION
    Create an potentialAction object that when attached to a MessageCard will show a button that links to an uri.
    .PARAMETER Name
    The name of the button
    .PARAMETER Uri
    The uri to open when button is clicked
    .EXAMPLE
    $potAction = New-MessageCardActionOpenURI -Name "View" -Uri "https://www.dn.se"
#>

    Param (
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [Parameter(Mandatory = $true)]
        [string]$Uri
    )
    @{ "@type"="OpenUri"; "name"=$Name; "targets"= @( @{ "os"="default"; "uri" = $Uri } ) }
}

Set-Alias -Name New-MCAOU -Value New-MessageCardActionOpenURI