
data "template_file" "user_data" {
  template = templatefile("startup.tpl", {})
}

