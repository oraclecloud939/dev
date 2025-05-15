resource "libvirt_domain" "vm" {
  name   = var.name
  memory = var.memory
  vcpu   = var.vcpu
  disk {
    source = var.disk_image
    format = "qcow2"
  }
  network_interface {
    network_id = var.network_id
  }
  cloudinit = var.cloudinit_config != "" ? var.cloudinit_config : null

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }

  console {
    type        = "pty"
    target_type = "serial"
  }

  video {
    type = "qxl"
  }

  provisioner "remote-exec" {
    inline = [
      "hostnamectl set-hostname ${var.name}",
      # Altre configurazioni post-creazione se necessarie (richiede SSH/WinRM)
    ]
    connection {
      type        = "ssh" # O "winrm" se configurato
      user        = var.ssh_username
      private_key = file(var.ssh_private_key_path)
      host        = self.network_interface.0.addresses.0 # Potrebbe richiedere un output specifico
    }
    # Il provisioner remote-exec per Windows potrebbe richiedere WinRM
    # e una configurazione iniziale specifica nel template.
  }
}