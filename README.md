<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.29.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.lifecycle_policy](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.ecr_repo](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.access_policy](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/resources/ecr_repository_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.access_policy_document](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_principal_arns"></a> [additional\_principal\_arns](#input\_additional\_principal\_arns) | n/a | `list(string)` | `[]` | no |
| <a name="input_encryption_type"></a> [encryption\_type](#input\_encryption\_type) | Encryption configuration for the repository | `string` | `"AES256"` | no |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE | `string` | `"IMMUTABLE"` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | The ARN of the KMS key to use when encryption\_type is KMS. If not specified, uses the default AWS managed key for ECR | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the ECR repos | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
