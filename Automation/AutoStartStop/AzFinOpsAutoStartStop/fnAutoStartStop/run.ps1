# Azure PowerShell Function to AutoStart/Stop Resources
# by Freddy Ayala (c) 2022 cloud-architect.fr 
# 1. Deploy this function to your Azure Subscription
# 2. Activate Managed Identity
# 3. Assign the RBAC role such as Virtual Machine Contribute
# 4. Tag your resources accordingly
# Shutdown
# AutoShutdown: {"Activated":"true","Timezone":"Romance Standard Time","Time":"16:00:00"}
# Start 
# AutoStartup: {"Activated":"true","Timezone":"Romance Standard Time","Time":"15:00:00"}
# Profit $$$ (literally)

param($Timer)

# The 'IsPastDue' porperty is 'true' when the current function invocation is later than scheduled.
if ($Timer.IsPastDue) {
    Write-Host "PowerShell timer is running late!"
}

Import-Module "StartStop.psm1"

#Import-Module "./Modules/StartStop/StartStop.psm1"
$AutoShutdownTag="AutoShutdown"
$AutoStartTag="AutoStartup"

$virtualMachines = Get-AzResource -ResourceType Microsoft.Compute/virtualMachines | Where-Object { $_.Tags[$AutoShutdownTag] -ne $null -Or $_.Tags[$AutoStartTag] -ne $null }
Write-Host $virtualMachines
foreach ($vm in $virtualMachines) {
    Write-Host "Found Virtual Machine with Action Tags"    
    VerifiyAndExecuteSchedule $AutoShutdownTag $AutoStartTag $vm

}