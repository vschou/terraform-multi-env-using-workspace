output "prod-ecs-user-tg-arn" {
  value = aws_lb_target_group.prod-ecs-user-tg.arn
}
output "prod-ecs-api-tg-arn" {
  value = aws_lb_target_group.prod-ecs-api-tg.arn
}