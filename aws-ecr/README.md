# AWS-ECR Resources Repository

This repository consists of ECR resources to store Container images.

## Required Variables

| Name | Type |
|------|------|
| [mutability](./variables.tf) | string |
| [name](./variables.tf) | string |
| [region](./variables.tf) | string |

## Usage

To run this deployment you need to execute:

```bash
$ terraform init
$ terraform plan -var-file="<ENV>.tfvars"
$ terraform apply -var-file="<ENV>.tfvars"
```

Note that this deployment may create resources which cost money. Run `terraform destroy` when you don't need these resources.
