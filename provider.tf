terraform {
  backend "gcs" {
    bucket = "pgr301-terraform-state"
    prefix = "terraformstate-10007"
    credentials = "google-key.json"
  }
}

provider "google-beta" {
  credentials = file("google-key.json")
  project = "terraform-292215"
  version = "~> 3.0.0-beta.1"
}



