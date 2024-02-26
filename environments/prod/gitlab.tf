terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
    }
  }
}
provider "gitlab" {
  token    = var.TOKEN
  insecure = true
  base_url = var.BASE_URL
}
# CREATION OF NEW GITLAB PROJECT
resource "gitlab_project" "website-project" {
  name             = "${var.PROJECT_NAME}-${terraform.workspace}-website"
  description      = "This is my project for website."
  visibility_level = "private"
}
# CREATION OF NEW GITLAB GROUP
resource "gitlab_group" "webiste-group" {
  name             = "${var.PROJECT_NAME}-${terraform.workspace}-group"
  path             = "group"
  description      = "This is my group for website"
  visibility_level = "private"
}

output "gitlab-project-name" {
  value = gitlab_project.website-project.name
}



