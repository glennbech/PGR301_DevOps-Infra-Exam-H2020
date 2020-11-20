terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    google-beta = {
      source = "hashicorp/google-beta"
    }
    opsgenie = {
      source = "opsgenie/opsgenie"
      version = "0.5.2"
    }
    statuscake = {
      source = "terraform-providers/statuscake"
    }
  }
  required_version = ">= 0.13"
}
