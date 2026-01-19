variable "api_token" {
}

variable "vms" {
  type = map(string)
}

variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxzSfh25piQgBazhER763HRw5SVLPvvDs+62OEB2rdOQZjv4I2gwbpFcFdfSKONhhFfjn0sqqv3KKmwsRM7WE8BwZgUxA1FhXaRflQMCO27h1YtGnl/atfRMqra1X7e3RE6LzSGGhpNE/wMdgciCZ5TwlISAR5wz3aP3nhBtlYRmnQxQcYRleBg8feJx/jyDwfH6r1h0x/APPunvIm5m1J3cOrnYsItx3FrrBO0PF9jIiSUD9rwgFoQ/pkiUFeivMxLKdz8zMFG36O3aPpKD6kclB+QEeI7kPMd3jr8VdZY1Ke7jvUbRoqjBVVV+/VcYFycnyKIaj0fQpRGB9/0STLy6HjEqFfWRVyDi1/wGhEjUjtS0MEhI4Eqott0uwtiyJ08WDu+lIIEr/vFnKeIhXamLfVmjgNFGAWXkWvfJZ+Gc7BCk58Se1eanXmYTrZMaeWmxklXGLpYWmMFg5ZPNOwlaoZFzJBUi+IILmNbk8OeAWIi6HubQAOxvddyySi+8sGJ0RGh2aNkpgh4e/T79xU5T3Xsom5DN8/mm8FBVUbeBbFzoU3zs2NXa/5xon3lioQ0amaAZdDaJPTMlChsL0rVjVAZUYGyc4r78qphMIyYydyDIkZrsdNzS7ge2cNSJUHnOrvi+mdMFUFlKhU54E97vgPlqAnxAyDJqqoDR+9tQ== thomasprs@MacBook-Pro-de-thomasprs.local"
}

variable "vm_name" {
  description = "Nom de la VM"
  type        = string
  default     = "pve"
}

variable "node_name" {
  description = "Nom du node Proxmox"
  type        = string
}

variable "domain" {
  description = "Domaine DNS"
  type        = string
  default     = "pve.thomas"
}

variable "storage_pool" {
  description = "Storage Proxmox pour les disques"
  type        = string
  default     = "local-lvm"
}

variable "template" {
  description = "Nom du template Proxmox"
  type        = string
  default     = "template-cloud-ubuntu"
}

variable "cicustom" {
  description = "Cloud init config"
  type        = string
}
