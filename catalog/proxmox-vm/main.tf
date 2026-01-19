resource "proxmox_vm_qemu" "vm" {
  for_each = var.vms

  vmid        = each.key
  name        = each.value
  target_node = var.node_name
  clone       = var.template
  full_clone  = true

  os_type = "cloud-init"
  boot    = "order=scsi0"

  agent = 1

  sockets = 1
  cores   = 1
  memory  = 1024

  scsihw    = "virtio-scsi-single"
  cicustom  = var.cicustom #"vendor=local:snippets/qemu-guest-agent.yml" # /var/lib/vz/snippets/qemu-guest-agent.yml
  ciupgrade = true

  disks {
    scsi {
      scsi0 {
        disk {
          size    = "32G"
          storage = "local-lvm"
        }
      }
    }

    ide {
      ide1 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
  }




  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }


  ipconfig0 = "ip=dhcp"

  ciuser = "ubuntu"

  sshkeys = var.ssh_key

}
