# é outra forma de definir vars do terraform, é lido automáticamente os arquivos .tfvars
# as variáveis com valores default definidas no input.tf não precisa mais usar default, já que aqui já foram definidas. caso estejam usando default
# os valores default vão soberscritos 

# ordem de qual váriavel vai ser usada, já que são definidas de diversas formas: https://developer.hashicorp.com/terraform/language/values/variables`


# exemplo:

aws_region = "eu-central-2"
aws_profile = "tf015"
instance_ami = "ami-xxx"
instance_type = "xxxx"