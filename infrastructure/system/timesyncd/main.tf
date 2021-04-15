# install and configure timesyncd

resource "null_resource" "enable" {
  provisioner "local-exec" {
    command = "systemctl enable systemd-timesyncd.service"
  }
}

resource "null_resource" "setup" {
  provisioner "local-exec" {
    command = "timedatectl set-ntp true"
  }
}
