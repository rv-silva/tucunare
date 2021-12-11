variable "name" {
  type        = string
  description = "Name of the Respository."
}

variable "mutability" {
  type        = string
  description = "Allow image tags to be overwritten (MUTABLE or IMMUTABLE)"
}

variable "region" {
  type        = string
  description = "Defines the Region."
}

