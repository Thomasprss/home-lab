# resource "proxmox_cloud_init_disk" "cloud_init" {
#   name     = local.vm_name
#   pve_node = local.node_name
#   storage  = "cephfs"
#
#   meta_data = yamlencode({
#     instance_id    = sha1(local.vm_name)
#     local-hostname = local.vm_name
#   })
#
#   user_data = file("../cloud-init/user_data")
#
#   network_config = yamlencode({
#     version = 1
#     config = [{
#       type = "physical"
#       name = "eth0"
#       subnets = [{
#         type    = "static"
#         address = "192.168.1.100/24"
#         gateway = "192.168.1.1"
#         dns_nameservers = [
#           "1.1.1.1",
#           "8.8.8.8"
#         ]
#       }]
#     }]
#   })
# }
#
