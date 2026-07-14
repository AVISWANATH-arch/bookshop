terraform {
  required_providers {
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = "~> 0.53"
    }
  }
}

provider "cloudfoundry" {
  api_url  = var.api_url
  user     = var.cf_user
  password = var.cf_password
}