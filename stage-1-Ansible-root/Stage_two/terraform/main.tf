
terraform {
  required_providers {
    vagrant = {
      source = "hashicorp/vagrant"
      version = "~> 2.3.0"
    }
  }
}

provider "vagrant" {
}


resource "vagrant_vm" "app_server" {
  box = "ubuntu/focal64"  # Ubuntu 20.04 LTS
  name = "app-server"
  hostname = "app-server"
  

  network {
    type = "private_network"
    ip = "192.168.56.10"
  }
  
  cpus = 2
  memory = 2048
  
  provisioner "local-exec" {
    command = "cd ../ansible && ansible-playbook -i inventory.ini playbook.yml"
  }
}
