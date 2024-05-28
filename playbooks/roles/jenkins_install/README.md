kubectl create namespace jenkins

helm repo add jenkinsci https://charts.jenkins.io
helm repo update

helm install jenkins jenkinsci/jenkins --namespace jenkins --set controller.serviceType=NodePort

kubectl get secret --namespace jenkins jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode; echo

export NODE_PORT=$(kubectl get --namespace jenkins -o jsonpath="{.spec.ports[0].nodePort}" services jenkins)
export NODE_IP=$(kubectl get nodes --namespace jenkins -o jsonpath="{.items[0].status.addresses[0].address}")
echo http://$NODE_IP:$NODE_PORT/login

