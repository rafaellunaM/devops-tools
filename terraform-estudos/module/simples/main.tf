module "msg" {
  source = "../modules/echo"
  messange = "Repita mensagem, pf"
}

output "echo" {
        # vou acessar o module com nome msm mapeado para "../modules/echo" e referencia o ouput "echo"
  value = module.msg.echo
}