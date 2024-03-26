variable "reporter_apps" {
  type = map(any)
  default = {
    staging = {
      kosli_host                         = "https://staging.app.kosli.com"
      kosli_api_token_ssm_parameter_name = "kosli_api_token_staging"
    }
    prod = {
      kosli_host                         = "https://app.kosli.com"
      kosli_api_token_ssm_parameter_name = "kosli_api_token_prod"
    }
  }
}

variable "env" {
  type = string
}

variable "app_name" {
  type    = string
  default = "kosli"
}