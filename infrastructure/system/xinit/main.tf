# install and configure yay

locals {
  xinitrc = file("${path.module}/xinitrc")
}

resource "local_file" "xinitrc" {
  content = local.xinitrc
  filename = "/home/${var.user}/.xinitrc"
  file_permission = "0600"
}
