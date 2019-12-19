terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-vpc.git?ref=v2.21.0"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name = "prod"

  # Visual subnet calculator - http://www.davidc.net/sites/default/subnets/subnets.html?network=10.10.0.0&mask=16&division=31.f4627231
  cidr = "10.10.0.0/16"

  azs = ["us-east-1a", "us-east-1b", "us-east-1c"]

  private_subnets = ["10.10.0.0/20", "10.10.16.0/20", "10.10.32.0/20"]

  public_subnets = ["10.10.64.0/20", "10.10.80.0/20", "10.10.96.0/20"]

  enable_dns_hostnames = true

  enable_dns_support = true

  tags = {
    Environment = "prod"
  }
}