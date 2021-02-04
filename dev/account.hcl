# Set account-wide variables. These are automatically pulled in to configure the remote state bucket in the root
# terragrunt.hcl configuration.
locals {
  account_name   = "dev"
  aws_account_id = "608994313921"
  aws_profile    = "terraform_user_dev"
}