provider "libvirt" {
  uri = "qemu:///system"
}

module "windows_vm_1" {
  source        = "./modules/vm"
  name          = "windows-vm-01"
  memory        = "4G"
  vcpu          = 2
  disk_image    = var.windows_template_path
  network_id    = var.kvm_default_network
  # cloudinit_config = "./templates/cloud-init/user-data-vm1.tpl" # Se si usa cloud-init
  ssh_username      = "administrator" # Sostituire con l'utente corretto
  ssh_private_key_path = "~/.ssh/id_rsa" # Sostituire con il percorso corretto
}

module "windows_vm_2" {
  source        = "./modules/vm"
  name          = "windows-vm-02"
  memory        = "8G"
  vcpu          = 4
  disk_image    = var.windows_template_path
  network_id    = var.kvm_default_network
  # cloudinit_config = "./templates/cloud-init/user-data-vm2.tpl" # Se si usa cloud-init
  ssh_username      = "administrator" # Sostituire con l'utente corretto
  ssh_private_key_path = "~/.ssh/id_rsa" # Sostituire con il percorso corretto
}

# Puoi definire altri moduli per creare più macchine virtuali