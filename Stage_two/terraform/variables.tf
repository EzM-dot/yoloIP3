variable "vm_name" {
  description = "Name of the Vagrant VM"
  type        = string
  default     = "app-server"
}

variable "vm_hostname" {
  description = "Hostname of the Vagrant VM"
  type        = string
  default     = "app-server"
}

variable "vm_box" {
  description = "Base box to use for the VM"
  type        = string
  default     = "ubuntu/focal64"
}

variable "private_ip" {
  description = "Private IP address for the VM"
  type        = string
  default     = "192.168.56.10"
}

variable "cpus" {
  description = "Number of CPUs for the VM"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Amount of memory in MB for the VM"
  type        = number
  default     = 2048
}
