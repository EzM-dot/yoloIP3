# Stage Two: Terraform + Ansible Deployment

This directory contains the infrastructure as code and configuration management setup for the application deployment.

## Directory Structure

```
.
├── ansible/
│   ├── inventory.ini         # Ansible inventory file
│   ├── playbook.yml         # Main playbook
│   └── roles/               # Ansible roles
│       └── app_deployment/   # Application deployment role
│           ├── tasks/
│           ├── templates/
│           └── ...
└── terraform/
    └── main.tf            # Terraform configuration
```

## Prerequisites

1. Install required tools:
   - Vagrant
   - VirtualBox
   - Terraform
   - Ansible

## Usage

1. Navigate to the terraform directory:
   ```bash
   cd terraform/
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Apply the Terraform configuration:
   ```bash
   terraform apply
   ```

   This will:
   - Create a Vagrant VM
   - Run the Ansible playbook to configure the server
   - Deploy the application using Docker containers

## Accessing the Application

- Frontend: http://192.168.56.10:3000
- Backend API: http://192.168.56.10:5000

## Notes

- The VM is configured with 2 vCPUs and 2GB RAM
- Docker and Docker Compose are installed automatically
- The application is deployed using containers defined in docker-compose.yml
