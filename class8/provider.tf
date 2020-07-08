provider "azurerm" {
  version = "1.27"
}

# These resources are to be created before running "terraform init" 

terraform {
  required_version = "0.11.14"

  backend "azurerm" {
    resource_group_name  = "dev"
    storage_account_name = "dev1aia"
    container_name       = "devcontainer"
    access_key           = "x+itnMQE9cOkLXFxy6dK6XK39pko22uoknU8TPduwFCZ1XopgE8SebZ5NUG00UrSlyTNv8ClnxT8VHuCl4X4nQ=="
    key                  = "dev_terraform.tfstate"
  }
}
