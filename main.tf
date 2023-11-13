terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.45.0"



    }
  }
}

provider "azuread" {

}
data "azuread_client_config" "current" {}

resource "azuread_application" "apple" {
  display_name = var.app_display_name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "spn" {
  client_id                    = azuread_application.apple.client_id
  app_role_assignment_required = true
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "time_rotating" "example" {
  rotation_days = 7
}

resource "azuread_application_password" "Secret" {
  application_id = azuread_application.apple.id
  rotate_when_changed = {
    rotation = time_rotating.example.id
  }
}