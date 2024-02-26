output "secgrp_01_id" {
  value = aws_security_group.secgrp-01.id
}
output "prod-ecs-sg-id" {
  value = aws_security_group.prod-ecs-sg.id
}
output "prod-ecs-sg-name" {
  value = aws_security_group.prod-ecs-sg.name
}
output "prod-alb-ecs-sg-id" {
  value = aws_security_group.prod-alb-ecs-sg.id
}
output "prod-alb-ecs-sg-name" {
  value = aws_security_group.prod-alb-ecs-sg.name
}