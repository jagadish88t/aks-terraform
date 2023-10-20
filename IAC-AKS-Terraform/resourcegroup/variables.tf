variable "resource_group_name" {
  type        = string
  description = "Resource group name for AKS"
}
variable "resource_group_location" {
  type        = string
  description = "Resource group location for AKS"
}
variable "resource_group_tags" {
  type = map(string)
}