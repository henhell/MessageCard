function New-MessageCardSection {
<#
    .SYNOPSIS
    Create a MessageCard section.
    .DESCRIPTION
    The New-MessageCardSection will create a section that can be attached to a MessageCard.
    .PARAMETER Title
    The section title (first row).
    .PARAMETER Subtitle
    The subtitle of the section (second row).
    .PARAMETER Subtitle
    The text body of the section.
    .PARAMETER Image
    An uri to an image to display in this section.
    .PARAMETER Facts
    One or more New-MessageCardFact objects to attach to the section.
    .PARAMETER potentialAction
    One or more New-MessageCardAction* objects to attach to section.
    .EXAMPLE
    $sct = New-MessageCardSection -Title "One Section" -Subtitle "A section in a Card" -Text "Lorem ipsum"
#>
    Param (
        [string]$Title,
        [string]$Subtitle,
        [string]$Text,
        [string]$Image,
        [array]$Facts,
        [array]$potentialAction
    ) 

    $section = @{};
    if ($Title) { $section.Add('activityTitle',$Title); }
    if ($Subtitle) { $section.Add('activitySubtitle',$Subtitle); }
    if ($Text) { $section.Add('activityText',$Text); }
    if ($Image) { $section.Add('activityImage',$Image); }
    if ($Facts) { $section.add('facts',$Facts)}
    if ($potentialAction) { $section.add('potentialAction',$potentialAction)}
    $section
}

Set-Alias -Name New-MCS -Value New-MessageCardSection
