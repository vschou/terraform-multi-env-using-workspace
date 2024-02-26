# Defines environment-specific variables
variable "REGION" {
  description = "value of REGION variable"
}

# VPC VARIABLES
variable "VPC_CIDR" {
  description = "value of CIDR for the VPC"
}
variable "PROJECT_NAME" {
  description = "value of project name to be used in resources naming"
}
variable "ZONE1" {
  description = "value of first availability zone to use"
}
variable "ZONE2" {
  description = "value of second availability zone to use (optional)"
}
variable "ZONE3" {
  description = "value of third availability zone to use, if not provided ZONE1 will be used instead."
}
variable "PUB_SUB_1_CIDR" {
  description = "value of public subnet 1 CIDR"
}
variable "PUB_SUB_2_CIDR" {
  description = "value of public subnet 2 CIDR"
}
variable "PUB_SUB_3_CIDR" {
  description = "value of public subnet 3 CIDR"
}
variable "PVT_SUB_1_CIDR" {
  description = "value of private subnet 1 CIDR"
}
variable "PVT_SUB_2_CIDR" {
  description = "value of private subnet 2 CIDR"
}
variable "PVT_SUB_3_CIDR" {
  description = "value of private subnet 3 CIDR"
}

# EC2 INSTANCE VARIABLES
variable "AMI" {
  description = "value of AMI ID to use for instances. If empty latest Amazon Linux is used."
}
variable "INSTANCE_TYPE" {
  description = "value of instance type to use"
}
variable "PUB_KEY" {
  description = "value of the SSH Public Key to add to the server"
}
variable "PVT_KEY" {
  description = "value of Private key in PEM format that will be added to the server"
}