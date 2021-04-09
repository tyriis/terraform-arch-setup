# install and configure yay

locals {
  makepkg_conf = templatefile("${path.module}/makepkg.conf.tmpl", {cores = var.cores})
  pkglist = file("${path.module}/pkglist.txt")
}

resource "null_resource" "yay_prepare" {
  provisioner "local-exec" {
    command = "sudo rm -rf /tmp/yay"
  }
}

resource "null_resource" "yay_clone" {
  depends_on = [ null_resource.yay_prepare ]
  provisioner "local-exec" {
    command = "sudo -u ${var.user} git clone https://aur.archlinux.org/yay.git"
    working_dir = "/tmp"
  }
}

resource "null_resource" "yay_install" {
  depends_on = [ null_resource.yay_clone ]
  provisioner "local-exec" {
    command = "sudo -u ${var.user} makepkg -si --noconfirm"
    working_dir = "/tmp/yay"
  }
}

resource "null_resource" "yay_config" {
  depends_on = [ null_resource.yay_install ]
  provisioner "local-exec" {
    command = "sudo -u ${var.user} yay --editmenu --nodiffmenu --save"
    working_dir = "/tmp/yay"
  }
}

resource "local_file" "makepkg_conf" {
  content = local.makepkg_conf
  filename = "/etc/makepgk.conf"
  file_permission = "0600"
}

resource "local_file" "pkglist_txt" {
  content = local.pkglist
  filename = "/etc/pkglist.txt"
  file_permission = "0666"
}

resource "null_resource" "yay_update" {
  provisioner "local-exec" {
    command = "sudo -u ${var.user} yay -Syu --needed --noconfirm"
    working_dir = "/home/${var.user}/"
  }
}

resource "null_resource" "package_install" {
  triggers = {
    pkglist = sha1(local.pkglist)
  }
  depends_on = [
    local_file.makepkg_conf,
    null_resource.yay_config
  ]
  provisioner "local-exec" {
    command = "sudo -u ${var.user} yay -S --noconfirm - < /etc/pkglist.txt"
    working_dir = "/home/${var.user}/"
  }
}
