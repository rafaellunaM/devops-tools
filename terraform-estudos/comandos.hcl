executar tf:
	terraform apply main.tf

	executar apply sem precisar aprovar:
		terraform apply -auto-approve

verificar plano tf - mostar o que vai ser definido:
	terraform plan

inspecionar o estado atual da infra gerenciada pelo tf:
	terraform show

verificar se o formato do arquivo está correto:
	terraform fmt
	verificar formato de forma recursiva (todas as pastas a partir da ./):
		terraform fmt -recursive

verifica o terraform antes de aplicar (importante)
	terraform validate

modo interativo:
	terraform console
		basta escrever o nome do recursos que se deseja pesquisar:
			exemplo: aws_s3_bucket_object.this