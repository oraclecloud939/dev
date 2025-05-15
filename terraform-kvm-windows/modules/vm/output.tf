output "ip_address" {
  description = "Indirizzo IP della macchina virtuale (potrebbe non essere disponibile subito)"
  value       = libvirt_domain.vm.network_interface.0.addresses.0
}