variable "tags" {
  description = "Tags for the ECR repos"
  type        = map(string)
  default     = {}
}

variable "additional_principal_arns" {
  type    = list(string)
  default = []
}

variable "kms_key_arn" {
  description = "The ARN of the KMS key to use when encryption_type is KMS. If not specified, uses the default AWS managed key for ECR"
  type        = string
}

variable "encryption_type" {
  description = "Encryption configuration for the repository"
  type        = string
  default     = "AES256"

  validation {
    condition     = contains(["AES256", "KMS"], var.encryption_type)
    error_message = "Allowed values for input_parameter are \"AES256\" or \"KMS\"."
  }
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE"
  type        = string
  default     = "IMMUTABLE"

  validation {
    condition     = contains(["MUTABLE", "IMMUTABLE"], var.encryption_type)
    error_message = "Allowed values for input_parameter are \"MUTABLE\" or \"IMMUTABLE\"."
  }
}
