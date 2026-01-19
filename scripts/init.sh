cd /var/lib/vz/template/iso
wget https://cloud-images.ubuntu.com/releases/22.04/release/ubuntu-22.04-server-cloudimg-amd64.img
virt-customize -a ubuntu-22.04-server-cloudimg-amd64.img --install qemu-guest-agent
virt-customize -a ubuntu-22.04-server-cloudimg-amd64.img --root-password password:network
qm create 9999 --name "ubuntu.local" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
qm importdisk 9999 ubuntu-22.04-server-cloudimg-amd64.img local
qm set 9999 --tags "template,ubuntu"
qm set 9999 --scsihw virtio-scsi-pci --scsi0 local:9999/vm-9999-disk-0.raw
qm set 9999 --boot c --bootdisk scsi0
qm set 9999 --ide2 local:cloudinit
qm set 9999 --serial0 socket --vga serial0
qm set 9999 --agent enabled=1
qm set 9999 --ipconfig0 ip=dhcp
qm template 9999
