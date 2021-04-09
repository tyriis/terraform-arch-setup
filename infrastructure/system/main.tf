module "packages" {
  source = "./packages"
  user = var.user
  cores = var.cores
}

module "locale" {
  depends_on = [
    module.packages
  ]
  source = "./locale"
}
