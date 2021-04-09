# install and configure yay

locals {
  config = file("${path.module}/config")
}

resource "local_file" "config" {
  content = local.xinitrc
  filename = "/home/${var.user}/.config/i3/config"
  file_permission = "0600"
}
