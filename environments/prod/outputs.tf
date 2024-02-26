# Defines output values to be displayed after terraform apply
# Defines output values to be displayed after terraform apply
# VPC Outputs
output "vpc_id" {
  value = module.vpc.vpc_id
}
output "pub_sub_1_id" {
  value = module.vpc.pub_sub_1_id
}
output "pub_sub_2_id" {
  value = module.vpc.pub_sub_2_id
}
output "pub_sub_3_id" {
  value = module.vpc.pub_sub_3_id
}
output "pvt_sub_1_id" {
  value = module.vpc.pvt-sub-1-id
}
output "pvt_sub_2_id" {
  value = module.vpc.pvt-sub-2-id
}
output "pvt_sub_3_id" {
  value = module.vpc.pvt-sub-3-id
}

# SG OUTPUTS
output "secgrp_01_id" {
  value = module.sg.secgrp_01_id
}
output "prod_ecs_sg_id" {
  value = module.sg.prod-ecs-sg-id
}
output "prod_ecs_sg_name" {
  value = module.sg.prod-ecs-sg-name
}
output "prod_alb_ecs_sg_id" {
  value = module.sg.prod-alb-ecs-sg-id
}
output "prod_alb_ecs_sg_name" {
  value = module.sg.prod-alb-ecs-sg-name
}

# ECR Outputs
output "prod_website_ecr_name" {
  value = module.ecr.prod_website_ecr_name
}
output "prod_website_ecr_repositoty_url" {
  value = module.ecr.prod_website_ecr_repositoty_url
}
output "prod_api_ecr_name" {
  value = module.ecr.prod_api_ecr_name
}
output "prod_api_ecr_repositoty_url" {
  value = module.ecr.prod_api_ecr_repositoty_url
}

# IAM ROLES outputs
output "prod_ecs_role_name" {
  value = module.iam-roles.prod-ecs-role-name
}
output "prod_ecs_role_arn" {
  value = module.iam-roles.prod_ecs_role_arn
}
output "prod_codebuild_role_name" {
  value = module.iam-roles.prod-codebuild-role-name
}
output "prod_codebuild_role_arn" {
  value = module.iam-roles.prod-codebuild-role-arn
}

# ECS  Cluster outputs
output "prod_ecs_user_family_name" {
  value = module.ecs.prod-ecs-user-family-name
}
output "prod_ecs_api_family_name" {
  value = module.ecs.prod-ecs-api-family-name
}

# ALB Outputs
output "prod_ecs_user_tg_arn" {
  value = module.alb.prod-ecs-user-tg-arn
}
output "prod_ecs_api_tg_arn" {
  value = module.alb.prod-ecs-api-tg-arn
}

# CodeBuild Projects Outputs
output "prod_codebuild_user_name" {
  value = module.codebuild.prod_codebuild_user_name
}
output "prod_codebuild_api_name" {
  value = module.codebuild.prod_codebuild_api_name
}
