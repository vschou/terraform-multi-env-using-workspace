resource "aws_ecr_repository" "prod-website-ecr" {
  name = "${var.PROJECT_NAME}-${terraform.workspace}-website-ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "prod-api-ecr" {
  name = "${var.PROJECT_NAME}-${terraform.workspace}-api-ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}