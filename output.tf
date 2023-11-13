
output "app_display_name" {
    value = azuread_application.apple.display_name
}

output "tenant_id" {
    value = data.azuread_client_config.current.tenant_id

}

output "client_id" {
  value = azuread_application.apple.id
}

output "client_secret" {
    value = azuread_application_password.Secret
    sensitive = true
}

output "spn_objectid" {
  value = azuread_service_principal.spn.object_id
}

output "application_objectid" {
    value = azuread_application.apple.object_id
  
}
