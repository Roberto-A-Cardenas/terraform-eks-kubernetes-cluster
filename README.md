# 🚀 Terraform EKS Kubernetes Cluster (AWS)

[![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/Cloud-AWS-FF9900?logo=amazon-aws)](https://aws.amazon.com/eks/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-EKS-326CE5?logo=kubernetes)](https://kubernetes.io/)

This project provisions a secure, production-grade **EKS Kubernetes Cluster** on AWS using **Terraform**. It includes a full VPC setup with public and private subnets, NAT Gateway, IAM roles, security group restrictions, CloudWatch logging, and a working sample deployment (NGINX).

![EKS Architecture Diagram](https://github.com/Roberto-A-Cardenas/terraform-eks-kubernetes-cluster/raw/main/eks-cluster-diagram.png)

## 🧱 Features

- 💠 AWS EKS cluster provisioned via Terraform  
- 🌐 3-tier VPC with public and private subnets  
- 🔐 Secure security group (port 443 only)  
- 📡 NAT Gateway for private subnet egress  
- ⚙️ Managed Node Group with EC2 t3.medium instances  
- 📜 IAM roles for EKS control plane and worker nodes  
- 📊 CloudWatch logging (auth, audit, API, scheduler, etc.)  
- 🚀 Sample NGINX app with LoadBalancer exposure  

## 📂 Project Structure

```
terraform-eks-cluster/
├── vpc.tf                 # VPC, subnets, IGW, NAT, routing
├── eks.tf                 # EKS cluster, SG, CloudWatch logs
├── nodegroup.tf           # Worker nodes + IAM roles
├── provider.tf            # AWS provider config
├── versions.tf            # Terraform + provider versions
├── outputs.tf             # Key Terraform outputs
├── variables.tf           # (Reserved for future use)
├── main.tf                # Empty (flat layout)
├── nginx-deployment.yaml  # Test app deployment
├── nginx-service.yaml     # LoadBalancer service
├── kubectl_config.sh      # Update kubeconfig script
├── .gitignore             # Terraform + kube exclusions
├── LICENSE                # MIT License
├── README.md              # You're here!
└── assets/
    ├── eks-cluster-diagram.png
    └── screenshot.png
```

## 🛠️ Getting Started

### 1. Clone the Repo
```bash
git clone https://github.com/your-username/terraform-eks-cluster.git
cd terraform-eks-cluster
```

### 2. Initialize Terraform
```bash
terraform init
```

### 3. Deploy the Infrastructure
```bash
terraform apply
```

### 4. Configure `kubectl`
```bash
aws eks update-kubeconfig --region us-east-1 --name cloudphoenix-eks
kubectl get nodes
```

### 5. Deploy Test App
```bash
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
kubectl get svc nginx-service
```

Then visit the `EXTERNAL-IP` of the service in your browser to see the NGINX welcome page.

## 📸 Screenshot

Here's what the deployed NGINX service looks like when accessed via the external load balancer:

![Cluster Screenshot](https://github.com/Roberto-A-Cardenas/terraform-eks-kubernetes-cluster/raw/main/assets/terraform-eks-cluster-welcome-to-nginx.png)

## 🧹 Cleanup

To avoid charges, remove the test resources and destroy the infrastructure:
```bash
kubectl delete -f nginx-deployment.yaml
kubectl delete -f nginx-service.yaml
terraform destroy
```

## 📄 License

This project is licensed under the [MIT License](LICENSE) — free to use, share, and modify.
