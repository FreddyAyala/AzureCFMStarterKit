

Function GetCosts {
    Param ( $CostParameter)
    $offerDurableId = $CostParameter.offerDurableId 
    $currency = $CostParameter.currency 
    $locale = $CostParameter.locale 
    $regionInfo = $CostParameter.regionInfo 
    $startTime = $CostParameter.startTime 
    $endTime = $CostParameter.endTime 
    $managementGroupDisplayName = $CostParameter.managementGroupDisplayName 
    $subscriptionName = $CostParameter.subscriptionName 
    $subscriptionId = $CostParameter.subscriptionId 
    $headers = $CostParameter.headers



   
    #$outFile = ".\$managementGroupDisplayName.$subscriptionName$startTime.$endTime.csv"
    
    # *** Rate Card ***

    $rateCardFilter = "OfferDurableId eq '$offerDurableId' and Currency eq '$currency' and Locale eq '$locale' and RegionInfo eq '$regionInfo'"
    $rateCardUri = "https://management.azure.com/subscriptions/$subscriptionId/providers/Microsoft.Commerce/RateCard?api-version=2016-08-31-preview&`$filter=$rateCardFilter"

    Write-Host "Querying Rate Card API"

    $rateCardResponse = Invoke-RestMethod $rateCardUri -Headers $headers -ContentType "application/json"

    $rateCard = @{}

    foreach ($meter in $rateCardResponse.Meters) {
        # Note, the following if statement can be written more compact, but due to readability, I've kept it this way

        if ($rateCard[$meter.MeterId]) {
            # A previous price was found

            if ($meter.EffectiveDate -gt $rateCard[$meter.MeterId].EffectiveDate) {
                # Found updated price for $meter.MeterId

                $rateCard[$meter.MeterId] = $meter
            }
        }
        else {
            # First time a price was found for $meter.MeterId

            $rateCard[$meter.MeterId] = $meter
        }
    }


    # *** Usage ***

    $usageUri = "https://management.azure.com/subscriptions/$subscriptionId/providers/Microsoft.Commerce/UsageAggregates?api-version=2015-06-01-preview&reportedStartTime=$startTime&reportedEndTime=$endTime&aggregationGranularity=Daily&showDetails=false"
    $usageRows = New-Object System.Collections.ArrayList

    Write-Host "Querying Azure Usage API"

    do {
        Write-Host "."

        $usageResult = Invoke-RestMethod $usageUri -Headers $headers -ContentType "application/json"

        foreach ($usageRow in $usageResult.value) {
            $usageRows.Add($usageRow) > $null
        }

        $usageUri = $usageResult.nextLink

        # If there's a continuation, then call API again
    } while ($usageUri)

    Write-Host "Organizing Data"

    foreach ($item in $usageRows) {
        # Fix "bug" in Usage API that return instanceData as a string instead of as JSON
        if ($item.properties.instanceData) {
            $item.properties.instanceData = ConvertFrom-Json $item.properties.instanceData
        }
    }

    $data = $usageRows | select -ExpandProperty properties

    foreach ($item in $data) {
        # Fix members to make them easier to consume

        $usageStartDate = (Get-Date $item.usageStartTime).ToShortDateString()
        $usageEndDate = (Get-Date $item.usageEndTime).ToShortDateString()

        $item | Add-Member "usageStartDate" $usageStartDate
        $item | Add-Member "usageEndDate" $usageEndDate
        $item | Add-Member "managementGroup" $managementGroupDisplayName
        $item | Add-Member "subscription" $subscriptionName  
        $item | Add-Member "location" $item.instanceData.'Microsoft.Resources'.location
        $item | Add-Member "resourceUri" $item.instanceData.'Microsoft.Resources'.resourceUri
        $item | Add-Member "additionalInfo" $item.instanceData.'Microsoft.Resources'.additionalInfo
        $item | Add-Member "tags" $item.instanceData.'Microsoft.Resources'.tags

        $tagList = $item.instanceData.'Microsoft.Resources'.tags
        $tags = $tagList -split (';')
        if ($tags) {
            foreach ($tag in $tags ) {
                try {  
                    $tagValue = $tag.split("=")
                    $name = $tagValue[0].Trim()
                    $item | Add-Member "tags.$name" $tagValue[1].Trim()
                }
                catch { 
                    Write-Host "An error occurred:"
                    Write-Host $_
            
                }
          
            }
        }
     

        $item.resourceUri -match "(?<=resourceGroups\/)(?<resourceGroup>.*)(?=\/providers)" | Out-Null
        $item | Add-Member "resourceGroup" $Matches.resourceGroup

        # Lookup pricing

        $meterRate0 = $rateCard[$item.meterId].MeterRates.0
        $total = $item.quantity * $MeterRate0

        $item | Add-Member "meterRate0" $meterRate0 # Use the first MeterRate and ignored tiered pricing for this calculation
        $item | Add-Member "total" $total
        $item | Add-Member "currency" $currency
    }

    # *** Fine tune result and only keep interesting information ***

    #$reportResult = $data | select usageStartDate, usageEndDate, managementGroup, subscription, location, meterName, meterCategory, meterSubCategory, quantity, unit, meterRate0, total, currency, resourceGroup, meterId, resourceUri, additionalInfo, tags
    $reportResult = $data 
    # *** Export to File ***

    #Write-Host "Exporting to $outFile"

    #$reportResult | Export-Csv $outFile -UseCulture -NoTypeInformation
    return $reportResult
    
}