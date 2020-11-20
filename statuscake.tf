provider "statuscake" {
  username = "jonpus"
}

resource "statuscake_test" "googlecloudruntest" {
  website_name = "Monster Website"
  website_url  = google_cloud_run_service.hello.status[0].url
  test_type    = "HTTP"
  check_rate   = 300
  contact_group = ["195208"]
}