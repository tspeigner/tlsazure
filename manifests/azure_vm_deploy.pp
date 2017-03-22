class pe_azure_demo::azure_vm_deploy {
  azure_vm { 'tls322':
    image          => 'canonical:ubuntuserver:14.04.2-LTS:latest',
    location       => $location,
    user           => 'sampleuser',
    password       => 'SpecPass123!@#$%',
    size           => 'Standard_A0',
    resource_group => 'tommy_test',
  }

  azure_vm { 'tlwinone':
    image		=> 'MicrosoftWindowsServer:WindowsServer:2012-R2-Datacenter:latest',
    location		=> 'westus',
    user		=> 'sampleuser',
    password		=> 'SpecPass123!!!',
    size		=> 'Standard_A0',
    resource_group	=> 'tommy_test',
  }
}
