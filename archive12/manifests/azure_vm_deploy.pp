class azure_vm_deploy {
  pe_azure_demo::vmss_website { 'tls_test':
        ensure           => running,
        project          => 'child',
        rg_name          => 'tommy',
        adminUsername    => 'administrator',
        adminPassword    => 'puppetlabs',
        puppetMasterFqdn => 'master.inf.puppet.vm',
        location         => $location,
  }
  azure_vm { 'tls_test_1':
  department     => 'eng',
  image          => 'canonical:ubuntuserver:14.04.2-LTS:latest',
  location       => 'eastus',
  user           => 'sampleuser',
  password       => 'SpecPass123!@#$%',
  size           => 'Standard_A0',
  resource_group => 'group',
  }
}
