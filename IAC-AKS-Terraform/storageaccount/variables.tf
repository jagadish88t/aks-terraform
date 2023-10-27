variable "resource_group_name" {
  type        = string
  description = "Resource group name for AKS"
}
variable "resource_group_location" {
  type        = string
  description = "Resource group location for AKS"
}
variable "environment" {
  type = string
  description = "Environment where the resources are going to be created."
}
variable "tags" {
  type = map(string)
}