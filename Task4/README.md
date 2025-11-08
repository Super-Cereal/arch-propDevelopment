## Таблица ролей:

| Роль             | Права роли                                                                          | Группы пользователей        |
| ---------------- | ----------------------------------------------------------------------------------- | --------------------------- |
| cluster-admin    | Полный доступ ко всем ресурсам кластера                                             | Администраторы кластера     |
| namespace-admin  | Полный доступ ко всем ресурсам в конкретном namespace                               | Team Leads, DevOps инженеры |
| developer        | Создание, обновление, удаление deployment-ов, pods, services в конкретных namespace | Разработчики                |
| viewer           | Только чтение всех ресурсов в namespace (кроме secrets)                             | Тестировщики, Аналитики     |
| security-auditor | Чтение secrets и конфигураций безопасности                                          | Security team, Аудиторы     |

## Запуск скриптов:

Запустите Minikube:

```bash
minikube start
```

Запустите скрипты в правильном порядке:

```bash
./create-users.sh
./create-roles.sh
./create-bindings.sh
```

Проверьте созданные ресурсы:
```bash
kubectl get roles,rolebindings -n development
kubectl get clusterroles,clusterrolebindings | grep -E "(security-auditor|namespace-admin)"
```
