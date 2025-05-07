#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Install required packages
echo "Installing required packages..."
sudo apt-get install -y \
    git \
    curl \
    python3-pip \
    python3-venv

# Install Ansible
if ! command -v ansible &> /dev/null; then
    echo "Installing Ansible..."
    sudo apt-get install -y ansible
fi

# Create Python virtual environment
echo "Setting up Python virtual environment..."
python3 -m venv ~/venv
source ~/venv/bin/activate

# Install Python dependencies
echo "Installing Python dependencies..."
pip install --upgrade pip
pip install docker

# Clone the repository if not already present
if [ ! -d "/vagrant/ansible" ]; then
    echo "Cloning repository..."
    git clone https://github.com/EzM-dot/yoloIP3.git /tmp/yoloIP3
    cp -r /tmp/yoloIP3/ansible /vagrant/
    rm -rf /tmp/yoloIP3
fi

# Run the Ansible playbook
echo "Running Ansible playbook..."
cd /vagrant/ansible
ansible-playbook -i inventory.ini vagrant-setup.yml --extra-vars "env=development"

echo "Provisioning complete! The application should be available at http://localhost:8080"
