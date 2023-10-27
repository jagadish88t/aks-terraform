# Variables for Resources
# All resources are created in one Resource Group only

# Constant variables for all resources accross this project
variable "resource_group_name" {
  type        = string
  description = "Resource group name for AKS"
}
variable "resource_group_location" {
  type        = string
  description = "Resource group location for AKS"
  validation {
    condition = contains(["eastus", "westus"], lower(var.resource_group_location))
    error_message = "Unsupported Azure Region specified. Supported regions include: eastus, westus."
  }
}
variable "resource_group_tags" {
  type = map(string)
}
# variable "resource_group_tags" {
#   type = object({
#     owner = string
#   })
# }
variable "environment" {
  type = string
  description = "Environment where the resources are going to be created"
}


# AKS Input Variables

# AKS Cluster input variables

# AKS cluster name
variable "aks_cluster_name" {
  type = string
  description = "AKS cluster name."
}

# SSH Public Key for Linux VMs
variable "ssh_public_key" {
  default = "~/.ssh/aks-prod-sshkeys-terraform/aksprodsshkey.pub"
  description = "This variable defines the SSH Public Key for Linux k8s Worker nodes"
}

# Windows Admin Username for k8s worker nodes
variable "windows_admin_username" {
  type = string
  description = "This variable defines the Windows admin username k8s Worker nodes"
}

# Windows Admin Password for k8s worker nodes
variable "windows_admin_password" {
  type = string
  description = "This variable defines the Windows admin password k8s Worker nodes"  
}


# Log Analytics workspace variables

# Log analytics workspace name
variable "log_analytics_workspace_name" {
  type = string
  description = "Log Analytics workspace resource name."
}

# Log analytics workspace sku
variable "log_analytics_workspace_sku" {
  type = string
  description = "SKU for log analytics workspace."
}