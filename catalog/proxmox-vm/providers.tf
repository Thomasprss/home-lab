# terraform {
#   required_providers {
#     proxmox = {
#       source  = "Telmate/proxmox"
#       version = "3.0.1-rc8"
#     }
#   }
# }

# provider "proxmox" {
#   pm_api_token_id     = "terraform-prov@pve!terraform"
#   pm_api_token_secret = var.api_token
#   pm_api_url          = "https://192.168.0.45:8006/api2/json"
#   pm_tls_insecure     = true
# }
