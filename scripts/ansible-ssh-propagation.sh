#!/usr/bin/env bash
set -euo pipefail

STACK_DIR="../kube-vms"
ANSIBLE_OUTPUT=$(terragrunt output -json)
cd "$STACK_DIR"
OUTPUT=$(terragrunt output -json)

ANSIBLE_IP=$(echo "$ANSIBLE_OUTPUT" | jq -r '.vm_ips.value["999"]')

ssh-keygen -t rsa -b 4096 -f ./ansible-key -N ""
scp ansible-key ubuntu@"$ANSIBLE_IP":~/.ssh/ansible-key
scp ansible-key.pub ubuntu@"$ANSIBLE_IP":~/.ssh/ansible-key.pub

for VMID in 100 101 102; do
  IP=$(echo "$OUTPUT" | jq -r ".vm_ips.value[\"$VMID\"]")

  echo "🔑 Installing SSH key on node $VMID ($IP)"

  scp ansible-key.pub ubuntu@"$IP":/tmp/ansible-key.pub

  ssh ubuntu@"$IP" <<EOF
mkdir -p ~/.ssh
  cat /tmp/ansible-key.pub >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
rm /tmp/ansible-key.pub
EOF
done

  echo "✅ SSH key authorized on all nodes"
rm ansible-key ansible-key.pub inventory.yaml

