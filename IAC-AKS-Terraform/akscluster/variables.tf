# Azure AKS Location
variable "resource_group_location" {
  type = string
  description = "AKS resource location"
}

# Azure AKS Resource Group Name
variable "resource_group_name" {
  type = string
  description = "AKS resource group name where the resource need to be created."
}

# Azure AKS Environment Name
variable "environment" {
  type = string
  description = "AKS environment"
}

# AKS Cluster input variables

# AKS cluster name
variable "aks_cluster_name" {
  type = string
  description = "AKS cluster name."
}
# AKS Input Variables

# SSH Public Key for Linux VMs
variable "ssh_public_key" {
  default = "~/.ssh/aks-prod-sshkeys-terraform/aksprodsshkey.pub"
  description = "This variable defines the SSH Public Key for Linux k8s Worker nodes"
}

# Windows Admin Username for k8s worker nodes
variable "windows_admin_username" {
  type = string
  default = "azureuser"
  description = "This variable defines the Windows admin username k8s Worker nodes"
}

# Windows Admin Password for k8s worker nodes
variable "windows_admin_password" {
  type = string
  default = "StackSimplify@102"  # Updated June 2023
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


variable "resource_group_tags" {
  type = map(string)
}