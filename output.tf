output "vm_ips" {
  description = "Indirizzi IP delle macchine virtuali create"
  value = {
    vm1 = module.windows_vm_1.ip_address
    vm2 = module.windows_vm_2.ip_address
  }
}