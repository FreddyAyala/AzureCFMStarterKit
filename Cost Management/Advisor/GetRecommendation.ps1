#Install Az.Advisor Module if not exists.
#Install-Module -Name Az.Advisor -Scope CurrentUser

#List all Azure subscriptions
$subscriptionIds = Get-AzSubscription
foreach ($subscription in $subscriptionIds) {
    #Change the Subscription
    Set-AzContext -Subscription $subscription
    #Get the information of Azure Reservation consumption usage details
    $info = Get-AzAdvisorRecommendation 
    #Save the information to Microsoft Excel CSV files with subscription id in the name of file
    $info | Export-Csv -NoTypeInformation -Path "C:\temp\$($subscription.name).csv"
}