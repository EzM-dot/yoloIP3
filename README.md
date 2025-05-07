# E-commerce Platform Deployment

This project involves the containerization and deployment of a full-stack e-commerce platform using Docker, Ansible, and Terraform.

## Docker Configuration Files

### Core Dockerfiles
- `stage-1-Ansible-root/Stage_two/ecommerce-ansible/dockerfiles/backend/Dockerfile` - Backend service (Django/Node.js)
- `stage-1-Ansible-root/Stage_two/ecommerce-ansible/dockerfiles/frontend/Dockerfile` - Frontend service (Next.js)
- `stage-1-Ansible-root/Stage_two/ecommerce-ansible/dockerfiles/nginx/Dockerfile` - Nginx reverse proxy

### Docker Compose
- `stage-1-Ansible-root/Stage_two/ecommerce-ansible/docker-compose.yml` - Defines all services and their configurations
- `stage-1-Ansible-root/Stage_two/ecommerce-ansible/.env.example` - Example environment variables template

## Requirements

- [Docker](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Quick Start

1. Copy environment file:
   ```bash
   cp stage-1-Ansible-root/Stage_two/ecommerce-ansible/.env.example stage-1-Ansible-root/Stage_two/ecommerce-ansible/.env
   ```

2. Update the `.env` file with your configuration

3. Build and start the services:
   ```bash
   cd stage-1-Ansible-root/Stage_two/ecommerce-ansible
   docker-compose up --build
   ```

## Application Access

- Frontend: http://localhost:3003
- Backend API: http://localhost:8000
- Nginx: http://localhost (port 80/443)

## Infrastructure

- AWS EC2 for application servers
- RDS PostgreSQL for database
- ElastiCache Redis for caching
- Managed using Terraform and Ansible
