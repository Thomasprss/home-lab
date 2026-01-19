include {
  path = find_in_parent_folders()
}

locals {
  root = read_terragrunt_config(find_in_parent_folders("root.hcl"))
}

terraform {
  source = "../../catalog/proxmox-vm"
}

inputs = {
  vms = {
    999 = "ansible-master",

  }


  node_name    = local.root.locals.node_name
  domain       = local.root.locals.domain
  storage_pool = local.root.locals.storage_pool
  template     = local.root.locals.template

  cicustom = "vendor=local:snippets/cloud-init-ansible-master.yml"
}

