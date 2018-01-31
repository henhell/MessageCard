<#	
	===========================================================================
	 Created with: 	VSCode
	 Created on:   	2018-01-27 21.00
	 Created by:   	Henrik Hellerstedt <henrik@hellerstedt.com>
	 Organization: 	
	 Filename:     	PSMessageCard.psm1
	-------------------------------------------------------------------------
	 Module Name: PSMessageCard
	===========================================================================
	.SYNOPSIS
    Create Microsoft MessageCards
    See https://docs.microsoft.com/en-us/outlook/actionable-messages/card-reference
	.Description
	Functions to crate MessageCards suitable to send to Microsoft Teams channels
	
	.EXAMPLE
    # Create a message and send it
    $act
    $fct = New-MessageCardFact -name 'Date' -Value '2012-12-12';
    $fct2 = New-MessageCardFact -name 'Info' -Value 'Multiple Facts are possible'
    $sct = New-MessageCardSection -Title "This is a section test" -Text "This is text to show in this sections body, there can be multiple sections" -Facts $fct,$fct2
    $card = New-MessageCard -Title "The card title" -Sections $sct
    $uri = "https://outlook.office.com/webhook/your-uniq-hook-here"
    # Post it to Teams
    Invoke-RestMethod -Uri $Uri -body $Card -Method Post -ContentType 'application/json'

    > Import-Module MessageCard
    > $Message = "Lorem impsum"
    > $Title = "Hello WOrld"
    > Invoke-RestMethod -Uri $Uri -Body (New-MessageCard -Text $Message -Title $Title) -Method Post -ContentType 'application/json'
#>

# Import all functions that exist in separate files
Get-ChildItem -Path $PSScriptRoot\*.ps1 |
Where-Object { $_.FullName -notlike "*.Test.ps1"} |
ForEach-Object {
    . $_.FullName
}




#Export-ModuleMember -Function @(
#    'New-MessageCard',
#    'New-MessageCardActionOpenURI',
#    'New-MessageCardFact',
#    'New-MessageCardSection' )
