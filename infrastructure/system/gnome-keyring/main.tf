# unlock the gnome keyring and the ssh keys

locals {
  login = file("${path.module}/pam.d/login")
  passwd = file("${path.module}/pam.d/passwd")
  path            = "/etc/pam.d/"
}

resource "local_file" "login" {
  content         = local.login
  filename        = "${local.path}/login"
  file_permission = "0644"
}

resource "local_file" "passwd" {
  content         = local.passwd
  filename        = "${local.path}/passwd"
  file_permission = "0644"
}
