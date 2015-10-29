# Set our default provider for this Vagrantfile to 'vmware_appcatalyst'
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'vmware_appcatalyst'
 
nodes = [
  { hostname: 'pos-1', box: 'vmware/photon' },
  { hostname: 'pos-2', box: 'vmware/photon' }
]
 
Vagrant.configure('2') do |config|
 
  # Configure our boxes with 1 CPU and 384MB of RAM
  config.vm.provider 'vmware_appcatalyst' do |v|
    v.vmx['numvcpus'] = '1'
    v.vmx['memsize'] = '400'
  end
 
  # Go through nodes and configure each of them
  nodes.each do |node|
    config.vm.define node[:hostname] do |node_config|
      node_config.vm.box = node[:box]
      node_config.vm.hostname = node[:hostname]
      node_config.vm.provision "shell", path: "bootstrap.sh"
    end
    #config.vm.provision "shell", path: "bootstrap.sh"
  end
end
