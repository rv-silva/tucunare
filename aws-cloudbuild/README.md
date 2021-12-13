# AWS-CloudBuild Resources Repository

This repository consists of CloudBuild resources deployed to run the CICD Pipelines.

## Usage

To run this deployment you need to execute:

```bash
$ terraform init
$ terraform plan -var="account_id=<ACCOUNT_ID>" -var="region=<REGION>"
$ terraform apply -var="account_id=<ACCOUNT_ID>" -var="region=<REGION>"
```

Note that this deployment may create resources which cost money. Run `terraform destroy` when you don't need these resources.
