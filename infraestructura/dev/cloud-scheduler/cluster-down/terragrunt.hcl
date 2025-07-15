terraform {
  source = "../../../modules//cloud-scheduler/scheduler-http"
}

include {
  path = "${find_in_parent_folders()}"
}

locals {

  this                    = yamldecode(file("${get_terragrunt_dir()}/vars.yaml"))
  all_envs                = yamldecode(file("${get_terragrunt_dir()}../../../all_envs.yaml"))
  common_vars             = yamldecode(file("${get_terragrunt_dir()}../../../common_vars.yaml"))

}

inputs = merge(
  {
    project_id               = [ "${local.this.project_id}" ] 
  },
  local.this,
  local.common_vars
)

prevent_destroy = false # colocar false si se quiere destruir
skip = false # colocar true si se quiere saltar este modulo
