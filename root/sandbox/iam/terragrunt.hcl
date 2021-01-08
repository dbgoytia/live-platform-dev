
locals {
  aws_region   = "us-east-1"
}

# Generate an AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.aws_region}"
}
EOF
}

# Configure Terragrunt to automatically store tfstate files in an S3 bucket
remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "my-tfstate-${local.aws_region}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

terraform {
  source = "git::git@github.com:dbgoytia/iam-user-module-terraform.git"
}

inputs = {
  policy_name = "test-policy-tf"
  group_name  = "test-group-tf"
  user_name   = "test-user-tf"
}

