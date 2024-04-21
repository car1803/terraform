terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = var.github_token
}

resource "github_repository" "codebase" {
  name        = var.repo_name
  description = "My awesome codebase"
  visibility  = "public"
}

resource "github_repository" "webpage" {
  name        = "${var.repo_name}-web"
  description = "My awesome web page"
  visibility  = "public"
}

resource "github_branch" "development" {
  repository = github_repository.codebase.name
  branch     = "development"
  depends_on = [github_repository.codebase]
  lifecycle {
    ignore_changes = [
      branch
    ]
    create_before_destroy = true
  }
}

resource "github_branch" "testing" {
  repository = github_repository.codebase.name
  branch     = "testing"
  depends_on = [github_repository.codebase]
}

resource "github_branch" "feature" {
  repository = github_repository.codebase.name
  branch     = "feature"
  depends_on = [github_repository.codebase]
}
