module "infrastructure" {
  source = "./infrastructure"
  user = var.user
  cores = var.cores
}
