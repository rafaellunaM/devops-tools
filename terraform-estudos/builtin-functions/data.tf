data "template_file" "json"{

    template = file("template.json.tpl")


    # vai substituir esse valores dentro do arquivo, pode ser vars 
    vars = {
        name = "rafael"
        gender = "Male"

    }
}

data "archive_file" "json" {

    # tipo de arquivo gerado a partir da tamplate
    type = local.file_text

    # local onde a tamplate vai ser salva LOCALMENTE
    output_path = "${path.module}/files/${local.object_name}.${loca.file_text}"


    source {
      
      content = data.template_file.json.rendered
      filename = "${local.object_name}.json"
    }
}