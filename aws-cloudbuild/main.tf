resource "aws_iam_role" "default" {
  name = "prod-codebuild"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "default" {
  role = aws_iam_role.default.name

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
      {
        "Effect": "Allow",
        "Resource": [
          "*"
        ],
        "Action": [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
      },
      {
          "Effect": "Allow",
          "Action": [
              "codebuild:CreateReportGroup",
              "codebuild:CreateReport",
              "codebuild:UpdateReport",
              "codebuild:BatchPutTestCases",
              "codebuild:BatchPutCodeCoverages"
          ],
          "Resource": [
              "arn:aws:codebuild:us-east-2:${var.account_id}:report-group/*"
          ]
      },
      {
          "Action": [
              "ecr:BatchCheckLayerAvailability",
              "ecr:CompleteLayerUpload",
              "ecr:GetAuthorizationToken",
              "ecr:InitiateLayerUpload",
              "ecr:PutImage",
              "ecr:UploadLayerPart"
          ],
          "Resource": "*",
          "Effect": "Allow"
      }
  ]
}
POLICY
}

resource "aws_codebuild_project" "default" {
  name          = "prod-builder"
  description   = "prod_codebuild_project"
  build_timeout = "5"
  service_role  = aws_iam_role.default.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = "true"
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "log-group"
      stream_name = "log-stream"
    }

    s3_logs {
      status   = "DISABLED"
    }
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/rv-silva/piracaia.git"
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }

  source_version = "main"

  tags = {
    Environment = "Prod"
  }
}

######### MAKE THIS REPO PRIVATE WHEN IN PRODUCTION #########
# resource "aws_codebuild_source_credential" "default" {
#   auth_type   = "PERSONAL_ACCESS_TOKEN"
#   server_type = "GITHUB"
#   token       = var.github_token
# }
