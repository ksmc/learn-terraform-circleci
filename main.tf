terraform {
  required_version = ">= 0.12"
  backend "s3" {

  }
}

provider "aws" {
  region = var.region
}

locals {
  environment = var.environment
  common_tags = {
    namespace   = var.namespace
    environment = var.environment
    managed     = var.managed
    group       = var.group
  }
}

resource "aws_vpc" "testvpc" {
  cidr_block           = var.cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_classiclink   = false
  instance_tenancy     = "default"

  tags = merge(local.common_tags, { Name = "${var.environment}-hhs-mainvpc" })
}

output "VPC_ID" {
  value = aws_vpc.testvpc.id
}
