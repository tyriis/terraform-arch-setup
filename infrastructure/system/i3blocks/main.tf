# install and configure i3blocks

locals {
  path = "/home/${var.user}/.config/i3blocks"
  default_script_dir = "/usr/lib/i3blocks"
  config = templatefile("${path.module}/config", { default_script_dir= local.default_script_dir })
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
    working_dir = local.path
  }
}
