# Creates a Defined Type for Three Tier Application
define pe-azure-demo::resource_group(
      $rg_name,
      $location,
      $vm_size,
      $template_location,
      $department,
      $project,
      $created_by,
)
{
  azure_resource_group { $rg_name:
    ensure         => 'present',
    location       => $location,
  } ->

  azure_resource_template { "${rg-name}-dep":
    ensure         => 'present',
    content        => $template_location),
    resource_group => $rg_name,
    params         => {
      'vmSku'            => $vm_size
      'department'       => $department,
      'project'          => $project,
      'createdby'        => $created_by,
    }
  }
}
