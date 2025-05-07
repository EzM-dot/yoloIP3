#!/bin/bash

# Install Vagrant if not already installed
if ! command -v vagrant &> /dev/null; then
    echo "Installing Vagrant..."
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install -y vagrant
fi

# Install VirtualBox if not already installed
if ! command -v vboxmanage &> /dev/null; then
    echo "Installing VirtualBox..."
    sudo apt update
    sudo apt install -y virtualbox
fi

# Install Ansible if not already installed
if ! command -v ansible &> /dev/null; then
    echo "Installing Ansible..."
    sudo apt update
    sudo apt install -y ansible
fi

echo "Vagrant setup complete! Run 'vagrant up' to start the VM."
