data "aws_caller_identity" "current" {}

resource "aws_ecr_repository" "ecr_repo" {
  name                 = "Default ECR repo"
  image_tag_mutability = var.image_tag_mutability

  dynamic "encryption_configuration" {
    for_each = (var.encryption_type == "KMS" && var.kms_key_arn != null) ? [1] : []
    content {
      encryption_type = var.encryption_type
      kms_key         = var.kms_key_arn
    }
  }

  dynamic "encryption_configuration" {
    for_each = (var.kms_key_arn == null) ? [1] : []
    content {
      encryption_type = var.encryption_type
    }
  }

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.tags
}

resource "aws_ecr_repository_policy" "access_policy" {
  repository = aws_ecr_repository.ecr_repo.name
  policy     = data.aws_iam_policy_document.access_policy_document.json
}

resource "aws_ecr_lifecycle_policy" "lifecycle_policy" {
  repository = aws_ecr_repository.ecr_repo.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 100 days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 100
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

data "aws_iam_policy_document" "access_policy_document" {
  statement {
    sid    = "Access policy"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = local.principal_arns
    }

    actions = [
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
      "ecr:DeleteRepository",
      "ecr:BatchDeleteImage",
      "ecr:SetRepositoryPolicy",
      "ecr:DeleteRepositoryPolicy",
    ]
  }
}
