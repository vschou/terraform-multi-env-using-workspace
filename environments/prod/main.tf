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
  PROJECT_NAME  = var.PROJECT_NAME
  INSTANCE_TYPE = var.INSTANCE_TYPE
  PUB_KEY       = var.PUB_KEY
  PVT_KEY       = var.PVT_KEY
  pub_sub_1_id  = module.vpc.pub_sub_1_id
  pub_sub_2_id  = module.vpc.pub_sub_2_id
  pub_sub_3_id  = module.vpc.pub_sub_3_id
  secgrp_01_id  = module.sg.secgrp_01_id
}


# ECR MODULE
module "ecr" {
  source = "../../modules/ecr"

  PROJECT_NAME = var.PROJECT_NAME
}

# IAM ROLES MODULE
module "iam-roles" {
  source = "../../modules/iam-roles"

  PROJECT_NAME = var.PROJECT_NAME
}

# ECS MODULE
module "ecs" {
  source = "../../modules/ecs"

  PROJECT_NAME         = var.PROJECT_NAME
  prod_ecs_role_arn    = module.iam-roles.prod_ecs_role_arn
  prod_ecs_sg_id       = module.sg.prod-ecs-sg-id
  pvt_sub_1_id         = module.vpc.pvt-sub-1-id
  pvt_sub_2_id         = module.vpc.pvt-sub-2-id
  pvt_sub_3_id         = module.vpc.pvt-sub-3-id
  prod_ecs_user_tg_arn = module.alb.prod-ecs-user-tg-arn
  prod_ecs_api_tg_arn  = module.alb.prod-ecs-api-tg-arn
}

# ALB MODULE
module "alb" {
  source             = "../../modules/alb"
  PROJECT_NAME       = var.PROJECT_NAME
  prod_alb_ecs_sg_id = module.sg.prod-alb-ecs-sg-id
  pub_sub_1_id       = module.vpc.pub_sub_1_id
  pub_sub_2_id       = module.vpc.pub_sub_2_id
  pub_sub_3_id       = module.vpc.pub_sub_3_id
  vpc_id             = module.vpc.vpc_id
}

# CODEBUILD MODULE
module "codebuild" {
  source = "../../modules/codebuild"

  PROJECT_NAME            = var.PROJECT_NAME
  prod_codebuild_role_arn = module.iam-roles.prod-codebuild-role-arn
}