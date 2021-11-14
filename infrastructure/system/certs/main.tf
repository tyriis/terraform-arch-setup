# install my-ca.pem

locals {
  ca_pem = file("${path.module}/my-ca.pem")
  path   = "/etc/ca-certificates/trust-source/anchors"
}

resource "local_file" "my_ca" {
  content         = local.ca_pem
  filename        = "${local.path}/my-ca.pem"
  file_permission = "0444"
}

resource "null_resource" "install_my_ca" {
  depends_on = [local_file.my_ca]
  provisioner "local-exec" {
    command = "update-ca-trust"
  }
}
