module "lambda_reporter" {
  for_each = var.reporter_apps

  source  = "kosli-dev/kosli-reporter/aws"
  version = "0.0.3"

  name              = "${var.app_name}-${each.key}"
  kosli_env         = var.env
  kosli_host        = each.value.kosli_host
  kosli_cli_version = "v0.1.9"
  ecs_cluster       = "app"
  kosli_org         = "cyber-dojo"
  tags              = module.tags.result
}