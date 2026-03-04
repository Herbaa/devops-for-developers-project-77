### Hexlet tests and linter status:
[![Actions Status](https://github.com/Herbaa/devops-for-developers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Herbaa/devops-for-developers-project-77/actions)
## [Ссылка на приложение](https://devops.herba.ink)
## Подготовка
1. Создать API Token в Digitalocean
2. Добавить свой SSH ключ в панель DigitalOcean и скопируйте его Fingerprint
3. Установить terraform и ansible

## Управление инфраструктурой
Установка роли Ansible:

    make ansible-prepare
   
Запустите деплой:

    make ansible-deploy
  
Инициализация Terraform:

    make init

Просмотр планируемых изменений:

    make plan

Инфраструктуры в облаке:

    make apply

Полное удаление всех ресурсов:

    make destroy


## Внешняя доступность проверяется через Upmon, а внутреннее состояние через Datadog.
<img width="1858" height="959" alt="image" src="https://github.com/user-attachments/assets/85bae8ab-3733-4bdc-a7c2-6d1682a8e9f5" />
