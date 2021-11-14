locals {
  daemon_json = file("${path.module}/daemon.json")
  path            = "/etc/docker/"
}

resource "local_file" "daemon_json" {
  content         = local.daemon_json
  filename        = "${local.path}/daemon.json"
  file_permission = "0644"
}
