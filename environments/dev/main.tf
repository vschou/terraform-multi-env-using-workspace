# Defines resources and modules specific to the environment
# VPC MODULE
module "vpc" {
  source = "../../modules/vpc"

  PROJECT_NAME   = var.PROJECT_NAME
  VPC_CIDR       = var.VPC_CIDR
  ZONE1          = var.ZONE1
  ZONE2          = var.ZONE2
  ZONE3          = var.ZONE3
  PUB_SUB_1_CIDR = var.PUB_SUB_1_CIDR
  PUB_SUB_2_CIDR = var.PUB_SUB_2_CIDR
  PUB_SUB_3_CIDR = var.PUB_SUB_3_CIDR
  PVT_SUB_1_CIDR = var.PVT_SUB_1_CIDR
  PVT_SUB_2_CIDR = var.PVT_SUB_2_CIDR
  PVT_SUB_3_CIDR = var.PVT_SUB_3_CIDR
}

# SG MODULE
module "sg" {
  source = "../../modules/sg"

  vpc_id       = module.vpc.vpc_id
  PROJECT_NAME = var.PROJECT_NAME
}

# EC2 INSTANCE MODULE
module "ec2" {
  source = "../../modules/ec2"

  AMI           = var.AMI
  INSTANCE_TYPE = var.INSTANCE_TYPE
  PROJECT_NAME  = var.PROJECT_NAME
  PUB_KEY       = var.PUB_KEY
  PVT_KEY       = var.PVT_KEY

  pub_sub_1_id  = module.vpc.pub_sub_1_id
  pub_sub_2_id  = module.vpc.pub_sub_2_id
  pub_sub_3_id  = module.vpc.pub_sub_3_id
  secgrp_01_id  = module.sg.secgrp_01_id
}