# install and configure yay

locals {
  logitech_default_zoom = file("${path.module}/rules/99-logitech-default-zoom.rules")
  rules_path            = "/etc/udev/rules.d"
}

resource "local_file" "logitech_default_zoom" {
  content         = local.logitech_default_zoom
  filename        = "${local.rules_path}/99-logitech-default-zoom.rules"
  file_permission = "0644"
}
