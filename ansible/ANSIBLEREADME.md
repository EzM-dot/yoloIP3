
This document provides an overview of the Ansible-based deployment setup for the YOLO IP3 application.

Directory Structure

```
ansible/
├── deploy.yml                  # Main deployment playbook
├── inventory.ini               # Inventory file with environment definitions
├── group_vars/                 # Group variables
│   ├── all.yml                # Common variables for all environments
│   └── development.yml        # Development environment variables
└── roles/
    ├── common/               # Common system setup tasks
    │   └── tasks/main.yml
    │
    ├── mongodb_container/     # MongoDB container management
    │   └── tasks/main.yml
    │
    ├── backend_container/     # Backend service container
    │   ├── tasks/main.yml
    │   └── templates/backend-env.j2
    │
    ├── frontend_container/    # Frontend service container
    │   ├── tasks/main.yml
    │   └── templates/frontend-env.j2
    │
    ├── nginx/                # Nginx reverse proxy
    │   ├── tasks/main.yml
    │   └── templates/nginx-site.j2
    │
    └── dockerfiles/          # Docker reference files
        └── tasks/main.yml
```

## Prerequisites

- Ansible 2.9+
- Docker
- Python 3.6+
- Docker SDK for Python

## Configuration

### Environment Variables

1. **Common Variables** (`group_vars/all.yml`):
   - Application name and directory structure
   - Network ports and settings
   - Docker configurations
   - Service image names and paths

2. **Development Variables** (`group_vars/development.yml`):
   - Development-specific overrides
   - Debug settings
   - Local development endpoints

### Inventory

Edit `inventory.ini` to define your target environments and hosts:

```ini
[development]
localhost ansible_connection=local

[production]

```

## Local Development with Vagrant

### Prerequisites

1. Install VirtualBox
2. Install Vagrant
3. Install Ansible

Or run the setup script:

```bash
chmod +x ansible/setup-vagrant.sh
./ansible/setup-vagrant.sh
```

### Start the Vagrant VM

```bash
cd /path/to/yoloIP3
vagrant up
```

This will:
1. Start a new Ubuntu VM
2. Install all required dependencies
3. Clone the repository
4. Set up Docker and Docker Compose
5. Build and start all services

### Access the Application

Once provisioning is complete, access the application at:
- Frontend: http://localhost:8083
- Backend API: http://localhost:5000

### Managing the VM

- Stop the VM: `vagrant halt`
- Restart the VM: `vagrant reload`
- Re-provision: `vagrant provision`
- SSH into the VM: `vagrant ssh`
- Destroy the VM: `vagrant destroy`

## Manual Deployment

### Development Environment

```bash
ansible-playbook -i inventory.ini deploy.yml --limit development
```

### Production Environment

```bash
ansible-playbook -i inventory.ini deploy.yml --limit production
```

## Role Descriptions

### Common Role
- System updates and package installation
- Docker and Docker Compose setup
- Common user and directory setup

### MongoDB Container Role
- MongoDB container deployment
- Volume management for data persistence
- Network configuration

### Backend Container Role
- Backend service build and deployment
- Environment variable management
- Dependency installation

### Frontend Container Role
- Frontend application build
- Static file serving
- Environment configuration

### Nginx Role
- Reverse proxy configuration
- SSL/TLS termination
- Static file serving
- Load balancing (if needed)

## Tags

Run specific parts of the deployment using tags:

```bash
ansible-playbook -i inventory.ini deploy.yml --tags common

ansible-playbook -i inventory.01.ini deploy.yml --tags database

ansible-playbook -i inventory.ini deploy.yml --tags app

ansible-playbook -i inventory.ini deploy.yml --tags proxy

ansible-playbook -i inventory.ini deploy.yml --tags docker
```

## Maintenance

### Updating Services

1. Update the relevant service code
2. Update the version in the appropriate `group_vars` file
3. Run the deployment playbook

### Accessing Logs

```bash
docker logs yolo-app-backend

docker logs yolo-app-frontend

docker logs yolo-app-mongodb
```

## Troubleshooting

1. **Docker Permissions**
   Ensure the Ansible user has permissions to manage Docker:
   ```bash
   sudo usermod -aG docker $USER
   ```

2. **Port Conflicts**
   Check for port conflicts if services fail to start:
   ```bash
   sudo lsof -i :80
   ```

3. **View Container Status**
   ```bash
   docker ps -a
   docker-compose -f /opt/yolo-app/docker-compose.yml ps
   ```

## Security Considerations

- Use Ansible Vault for sensitive data
- Configure proper firewall rules
- Regularly update Docker images
- Use non-root users in containers
- Implement proper logging and monitoring