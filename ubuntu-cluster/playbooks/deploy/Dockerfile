# Используем базовый образ Ubuntu
FROM ubuntu:latest

# Создаем необходимые каталоги для sshd
RUN mkdir -p /run/sshd

# Обновляем пакеты и устанавливаем sudo и openssh-server
RUN apt-get update && \
    apt-get install -y sudo openssh-server && \
    rm -rf /var/lib/apt/lists/*

# Создаем пользователя с заданным именем и паролем, используя аргументы сборки
ARG USERNAME
ARG PASSWORD
RUN useradd -m -s /bin/bash $USERNAME && \
    echo "$USERNAME:$PASSWORD" | chpasswd && \
    usermod -aG sudo $USERNAME

# Открытие порта SSH
EXPOSE 22

# Запуск SSH сервера
ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D"]
