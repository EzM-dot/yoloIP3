output "app_public_ips" {
  description = "Public IP addresses of the application servers"
  value       = aws_instance.app_server[*].public_ip
}

output "db_endpoint" {
  description = "Endpoint for the PostgreSQL database"
  value       = aws_db_instance.postgres.endpoint
}

output "redis_endpoint" {
  description = "Endpoint for the Redis cache"
  value       = aws_elasticache_cluster.redis.cache_nodes[0].address
}

output "application_url" {
  description = "URL to access the application"
  value       = "http://${aws_instance.app_server[0].public_ip}"
}
