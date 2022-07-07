data "azurerm_resource_group" "RG" {
  name = var.resource_group_name
}

# Generate Ramdon String
resource "random_string" "random_passwd" {
  length                       = "14"
  special                      = "true"
}
# Create the secret for user
resource "azurerm_key_vault_secret" "pass_secret" {
  name                         = var.passwordsecret_name
  value                        = random_string.random_passwd.result
  key_vault_id                 = data.azurerm_key_vault.RG.id
}
