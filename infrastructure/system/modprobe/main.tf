# blacklist nouveau

locals {
  nouveau_blacklist = file("${path.module}/modprobe.d/blacklist-nvidia-nouveau.conf")
  path            = "/etc/modprobe.d/"
}

resource "local_file" "nouveau_blacklist" {
  content         = local.nouveau_blacklist
  filename        = "${local.path}/blacklist-nvidia-nouveau.conf"
  file_permission = "0644"
}
