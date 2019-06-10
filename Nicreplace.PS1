$rg = 'Resourcegroupname'
$vm = get-azvm -ResourceGroupName $rg -Name $vmname
$nicid = $VM.NetworkProfile.NetworkInterfaces.Id
$newnic = Get-AzNetworkInterface -ResourceGroupName $rg -Name $nicname
Add-AzVMNetworkInterface -VM $vm -Id $newnic.Id
Remove-AzVMNetworkInterface -VM $vm -NetworkInterfaceIDs $nicid
Update-AzVM -VM $vm -ResourceGroupName $rg