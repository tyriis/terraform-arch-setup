module "infrastructure" {
  source = "./infrastructure"
  user = var.user
  cores = var.cores
}

#data "vault_generic_secret" "test" {
#  path = "secrets/home/nils/.ssh"
#}

#locals {
#  test = data.vault_generic_secret.test
#}

#output "test" {
#  value = local.test
#  sensitive = false
#}
