locals {
  
  arquivos = {

    "primeiro_arquivo.txt" : "Este é o conteúdo do primeiro arquivo",
    "segundo_arquivo.txt"  : "Este é o conteúdo do segundo arquivo"

  }
}

module "arquivos" {
  
  source = "../modules/file"
  for_each = local.arquivos
}