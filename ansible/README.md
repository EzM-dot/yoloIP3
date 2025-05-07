# YOLO Application Deployment with Ansible

This Ansible playbook automates the deployment of the YOLO application stack, including the backend, frontend, MongoDB, and Nginx.

## Prerequisites

- Ansible 2.9+
- Docker
- Docker Compose
- Python 3.6+

## Directory Structure

```
ansible/
├── deploy.yml               # Main playbook
├── inventory.ini            # Inventory file
├── group_vars/              # Group variables
│   ├── all.yml              # Common variables
│   └── development.yml      # Development environment variables
└── roles/
    ├── common/             # Common system setup
    ├── backend/             # Backend application
    ├── frontend/            # Frontend application
    ├── mongodb/             # MongoDB database
    └── nginx/               # Nginx reverse proxy
```

## Usage

1. Update the `inventory.ini` file with your server details.
2. Configure environment-specific variables in `group_vars/`.
3. Run the playbook:

```bash
# For development environment
ansible-playbook -i inventory.ini deploy.yml --limit development

# For production environment
ansible-playbook -i inventory.ini deploy.yml --limit production
```

## Docker Reference Files

Reference Docker configuration files are automatically saved to `/home/{{ user }}/docker-reference/` during deployment. These include:

- `backend-Dockerfile`: For the Node.js backend service
- `frontend-Dockerfile`: For the React frontend
- `nginx.conf`: Nginx configuration for the frontend

To upload these files to your Docker Hub account:

```bash
ansible-playbook -i inventory.ini upload-docker-reference.yml
```

## Tags

Use tags to run specific parts of the playbook:

```bash
# Run only backend tasks
ansible-playbook -i inventory.ini deploy.yml --tags backend

# Run only database tasks
ansible-playbook -i inventory.ini deploy.yml --tags database

# Run only nginx configuration
ansible-playbook -i inventory.ini deploy.yml --tags nginx

# Skip saving Docker reference files
ansible-playbook -i inventory.ini deploy.yml -e "docker_save_reference=false"
```

## Variables

### Common Variables (`group_vars/all.yml`)

- `app_name`: Application name
- `user`: System user for deployment
- `group`: System group for deployment
- `app_port`: Application port
- `frontend_port`: Frontend port
- `mongodb_port`: MongoDB port
- `docker_compose_version`: Docker Compose version
- `app_dir`: Application directory

### Development Variables (`group_vars/development.yml`)

- `backend_image`: Backend Docker image name
- `frontend_image`: Frontend Docker image name
- `mongodb_image`: MongoDB Docker image
- `mongodb_volume`: MongoDB volume name
- `api_endpoint`: API endpoint URL

## Security Notes

- Store sensitive information (passwords, API keys) in Ansible Vault.
- Use proper firewall rules in production.
- Regularly update Docker images and system packages.
