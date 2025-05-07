output "app_server_private_ip" {
  description = "Private IP address of the application server"
  value       = var.private_ip
}

output "app_server_ssh_command" {
  description = "Command to SSH into the application server"
  value       = "ssh -i ~/.ssh/id_rsa ubuntu@${var.private_ip}"
}

output "app_url" {
  description = "URL to access the application"
  value       = "http://${var.private_ip}:3000"
}

output "api_url" {
  description = "URL to access the API"
  value       = "http://${var.private_ip}:5000"
}