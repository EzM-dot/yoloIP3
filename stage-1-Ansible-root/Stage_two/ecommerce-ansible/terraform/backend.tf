terraform {
  backend "s3" {
    # This will be configured at runtime
    # bucket = "your-terraform-state-bucket"
    # key    = "ecommerce/terraform.tfstate"
    # region = "us-east-1"
  }
}
