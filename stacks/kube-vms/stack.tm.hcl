stack {
  name        = "Stack  kube-vms"
  description = "Stack  kube-vms"
  id          = "582468b1-4882-417a-aeee-6e588fd283c7"
  tags        = ["kube", "vms", "lab"]

  before = [
    "tag:ansible-master"
  ]

}
