variable "name" {
  type        = string
  description = "Nome della macchina virtuale"
}

variable "memory" {
  type        = string
  description = "Quantità di memoria (es. 2G)"
}

variable "vcpu" {
  type        = number
  description = "Numero di CPU virtuali"
}

variable "disk_image" {
  type        = string
  description = "Percorso del file immagine del disco QCOW2"
}

variable "network_id" {
  type        = string
  description = "ID della rete libvirt a cui connettere la VM"
}

variable "cloudinit_config" {
  type        = string
  description = "Percorso del file cloud-init user-data (opzionale)"
  default     = ""
}

variable "ssh_username" {
  type        = string
  description = "Username SSH per la connessione (se necessario)"
  default     = "root"
}

variable "ssh_private_key_path" {
  type        = string
  description = "Percorso della chiave privata SSH (se necessario)"
  default     = "~/.ssh/id_rsa"
}