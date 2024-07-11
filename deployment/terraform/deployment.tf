module "lambda_reporter" {
  for_each = var.kosli_hosts

  source  = "kosli-dev/kosli-reporter/aws"
  version = "0.5.5"

  name                               = "${var.app_name}-${each.key}"
  kosli_environment_type             = "ecs"
  kosli_host                         = each.value.kosli_host
  kosli_cli_version                  = "v2.10.10"
  kosli_environment_name             = var.env
  kosli_org                          = "cyber-dojo"
  reported_aws_resource_name         = "app" # ECS cluster name
  schedule_expression                = "rate(1 minute)"
  kosli_api_token_ssm_parameter_name = each.value.kosli_api_token_ssm_parameter_name
  tags                               = module.tags.result
}
