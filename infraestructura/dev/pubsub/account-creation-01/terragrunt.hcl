terraform {
  source = "git::https://github.com/terraform-google-modules/${local.this.module}.git//?ref=${local.this.version}"
}


include {
  path = find_in_parent_folders()
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

prevent_destroy = true # colocar false si se quiere destruir
skip = false # colocar true si se quiere saltar este modulo
