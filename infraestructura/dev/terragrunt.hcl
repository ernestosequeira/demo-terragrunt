locals {

  all_envs                = yamldecode(file("all_envs.yaml"))
  common_vars             = yamldecode(file("common_vars.yaml"))

}

remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket   = "terraform-state-iac-demo-dev"
    prefix   = "${local.all_envs.project_folder}/${local.all_envs.project_name}/${local.common_vars.env}/${path_relative_to_include()}"
    project  = "d-cord-1725"
    location = "us-central1"
  }
}
