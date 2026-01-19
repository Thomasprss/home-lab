#!/usr/bin/env bash
set -euo pipefail

STACK_DIR="../kube-vms"
ANSIBLE_IP=$(terragrunt output -json)

cd "$STACK_DIR"

OUTPUT=$(terragrunt output -json)

MASTER_ID="100"



cat > inventory.yaml <<EOF
all:
  vars:
    ansible_user: ubuntu
    ansible_ssh_private_key_file: ~/.ssh/ansible-key
    ansible_python_interpreter: /usr/bin/python3

  children:
    kube_master:
      hosts:
EOF

# kube-master (vmid 100)
echo "$OUTPUT" | jq -r --arg mid "$MASTER_ID" '
  .vm_ips.value
  | to_entries[]
  | select(.key == $mid)
  | "        kube-master:\n          ansible_host: \(.value)"
' >> inventory.yaml

cat >> inventory.yaml <<EOF

    kube_nodes:
      hosts:
EOF

# kube-nodes (tout sauf 100)
INDEX=1
echo "$OUTPUT" | jq -r --arg mid "$MASTER_ID" '
  .vm_ips.value
  | to_entries[]
  | select(.key != $mid)
  | "        kube-node-\(.key):\n          ansible_host: \(.value)"
' >> inventory.yaml

echo "✅ inventory.yaml generated (VMID-based mapping)"

scp inventory.yaml ubuntu@$(echo "$ANSIBLE_IP" | jq -r '.vm_ips.value["999"]'):/home/ubuntu/inventory.yaml

cat > ansible.cfg <<EOF
[defaults]
inventory = inventory.yaml
EOF

scp ansible.cfg ubuntu@$(echo "$ANSIBLE_IP" | jq -r '.vm_ips.value["999"]'):/home/ubuntu/ansible.cfg

echo "✅ ansible.cfg generated (VMID-based mapping)"
rm ansible.cfg
