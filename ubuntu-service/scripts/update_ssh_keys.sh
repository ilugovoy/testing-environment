#!/bin/bash

#  ./ubuntu-cluster/playbooks/keys_update/update_ssh_keys.sh

# Путь до файла known_hosts
KNOWN_HOSTS_FILE="$HOME/.ssh/known_hosts"

# Генерируем список портов от 2222 до 2226
PORTS=($(seq -f "%g" 2222 2226))

# Перебираем порты и удаляем старые ключи
for PORT in "${PORTS[@]}"; do
    echo "Removing old key for port $PORT..."
    ssh-keygen -f "$KNOWN_HOSTS_FILE" -R "[127.0.0.1]:$PORT"
done

echo "Done."
