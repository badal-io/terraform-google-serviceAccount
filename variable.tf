variable "module_dependency" {
  type        = "string"
  default     = ""
  description = "This is a dummy value to great module dependency"
}

variable "name" {
    description = "The name of the service account."
    type        = "string"
}

variable "project" {
    description = "The project in which the resource belongs. If it is not provided, the provider project is used."
    type        = "string"
    default     = ""
}

variable "description" {
    description = "Service Account description"
    type        = "string"
    default     = "Provisioned by Terraform"
}

variable "key" {
    description = "Configuration for retrieving Key"
    type        = "map"
    default     = {
        enabled = "false"
    }
}

variable "iam" {
    description = "Non-authorative service account role binding... grants permissions to other users to act as the SA"
    type        = "map"
    default     = {}
}