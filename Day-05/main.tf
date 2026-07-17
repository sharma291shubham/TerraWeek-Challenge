# Root module: resolve shared lookups ONCE, then call our reusable module.

# --- Shared data sources (resolved a single time, passed into every module) ---

data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

# This example uses your account's DEFAULT VPC for convenience.
# ⚠️ Prerequisite: a default VPC must exist in this region. If it was deleted,
# either recreate it (`aws ec2 create-default-vpc`) or point subnet_id /
# vpc_security_group_ids at the VPC you built on Day 3.
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default.id
  name   = "default"
}

locals {
  subnet_id          = data.aws_subnets.default.ids[0]
  security_group_ids = [data.aws_security_group.default.id]
}

# 1) A single instance — pass inputs, read outputs.
module "labels" {
  source                 = "git::https://github.com/sharma291shubham/terraweek-terraform-modules.git//labels?ref=v1.0.0"
  environment            = "dev"
  name                   = "web"

  extra_tags = {
    Role = "frontend"
  }
}

module "web_server" {
  source                 = "git::https://github.com/sharma291shubham/terraweek-terraform-modules.git//ec2_instance?ref=v1.0.0"
  name                   = module.labels.resource_name
  environment            = "dev"
  instance_type          = "t3.micro"
  ami                    = data.aws_ami.al2023.id
  subnet_id              = local.subnet_id
  vpc_security_group_ids = local.security_group_ids

  tags = module.labels.tags
}

# 2) Modular composition: the SAME module, instantiated many times with for_each.
module "servers" {
  source   = "./modules/ec2_instance"
  for_each = toset(["app", "worker", "cache"])

  name                   = each.key
  instance_type          = "t3.micro"
  environment            = "dev"
  ami                    = data.aws_ami.al2023.id
  subnet_id              = local.subnet_id
  vpc_security_group_ids = local.security_group_ids
}