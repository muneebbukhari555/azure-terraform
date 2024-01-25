# Generic Input Variables
# Business Division
variable "business_divsion" {
  description = "Business division in large organization"
  type        = string
  default     = "bukhari"
}

# Environment Variable
variable "environment" {
  description = "Enviroment Variable used as a prefix"
  type        = string
  default     = "dev"
}

# Azure Resource Group Name 
variable "resource_group_name" {
  description = "Name of RG"
  type        = string
  default     = "rg-default"
}

# Azure Resources Location
variable "resource_group_location" {
  description = "Location of RG"
  type        = string
  default     = "eastus2"
}