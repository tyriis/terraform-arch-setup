# configure git

locals {
  config = file("${path.module}/config")
  path   = "/home/${var.user}/"
}

resource "local_file" "config" {
  content         = local.config
  filename        = "${local.path}/.gitconfig"
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
    command     = "chown ${var.user}: .gitconfig"
    working_dir = local.path
  }
}

resource "local_file" "strg_config" {
  content         = local.config
  filename        = "${local.path}/projects/strg/.gitconfig"
  file_permission = "0600"
}

resource "null_resource" "strg_ownership" {
  triggers = {
    xinitrc = sha1(local.config)
  }
  depends_on = [
    local_file.strg_config
  ]
  provisioner "local-exec" {
    command     = "chown ${var.user}: .gitconfig"
    working_dir = "${local.path}/projects/strg"
  }
}

resource "local_file" "techtales_config" {
  content         = local.config
  filename        = "${local.path}/projects/techtales/.gitconfig"
  file_permission = "0600"
}

resource "null_resource" "techtales_ownership" {
  triggers = {
    xinitrc = sha1(local.config)
  }
  depends_on = [
    local_file.strg_config
  ]
  provisioner "local-exec" {
    command     = "chown ${var.user}: .gitconfig"
    working_dir = "${local.path}/projects/techtales"
  }
}
