variable "platform_name" {}
variable "node_count" {}
variable "cpu_count" {}
variable "memory_mb" {}
variable "datastore" {}
variable "network" {}

# Normalement, ici il y aurait la ressource :
# resource "vsphere_virtual_machine" "vm" {
#   count = var.node_count
#   ...
# }
