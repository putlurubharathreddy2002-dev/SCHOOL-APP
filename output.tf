output "vm_public_ip" {
  value = azurerm_public_ip.pip.ip_address
}

output "mysql_endpoint" {
  value = azurerm_mysql_flexible_server.mysql.fqdn
}

output "application_url" {
  value = "http://${azurerm_public_ip.pip.ip_address}"
}