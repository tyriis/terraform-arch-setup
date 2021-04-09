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

module "xinitrc" {
  depends_on = [
    module.locale
  ]
  source = "./xinit"
  user = nils
}
