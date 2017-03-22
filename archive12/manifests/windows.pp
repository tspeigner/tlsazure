# Creates a Defined Type for VMs
define azure::windows(
      $rg_name,
      $vm_name,
      $adminUsername,
      $adminPassword,
      $puppetMasterFqdn,
      $location,
      $size,
)
{
  azure_resource_group { $rg_name:
    ensure         => 'present',
    location       => $location,
  } ->

  azure_vm { $vm_name:
    ensure         => running,
    image          => 'MicrosoftWindowsServer:WindowsServer:2012-R2-Datacenter:latest',
    location       => $location,
    user           => $adminUsername,
    password       => $adminPassword,
    size           => $size,
    resource_group => $rg_name,
    extensions     => {
      'PuppetExtension' => {
        'auto_upgrade_minor_version' => true,
        'publisher'                  => 'Puppet',
        'type'                       => 'PuppetAgent',
        'type_handler_version'       => '1.5',
        'protected_settings'         => {
          'PUPPET_MASTER_SERVER'     => $puppetMasterFqdn
        },
      },
    },
  }
}
