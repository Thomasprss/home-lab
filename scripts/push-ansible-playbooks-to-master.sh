#!/usr/bin/env bash
set -euo pipefail

# STACK_DIR="../ansible-master"
# cd  "$STACK_DIR"

ANSIBLE_OUTPUT=$(terragrunt output -json)
ANSIBLE_IP=$(echo "$ANSIBLE_OUTPUT" | jq -r '.vm_ips.value["999"]')
rsync -chavzP ../../ansible ubuntu@"$ANSIBLE_IP":/home/ubuntu/
