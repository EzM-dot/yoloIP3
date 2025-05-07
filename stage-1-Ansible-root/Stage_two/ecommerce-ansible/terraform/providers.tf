provider "aws" {
  region = var.aws_region
  
  # Uncomment and configure these if not using AWS credentials file or environment variables
  # access_key = "your-access-key"
  # secret_key = "your-secret-key"
}

# Additional provider for the us-east-1 region (for ACM certificates)
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
  
  # Uncomment and configure these if not using AWS credentials file or environment variables
  # access_key = "your-access-key"
  # secret_key = "your-secret-key"
}
