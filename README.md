# PurpleSchool Ansible Demo

Демонстрационный проект для Ansible, включающий в себя разворачивание тестовой среды с IAC.


## Структура проекта

Проект состоит из следующих основных компонентов:  

```bash
├── .ansible-lint
├── .ansible-lint-ignore
├── .gitignore
├── .pre-commit-config.yaml
├── LICENSE
├── README.md
└── ubuntu-cluster
    ├── inventory.ini
    └── playbooks
        ├── deploy
        │   ├── .env
        │   ├── Dockerfile
        │   ├── deploy_ubuntu.yaml
        │   └── vars.yaml
        ├── remove
        │   └── remove_ubuntu.yaml
        └── stop
            └── stop_ubuntu.yaml
```


## Как использовать

### Клонирование репозитория

```sh
git clone git@github.com:ilugovoy/testing-environment.git && cd testing-environment
```

### Настройка переменных

Перед запуском playbook убедитесь, что файл `ubuntu-cluster/playbooks/deploy/vars.yml` содержит актуальные данные для подключения к вашей удаленной машине.

### Установка модуля для докер

```sh
ansible-galaxy collection install community.docker
```


## Основные команды

### Разворачивание тестовой среды

```sh
ansible-playbook -i ubuntu-cluster/inventory.in ubuntu-cluster/playbooks/deploy/deploy_ubuntu.yaml
```

### Остановка инстансов

```sh
ansible-playbook -i ubuntu-cluster/inventory.ini ubuntu-cluster/playbooks/stop/stop_ubuntu.yaml
```

### Удаление инстансов

```sh
ansible-playbook -i ubuntu-cluster/inventory.ini ubuntu-cluster/playbooks/remove/remove_ubuntu.yaml
```



## Автоматическая проверка качества кода

Проект использует следующие инструменты для автоматической проверки качества кода:

- **ansible-lint**: Проверяет код на соответствие лучшим практикам Ansible.
- **yamllint**: Проверяет синтаксис и стиль YAML-файлов.
- **pre-commit**: Автоматически запускает lint'еры перед каждым коммитом.



## Участие

Если вы обнаружили какие-либо проблемы или у вас есть предложения по улучшению, пожалуйста, создайте новый `issue` или отправьте `pull request`.

## Лицензия

Этот проект лицензирован [MIT License](LICENSE).
