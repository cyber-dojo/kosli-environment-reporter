module "lambda_reporter" {
  source  = "kosli-dev/kosli-reporter/aws"
  version = "0.5.5"

  name                       = "${var.app_name}-reporter"
  kosli_environment_type     = "ecs"
  kosli_cli_version          = "v2.11.20"
  kosli_environment_name     = var.env
  kosli_org                  = "cyber-dojo"
  kosli_host                 = var.KOSLI_HOST
  reported_aws_resource_name = "app" # ECS cluster name
  schedule_expression        = "rate(1 minute)"
  tags                       = module.tags.result
}
