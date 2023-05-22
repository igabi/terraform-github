resource "github_team_repository" "all" {
  for_each = {
    for team in csvdecode(file("teams.csv")) :
    team.team_id => team
  }

  team_id    = each.value.team_id
  permission = each.value.permission

  repository = github_repository.application.name
}