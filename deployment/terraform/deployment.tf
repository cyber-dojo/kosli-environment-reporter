module "lambda_reporter" {
  source  = "kosli-dev/kosli-reporter/aws"
  version = "0.8.2"

  name                = "${var.app_name}-reporter"
  kosli_cli_version   = "v2.11.23"
  kosli_org           = "cyber-dojo"
  kosli_host          = var.KOSLI_HOST
  schedule_expression = "rate(1 minute)"
  tags                = module.tags.result
  environments = [
    {
      kosli_environment_name     = var.env
      kosli_environment_type     = "ecs"
      reported_aws_resource_name = "app" # ECS cluster name
    }
  ]
}
