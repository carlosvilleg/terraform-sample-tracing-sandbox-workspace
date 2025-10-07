

terraform {
  required_providers {
    external = {
      source = "hashicorp/external"
      version = "2.3.5"
    }
  }
}

provider "external" {
  # the external provider doesn't have any config options
  #nothing = module.traceparent.traceparent
}

