terraform {
  source = "git::git@github.com:dimagv/tf-modules.git//modules/terraform-aws-security-group?ref=v1.2.3"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  # Name of security group
  name = "acme-prod-alb"

  # Description for security group
  description = "Security group for the public Application Load Balancer"

  # ID of the VPC where to create security group
  vpc_id = dependency.vpc.outputs.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_rules = ["http-80-tcp", "https-443-tcp"]

  egress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}