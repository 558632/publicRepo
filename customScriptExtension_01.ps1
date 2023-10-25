param (
    [string]$AZVM,
    [string]$AZVMNic
)

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Forcen
Install-Module -Name PowerShellGet -Force
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
Install-Module -Name Az -Repository PSGallery -Force

Connect-AzAccount -Tenant '91c369b5-1c9e-439c-989c-1867ec606603' -SubscriptionId 'bc447a8e-4cfd-4096-b2cd-06e7321b1a38'
$nic = Get-aznetworkinterface -name $AZVMNic
$nic.Dnssettings.dnsservers.add("172.21.0.22")
$nic | Set-AzNetworkInterface
restart-azvm -resourcegroupname Lukas_RG -name $AZVM
stop-azvm -resourcegroupname Lukas_RG -name $AZVM
