# EC2 Instance SG
resource "aws_security_group" "secgrp-01" {
  vpc_id = var.vpc_id
  name = "${var.PROJECT_NAME}-${terraform.workspace}-sec-grp-01"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = {
    Name = "${var.PROJECT_NAME}-${terraform.workspace}-secgrp-01"
    environment = "${terraform.workspace}"
  }
}

# ALB-ECS-SG
resource "aws_security_group" "prod-alb-ecs-sg" {
  vpc_id = var.vpc_id
  name   = "${var.PROJECT_NAME}-${terraform.workspace}-alb-ecs-sg"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80 
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = {
    Name  = "${var.PROJECT_NAME}-${terraform.workspace}-alb-ecs-sg"
    environment = "${terraform.workspace}"
  }
}

# ECS Security Group
resource "aws_security_group" "prod-ecs-sg" {
  vpc_id = var.vpc_id
  name = "${var.PROJECT_NAME}-${terraform.workspace}-ecs-sg"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [aws_security_group.prod-alb-ecs-sg.id]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [aws_security_group.prod-alb-ecs-sg.id]
  }
  tags = {
    Name = "${var.PROJECT_NAME}-${terraform.workspace}-ecs-sg"
    environment = "${terraform.workspace}"
  }
}