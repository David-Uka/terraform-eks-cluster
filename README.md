# terraform-eks-cluster

Reusable Terraform modules to stand up a production-ready VPC + EKS cluster
on AWS, with remote state, CI validation, and security scanning baked in.

## Structure
- `modules/vpc` — VPC, public/private subnets, NAT gateways, route tables
- `modules/eks` — EKS cluster, managed node groups, IRSA-ready OIDC provider
- root — wires modules together, remote backend config

## Usage
```hcl
module "vpc" {
  source   = "./modules/vpc"
  name     = "example"
  vpc_cidr = "10.0.0.0/16"
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = "example"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnet_ids
  cluster_version = "1.29"
}
```

## Remote state
Configure `backend.tf` with your own S3 bucket + DynamoDB lock table before
`terraform init`.

## CI
GitHub Actions runs `fmt -check`, `validate`, `tflint`, and `tfsec` on every PR.

## Requirements
- Terraform >= 1.6
- AWS provider ~> 5.0
