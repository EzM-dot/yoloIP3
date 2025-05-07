provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "app_server" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  subnet_id              = var.subnet_id != "" ? var.subnet_id : null
  
  tags = {
    Name = "app-server-${count.index + 1}"
  }

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp2"
  }
}

resource "aws_security_group" "app_sg" {
  name        = "app-server-sg"
  description = "Security group for application servers"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_ips" {
  description = "Public IP addresses of the created instances"
  value       = aws_instance.app_server[*].public_ip
}
