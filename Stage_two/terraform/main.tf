
terraform {
  required_providers {
    vagrant = {
      source = "hashicorp/vagrant"
      version = "~> 2.3.0"
    }
  }
}

provider "vagrant" {
  # Configuration options
}

# Create a Vagrant machine
resource "vagrant_vm" "app_server" {
  box = "ubuntu/focal64"  # Ubuntu 20.04 LTS
  name = "app-server"
  hostname = "app-server"
  
  # Network configuration
  network {
    type = "private_network"
    ip = "192.168.56.10"
  }
  
  # Resource allocation
  cpus = 2
  memory = 2048
  
  # Ansible provisioning will be handled by the playbook
  
  # Output the VM's IP address for Ansible
  provisioner "local-exec" {
    command = "echo 'app-server ansible_host=192.168.56.10' > ../../inventory.ini"
  }
}

# Output the VM's IP address for reference
output "app_server_ip" {
  value = "192.168.56.10"
}
