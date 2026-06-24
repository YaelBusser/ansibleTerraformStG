variable "stg_network" {
  description = "Nom du réseau VMware pour le simulateur"
  type        = string
  default     = "VM Network"
}

variable "plateformes" {
  description = "Configuration des différentes plateformes StG"
  type = map(object({
    cpu       = number
    memory_mb = number
    datastore = string
  }))
  default = {
    "plateforme1" = {
      cpu       = 4
      memory_mb = 16384
      datastore = "datastore1"
    }
    "plateforme2" = {
      cpu       = 4
      memory_mb = 16384
      datastore = "datastore2"
    }
    "plateforme3" = {
      cpu       = 4
      memory_mb = 16384
      datastore = "datastore3"
    }
    "plateforme4" = {
      cpu       = 4
      memory_mb = 16384
      datastore = "datastore4"
    }
  }
}
