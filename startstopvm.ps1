

$vms = gc -Path C:\computer.txt  (# put name of azure vm in the text file) 

# $vms = (get-azurermvm -resourcegroup "rgname").name
foreach ($vm in $vms)

{

   $resource = Find-AzurermResource -ResourceNameEquals $vm -ResourceType "Microsoft.Compute/virtualMachines"

   if($resource -ne $null)

   { 

       Write-Output "Stopping virtual machine..." + $vm

       Stop-AzurermVM -ResourceGroupName $resource.ResourceGroupName -Name $vm -Force

   } 

   else

   {

       Write-output "Virtual machine not found:" + $vm

   }

}