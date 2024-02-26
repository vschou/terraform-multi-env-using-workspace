output "prod_website_ecr_name" {
  value = aws_ecr_repository.prod-website-ecr.name
}
output "prod_website_ecr_repositoty_url" {
  value = aws_ecr_repository.prod-website-ecr.repository_url
}
output "prod_api_ecr_name" {
  value = aws_ecr_repository.prod-api-ecr.name
}
output "prod_api_ecr_repositoty_url" {
  value = aws_ecr_repository.prod-api-ecr.repository_url
}