# Terraform workspace

o Terraform workspace facilita a reutilização de código em ambientes diferentes

## Por que não criar um arquivo de vars para cada ambiente?

Caso seja criado um arquivo para cada ambiente, o aplicado irá sobrepor os valores de seu antecessor no arquivo terraform.tfstate,
por essa razão, é necessário criar workspaces

exemplo:
    preciso de três ambientes: dev, stage e prod
    criei três arquivos de vars : dev.tfvars, stage.tfvars e prod.tfvars

    aplico  o primeiro:  terraform apply -var-file=dev.tfvars
                    será adicionado os recursos
    aplico o segundo: terraform apply -var-file=dev.tfvars
                    será modififcado os recursos existentes

## Utilizando workspaces

### criando três ambientes: 
    terraform workspace new dev
    terraform workspace new stage
    terraform workspace new prod

    é criada a pasta terraform.tfstate.d com os três ambientes e um arquivo de state para cada ambiente
    C:.
    └───terraform.tfstate.d
        ├───dev
        ├───prod
        └───stage

### Aplicando vars em um dos ambientes
    seleciono o workspace:
    terraform  workspace select dev

    aplico as vars no ambiente selecionado:
    terraform apply -var-file=dev.tfvars
    
    outra forma mais dinâmica de fazer é deixando o código mais dinâmico.
    Exemplo:
        ```terraform
            variable "instace_type" {
                  description = "value"
                  type = map(string)
                
                  default = {
                    "dev" = "t2.micro"
                    "stage" = "t2.medium"
                    "prod" = "t2.xlarge"
                  }
                }
            module "ec2_instance" {
                source = "./modules/ec2_instance"
                ami = var.ami
                                # vai buscar em instance o valor da chave de acordo com o workspace e se n encontrar vai usar micro
                instace_type = lookup(var.instace_type, terraform.workspace, "t2.micro")
                }
        ``` 
    basta selecionar o ambiente e aplicar:
    terraform workspace dev
    terraform apply 
    será criada uma instância ec2 do tipo t2.micro

## Arvore de diretórios:
    C:.
    ├───.terraform
    ├───modules
    │   └───ec2_instance
    └───terraform.tfstate.d
    │    ├───dev
    │    ├───prod
    │    └───stage
    │─────────main.tf
    |─────────readme.md
    |─────────terraformtf.vars