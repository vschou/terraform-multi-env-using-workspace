# Creation of Prod CodeBuild USER Project
resource "aws_codebuild_project" "prod-user-codebuild" {
  name = "${var.PROJECT_NAME}-${terraform.workspace}-user-codebuild"
  description = "Build & Deploys the user code for prod environment."
  service_role = var.prod_codebuild_role_arn

    artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image = "aws/codebuild/standard:4.0"
    type = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
    name = "SOME_KEY1"
    value = "SOME_VALUE1"
    }
  }
  source {
    type = "NO_SOURCE"
    }
    # Use the buildspec content from a local file
    # buildspec = file("buildspec.yml")

    logs_config {
      cloudwatch_logs {
        status = "ENABLED"
        group_name = "/aws/codebuild/${var.PROJECT_NAME}-${terraform.workspace}-user-codebuild"
        stream_name = "build"
      }
    }
    tags = {
      name = "${var.PROJECT_NAME}-${terraform.workspace}-user-codebuild"
      environment =  "${terraform.workspace}"
    }
  }


###################################################################################
# Creation of Prod CodeBuild API Project
resource "aws_codebuild_project" "prod-api-codebuild" {
  name = "${var.PROJECT_NAME}-${terraform.workspace}-api-codebuild"
  description = "Deploys the api code for prod environment."
  service_role = var.prod_codebuild_role_arn

    artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image = "aws/codebuild/standard:4.0"
    type = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
    name = "SOME_KEY1"
    value = "SOME_VALUE1"
    }
  }
  source {
    type = "NO_SOURCE"
    }
    # Use the buildspec content from a local file
    # buildspec = file("buildspec.yml")

    logs_config {
      cloudwatch_logs {
        status = "ENABLED"
        group_name = "/aws/codebuild/${var.PROJECT_NAME}-${terraform.workspace}-api-codebuild"
        stream_name = "build"
      }
    }
    tags = {
      name = "${var.PROJECT_NAME}-${terraform.workspace}-api-codebuild"
      environment =  "${terraform.workspace}"
    }
  }