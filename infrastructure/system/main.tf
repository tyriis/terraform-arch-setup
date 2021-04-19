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

module "xinit" {
  depends_on = [
    module.locale
  ]
  source = "./xinit"
  user = var.user
}

module "i3" {
  depends_on = [
    module.xinit
  ]
  source = "./i3"
  user = var.user
}

module "i3blocks" {
  depends_on = [
    module.i3
  ]
  source = "./i3blocks"
  user = var.user
}

module "timesyncd" {
  depends_on = [
    module.packages
  ]
  source = "./timesyncd"
}