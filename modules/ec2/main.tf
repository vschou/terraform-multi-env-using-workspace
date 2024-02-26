resource "aws_key_pair" "pem-key" {
  key_name = "${terraform.workspace}-pem-key"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "website-inst" {
  ami = var.AMI
  instance_type = var.INSTANCE_TYPE
  subnet_id = var.pub_sub_1_id
  key_name = aws_key_pair.pem-key.key_name
  vpc_security_group_ids = [var.secgrp_01_id]
  tags = {
    Name = "${var.PROJECT_NAME}-${terraform.workspace}-website"
    environment = "${terraform.workspace}"
  }
}

resource "aws_instance" "api-inst" {
  ami = var.AMI
  instance_type = var.INSTANCE_TYPE
  subnet_id = var.pub_sub_1_id
  key_name = aws_key_pair.pem-key.key_name
  vpc_security_group_ids = [var.secgrp_01_id]
  tags = {
    Name = "${var.PROJECT_NAME}-${terraform.workspace}-api"
    environment = "${terraform.workspace}"
  }
}

# resource "aws_instance" "website-inst" {
#   ami = var.AMI
#   instance_type = var.INSTANCE_TYPE
#   key_name = aws_key_pair.pem-key.key_name
#   tags = {
#     Name = "${var.PROJECT_NAME}-${terraform.workspace}-website"
#     environment = "${terraform.workspace}"
#   }
# }