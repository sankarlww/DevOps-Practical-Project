# Setup Instructions

# Setup Instructions for Windows OS

## Minikube Setup

### 1. **Install Minikube**

1. **Download Minikube:**
   Go to the [Minikube releases page](https://github.com/kubernetes/minikube/releases) and download the latest Windows installer (`minikube-installer.exe`).

2. **Run the Installer:**
   Double-click the downloaded `minikube-installer.exe` file and follow the installation instructions.

3. **Verify Installation:**
   Open Command Prompt or PowerShell and run:
   ```bash
   minikube version
   ```

### 2. **Install kubectl**

1. **Download kubectl:**
   Open Command Prompt or PowerShell and run:
   ```bash
   curl -LO "https://dl.k8s.io/release/v1.21.0/bin/windows/amd64/kubectl.exe"
   ```

2. **Move kubectl to PATH:**
   Move `kubectl.exe` to a directory in your PATH. For example:
   ```bash
   move kubectl.exe C:\Windows\System32\
   ```

3. **Verify Installation:**
   Run:
   ```bash
   kubectl version --client
   ```

### 3. **Start Minikube**

1. **Start Minikube:**
   Open Command Prompt or PowerShell and run:
   ```bash
   minikube start --driver=virtualbox
   ```
   *You can use other drivers if you have them installed, such as Hyper-V.*

2. **Verify Minikube Status:**
   Run:
   ```bash
   minikube status
   ```

## Deploy MongoDB

1. **Create MongoDB Deployment YAML:**
   Save the following content as `mongodb-deployment.yaml`:

   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: mongodb
   spec:
     replicas: 1
     selector:
       matchLabels:
         app: mongodb
     template:
       metadata:
         labels:
           app: mongodb
       spec:
         containers:
           - name: mongodb
             image: mongo:latest
             ports:
               - containerPort: 27017
   ```

2. **Create MongoDB Service YAML:**
   Save the following content as `mongodb-service.yaml`:

   ```yaml
   apiVersion: v1
   kind: Service
   metadata:
     name: mongodb-service
   spec:
     selector:
       app: mongodb
     ports:
       - protocol: TCP
         port: 27017
         targetPort: 27017
     type: ClusterIP
   ```

3. **Apply MongoDB Deployment:**
   Run the following commands:
   ```bash
   kubectl apply -f mongodb-deployment.yaml
   kubectl apply -f mongodb-service.yaml
   ```

## Deploy the Application

1. **Install Helm:**
   Download the latest Helm installer for Windows from the [Helm releases page](https://github.com/helm/helm/releases).

2. **Run the Installer:**
   Double-click the downloaded `helm-vX.X.X-windows-amd64.zip` file, extract it, and move `helm.exe` to a directory in your PATH.

3. **Verify Helm Installation:**
   Run:
   ```bash
   helm version
   ```

4. **Install the Helm Chart:**
   Navigate to the directory containing your Helm chart and run:
   ```bash
   helm install devops-practical ./devops-practical-chart
   ```

5. **Forward Ports to Access the Application:**
   Run:
   ```bash
   kubectl port-forward svc/devops-practical 8080:80
   ```

6. **Access the Application:**
   Open your web browser and go to `http://localhost:8080`.

7. **Add a Record:**
   Follow the application’s instructions to register for an account and add a record.

## Additional Notes

- Ensure that VirtualBox or Hyper-V is installed if using Minikube with these drivers.
- Adjust firewall settings if needed to allow traffic on the relevant ports.
- For troubleshooting, refer to Minikube and Kubernetes documentation or check logs using:
  ```bash
  kubectl logs <pod-name>
