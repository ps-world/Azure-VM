*** modifying ip address**

$vnet = Get-AzVirtualNetwork -Name 'VirtalNetwrokName' -ResourceGroupName 'ResourcegroupName'
$subnet = Get-AzVirtualNetworkSubnetConfig -Name 'SubnetName' -VirtualNetwork $vnet
$publicIP = Get-AzPublicIpAddress -name 'PublicIpName' -ResourceGroupName 'ResourcegroupName'
$publicIp.PublicIpAllocationMethod = "dynamic"
$nic = Get-AzNetworkInterface -Name 'nic-name'  -ResourceGroupName 'ResourcegroupName'
$nic | Set-AzNetworkInterfaceIpConfig -Name ipconfig1 -PrivateIpAddress 10.x.x.x -Subnet $subnet -Primary -PublicIpAddress $publicIP
$nic | Set-AzNetworkInterface



******** remove the IP ****

$nic = Get-AzNetworkInterface -Name 'nic-name'  -ResourceGroupName 'ResourcegroupName'
$nic.IpConfigurations.publicipaddress.id = $null
Set-AzNetworkInterface -NetworkInterface $nic