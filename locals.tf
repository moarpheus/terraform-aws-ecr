locals {
  principal_arns = concat(var.additional_principal_arns, "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root")
}
