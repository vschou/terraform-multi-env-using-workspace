output "prod-ecs-role-name" {
  value = aws_iam_role.prod-ecs-role.name
}
output "prod_ecs_role_arn" {
  value = aws_iam_role.prod-ecs-role.arn
}
output "prod-codebuild-role-name" {
  value = aws_iam_role.prod-codebuild-role.name
}
output "prod-codebuild-role-arn" {
  value = aws_iam_role.prod-codebuild-role.arn
}