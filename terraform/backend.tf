terraform {
  cloud {
    organization = "hexlet--devops"

    workspaces {
      name = "devops-project"
    }
  }
}