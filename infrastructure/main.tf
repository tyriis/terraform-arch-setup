module "system" {
  source = "./system"
  user = var.user
  cores = var.cores
}

module "user" {
  source = "./user"
  user = var.user
}
