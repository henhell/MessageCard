function New-MessageCard {
<#
    .SYNOPSIS
    Create a MessageCard
    .DESCRIPTION
    The New-MessageCard will create a string (JSON) that is suitable to post to an incoming Microsoft Teams webhook
    .PARAMETER Title
    The main title of the message
    .PARAMETER Text
    The main body of the message
    .PARAMETER Color
    A color in hex (#ff2211) that is used in the message. You could use red to indicate a warning,
    or green to indicate OK.
    .PARAMETER Sections
    One or more New-MessageCardSection objects to attach to the card
    .EXAMPLE
    $card = New-MessageCard -Title "Is it working" -Color "#0000ff" -Text "This is probably not working!"
#>
	Param (
        [Parameter(ValueFromPipeline,Mandatory = $true)]
        [String]$Text,
        [String]$Title,
        [string]$Color,
        [array]$Sections        
    )

    $card = @{
        '@type'='MessageCard';
        '@context'='http://schema.org/extensions';
        'text' = $Text
    }

    if($Title) { $card.Add('title',$Title) }
    if($Color) { $card.Add('themeColor',$Color) }
    if($Sections) { $card.Add('sections',$Sections) }
    #if($Summary) { $card.Add('summary',$Summary) }
    ConvertTo-Json $card -Depth 6
}

Set-Alias -Name New-MC -Value New-MessageCard