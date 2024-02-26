################ ECS CLUSTER CREATION ####################
resource "aws_ecs_cluster" "prod-cluster" {
  name = "${var.PROJECT_NAME}-${terraform.workspace}-ecs"
}

################# ECS_USER TASK_DEFINITION CREATION #####################
resource "aws_ecs_task_definition" "prod-website-user-family" {
  family = "${var.PROJECT_NAME}-${terraform.workspace}-user-family"
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu = 1024
  memory = 2048
  execution_role_arn = var.prod_ecs_role_arn

  container_definitions = <<DEFINITION
  [
    {
        "name" : "",
        "image" : "nginx:latest",
        "portMappings" : [
            {
            "containerPort" : 80,
            "hostPort" : 80
            }
        ]
    }
  ]
  DEFINITION
}

##################### ECS ROLE CREATION #######################

# resource "aws_iam_role" "prod-ecs-execution-role" {
#   name = ""

#   assume_role_policy = <<EOF
#   {
#     "Version" : "2012-10-17",
#     "Statement" : [
#         {
#             "Action" : "sts:AssumeRole",
#             "Principal" : {
#                 "Service" : "ecs-tasks.amazonaws.com"
#             },
#             "Effect" : "Allow",
#             "Sid" : ""
#         }
#     ]
#   }
#   EOF
# }

##################### ECS_USER SERVICE CREATION ###########################

resource "aws_ecs_service" "prod-website-user-svc" {
  name = "${var.PROJECT_NAME}-${terraform.workspace}-user-svc"
  cluster = aws_ecs_cluster.prod-cluster.id
  task_definition = aws_ecs_task_definition.prod-website-user-family.arn
  desired_count = 1
  launch_type = "FARGATE"
  load_balancer {
    target_group_arn = var.prod_ecs_user_tg_arn #var.USER.TG
    container_name = "${var.PROJECT_NAME}-{terraform.workspace}-user-image" # devotion-user
    container_port = 80
  }
  network_configuration {
    subnets = [var.pvt_sub_1_id, var.pvt_sub_2_id, var.pvt_sub_3_id] # [ "../modules/vpc.PVT_SUB_1","../modules/vpc.PVT_SUB_2"]
    security_groups = [ var.prod_ecs_sg_id ] # ["../modules/sg.ECS_SG"]
  }
}

#######################################################################################
############# ECS API  TASK DEFINITION AND RELATED RESOURCES #########################

############# ECS API TASK DEFINITION CREATION #####################
resource "aws_ecs_task_definition" "prod-api-family" {
  family = "${var.PROJECT_NAME}-${terraform.workspace}-api-family"
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu = 1024
  memory = 2048
  execution_role_arn = var.prod_ecs_role_arn

  container_definitions = <<DEFINITION
  [
    {
        "name" : "devotion-user",
        "image" : "nginx-latest",
        "portMappings" : [
            {
                "containerPort" : 4000,
                "hostPort" : 4000
            }
        ]
    }
  ]
  DEFINITION
}

#################### ECS API SERVICE CREATION ###################
resource "aws_ecs_service" "prod-api-svc" {
  name = "${var.PROJECT_NAME}-${terraform.workspace}-api-svc"
  cluster = aws_ecs_cluster.prod-cluster.id
  task_definition = aws_ecs_task_definition.prod-api-family.arn
  desired_count = 1
  launch_type = "FARGATE"
  load_balancer {
    target_group_arn = var.prod_ecs_api_tg_arn # var.API_TG
    container_name = "${var.PROJECT_NAME}-{terraform.workspace}-user-image" # devotion-api
    container_port = 4000
  }
  network_configuration {
    subnets = [var.pvt_sub_1_id, var.pvt_sub_2_id, var.pvt_sub_3_id] # [ "../modules/vpc.PVT_SUB_1","../modules/vpc.PVT_SUB_2"]
    security_groups = [var.prod_ecs_sg_id] # ["../modules/sg.ECS_SG"]
  }
}
