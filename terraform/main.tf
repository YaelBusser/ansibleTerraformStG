terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "~> 2.4"
    }
  }
}

module "stg_plateforme" {
  source   = "./modules/stg_platform"
  for_each = var.plateformes

  platform_name = each.key
  node_count    = 12
  cpu_count     = each.value.cpu
  memory_mb     = each.value.memory_mb
  datastore     = each.value.datastore
  network       = var.stg_network
}
