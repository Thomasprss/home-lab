resource "proxmox_cloud_init_disk" "master" {
  name     = "template-master"
  pve_node = local.node_name
  storage  = local.storage_pool

  meta_data = yamlencode({
    instance_id    = sha1(local.vm_name)
    local-hostname = local.vm_name
  })

  user_data = file("${path.module}/../cloud-init/user_data")

  network_config = yamlencode({
    version = 1
    config = [{
      type = "physical"
      name = "eth0"
      subnets = [{
        type = "dhcp"
        dns_nameservers = [
          "1.1.1.1",
          "8.8.8.8"
        ]
      }]
    }]
  })
}
