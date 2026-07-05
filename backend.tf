# Fill in with your own remote state backend before running `terraform init`.
# terraform {
#   backend "s3" {
#     bucket         = "your-tfstate-bucket"
#     key            = "eks-cluster/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-locks"
#     encrypt        = true
#   }
# }
