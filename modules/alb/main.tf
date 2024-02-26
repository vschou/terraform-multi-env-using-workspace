# ALB (Application Load Balancer) Creation for USER ECS 
resource "aws_lb" "prod-ecs-user-alb" {
  name = "${var.PROJECT_NAME}-${terraform.workspace}-ecs-user-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [ var.prod_alb_ecs_sg_id ]
  subnets = [ var.pub_sub_1_id, var.pub_sub_2_id, var.pub_sub_3_id ]

  enable_deletion_protection = true
  tags = {
    environment = "${terraform.workspace}"
  }
}

# USER TG (Target Group) Creation for USER ECS
resource "aws_lb_target_group" "prod-ecs-user-tg" {
  name = "${var.PROJECT_NAME}-${terraform.workspace}-ecs-user-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id

  health_check {
    path = "/health"
    port = 80
    protocol = "HTTP"
    timeout = 5
    interval = 30
    healthy_threshold = 2
    unhealthy_threshold = 2
    matcher = "200-399"
  }
  tags = {
    name = "${var.PROJECT_NAME}-${terraform.workspace}-ecs-user-tg"
    environment = "${terraform.workspace}"
  }
}

# Creation of Listener for USER ALB to forward traffic to USER TG
resource "aws_alb_listener" "prod-user-alb-listener" {
  load_balancer_arn = aws_lb.prod-ecs-user-alb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.prod-ecs-user-tg.arn
  }
}

###########################################################

# ALB (Application Load Balancer) Creation for API ECS
resource "aws_lb" "prod-ecs-api-alb" {
  name = "${var.PROJECT_NAME}-${terraform.workspace}-ecs-api-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [ var.prod_alb_ecs_sg_id ]
  subnets = [ var.pub_sub_1_id, var.pub_sub_2_id, var.pub_sub_3_id ]

  enable_deletion_protection = true
  tags = {
    environment = "${terraform.workspace}"
  }
}

# USER TG (Target Group) Creation for USER ECS
resource "aws_lb_target_group" "prod-ecs-api-tg" {
  name = "${var.PROJECT_NAME}-${terraform.workspace}-ecs-api-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id

  health_check {
    path = "/health"
    port = 80
    protocol = "HTTP"
    timeout = 5
    interval = 30
    healthy_threshold = 2
    unhealthy_threshold = 2
    matcher = "200-399"
  }
  tags = {
    name = "${var.PROJECT_NAME}-${terraform.workspace}-ecs-api-tg"
    environment = "${terraform.workspace}"
  }
}

# Creation of Listener for USER ALB to forward traffic to USER TG
resource "aws_alb_listener" "prod-api-alb-listener" {
  load_balancer_arn = aws_lb.prod-ecs-api-alb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.prod-ecs-api-tg.arn
  }
}