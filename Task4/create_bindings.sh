#!/bin/bash

echo "Creating role bindings..."

# Привязка developer роли к пользователю Alexey
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: developer-binding
  namespace: development
subjects:
- kind: User
  name: alexey-developer
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: developer-role
  apiGroup: rbac.authorization.k8s.io
EOF

# Привязка viewer роли к пользователю Maria
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: viewer-binding
  namespace: development
subjects:
- kind: User
  name: maria-viewer
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: viewer-role
  apiGroup: rbac.authorization.k8s.io
EOF

# Привязка security auditor роли к пользователю Ivan
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: security-auditor-binding
subjects:
- kind: User
  name: ivan-security
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: security-auditor-role
  apiGroup: rbac.authorization.k8s.io
EOF

# Привязка namespace admin роли к группе team-leads (пример для будущего использования)
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: namespace-admin-binding
  namespace: development
subjects:
- kind: Group
  name: team-leads
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: namespace-admin-role
  apiGroup: rbac.authorization.k8s.io
EOF

echo "Role bindings created successfully!"
echo ""
echo "Summary of created bindings:"
echo "- alexey-developer → developer-role (namespace: development)"
echo "- maria-viewer → viewer-role (namespace: development)" 
echo "- ivan-security → security-auditor-role (cluster-wide)"
echo "- team-leads group → namespace-admin-role (namespace: development)"
