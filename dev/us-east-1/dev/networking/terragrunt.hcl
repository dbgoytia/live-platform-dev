locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract out common variables for reuse
  env = local.environment_vars.locals.environment
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:dbgoytia/networks-tf.git?ref=v1.2"
}

inputs = {
  vpc_cidr_block = "10.0.0.0/24"
  public_subnets_cidrs = ["10.0.0.128/26", "10.0.0.192/26"]
  create_natted_subnet = true
  private_subnets = ["10.0.0.0/27", "10.0.0.32/27", "10.0.0.64/27", "10.0.0.96/27"]
  azs = ["us-east-1a", "us-east-1d"]
  region = "us-east-1"
}


