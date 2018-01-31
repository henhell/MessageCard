# MessageCard

The Powershell module simplifies the generation of MessageCard JSON. The JSON is suitable for posting to a Microsoft Teams incoming webhook to produce a rich text message.

The module support generation of simple and more advanced card with sections, facts and buttons to open uri's

Do not forget that Get-Help is your friend!

## Getting Started

Clone or download the module and put it in your module path.

### Prerequisites

You need Windows or Linux and PowerShell

### How to generate a MessageCard

```powershell
Import-Module MessageCard
$act = New-MessageCardActionOpenURI -Name "Open GitHub" -Uri "https://github.com"
$fct = New-MessageCardFact -name 'Date' -Value '2012-12-12'
$fct2 = New-MessageCardFact -name 'Info' -Value 'Multiple Facts are possible'
$sct = New-MessageCardSection -Title "This is a section test" -Text "This is text to show in this sections body, there can be multiple sections" -Facts $fct,$fact2 -potentialAction $act
$card = New-MessageCard -Title "The card title" -Sections $sct
$uri = "https://outlook.office.com/webhook/your-uniq-hook-here"
Invoke-RestMethod -Uri $uri -body $card -Method Post -ContentType 'application/json'
```

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

* **Henrik Hellerstedt** - *Initial work* - [henhell](https://github.com/henhell)

See also the list of [contributors](https://github.com/henhell/MessageCard/contributors) who participated in this project.

## License

This project is licensed under the BSD 3-Clause License - see the [LICENSE](LICENSE) file for details
