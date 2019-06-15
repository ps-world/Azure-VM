$vms = get-azvm
$NewVMSize = "Standard_B2ms"
foreach ( $vm in $vms ) {
        if ( $vm.hardwareprofile.vmsize -ne "Standard_D2s_v3") {

        write-host "changing size + "$($VM.name)""
        $vm.HardwareProfile.vmSize = $NewVMSize
        Update-AzVM -ResourceGroupName $vm.ResourceGroupName -VM $vm

        }
        }