output "master_ip" {
  value = proxmox_vm_qemu.vm-instance["100"].default_ipv4_address
}

output "node1_ip" {
  value = proxmox_vm_qemu.vm-instance["101"].default_ipv4_address
}

output "node2_ip" {
  value = proxmox_vm_qemu.vm-instance["102"].default_ipv4_address
}
