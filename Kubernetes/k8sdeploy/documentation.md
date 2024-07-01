# Steps to Launch Kubernetes Dashboard

## Prerequisites

- Ensure you have Minikube and kubectl installed on your machine.
- You need a working Kubernetes cluster. Minikube provides an easy way to create one for local development.

## Steps

1. **Start Minikube**

   Start a Minikube cluster. The `--no-vtx-check` flag is used to skip the VirtualBox VT-x check, which is useful if you are running Minikube in an environment where VT-x is not available or not enabled.

   ```bash
   minikube start --no-vtx-check
   ```
2. **Verify Kubernetes Pods**

   `kubectl get pod -A`

3. **Deploy Kubernetes Dashboard**

   Apply the recommended Kubernetes Dashboard deployment YAML file from the official Kubernetes repository.

   `kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml`

4. **Create Admin User**

   Create a YAML file named dashboard-adminuser.yaml with the following content to define an admin user for the dashboard:

```apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
```

**Apply the admin user configuration to your cluster.**

   `kubectl apply -f dashboard-adminuser.yaml`

5. **Generate Access Token**

   Generate an access token for the admin user. This token will be used to log in to the Kubernetes Dashboard.

   `kubectl -n kubernetes-dashboard create token admin-user`

6. **Start Kubernetes Proxy**

   Start the Kubernetes proxy to access the dashboard from your local machine.

   `kubectl proxy`

7. **Access the Kubernetes Dashboard**
   
   Open your web browser and navigate to the following URL to access the Kubernetes Dashboard:

   ```http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
   ``` 





