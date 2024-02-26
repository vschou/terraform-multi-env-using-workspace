variable "PROJECT_NAME" {
  description = "value of PROJECT_NAME environment variable."
}
variable "prod_ecs_role_arn" {
  description = "value of prod_ecs_role_arn environment variable."
}
variable "prod_ecs_sg_id" {
  description = "value of prod_ecs_sg_id environment variable."
}
variable "pvt_sub_1_id" {
  description = "value of pvt_sub_1_id environment variable."
}
variable "pvt_sub_2_id" {
  description = "value of privatesubnet-2 id."
}
variable "pvt_sub_3_id" {
  description = "value of privatesubnet-3 id."
}
variable "prod_ecs_user_tg_arn" {
  description = "value of tg arn of user ecs"
}
variable "prod_ecs_api_tg_arn" {
  description = "value of tg arn of api ecs"
}