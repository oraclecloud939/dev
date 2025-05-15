variable "kvm_default_network" {
  type        = string
  description = "Nome della rete KVM predefinita"
  default     = "default"
}

variable "windows_template_path" {
  type        = string
  description = "Percorso del template QCOW2 di Windows 10"
  default     = "/var/lib/libvirt/images/windows10-template.qcow2"
}

# Altre variabili globali se necessario