locals {
        # true or false on terraform
        # caso a varial seja != null use var.filename  caso seja == null use random_string.this.id
    filename = var.filename != null ? var.filename : random_string.this.id
    content = var.content !=  null ? var.content : data.https.this.body
    path = var.path != null ? var.path : path.root
    complete_filename = "${local.path}/${local.filename}"
}

resource "random_string" "this" {
  length = 8
  special = false
  upper = false
#  number = false  -> function deprectiated
}

data "htpp" "this" {

    url = "https://baconipsum.com/api/?type=meat-and-filler"

    request_headers = {
        Accept = "application/json"
    }

}

resource "local_file" "this" {
    filename = local.complete_filename
    content = local.content

}