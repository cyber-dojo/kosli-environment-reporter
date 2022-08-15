variable "reporter_apps" {
  type = map(any)
  default = {
    staging = {
      kosli_host = "https://staging.app.kosli.com"
    }
    prod = {
      kosli_host = "https://app.kosli.com"
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