# install and configure yay

locals {
  config = file("${path.module}/config")
  path = "/home/${var.user}/.config/i3"
}

resource "local_file" "config" {
  content = local.config
  filename = "${local.path}/config"
  file_permission = "0600"
}

resource "null_resource" "ownership" {
  triggers = {
    xinitrc = sha1(local.config)
  }
  depends_on = [
    local_file.config
  ]
  provisioner "local-exec" {
    command = "chown ${var.user}: config"
    working_dir = "${local.path}"
  }
}
