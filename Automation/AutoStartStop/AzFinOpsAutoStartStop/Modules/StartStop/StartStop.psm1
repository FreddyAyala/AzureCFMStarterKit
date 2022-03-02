#This function uses the schedules defined inside the autostart or autoshutdown tags in order to orchestrate the workloads automatic start/stop
function VerifiyAndExecuteSchedule {
    [CmdletBinding()]
    param($AutoShutdownTag, $AutoStartTag, $workload)

    # We stablish a time window from the start of the schedule where we will verify and shutdown/start the workloads according to the powerstate
    # For example if one minute has passed from the schedule and we are under the 60 minutes window, the schedule will be executed
    # You have to avoid Start, Stop Schedules for the same resource where the time window is near (for example start at 15:00 and stop at 15:10)
    # This will create a loop and your Virtual Machine will be started/stopped several times.
    
    $minMinutes = 0
    $maxMinutes = 15

    Write-Host "Schedule"
    $currentSchedule = GetSchedule $workload $AutoShutdownTag  $AutoStartTag  | ConvertFrom-Json  
    Write-Host $currentSchedule

    $currentTimeinTimeZone = [System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId([DateTime]::Now, $currentSchedule.Timezone).ToString("HH:mm")  
    Write-Host $currentSchedule.Time 
    Write-Host $currentTimeinTimeZone
            
   
        
    Write-Host $workload.Tags
    if ($null -ne $workload.Tags[$AutoShutdownTag]) {
        $currentSchedule = $workload.Tags[$AutoShutdownTag] | ConvertFrom-Json
        $TimeDiff = New-TimeSpan  $currentSchedule.Time  $currentTimeinTimeZone
        Write-Host $TimeDiff.TotalMinutes

        if ($currentSchedule.Activated -eq "true") {
            if ($TimeDiff.TotalMinutes -ge $minMinutes -And $TimeDiff.TotalMinutes -lt $maxMinutes) {
                Write-Output "Found Workload to turn off"
                StopWorkload  $workload

            }
        }
    } 

    if ($null -ne $workload.Tags[$AutoStartTag]) {
        $currentSchedule = $workload.Tags[$AutoStartTag] | ConvertFrom-Json
        $TimeDiff = New-TimeSpan  $currentSchedule.Time  $currentTimeinTimeZone
        Write-Host $TimeDiff.TotalMinutes

        if ($currentSchedule.Activated -eq "true") {
            if ($TimeDiff.TotalMinutes -ge $minMinutes -And $TimeDiff.TotalMinutes -lt $maxMinutes) {
                Write-Output "Found Workload to turn on"
                StartWorkload  $workload
                
            }
        }
    }    
}

function GetSchedule {
    [CmdletBinding()]
    param($workload, $AutoShutdownTag, $AutoStartTag)

    Write-Host $workload.Tags
    if ($null -ne $workload.Tags[$AutoShutdownTag]) {
        return $workload.Tags[$AutoShutdownTag];
    }
    if ($null -ne $workload.Tags[$AutoStartTag]) {
        return $workload.Tags[$AutoStartTag];
    }
}

# Stop the workloads

function StopWorkload {
    [CmdletBinding()]
    param($workload)
    if ($workload.ResourceId -like "*/Microsoft.Compute/virtualMachines*") {
        StopVM $workload
    }
}

function StartWorkload {
    [CmdletBinding()]
    param($workload)
    if ($workload.ResourceId -like "*/Microsoft.Compute/virtualMachines*") {
        StartVM $workload

    }
}


# Virtual Machines Functions

function StopVM {
    [CmdletBinding()]
    param($workload)
    $workloadStatus = ((Get-AzVM -VMName $workload.Name -ResourceGroupName $workload.ResourceGroupName  -Status).Statuses[1]).code
    Write-Output  $workloadStatus

    if ($workloadStatus -eq "PowerState/running") {
        Write-Output "Stoping Workload"
        $stop = Stop-AzVM -ResourceGroupName $workload.ResourceGroupName -Name $workload.Name -Force -NoWait
        Write-Output $stop
    }
}

function StartVM {
    [CmdletBinding()]
    param($workload)
    $workloadStatus = ((Get-AzVM -VMName $workload.Name -ResourceGroupName $workload.ResourceGroupName  -Status).Statuses[1]).code
    Write-Output  $workloadStatus

    if ($workloadStatus -eq "PowerState/deallocated") {
        Write-Output "PowerState/deallocated"
        $start = Start-AzVM -ResourceGroupName $workload.ResourceGroupName -Name $workload.Name -NoWait
        Write-Output $start
    }
}

# AKS Clusters

