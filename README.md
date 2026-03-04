### Hexlet tests and linter status:
[![Actions Status](https://github.com/Herbaa/devops-for-developers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Herbaa/devops-for-developers-project-77/actions)

## Подготовка
1. Создать API Token в Digitalocean
2. Добавить свой SSH ключ в панель DigitalOcean и скопируйте его Fingerprint
3. Установить terraform и ansible

## Управление инфраструктурой
инициализация Terraform

`make init`

просмотр планируемых изменений

```make plan```

инфраструктуры в облаке.

```make apply``` 

полное удаление всех ресурсов.

```make destroy```  
