module "lambda_reporter" {
  for_each = var.reporter_apps

  source  = "kosli-dev/kosli-reporter/aws"
  version = "0.1.3"

  name                   = "${var.app_name}-${each.key}"
  kosli_environment_type = "ecs"
  kosli_host             = each.value.kosli_host
  kosli_cli_version      = "v2.0.0"
  kosli_environment_name     = var.env
  kosli_org                  = "cyber-dojo"
  reported_aws_resource_name = "app"
  tags                   = module.tags.result
}
