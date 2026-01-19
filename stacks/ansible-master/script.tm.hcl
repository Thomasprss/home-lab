script "generate_ansible" {
  description = "Generate ansible host inventory"
  job {
    name = "inventory"
    commands = [
      ["bash", "../../scripts/generate_inventory.sh"],
      ["bash", "../../scripts/ansible-ssh-propagation.sh"]

    ]
  }
  job {
    name = "all_vars"
    commands = [
      ["bash", "../../scripts/generate_all_group_vars.sh"]
    ]
  }

}

script "generate_ansible" "directory" {
  description = "Generate ansible host inventory"
  job {
    name = "ansible folder"
    commands = [
      ["bash", "../../scripts/push-ansible-playbooks-to-master.sh"]
    ]
  }

}

