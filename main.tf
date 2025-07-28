data "azurerm_resource_group" "agentic_rg" {
  name = "genai-pivot-dev"  # 🔹 Replace with the actual Resource Group name
}
resource "azurerm_app_service_plan" "webapp_service_plan" {
  name = "ASP-frontend-dev"
  location = data.azurerm_resource_group.agentic_rg.location
  resource_group_name = data.azurerm_resource_group.agentic_rg.name

  sku {
    tier = "Basic"
    size = "B3"
  }

  kind = "Linux"
  reserved = true
}
