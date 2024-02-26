output "prod-ecs-user-family-name" {
  value = aws_ecs_task_definition.prod-website-user-family.family
}
output "prod-ecs-api-family-name" {
  value = aws_ecs_task_definition.prod-api-family.family
}