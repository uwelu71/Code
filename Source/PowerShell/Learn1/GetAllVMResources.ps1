# Connect to your Azure account
Connect-AzAccount
Get-Module Az.Compute

# Get all VM resources
$VMResources = Get-AzVM

# Create an array list to hold VM details
$vmdetails = New-Object System.Collections.ArrayList

# Loop through each VM
foreach ($VM in $VMResources) {
    $singleVMDetails = [ordered]@{
        "VMName" = $VM.Name
        "ResourceGroupName" = $VM.ResourceGroupName
        "Status" = $VM.Statuses.DisplayStatus
        "OSType" = $VM.StorageProfile.OsDisk.OsType
        "Location" = $VM.Location
        "SubscriptionName" = (Get-AzContext).Subscription.Name
    }
    $vmdetails.Add((New-Object PSObject -Property $singleVMDetails))
}

# Display or export the VM details as needed
$vmdetails | Format-Table -AutoSize