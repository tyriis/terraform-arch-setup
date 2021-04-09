# install and configure yay

locals {
  xinitrc = file("${path.module}/xinitrc")
}

resource "local_file" "xinitrc" {
  content = local.xinitrc
  filename = "/home/${var.user}/.xinitrc"
  file_permission = "0600"
}

resource "null_resource" "package_install" {
  triggers = {
    xinitrc = sha1(local.xinitrc)
  }
  depends_on = [
    local_file.xinitrc
  ]
  provisioner "local-exec" {
    command = "sudo chown ${var.user}: .xinitrc"
    working_dir = "/home/${var.user}/"
  }
}
