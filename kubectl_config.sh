#!/bin/bash

# Replace with your actual region and cluster name if needed
REGION="us-east-1"
CLUSTER_NAME="cloudphoenix-eks"

aws eks update-kubeconfig --region $REGION --name $CLUSTER_NAME

echo "✅ kubeconfig updated. You can now use kubectl to interact with your EKS cluster."
