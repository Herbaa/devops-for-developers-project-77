### Hexlet tests and linter status:
[![Actions Status](https://github.com/Herbaa/devops-for-developers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Herbaa/devops-for-developers-project-77/actions)
## [Ссылка на приложения](https://devops.herba.ink)
## Подготовка
1. Создать API Token в Digitalocean
2. Добавить свой SSH ключ в панель DigitalOcean и скопируйте его Fingerprint
3. Установить terraform и ansible

## Управление инфраструктурой
Установка роли Ansible:

    make ansible-prepare
   
Запустите деплой:

    make ansible-deploy
  
Инициализация Terraform

    make init

Просмотр планируемых изменений

    make plan

Инфраструктуры в облаке.

    make apply

Полное удаление всех ресурсов.

    make destroy
