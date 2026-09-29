## Create AWS Cluster using EKSCTL commands

```
choco -v
choco upgrade chocolatey -y

Remove the existing Chocolatey folder
Remove-Item -Recurse -Force "C:\ProgramData\chocolatey"

Re-run the installation script
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Restart your PowerShell window and verify
choco -v

Using Chocolatey
choco install kubernetes-cli -y

• Restart your PowerShell terminal.
• Verify the installation:
kubectl version --client

Using Winget (Windows Package Manager)
winget install -e --id Kubernetes.kubectl
kubectl version --client

Direct Binary Download
curl.exe -LO "https://dl.k8s.io/release/$(curl.exe -L -s https://dl.k8s.io/release/stable.txt)/bin/windows/amd64/kubectl.exe"

choco install eksctl -y
eksctl version
choco install kubernetes-helm -y
choco install git -y
aws configure
aws sts get-caller-identity
choco install eksctl -y
eksctl version
<img width="752" height="663" alt="image" src="https://github.com/user-attachments/assets/3476a244-be1f-4b2a-8b06-98e36efe0b61" />
```

Step 1: Clean Up the Current Cluster
```
eksctl delete cluster --region us-east-1 --name practice-eks
```

Step 2: Run Cluster Creation

```
eksctl create cluster -f eks.yaml
```

# View system pods running across all namespaces
kubectl get pods -A

# Check cluster info and API server endpoint
kubectl cluster-info

# Check the compute resources of your nodes
kubectl describe nodes | grep -E "(Name:|Capacity:|Allocatable:)" -A 6

Deploy a sample Nginx deployment:
```
kubectl create deployment nginx-test --image=nginx:alpine --replicas=2
```
Verify the pods are running
```
kubectl get pods -l app=nginx-test -o wide
```
Clean up the deployment
```
kubectl delete deployment nginx-test
```

delete cluster
```
eksctl delete cluster -f eks.yaml
```

Step 1: Expose the Deployment with a Public AWS Load Balancer
```
kubectl expose deployment nginx-test --port=80 --target-port=80 --type=LoadBalancer --name=nginx-service
```
Step 2: Get the External URL
```
kubectl get svc nginx-service -w
```
Step 3: Test Access in Browser or Terminal
```
curl http://<YOUR-EXTERNAL-IP>
```
Step 4: Clean Up Test Workloads (Avoid Unwanted AWS Charges)
```
# Delete the service (removes the AWS Load Balancer)
kubectl delete svc nginx-service

# Delete the deployment pods
kubectl delete deployment nginx-test
```
