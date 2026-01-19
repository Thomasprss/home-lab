locals {

  vm_name      = "kube-master"
  node_name    = "pve"
  domain       = "pve.thomas"
  storage_pool = "local-lvm"

  template = "template-cloud-ubuntu"

}
