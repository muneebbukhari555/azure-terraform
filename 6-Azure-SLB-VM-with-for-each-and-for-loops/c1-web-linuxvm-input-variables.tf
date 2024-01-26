# Linux VM Input Variables Placeholder file.
variable "web_linuxvm_name" {
  description = "Name of VM"
  type        = string
  default     = "linux_vm"
}

# Web Linux VM Instance Count
variable "web_linuxvm_instance_count" {
  description = "Web Linux VM Instance Count"
  type        = map(string)
  default = {
    "vm1" = "1022",
    "vm2" = "2022",
    "vm3" = "3022",
    "vm4" = "4022",
    "vm5" = "5022",
  }
}
