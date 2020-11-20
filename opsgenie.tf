provider "opsgenie" {
  version = "0.2.3"
  api_url = "api.eu.opsgenie.com"
}

resource "opsgenie_user" "user1" {
  full_name = "Lottie Noble"
  role = "User"
  username = "LotNob99@student.kristiania.no"
  locale = "no_NO"
  timezone = "Europe/Oslo"
}

resource "opsgenie_user" "user2" {
  full_name = "Nathan Adams"
  role = "User"
  username = "NatAda99@student.kristiania.no"
  locale = "no_NO"
  timezone = "Europe/Oslo"
}

resource "opsgenie_team" "team1" {
  name = "A-Team"

  member {
    id = opsgenie_user.user1.id
    role = "user"
  }

  member {
    id = opsgenie_user.user2.id
    role = "user"
  }
}

resource "opsgenie_schedule" "schedule1" {
  name = "schedule1"
  owner_team_id = opsgenie_team.team1.id
}

resource "opsgenie_schedule_rotation" "teamrotation" {
  schedule_id = opsgenie_schedule.schedule1.id
  start_date = "2020-10-30T00:00:00Z"
  type = "hourly"
  participant {
    type = "user"
    id = opsgenie_user.user1.id
  }

  participant {
    type = "user"
    id = opsgenie_user.user2.id
  }
}
