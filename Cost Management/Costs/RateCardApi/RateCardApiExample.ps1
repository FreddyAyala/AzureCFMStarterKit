# PowerShell Snippet for calling Azure Resource Manager REST API to enumerate Rate Card meters

# Authenticate to Azure - can automate with Azure AD Service Principal credentials

Login-AzAccount

# Select Azure Subscription - can automate with specific Azure subscriptionId

    $subscriptionId = 
        (Get-AzSubscription |
         Out-GridView `
            -Title "Select an Azure Subscription ..." `
            -PassThru).SubscriptionId

# Set Azure AD Tenant for selected Azure Subscription

    $adTenant = 
        (Get-AzSubscription `
            -SubscriptionId $subscriptionId).TenantId

# Set parameter values for Azure AD auth to REST API

    $clientId = "1950a258-227b-4e31-a9cf-717495945fc2" # Well-known client ID for Azure PowerShell

    $redirectUri = "urn:ietf:wg:oauth:2.0:oob" # Redirect URI for Azure PowerShell

    $resourceAppIdURI = "https://management.core.windows.net/" # Resource URI for REST API

    $authority = "https://login.windows.net/$adTenant" # Azure AD Tenant Authority

# Load ADAL Assemblies

    $adal = "${env:ProgramFiles(x86)}\Microsoft SDKs\Azure\PowerShell\ServiceManagement\Azure\Services\Microsoft.IdentityModel.Clients.ActiveDirectory.dll"

    $adalforms = "${env:ProgramFiles(x86)}\Microsoft SDKs\Azure\PowerShell\ServiceManagement\Azure\Services\Microsoft.IdentityModel.Clients.ActiveDirectory.WindowsForms.dll"

    Add-Type -Path $adal

    Add-Type -Path $adalforms

# Create Authentication Context tied to Azure AD Tenant

    $authContext = New-Object "Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext" -ArgumentList $authority

# Acquire token

    $authResult = $authContext.AcquireToken($resourceAppIdURI, $clientId, $redirectUri, "Auto")

# Create Authorization Header

    $authHeader = $authResult.CreateAuthorizationHeader()

# Set REST API parameters

    $apiVersion = "2015-06-01-preview"

    $contentType = "application/json;charset=utf-8"

    $offerId = "MS-AZR-0015P"

    $currencyId = "USD"

    $localeId = "en-US"

    $regionId = "US"

# Set HTTP request headers to include Authorization header

    $requestHeader = @{"Authorization" = $authHeader}

# Set initial URI for calling Azure Resource Manager REST API

    $uri = "https://management.azure.com/subscriptions/$subscriptionId/providers/Microsoft.Commerce/RateCard?api-version=$apiVersion&`$filter=OfferDurableId eq '$offerId' and Currency eq '$currencyId' and Locale eq '$localeId' and RegionInfo eq '$regionId'"

# Call Azure Resource Manager REST API

    $result = Invoke-RestMethod `
        -Uri $Uri `
        -Method Get `
        -Headers $requestHeader `
        -ContentType $contentType

# Display Rate Card Meters

    $result.Meters