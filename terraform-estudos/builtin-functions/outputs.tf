# gera uma lista com todos os valore
output "instance_public_ips" {
  value = aws_instance.server.*.public_ip
}

# junta os nomes das instâncias criadas e coloca uma virgula para separa-las  
output "instance_names" {
  value = join(", ", aws_instance.server.*.tags.Name)
}