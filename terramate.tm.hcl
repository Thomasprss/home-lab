terramate {
  config {
    disable_safeguards = [
      "git-uncommitted",
      "git-untracked"
    ]
    experiments = [
      "scripts", # Enable Terramate Scripts
    ]
  }
}

globals {
  token_id = "terraform-prov@pve!terraform"
  api_url  = "https://192.168.0.45:8006/api2/json"
  token    = "c93c9f5c-7ad8-4c04-b914-d1e95e932a6b"
}

generate_file "provider.tf" {
  content = <<EOF
## Generate by terramate
provider "proxmox" {
  pm_api_token_id     = "${global.token_id}"
  pm_api_token_secret = "${global.token}"
  pm_api_url          = "${global.api_url}"
  pm_tls_insecure     = true
}
EOF
}

generate_file "version.tf" {
  content = <<EOF
## Generate by terramate
terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc8"
    }
  }
}
EOF
}


