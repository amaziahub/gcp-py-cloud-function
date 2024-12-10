.PHONY: all

zip:
	zip function-source.zip main.py requirements.txt

init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply

destroy:
	terraform destroy
