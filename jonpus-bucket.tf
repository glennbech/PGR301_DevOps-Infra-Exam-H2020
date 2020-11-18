resource "google_storage_bucket" "static-site" {
  project = "pgr301-devops-exam-monster"
  name = "pgr301-devops-infra-bucket12"
  location = "EU"
}