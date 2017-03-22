# Creates a Defined Type for vmss_website
define pe_azure_demo::vmss_website(
      $department,
      $project,
      $rg_name,
      $adminUsername,
      $adminPassword,
      $puppetMasterFqdn,
      $location,
)
{
  azure_resource_group { $rg_name:
    ensure   => 'present',
    location => $location,
  } ->

  # Deploys a VM Scale Set Template
  azure_resource_template { "${rg_name}-dep":
    ensure         => 'present',
    content        => file('/Users/tommy/code/azureDeploy.json'),
    resource_group => $rg_name,
    params         => {
      'vmSku'            =>  'Standard_A1',
      'windowsOSVersion' => '2012-R2-Datacenter',
      'vmssName'         => $rg_name,
      'instanceCount'    => 1,
      'adminUsername'    => $adminUsername,
      'adminPassword'    => $adminPassword,
      'puppetMasterFqdn' => $puppetMasterFqdn,
      'department'       => $department,
      'project'          => $project,
      'createdby'        => $createdby,
    }
  }
}
