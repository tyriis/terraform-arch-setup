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

#module "xinit" {
#  depends_on = [
#    module.locale
#  ]
#  source = "./xinit"
#  user = var.user
#}

module "timesyncd" {
  depends_on = [
    module.packages
  ]
  source = "./timesyncd"
}

module "certs" {
  source = "./certs"
}
