################### PROD ECS ROLE CREATION ######################
resource "aws_iam_role" "prod-ecs-role" {
  name = "${var.PROJECT_NAME}-${terraform.workspace}-ecs-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}


################## POLICY  ATTACHMENT TO THE PROD  ECS IAM ROLE ##################
resource "aws_iam_role_policy_attachment" "ecs-policy-attachment" {
    role = aws_iam_role.prod-ecs-role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}
resource "aws_iam_role_policy_attachment" "ecs-task-execution-policy-attachment" {
    role = aws_iam_role.prod-ecs-role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
resource "aws_iam_role_policy_attachment" "s3_full_access_policy_attachment" { 
    role = aws_iam_role.prod-ecs-role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
resource "aws_iam_role_policy_attachment" "ses_full_access_policy_attachment" {
    role = aws_iam_role.prod-ecs-role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonSESFullAccess"
}
resource "aws_iam_role_policy_attachment" "sns_full_access_policy_attachment" {
    role = aws_iam_role.prod-ecs-role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
}
resource "aws_iam_role_policy_attachment" "sns_role_policy_attachment" {
    role = aws_iam_role.prod-ecs-role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonSNSRole"
}
resource "aws_iam_role_policy_attachment" "codebuild_admin_access_policy_attachment" {
    role = aws_iam_role.prod-ecs-role.name
    policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"
}

########### ECR Custom Policy Creation For ECS ROLE ###########################
resource "aws_iam_policy" "ecr-policy" {
  name = "${var.PROJECT_NAME}-${terraform.workspace}-ecr-policy" # ecr-policy
  description = "This is a custom policy for the production ECR access."

  policy = <<EOF
{
"Version" : "2012-10-17",
"Statement" : [
    {
        "Effect" : "Allow", 
        "Action" : [
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage",
            "ecr:BatchCheckLayerAvailability",
            "ecr:PutImage",
            "ecr:InitiateLayerUpload",
            "ecr:UploadLayerPart",
            "ecr:CompleteLayerUpload",
            "ecr:DescribeRepositories",
            "ecr:GetRepositoryPolicy",
            "ecr:ListImages",
            "ecr:DescribeImages",
            "ecr:DeleteRepositoryPolicy",
            "ecr:PutLifecyclePolicy",
            "ecr:GetLifecyclePolicy",
            "ecr:DeleteRepository",
            "ecr:GetAuthorizationToken",
            "ecr:DescribeRepositories",
            "ecr:DescribeImageScanFindings",
            "ecr:StartImageScan",
            "ecr:PutImageScanningConfiguration",
            "ecr:StartLifecyclePolicyPreview",
            "ecr:GetLifecyclePolicyPreview",
            "logs:*"
                ],
                "Resource" : "*"
        }
    ]
  }
  EOF
}

######## Attaching the above ECR Policy to Prod-ECS-Role ##################
resource "aws_iam_role_policy_attachment" "ecr-policy-attachment" {
  role = aws_iam_role.prod-ecs-role.name
  policy_arn = aws_iam_policy.ecr-policy.arn
}

##################### CODEBUILD ROLE CREATION ######################
resource "aws_iam_role" "prod-codebuild-role" {
  name = "${var.PROJECT_NAME}-${terraform.workspace}-codebuild-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

################## POLICY  ATTACHMENT TO THE PROD  ECS IAM ROLE ##################
resource "aws_iam_role_policy_attachment" "ec2-container-registry-access" {
  role = aws_iam_role.prod-codebuild-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}
resource "aws_iam_role_policy_attachment" "ecs-full-access" {
  role = aws_iam_role.prod-codebuild-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}
resource "aws_iam_role_policy_attachment" "s3-full-access" {
  role = aws_iam_role.prod-codebuild-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
resource "aws_iam_role_policy_attachment" "codebuild-admin-access" {
  role = aws_iam_role.prod-codebuild-role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"
}
resource "aws_iam_role_policy_attachment" "ecr-policy-attachment-to-codebuild" {
  role = aws_iam_role.prod-codebuild-role.name
  policy_arn = aws_iam_policy.ecr-policy.arn
}