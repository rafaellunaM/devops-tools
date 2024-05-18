locals {
  
  ip_filepath = "ips.json"
  
  common_tags= {
      
      Service = "rafael-teste"

      Enviroment = var.environment

    }
}