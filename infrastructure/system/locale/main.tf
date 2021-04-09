# fix localectl

resource "null_resource" "set_x11_keymap" {
  provisioner "local-exec" {
    command = "sudo localectl --no-convert set-x11-keymap de"
  }
}
