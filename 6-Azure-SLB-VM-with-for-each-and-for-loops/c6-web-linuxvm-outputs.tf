/*## Public IP Address
output "web_linuxvm_public_ip" {
  description = "Web Linux VM Public Address"
  value = azurerm_public_ip.web_linuxvm_publicip.ip_address
}*/

## Virtual Machine Names and Private IP's
## Output Map - Single Input to for loop
output "web_linuxvm_private_ip_address_map" {
  description = "Web Linux Virtual Machine VM with Private IP"
  value       = { for vm in azurerm_linux_virtual_machine.web_linuxvm : vm.name => vm.private_ip_address }
}
## Terraform keys function which takes a map and returns a list of keys of the map.
output "web_linuxvm_private_ip_address_keys_function" {
  description = "Web Linux Virtual Machine VM-Name"
  value       = keys({ for vm in azurerm_linux_virtual_machine.web_linuxvm : vm.name => vm.private_ip_address })
}
## Terraform values function which takes a map and returns a list of value of the map.
output "web_linuxvm_private_ip_address_values_function" {
  description = "Web Linux Virtual Machine Private-IP"
  value       = values({ for vm in azurerm_linux_virtual_machine.web_linuxvm : vm.name => vm.private_ip_address })
}


# Network Interface Outputs
## Network Interface Private IP Addresses
# Output List - Single Input to for loop
output "web_linuxvm_network_interface_private_ip_addresses" {
  description = "Web Linux VM NIC Private IP Addresses"
  value       = [for nic in azurerm_network_interface.web_linuxvm_nic : nic.private_ip_addresses]
}
## Virtual Machine ID
## Output List - Two Input to for loop
output "web_linuxvm_network_interface_id_list" {
  description = "Web Linux Network Interface ID "
  value       = [for vm, nic in azurerm_network_interface.web_linuxvm_nic : nic.id]
}

## Output map - Two Input to for loop
output "web_linuxvm_network_interface_id_map" {
  description = "Web Linux Network Interface ID "
  value       = { for vm, nic in azurerm_network_interface.web_linuxvm_nic : vm => nic.id }
}




