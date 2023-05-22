# Create application repository
resource "github_repository" "application" {
  name        = "application-repo"
  description = "Integration with Github"

  visibility = "public"
  auto_init  = true

  template {
    owner                = "organization-igabi"
    repository           = "app-template"
    include_all_branches = true
  }

}

resource "github_branch_protection" "application" {
  repository_id = github_repository.application.node_id

  pattern          = "main"
  enforce_admins   = true
  allows_deletions = false
}