# Tucunare: Infrastructure Resources Repository

This repository consists of Infrastructure resources deployed to run the Applications.

`aws-cloudbuild`: configuration files to deploy the CICD engine.
`aws-ecr`: stores all Container Images.
`aws-eks`: contains the configuration used to deploy the EKS cluster which runs the Applications including `Sinatra`.

## Architectural Reference:
<p align="center">
  <img src="https://github.com/aws-samples/amazon-eks-cicd-codebuild/blob/main/images/eks-cicd-codebuild.png">
</p>

## Assumptions:
- Prioritize the usage of Cloud Provider Managed Tools considering a small Infra team.
- Deployment artifacts are contained alongside App artifacts. It gives autonomy to Dev Teams as requested (DevOps model).
- A Public repository is used for sharing purposes. [However, when in Production it must be a Private with OAuth to the Cloud Provider](https://github.com/rv-silva/tucunare/blob/main/aws-cloudbuild/main.tf#L118).
- Application is not exposed externally (Ingress & ALB). Use `kubectl port-forward svc/sinatra 8080:80 -n sinatra` for testing.

## Backlog:
- To limit the scope of change on Production Env, Peer Review (Merge Pull Request) must determine which members will be allowed to approve changes in Code.
- Introduce more comprehensive Observability with Metrics and Logs collection.
- Monitor App usage for a while then introduce scalability concerns (horizontal & vertical).
- Define policies & create pipelines for Infrastructure resources.
- Decouple CD from CI (CloudBuild).
- Introduce Scaffold with Terraform Doc & Pre-Commit hooks.

## Looking for the Application code?
[Piracaia: Application Resources.](https://github.com/rv-silva/piracaia)
