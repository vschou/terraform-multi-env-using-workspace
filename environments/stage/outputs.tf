# Defines output values to be displayed after terraform apply
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
output "secgrp_01_id" {
  value = module.sg.secgrp_01_id
}