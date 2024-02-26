# Defines environment-specific variables
# PROVIDERS VARIABLES
variable "access_key" {
  description = "value of access key"
}
variable "secret_key" {
  description = "value of secret key"
}
# GITLAB VARIABLES
variable "TOKEN" {
  description = "value of the gitlab token to use for authentication."
}
variable "BASE_URL" {
  description = "value of gitlab  base url. Defaults to https://gitlab.com if not provided."
}

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
  description = "value of AMI of INSTANCE"
}
variable "INSTANCE_TYPE" {
  description = "value of instance type"
}
variable "PUB_KEY" {
  description = "value of the SSH Public Key for connecting to instances"
}
variable "PVT_KEY" {
  description = "value of Private key in .pem format for connecting to instances"
}

# ECR Variables

variable "provider_alias" {
  description = "value of provider details"
  type        = string
}