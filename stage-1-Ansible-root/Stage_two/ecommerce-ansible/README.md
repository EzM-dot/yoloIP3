# E-commerce Platform Deployment with Ansible

This repository contains Ansible playbooks and Terraform configurations to deploy a containerized e-commerce platform on AWS.

## Prerequisites

- Ansible 2.9+
- Terraform 1.0+
- AWS Account with appropriate permissions
- AWS CLI configured with credentials
- SSH key pair in AWS and locally
- Python 3.8+
- Docker and Docker Compose

## Project Structure

```
ecommerce-ansible/
├── group_vars/           # Group variables for all hosts
├── host_vars/            # Host specific variables
├── roles/                # Ansible roles
│   ├── backend/          # Backend service configuration
│   ├── common/           # Common system setup
│   ├── database/         # Database services
│   ├── docker/           # Docker installation and setup
│   ├── frontend/         # Frontend service
│   ├── nginx/            # Nginx reverse proxy
│   ├── terraform/        # Infrastructure as Code
│   └── tests/            # Test automation
├── site.yml              # Main playbook
├── inventory.ini         # Inventory file
└── terraform/            # Terraform configurations
    ├── main.tf           # Main Terraform configuration
    ├── variables.tf      # Variable definitions
    ├── outputs.tf        # Output values
    └── terraform.tfvars  # Variable values
```

## Getting Started

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd ecommerce-ansible
   ```

2. **Configure AWS credentials**
   Ensure you have AWS credentials configured:
   ```bash
   aws configure
   ```

3. **Update variables**
   Edit `group_vars/all.yml` and `terraform/terraform.tfvars` with your configuration.

4. **Run the playbook**
   ```bash
   ansible-playbook -i inventory.ini site.yml
   ```

## Variables

Key variables that need to be configured:

- `aws_region`: AWS region to deploy to
- `key_name`: Name of your AWS key pair
- `domain_name`: Your domain name
- `db_password`: Database password
- `redis_password`: Redis password
- `secret_key`: Django secret key

## Security

- **Secrets Management**: Use Ansible Vault for sensitive data
- **Network Security**: Security groups restrict access to necessary ports
- **Updates**: Regular security updates are applied

## Monitoring

- **Metrics**: System and application metrics collection
- **Logging**: Centralized logging setup
- **Alerts**: Configured for critical events

## Scaling

The infrastructure is designed to scale horizontally. Update the `instance_count` in `terraform.tfvars` to scale the number of instances.

## Testing

Run the test suite:

```bash
ansible-playbook -i inventory.ini tests/run.yml
```

## Cleanup

To destroy all resources:

```bash
cd terraform
terraform destroy
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Support

For support, please open an issue in the GitHub repository.

## Acknowledgements

- [Ansible Documentation](https://docs.ansible.com/)
- [Terraform Documentation](https://www.terraform.io/docs/)
- [AWS Documentation](https://aws.amazon.com/documentation/)
