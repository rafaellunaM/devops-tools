variable "filename" {
  
  description = "Nome do arquivo"
  type = string
  default = null

}

variable "content" {
  
  description = "Conteúdo do arquivo a ser criado"
  type = any
  default = null

}

variable "path" {
  
    description = "Caminho completo onde o arquivo serár criado"
    type = string
    default = null

}