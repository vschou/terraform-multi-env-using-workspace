variable "AMI" {
  description = "value of the AMI to use for the EC2 instance."
}
variable "INSTANCE_TYPE" {
  description = "value of instance type"
}
variable "PROJECT_NAME" {
  description = "value of project name"
}
variable "PUB_KEY" {
  description = "value of public key id"
}
variable "PVT_KEY" {
  description = "value of private key path"
}
variable "pub_sub_1_id" {
  description = "value of pub sub net interface id in first network interface card (NIC) on ec2 instance"
}
variable "pub_sub_2_id" {
  description = "value of pub sub net interface id in second NIC on ec2 instance"
}
variable "pub_sub_3_id" {
  description = "value of pub subnet 3 id"
}
variable "secgrp_01_id" {
  description = "value of security group 01 id"
}