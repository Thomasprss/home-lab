output "vm_ips" {
  description = "IP addresses of VMs"
  value = {
    for k, vm in proxmox_vm_qemu.vm :
    k => vm.default_ipv4_address
  }
}

