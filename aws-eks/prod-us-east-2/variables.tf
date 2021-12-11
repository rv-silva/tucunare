variable "cluster_name" {
  type        = string
  description = "Name of the cluster. 1-100 alphanumeric characters."
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes master version. Latest if not specified. Downgrades are not supported by EKS."
}

variable "env" {
  type        = string
  description = "Defines the Environment. Names the resources created."
}

variable "region" {
  type        = string
  description = "Defines to which region resources will be deployed."
}

variable "vpc_name" {
  type        = string
  description = "Name of the cluster. 1-100 alphanumeric characters."
}

locals {
  cluster_name    = "${var.env}-${var.cluster_name}"
  cluster_version = var.cluster_version
  region          = var.region
  vpc_name        = "${var.env}-${var.vpc_name}"
}
