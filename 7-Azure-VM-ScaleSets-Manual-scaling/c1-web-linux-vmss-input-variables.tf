# Linux VM Input Variables Placeholder file.
variable "web_vmss_nsg_inbound_port" {
  description = "Web VMSS NSG Inbound Ports"
  type        = list(string)
  default     = [22, 80, 443]
}

