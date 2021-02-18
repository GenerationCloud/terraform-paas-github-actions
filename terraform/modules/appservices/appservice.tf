# Create an App Service plan
resource "azurerm_app_service_plan" "dev_app_service_plan" {
  name                = "${var.app_service_plan_name}-plan"
  location            = "${var.app_service_plan_location}"
  resource_group_name = "${var.app_service_plan_rg}"

  sku {
    tier = "${var.app_service_plan_tiers}"
    size = "${var.app_service_plan_sku}"
  }
}

#Create an App service

resource "azurerm_app_service" "dev_app_service" {
  name                = "${var.app_service_name}-app"
  location            = "${var.app_service_location}"
  resource_group_name = "${var.app_service_rg}"
  app_service_plan_id = azurerm_app_service_plan.dev_app_service_plan.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  tags = {
    environment = "${var.app_service_tag_env}"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "PostgreSQL" #Possible values are APIHub, Custom, DocDb, EventHub, MySQL, NotificationHub, PostgreSQL, RedisCache, ServiceBus, SQLAzure, SQLServer
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}

output "app_service_url" {
  value = azurerm_app_service.dev_app_service.default_site_hostname
  description = "URL to connect to App Service"
}