# Create Log analytics workspace for AKS
# resource "random_pet" "aksrandom" {
  
# }

resource "azurerm_log_analytics_workspace" "aks_insights" {
  name = "logs-${var.log_analytics_workspace_name}-${var.environment}-jt"//-${random_pet.random.id}"
  location = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku = var.log_analytics_workspace_sku //"PerGB2018"
  retention_in_days = 30
}

/*
  Create log analytics solution.
  If this resource is not added in terraform it will be created automatically and needs to be imported in tfstate later.
  https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_solution#product
  https://github.com/hashicorp/terraform-provider-azurerm/blob/main/website/docs/r/log_analytics_solution.html.markdown
*/
resource "azurerm_log_analytics_solution" "aks_insights_solution" {
  solution_name = "ContainerInsights"
  location = var.resource_group_location
  resource_group_name = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.aks_insights.id
  workspace_name = azurerm_log_analytics_workspace.aks_insights.name

  plan {
    publisher = "Microsoft"
    product = "OMSGallery/ContainerInsights"
  }
}

# Create Azure AD Group for AKS Admins
resource "azuread_group" "aks_admins" {
  display_name = "${var.resource_group_name}-cluster-admins"
  security_enabled = true
  description = "Azure AKS Kubernetes administrators for the ${var.resource_group_name}-cluster."
}

# Create AKS cluster
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.resource_group_name}-cluster"
  kubernetes_version = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = "${var.resource_group_name}-nrg"

  default_node_pool {
    name       = "systempool"
    //node_count = 1
    vm_size    = "Standard_D2_v2"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    zones = [ 1, 2, 3 ]
    enable_auto_scaling = true
    max_count = 3
    min_count = 1
    os_disk_size_gb = 30
    type = "VirtualMachineScaleSets"
    node_labels = {
      "nodepool-type" = "system"
      "environment" = var.environment
      "nodepoolos" = "linux"
      "app" = "system-apps"
    }
    tags = var.resource_group_tags
  }

# Identity (System Assigned or Service Principal)
  identity {
    type = "SystemAssigned"
  }

  # Add on profiles
  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.aks_insights.id
  }

  azure_active_directory_role_based_access_control {
    managed = true
    admin_group_object_ids = [azuread_group.aks_admins.id]
  }

  windows_profile {
    admin_username = var.windows_admin_username
    admin_password = var.windows_admin_password
  }

  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
  }
  
  tags = var.resource_group_tags
}