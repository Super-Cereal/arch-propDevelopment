#!/bin/bash

echo "Creating users and certificates..."

# Создаем директорию для сертификатов
mkdir -p ~/.minikube/users
cd ~/.minikube/users

# Пользователь developer - Алексей
openssl genrsa -out alexey-developer.key 2048
openssl req -new -key alexey-developer.key -out alexey-developer.csr -subj "/CN=alexey-developer/O=developers"
openssl x509 -req -in alexey-developer.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out alexey-developer.crt -days 500

# Пользователь viewer - Мария
openssl genrsa -out maria-viewer.key 2048
openssl req -new -key maria-viewer.key -out maria-viewer.csr -subj "/CN=maria-viewer/O=viewers"
openssl x509 -req -in maria-viewer.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out maria-viewer.crt -days 500

# Пользователь security - Иван
openssl genrsa -out ivan-security.key 2048
openssl req -new -key ivan-security.key -out ivan-security.csr -subj "/CN=ivan-security/O=security-auditors"
openssl x509 -req -in ivan-security.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out ivan-security.crt -days 500

# Создаем kubeconfig файлы для пользователей
kubectl config set-credentials alexey-developer --client-certificate=alexey-developer.crt --client-key=alexey-developer.key --embed-certs=true
kubectl config set-credentials maria-viewer --client-certificate=maria-viewer.crt --client-key=maria-viewer.key --embed-certs=true
kubectl config set-credentials ivan-security --client-certificate=ivan-security.crt --client-key=ivan-security.key --embed-certs=true

echo "Users created successfully!"
echo "Certificates location: ~/.minikube/users/"
