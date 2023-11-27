Connect-AzAccount
Get-AzSubscription | Format-Table
get-azcontext
Set-AzContext -SubscriptionId 9e9e248c-7acb-4e9f-8b97-2ae313be5d3c
New-AzResourceGroup -Name rg-dev-ghpz-poc -Location "East US" -Tag @{"ApplicationName"="ghpzea"; "Environment"="Dev"; "ServiceLevel"="poc"; "Recovery"="test"}
Get-AzResourceGroup |Format-Table ResourceGroupName
New-AzResourceGroupDeployment -ResourceGroupName rg-dev-ghpz-poc -TemplateFile .\main.bicep -namePrefix pzlab1
Remove-AzResourceGroup -Name rg-dev-ghpz-poc -Force