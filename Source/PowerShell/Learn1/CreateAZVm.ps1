# Variables
$ResourceGroup = "rg-myululab01-vms"
$Location = "eastus"
$VMName = "vm-srv01"

New-AzResourceGroup -Name $ResourceGroup -Location $Location
$cred = Get-Credential -Message "Enter a username and password for the virtual machine."

# Create VM
$vmParams = @{
    ResourceGroupName = $ResourceGroup
    Name = $VMName
    Location = $Location
    ImageName = 'Win2016Datacenter'
    PublicIpAddressName = 'pubip-myululab01-vm-srv01'
    Credential = $cred
    OpenPorts = 3389
    Size = 'Standard_D2s_v3'
  }
  $newVM1 = New-AzVM @vmParams

# Get Information about Name and AdminUserName
  $newVM1.OSProfile | Select-Object -Property ComputerName, AdminUserName

# Get VM Name and Private IP
  $newVM1 | Get-AzNetworkInterface |
  Select-Object -ExpandProperty IpConfigurations |
    Select-Object -Property Name, PrivateIpAddress
    
# Get Public IP and FQDN
    $publicIp = Get-AzPublicIpAddress -Name pubip-myululab01-vm-srv01 -ResourceGroupName $ResourceGroup

    $publicIp |
      Select-Object -Property Name, IpAddress, @{label='FQDN';expression={$_.DnsSettings.Fqdn}}