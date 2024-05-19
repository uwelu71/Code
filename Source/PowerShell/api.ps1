# Get-Token.ps1
$tenantId = "YOUR_TENANT_ID"
$clientId = "YOUR_APPLICATION_ID"
$clientSecret = "YOUR_SECRET"

# Request a token
$tokenUrl = "https://login.microsoftonline.com/$tenantId/oauth2/token"
$body = @{
    grant_type    = "client_credentials"
    client_id     = $clientId
    client_secret = $clientSecret
    resource      = "https://api.security.microsoft.com"
}
$response = Invoke-RestMethod -Uri $tokenUrl -Method POST -ContentType "application/x-www-form-urlencoded" -Body $body
$token = $response.access_token

# Use the token to fetch incidents
$incidentsUrl = "https://api.security.microsoft.com/api/incidents"
$headers = @{
    Authorization = "Bearer $token"
}
$incidents = Invoke-RestMethod -Uri $incidentsUrl -Headers $headers
$incidents | Format-Table -Property IncidentId, Title, CreatedTime
