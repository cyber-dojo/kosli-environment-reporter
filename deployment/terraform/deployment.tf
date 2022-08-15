resource "aws_ecr_pull_through_cache_rule" "this" {
  ecr_repository_prefix = "ecr-public"
  upstream_registry_url = "public.ecr.aws"
}

module "lambda_reporter" {
  for_each          = var.reporter_apps
  source            = "./lambda-reporter"
  name              = "${var.app_name}-${each.key}"
  env               = var.env
  kosli_host        = each.value.kosli_host
  kosli_cli_version = "1.5.9"
  ecs_cluster       = "app"
  kosli_user        = "cyber-dojo"
  tags              = module.tags.result
}