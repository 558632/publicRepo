param (
    [string]$AZVM,
    [string]$AZVMNic
)
$nic = Get-aznetworkinterface -name $AZVMNic
$nic.Dnssettings.dnsservers.add("172.21.0.22")
$nic | Set-AzNetworkInterface
restart-azvm -resourcegroupname Lukas_RG -name $AZVM
stop-azvm -resourcegroupname Lukas_RG -name $AZVM
