# Licensed under the MIT license.
# Copyright (C) 2022 Freddy Ayala
# Based on the original script of Kristofer Liljeblad (https://gist.github.com/krist00fer/9e8ff18ac4f22863d41aec0753ebdac4)

# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, 
# publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
# FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


# Get-AzureUsageCost

# The following script iterates all the subscriptions from all the management groups and then returns the Azure Usage from a specific Subscription ID, 
# collects a Rate Card and applies the correct cost
# to the specified resource. The script uses the latest reported price and only the first tier of any resources with tiered pricing.
# For authentication this script uses an Azure AD Application with associated tenant id, client id, client password and certificate. Before running
# this script, make sure you create such an Azure AD Application and assigns the appropriate permission to it.

Import-Module -Name .\Costs.ps1 -Verbose

# Replace the following configuration settings

$tenantId = ""
$clientId = ""
$certificatePassword = ""
$subscriptionId = ""
$certificatePath = "Certificate.pfx"


# *** Login ****
#Use a service principal with certificate

$securePassword = ConvertTo-SecureString -String $certificatePassword -AsPlainText -Force
Connect-AzAccount -WarningAction SilentlyContinue -InformationAction SilentlyContinue -ApplicationId $clientId -CertificatePath $certificatePath -CertificatePassword $securePassword -ServicePrincipal -Tenant $tenantId

$Token = $(Get-AzAccessToken).Token 

# Rate Card Settings
$offerDurableId = "MS-AZR-0003p" #Pay-As-You-Go
$currency = "EUR" # "SEK"
$locale = "en-US" # "sv-SE"
$regionInfo = "FR" # "SE"

# Usage Settings
$startTime = "2022-01-01"
$endTime = "2022-01-31"




# Use the same header in all the calls, so save authorization in a header dictionary

$headers = @{
    authorization = "Bearer $Token"
}


# *** Management Groups***

# Get all the management groups

$managementGroupsURI = "https://management.azure.com/providers/Microsoft.Management/managementGroups?api-version=2020-05-01"
Write-Host "Getting Management Groups"

$managementGroupesponse = Invoke-RestMethod $managementGroupsURI -Headers $headers -ContentType "application/json"
$consolidatedResults = @()
$CostParameter = New-Object PSObject
$CostParameter | Add-Member -NotePropertyName 'offerDurableId' -NotePropertyValue '' -Force
$CostParameter | Add-Member -NotePropertyName 'currency' -NotePropertyValue '' -Force
$CostParameter | Add-Member -NotePropertyName 'locale' -NotePropertyValue '' -Force
$CostParameter | Add-Member -NotePropertyName 'regionInfo' -NotePropertyValue '' -Force
$CostParameter | Add-Member -NotePropertyName 'startTime' -NotePropertyValue '' -Force
$CostParameter | Add-Member -NotePropertyName 'endTime' -NotePropertyValue '' -Force
$CostParameter | Add-Member -NotePropertyName 'managementGroupDisplayName' -NotePropertyValue '' -Force
$CostParameter | Add-Member -NotePropertyName 'subscriptionName' -NotePropertyValue '' -Force
$CostParameter | Add-Member -NotePropertyName 'subscriptionId' -NotePropertyValue '' -Force
$CostParameter | Add-Member -NotePropertyName 'headers' -NotePropertyValue '' -Force
New-Item -ItemType Directory -Force -Path ".\output\"

foreach ($managementGroup in $managementGroupesponse.value) {
    $managementGroupDisplayName = $managementGroup.properties.displayName
    $managementGroupId = $managementGroup.id

    Write-Host $managementGroupDisplayName

    $getSubsMngGroupURL = "https://management.azure.com/$managementGroupId/subscriptions?api-version=2020-05-01"
    $subsMgmResponse = Invoke-RestMethod $getSubsMngGroupURL -Headers $headers -ContentType "application/json"
    
    foreach ($subscription in $subsMgmResponse.value) {
        
        $subscriptionName = $subscription.properties.displayName
        Write-Host "--> $subscriptionName"

           
        $subscriptionIdArray = $subscription.id.Split("/")
        $subscriptionId = $subscriptionIdArray[$subscriptionIdArray.Length - 1]

        $CostParameter.offerDurableId = $offerDurableId 
        $CostParameter.currency = $currency 
        $CostParameter.locale = $locale 
        $CostParameter.regionInfo = $regionInfo 
        $CostParameter.startTime = $startTime 
        $CostParameter.endTime = $endTime 
        $CostParameter.managementGroupDisplayName = $managementGroupDisplayName 
        $CostParameter.subscriptionName = $subscriptionName 
        $CostParameter.subscriptionId = $subscriptionId 
        $CostParameter.headers = $headers

        $reportResult = GetCosts  $CostParameter 
        $reportResult | Export-Csv ".\output\$endTime-$subscriptionName-AzureCostManagementReport.csv"-UseCulture -NoTypeInformation
        $consolidatedResults = $consolidatedResults + $reportResult
        
    }

}
 

$consolidatedResults | Export-Csv ".\output\$endTime-AzureCostManagementReport.csv"-UseCulture -NoTypeInformation

