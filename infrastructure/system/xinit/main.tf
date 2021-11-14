# install and configure yay

locals {
  xinitrc = file("${path.module}/xinitrc")
  path    = "/home/${var.user}"
}

resource "local_file" "xinitrc" {
  content         = local.xinitrc
  filename        = "${local.path}/.xinitrc"
  file_permission = "0600"
}

resource "null_resource" "ownership" {
  triggers = {
    xinitrc = sha1(local.xinitrc)
  }
  depends_on = [
    local_file.xinitrc
  ]
  provisioner "local-exec" {
    command     = "chown ${var.user}: .xinitrc"
    working_dir = local.path
  }
}
