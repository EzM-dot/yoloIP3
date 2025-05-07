variable "aws_region" {
  description = "AWS region to launch servers"
  type        = string
  default     = "us-east-1"
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 1
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair to use"
  type        = string
  default     = "your-key-pair-name"
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
  type        = string
  default     = ""
}

variable "volume_size" {
  description = "Size of the root volume in GB"
  type        = number
  default     = 20
}
