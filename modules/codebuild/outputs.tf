output "prod_codebuild_user_name" {
  value = aws_codebuild_project.prod-user-codebuild.tags_all
}
output "prod_codebuild_api_name" {
  value = aws_codebuild_project.prod-api-codebuild.tags_all
}