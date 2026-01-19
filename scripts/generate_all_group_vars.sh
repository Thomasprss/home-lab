#!/usr/bin/env bash
set -euo pipefail

STACK_DIR_KUBE="../kube-vms"
STACK_DIR_ANSIBLE="../ansible-master"

cd "$STACK_DIR_ANSIBLE"
ANSIBLE_IP=$(terragrunt output -json)


cd "$STACK_DIR_KUBE"
OUTPUT=$(terragrunt output -json)

cd ../../ansible/group_vars
MASTER_ID="100"



cat > all.yaml <<EOF
---

EOF

echo "$OUTPUT" | jq -r --arg mid "$MASTER_ID" '
  .vm_ips.value
  | to_entries[]
  | select(.key == $mid)
  | "kube_master_ip: \(.value)"
' >> all.yaml
INDEX=1
echo "$OUTPUT" | jq -r --arg mid "$MASTER_ID" '
  .vm_ips.value
  | to_entries[]
  | select(.key != $mid)
  | "kube_node_\(.key)_ip: \(.value)"
' >> all.yaml

echo "✅ ansible/group_vars/all.yaml generated"


