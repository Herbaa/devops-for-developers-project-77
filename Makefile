init:
	cd terraform && terraform init

plan:
	cd terraform && terraform plan \
	-var="do_token=$(shell ansible-vault view ansible/vault.yml | grep do_token | awk '{print $$2}')" \
	-var="ssh_fingerprint=$(shell ansible-vault view ansible/vault.yml | grep ssh_fingerprint | awk '{print $$2}')" \
	-var="datadog_api_key=$(shell ansible-vault view ansible/vault.yml | grep datadog_api_key | awk '{print $$2}')" \
	-var="datadog_app_key=$(shell ansible-vault view ansible/vault.yml | grep datadog_app_key | awk '{print $$2}')"

apply:
	cd terraform && terraform apply \
	-var="do_token=$(shell ansible-vault view ansible/vault.yml | grep do_token | awk '{print $$2}')" \
	-var="ssh_fingerprint=$(shell ansible-vault view ansible/vault.yml | grep ssh_fingerprint | awk '{print $$2}')" \
	-var="datadog_api_key=$(shell ansible-vault view ansible/vault.yml | grep datadog_api_key | awk '{print $$2}')" \
	-var="datadog_app_key=$(shell ansible-vault view ansible/vault.yml | grep datadog_app_key | awk '{print $$2}')"

destroy:
	cd terraform && terraform destroy \
	-var="do_token=$(shell ansible-vault view ansible/vault.yml | grep do_token | awk '{print $$2}')" \
	-var="ssh_fingerprint=$(shell ansible-vault view ansible/vault.yml | grep ssh_fingerprint | awk '{print $$2}')" \
	-var="datadog_api_key=$(shell ansible-vault view ansible/vault.yml | grep datadog_api_key | awk '{print $$2}')" \
	-var="datadog_app_key=$(shell ansible-vault view ansible/vault.yml | grep datadog_app_key | awk '{print $$2}')"

ansible-install:
	ansible-galaxy install -r ansible/requirements.yml

ansible-deploy:
	ansible-playbook -i ansible/inventory.ini ansible/playbook.yml --ask-vault-pass