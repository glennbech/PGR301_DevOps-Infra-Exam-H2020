terraform {
  backend "gcs" {
    bucket = "pgr301-devops-infra-bucket_02"
    prefix = "terraformstate"
    credentials = "google-key.json"
  }
}

provider "google-beta" {
  credentials = file("google-key.json")
  project = "pgr301-devops-exam-monster"
  version = "~> 3.0.0-beta.1"
}

terraform {
  required_providers {
    opsgenie = {
      source = "opsgenie/opsgenie"
      version = "0.5.2"
    }
  }
}


